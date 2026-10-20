from __future__ import annotations

import logging
import os
from datetime import datetime, timedelta, date
from decimal import Decimal
from typing import Any

import clickhouse_connect
import psycopg2
import psycopg2.extras
from airflow import DAG
from airflow.operators.python import PythonOperator

LOG = logging.getLogger(__name__)

DEFAULT_ARGS = {
    "owner": "student",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}


def env(name: str, default: str = "") -> str:
    return os.getenv(name, default)


def gp_conn():
    return psycopg2.connect(
        host=env("GP_HOST", "greenplum"),
        port=int(env("GP_PORT", "5432")),
        user=env("GP_USER", "gpadmin"),
        password=env("GP_PASSWORD", "123456"),
        dbname=env("GP_DB", "template1"),
    )


def ch_client(database: str | None = None):
    return clickhouse_connect.get_client(
        host=env("CH_HOST", "clickhouse"),
        port=int(env("CH_PORT", "8123")),
        username=env("CH_USER", "default"),
        password=env("CH_PASSWORD", ""),
        database=database or env("CH_DATABASE", "dwh_marts"),
    )


def clean_value(value: Any) -> Any:
    if isinstance(value, Decimal):
        return float(value)
    if isinstance(value, datetime):
        return value.replace(tzinfo=None)
    if isinstance(value, date):
        return value
    return value


def fetch_gp(sql: str) -> list[dict[str, Any]]:
    with gp_conn() as conn:
        with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
            cur.execute(sql)
            return [dict(row) for row in cur.fetchall()]


def insert_select_to_ch(table: str, sql: str, columns: list[str]) -> None:
    rows = fetch_gp(sql)
    data = [tuple(clean_value(row.get(col)) for col in columns) for row in rows]
    client = ch_client()
    client.command(f"TRUNCATE TABLE IF EXISTS {table}")
    if data:
        client.insert(table, data, column_names=columns)
    LOG.info("Loaded %s rows into ClickHouse table %s", len(data), table)


def init_clickhouse_schema() -> None:
    database = env("CH_DATABASE", "dwh_marts")
    sys_client = ch_client(database="default")
    sys_client.command(f"CREATE DATABASE IF NOT EXISTS {database}")
    client = ch_client(database=database)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_sales_data (
            transaction_id String,
            order_date Date,
            year_num UInt16,
            month_num UInt8,
            day_num UInt8,
            quarter_num UInt8,
            customer_id String,
            age Nullable(Int32),
            gender String,
            subscription_status String,
            previous_purchases Int32,
            frequency_of_purchases String,
            item_id String,
            item_purchased String,
            category String,
            size_name String,
            color String,
            season String,
            location_name String,
            payment_method String,
            purchase_amount_usd Float64,
            review_rating Float64,
            discount_applied String,
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        PARTITION BY toYYYYMM(order_date)
        ORDER BY (order_date, category, location_name, transaction_id)
    """)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_sales_by_category_season (
            category String,
            season String,
            orders_count UInt64,
            revenue_usd Float64,
            avg_check_usd Float64,
            avg_rating Float64,
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        ORDER BY (category, season)
    """)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_sales_by_location_payment (
            location_name String,
            payment_method String,
            orders_count UInt64,
            revenue_usd Float64,
            avg_check_usd Float64,
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        ORDER BY (location_name, payment_method)
    """)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_customer_segments (
            gender String,
            subscription_status String,
            frequency_of_purchases String,
            customers_count UInt64,
            orders_count UInt64,
            revenue_usd Float64,
            avg_rating Float64,
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        ORDER BY (gender, subscription_status, frequency_of_purchases)
    """)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_sales_monthly (
            month_start Date,
            year_num UInt16,
            month_num UInt8,
            category String,
            orders_count UInt64,
            revenue_usd Float64,
            avg_check_usd Float64,
            avg_rating Float64,
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        ORDER BY (month_start, category)
    """)

    client.command("""
        CREATE TABLE IF NOT EXISTS ch_prometheus_metrics (
            metric_name String,
            metric_value Float64,
            samples_count UInt64,
            max_extracted_at Nullable(DateTime),
            load_dts DateTime DEFAULT now()
        ) ENGINE = MergeTree
        ORDER BY metric_name
    """)


def load_transaction_mart() -> None:
    insert_select_to_ch(
        "ch_sales_data",
        """
        SELECT
            f.transaction_id,
            f.order_date,
            d.year_num,
            d.month_num,
            d.day_num,
            d.quarter_num,
            c.customer_id,
            c.age,
            coalesce(c.gender, 'unknown') AS gender,
            coalesce(c.subscription_status, 'unknown') AS subscription_status,
            coalesce(c.previous_purchases, 0) AS previous_purchases,
            coalesce(c.frequency_of_purchases, 'unknown') AS frequency_of_purchases,
            i.item_id,
            coalesce(i.item_purchased, 'unknown') AS item_purchased,
            coalesce(i.category, 'unknown') AS category,
            coalesce(i.size_name, 'unknown') AS size_name,
            coalesce(i.color, 'unknown') AS color,
            coalesce(i.season, 'unknown') AS season,
            coalesce(l.location_name, 'unknown') AS location_name,
            coalesce(pm.payment_method, 'unknown') AS payment_method,
            coalesce(f.purchase_amount_usd, 0)::float AS purchase_amount_usd,
            coalesce(f.review_rating, 0)::float AS review_rating,
            coalesce(f.discount_applied, 'No') AS discount_applied
        FROM kimball_star.fact_sales f
        JOIN kimball_star.dim_date d ON d.date_key = f.date_key
        JOIN kimball_star.dim_customer c ON c.customer_key = f.customer_key
        JOIN kimball_star.dim_item i ON i.item_key = f.item_key
        JOIN kimball_star.dim_location l ON l.location_key = f.location_key
        JOIN kimball_star.dim_payment_method pm ON pm.payment_method_key = f.payment_method_key
        """,
        [
            "transaction_id", "order_date", "year_num", "month_num", "day_num", "quarter_num",
            "customer_id", "age", "gender", "subscription_status", "previous_purchases",
            "frequency_of_purchases", "item_id", "item_purchased", "category", "size_name",
            "color", "season", "location_name", "payment_method", "purchase_amount_usd",
            "review_rating", "discount_applied",
        ],
    )


def load_category_season_mart() -> None:
    client = ch_client()
    client.command("TRUNCATE TABLE IF EXISTS ch_sales_by_category_season")
    client.command("""
        INSERT INTO ch_sales_by_category_season
        (category, season, orders_count, revenue_usd, avg_check_usd, avg_rating)
        SELECT
            category,
            season,
            count() AS orders_count,
            round(sum(purchase_amount_usd), 2) AS revenue_usd,
            round(avg(purchase_amount_usd), 2) AS avg_check_usd,
            round(avg(review_rating), 2) AS avg_rating
        FROM ch_sales_data
        GROUP BY category, season
    """)


def load_location_payment_mart() -> None:
    client = ch_client()
    client.command("TRUNCATE TABLE IF EXISTS ch_sales_by_location_payment")
    client.command("""
        INSERT INTO ch_sales_by_location_payment
        (location_name, payment_method, orders_count, revenue_usd, avg_check_usd)
        SELECT
            location_name,
            payment_method,
            count() AS orders_count,
            round(sum(purchase_amount_usd), 2) AS revenue_usd,
            round(avg(purchase_amount_usd), 2) AS avg_check_usd
        FROM ch_sales_data
        GROUP BY location_name, payment_method
    """)


def load_customer_segment_mart() -> None:
    client = ch_client()
    client.command("TRUNCATE TABLE IF EXISTS ch_customer_segments")
    client.command("""
        INSERT INTO ch_customer_segments
        (gender, subscription_status, frequency_of_purchases, customers_count, orders_count, revenue_usd, avg_rating)
        SELECT
            gender,
            subscription_status,
            frequency_of_purchases,
            uniqExact(customer_id) AS customers_count,
            count() AS orders_count,
            round(sum(purchase_amount_usd), 2) AS revenue_usd,
            round(avg(review_rating), 2) AS avg_rating
        FROM ch_sales_data
        GROUP BY gender, subscription_status, frequency_of_purchases
    """)


def load_monthly_mart() -> None:
    client = ch_client()
    client.command("TRUNCATE TABLE IF EXISTS ch_sales_monthly")
    client.command("""
        INSERT INTO ch_sales_monthly
        (month_start, year_num, month_num, category, orders_count, revenue_usd, avg_check_usd, avg_rating)
        SELECT
            month_start,
            toYear(month_start) AS year_num,
            toMonth(month_start) AS month_num,
            category,
            count() AS orders_count,
            round(sum(purchase_amount_usd), 2) AS revenue_usd,
            round(avg(purchase_amount_usd), 2) AS avg_check_usd,
            round(avg(review_rating), 2) AS avg_rating
        FROM
        (
            SELECT
                toStartOfMonth(order_date) AS month_start,
                category,
                purchase_amount_usd,
                review_rating
            FROM ch_sales_data
        )
        GROUP BY month_start, category
    """)


def load_prometheus_mart() -> None:
    insert_select_to_ch(
        "ch_prometheus_metrics",
        """
        SELECT
            metric_name,
            coalesce(metric_value, 0)::float AS metric_value,
            coalesce(samples_count, 0)::bigint AS samples_count,
            max_extracted_at
        FROM mart.prometheus_metrics
        """,
        ["metric_name", "metric_value", "samples_count", "max_extracted_at"],
    )


def smoke_check() -> None:
    client = ch_client()
    for table in [
        "ch_sales_data",
        "ch_sales_by_category_season",
        "ch_sales_by_location_payment",
        "ch_customer_segments",
        "ch_sales_monthly",
        "ch_prometheus_metrics",
    ]:
        result = client.query(f"SELECT count() FROM {table}").result_rows[0][0]
        LOG.info("ClickHouse %s rows: %s", table, result)


with DAG(
    dag_id="prak12_clickhouse_data_marts",
    description="Практическая 12: витрины данных ClickHouse из DWH Greenplum для Yandex DataLens",
    default_args=DEFAULT_ARGS,
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=["clickhouse", "datalens", "prak12", "data-marts"],
) as dag:
    init = PythonOperator(task_id="01_init_clickhouse_schema", python_callable=init_clickhouse_schema)
    load_transactions = PythonOperator(task_id="02_load_transaction_mart_from_greenplum", python_callable=load_transaction_mart)
    by_category_season = PythonOperator(task_id="03_build_mart_category_season", python_callable=load_category_season_mart)
    by_location_payment = PythonOperator(task_id="04_build_mart_location_payment", python_callable=load_location_payment_mart)
    customer_segments = PythonOperator(task_id="05_build_mart_customer_segments", python_callable=load_customer_segment_mart)
    monthly = PythonOperator(task_id="06_build_mart_monthly", python_callable=load_monthly_mart)
    prometheus = PythonOperator(task_id="07_load_prometheus_metrics_mart", python_callable=load_prometheus_mart)
    check = PythonOperator(task_id="08_smoke_check_clickhouse_marts", python_callable=smoke_check)

    init >> load_transactions >> [by_category_season, by_location_payment, customer_segments, monthly, prometheus] >> check
