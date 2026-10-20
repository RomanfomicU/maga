from __future__ import annotations

import hashlib
import json
import logging
import os
import re
from datetime import datetime, timedelta
from decimal import Decimal
from typing import Any, Iterable

import psycopg2
import psycopg2.extras
import requests
from airflow import DAG
from airflow.operators.python import PythonOperator
from pymongo import MongoClient

LOG = logging.getLogger(__name__)

DEFAULT_ARGS = {
    "owner": "student",
    "depends_on_past": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=2),
}


def env(name: str, default: str = "") -> str:
    return os.getenv(name, default)


def fail_on_source_error() -> bool:
    return env("FAIL_ON_SOURCE_ERROR", "false").lower() in {"1", "true", "yes", "y"}


def json_default(value: Any) -> str:
    if isinstance(value, datetime):
        return value.isoformat()
    if isinstance(value, Decimal):
        return str(value)
    return str(value)


def gp_conn():
    return psycopg2.connect(
        host=env("GP_HOST", "host.docker.internal"),
        port=int(env("GP_PORT", "5432")),
        user=env("GP_USER", "gpadmin"),
        password=env("GP_PASSWORD", "123456"),
        dbname=env("GP_DB", "template1"),
    )


def source_pg_conn():
    return psycopg2.connect(
        host=env("PG_SOURCE_HOST", "host.docker.internal"),
        port=int(env("PG_SOURCE_PORT", "5432")),
        user=env("PG_SOURCE_USER", "postgres"),
        password=env("PG_SOURCE_PASSWORD", "postgres"),
        dbname=env("PG_SOURCE_DB", "postgres"),
    )


def execute_gp(sql: str, params: tuple | None = None) -> None:
    with gp_conn() as conn:
        with conn.cursor() as cur:
            cur.execute(sql, params)


def qident(name: str) -> str:
    return '"' + str(name).replace('"', '""') + '"'


def safe_float(value: Any, default: float = 0.0) -> float:
    if value in (None, ""):
        return default
    try:
        return float(str(value).replace(",", "."))
    except Exception:
        return default


def safe_int(value: Any, default: int = 0) -> int:
    if value in (None, ""):
        return default
    try:
        return int(float(str(value).replace(",", ".")))
    except Exception:
        return default


def norm_key(name: str) -> str:
    return re.sub(r"[^a-z0-9]+", "_", str(name).strip().lower()).strip("_")


def first_present(record: dict[str, Any], names: Iterable[str], default: Any = None) -> Any:
    normalized = {norm_key(k): v for k, v in record.items()}
    for name in names:
        key = norm_key(name)
        if key in normalized and normalized[key] not in (None, ""):
            return normalized[key]
    return default


def natural_hash(*parts: Any) -> str:
    source = "|".join("" if p is None else str(p) for p in parts)
    return hashlib.md5(source.encode("utf-8")).hexdigest()


def parse_date(value: Any) -> str:
    if value in (None, ""):
        return datetime.utcnow().date().isoformat()
    if isinstance(value, datetime):
        return value.date().isoformat()
    text = str(value).strip()
    for pattern in ["%Y-%m-%d", "%Y-%m-%d %H:%M:%S", "%d.%m.%Y", "%m/%d/%Y", "%Y/%m/%d"]:
        try:
            return datetime.strptime(text[:19], pattern).date().isoformat()
        except ValueError:
            continue
    match = re.search(r"\d{4}-\d{2}-\d{2}", text)
    if match:
        return match.group(0)
    return datetime.utcnow().date().isoformat()


def init_greenplum_schema() -> None:
    ddl = r"""
    CREATE SCHEMA IF NOT EXISTS meta;
    CREATE SCHEMA IF NOT EXISTS stg;
    CREATE SCHEMA IF NOT EXISTS inmon;
    CREATE SCHEMA IF NOT EXISTS kimball_star;
    CREATE SCHEMA IF NOT EXISTS kimball_snowflake;
    CREATE SCHEMA IF NOT EXISTS dv;
    CREATE SCHEMA IF NOT EXISTS anchor_model;
    CREATE SCHEMA IF NOT EXISTS mart;
    CREATE SCHEMA IF NOT EXISTS dq;

    CREATE TABLE IF NOT EXISTS meta.sttm_mapping (
        model_name TEXT,
        source_system TEXT,
        source_entity TEXT,
        source_attribute TEXT,
        transform_rule TEXT,
        target_schema TEXT,
        target_entity TEXT,
        target_attribute TEXT,
        target_type TEXT,
        integrity_rule TEXT,
        comment_txt TEXT,
        created_at TIMESTAMP DEFAULT now()
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS stg.raw_postgres (
        source_table TEXT,
        payload_json TEXT,
        extracted_at TIMESTAMP DEFAULT now()
    ) DISTRIBUTED RANDOMLY;

    CREATE TABLE IF NOT EXISTS stg.raw_mongo (
        source_database TEXT,
        source_collection TEXT,
        payload_json TEXT,
        extracted_at TIMESTAMP DEFAULT now()
    ) DISTRIBUTED RANDOMLY;

    CREATE TABLE IF NOT EXISTS stg.raw_prometheus (
        metric_name TEXT,
        metric_value NUMERIC,
        payload_json TEXT,
        extracted_at TIMESTAMP DEFAULT now()
    ) DISTRIBUTED RANDOMLY;

    CREATE TABLE IF NOT EXISTS stg.unified_sales_raw (
        source_system TEXT,
        source_table TEXT,
        source_pk TEXT,
        transaction_id TEXT,
        order_date DATE,
        customer_id TEXT,
        age INT,
        gender TEXT,
        subscription_status TEXT,
        previous_purchases INT,
        frequency_of_purchases TEXT,
        item_id TEXT,
        item_purchased TEXT,
        category TEXT,
        size_name TEXT,
        color TEXT,
        season TEXT,
        location_name TEXT,
        payment_method TEXT,
        purchase_amount_usd NUMERIC,
        review_rating NUMERIC,
        discount_applied TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (transaction_id);

    CREATE TABLE IF NOT EXISTS inmon.customers (
        customer_id TEXT,
        age INT,
        gender TEXT,
        subscription_status TEXT,
        previous_purchases INT,
        frequency_of_purchases TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (customer_id);

    CREATE TABLE IF NOT EXISTS inmon.categories (category_id TEXT, category_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS inmon.sizes (size_id TEXT, size_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS inmon.colors (color_id TEXT, color TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS inmon.seasons (season_id TEXT, season TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS inmon.locations (location_id TEXT, location_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS inmon.payment_methods (payment_method_id TEXT, method_name TEXT) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS inmon.items (
        item_id TEXT,
        item_name TEXT,
        category_id TEXT,
        size_id TEXT,
        color_id TEXT,
        season_id TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (item_id);

    CREATE TABLE IF NOT EXISTS inmon.transactions (
        transaction_id TEXT,
        customer_id TEXT,
        item_id TEXT,
        location_id TEXT,
        payment_method_id TEXT,
        order_date DATE,
        purchase_amount_usd NUMERIC,
        review_rating NUMERIC,
        discount_applied TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (transaction_id);

    CREATE TABLE IF NOT EXISTS kimball_star.dim_date (
        date_key INT,
        date_value DATE,
        year_num INT,
        month_num INT,
        day_num INT,
        quarter_num INT
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_star.dim_customer (
        customer_key BIGINT,
        customer_id TEXT,
        age INT,
        gender TEXT,
        subscription_status TEXT,
        previous_purchases INT,
        frequency_of_purchases TEXT
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_star.dim_item (
        item_key BIGINT,
        item_id TEXT,
        item_purchased TEXT,
        category TEXT,
        size_name TEXT,
        color TEXT,
        season TEXT
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_star.dim_location (location_key BIGINT, location_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_star.dim_payment_method (payment_method_key BIGINT, payment_method TEXT) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_star.fact_sales (
        transaction_id TEXT,
        date_key INT,
        customer_key BIGINT,
        item_key BIGINT,
        location_key BIGINT,
        payment_method_key BIGINT,
        order_date DATE,
        purchase_amount_usd NUMERIC,
        review_rating NUMERIC,
        discount_applied TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (transaction_id)
      PARTITION BY RANGE (order_date)
      (START (DATE '2020-01-01') INCLUSIVE END (DATE '2035-01-01') EXCLUSIVE EVERY (INTERVAL '1 month'), DEFAULT PARTITION other_dates);

    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_category (category_key BIGINT, category TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_size (size_key BIGINT, size_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_color (color_key BIGINT, color TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_season (season_key BIGINT, season TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_location (location_key BIGINT, location_name TEXT) DISTRIBUTED REPLICATED;
    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_payment_method (payment_method_key BIGINT, payment_method TEXT) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_item (
        item_key BIGINT,
        item_id TEXT,
        item_purchased TEXT,
        category_key BIGINT,
        size_key BIGINT,
        color_key BIGINT,
        season_key BIGINT
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_snowflake.dim_customer (
        customer_key BIGINT,
        customer_id TEXT,
        age INT,
        gender TEXT,
        subscription_status TEXT,
        previous_purchases INT,
        frequency_of_purchases TEXT
    ) DISTRIBUTED REPLICATED;

    CREATE TABLE IF NOT EXISTS kimball_snowflake.fact_sales (
        transaction_id TEXT,
        date_key INT,
        customer_key BIGINT,
        item_key BIGINT,
        location_key BIGINT,
        payment_method_key BIGINT,
        order_date DATE,
        purchase_amount_usd NUMERIC,
        review_rating NUMERIC,
        discount_applied TEXT,
        load_dts TIMESTAMP DEFAULT now()
    ) DISTRIBUTED BY (transaction_id)
      PARTITION BY RANGE (order_date)
      (START (DATE '2020-01-01') INCLUSIVE END (DATE '2035-01-01') EXCLUSIVE EVERY (INTERVAL '1 month'), DEFAULT PARTITION other_dates);

    CREATE TABLE IF NOT EXISTS dv.hub_customer (customer_hk CHAR(32), customer_id TEXT, load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (customer_hk);
    CREATE TABLE IF NOT EXISTS dv.hub_item (item_hk CHAR(32), item_id TEXT, load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (item_hk);
    CREATE TABLE IF NOT EXISTS dv.hub_transaction (transaction_hk CHAR(32), transaction_id TEXT, load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (transaction_hk);
    CREATE TABLE IF NOT EXISTS dv.link_transaction_item_customer (link_hk CHAR(32), transaction_hk CHAR(32), customer_hk CHAR(32), item_hk CHAR(32), load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (link_hk);
    CREATE TABLE IF NOT EXISTS dv.sat_customer_details (customer_hk CHAR(32), age INT, gender TEXT, subscription_status TEXT, previous_purchases INT, frequency_of_purchases TEXT, hashdiff CHAR(32), load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (customer_hk);
    CREATE TABLE IF NOT EXISTS dv.sat_item_details (item_hk CHAR(32), item_purchased TEXT, category TEXT, size_name TEXT, color TEXT, season TEXT, hashdiff CHAR(32), load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (item_hk);
    CREATE TABLE IF NOT EXISTS dv.sat_transaction_metrics (transaction_hk CHAR(32), order_date DATE, location_name TEXT, payment_method TEXT, purchase_amount_usd NUMERIC, review_rating NUMERIC, discount_applied TEXT, hashdiff CHAR(32), load_dts TIMESTAMP DEFAULT now(), record_source TEXT) DISTRIBUTED BY (transaction_hk);

    CREATE TABLE IF NOT EXISTS anchor_model.a_customer (customer_anchor_id CHAR(32), customer_id TEXT, load_dts TIMESTAMP DEFAULT now()) DISTRIBUTED BY (customer_anchor_id);
    CREATE TABLE IF NOT EXISTS anchor_model.a_item (item_anchor_id CHAR(32), item_id TEXT, load_dts TIMESTAMP DEFAULT now()) DISTRIBUTED BY (item_anchor_id);
    CREATE TABLE IF NOT EXISTS anchor_model.a_transaction (transaction_anchor_id CHAR(32), transaction_id TEXT, load_dts TIMESTAMP DEFAULT now()) DISTRIBUTED BY (transaction_anchor_id);
    CREATE TABLE IF NOT EXISTS anchor_model.attr_customer_profile (customer_anchor_id CHAR(32), age INT, gender TEXT, subscription_status TEXT, previous_purchases INT, frequency_of_purchases TEXT, changing_time TIMESTAMP DEFAULT now()) DISTRIBUTED BY (customer_anchor_id);
    CREATE TABLE IF NOT EXISTS anchor_model.attr_item_details (item_anchor_id CHAR(32), item_purchased TEXT, category TEXT, size_name TEXT, color TEXT, season TEXT, changing_time TIMESTAMP DEFAULT now()) DISTRIBUTED BY (item_anchor_id);
    CREATE TABLE IF NOT EXISTS anchor_model.tie_transaction_customer_item (transaction_anchor_id CHAR(32), customer_anchor_id CHAR(32), item_anchor_id CHAR(32), order_date DATE, location_name TEXT, payment_method TEXT, purchase_amount_usd NUMERIC, review_rating NUMERIC, discount_applied TEXT, changing_time TIMESTAMP DEFAULT now()) DISTRIBUTED BY (transaction_anchor_id);

    CREATE TABLE IF NOT EXISTS mart.prometheus_metrics (
        metric_name TEXT,
        metric_value NUMERIC,
        samples_count BIGINT,
        max_extracted_at TIMESTAMP
    ) DISTRIBUTED BY (metric_name);

    CREATE TABLE IF NOT EXISTS dq.dq_results (
        check_dts TIMESTAMP DEFAULT now(),
        layer_name TEXT,
        table_name TEXT,
        check_name TEXT,
        status TEXT,
        failed_rows BIGINT,
        comment_txt TEXT
    ) DISTRIBUTED RANDOMLY;
    """
    execute_gp(ddl)
    fill_sttm()


def fill_sttm() -> None:
    execute_gp("TRUNCATE TABLE meta.sttm_mapping")
    rows = [
        ("STG", "MongoDB", "shopping collection", "Customer ID", "as text", "stg", "unified_sales_raw", "customer_id", "TEXT", "not null", "Ключ клиента из CSV/Mongo"),
        ("STG", "MongoDB", "shopping collection", "Item Purchased", "as text", "stg", "unified_sales_raw", "item_purchased", "TEXT", "not null", "Название товара из Mongo"),
        ("STG", "MongoDB", "shopping collection", "Purchase Amount (USD)", "numeric", "stg", "unified_sales_raw", "purchase_amount_usd", "NUMERIC", ">= 0", "Сумма покупки из Mongo"),
        ("STG", "PostgreSQL", "Transactions", "Transaction_ID", "join normalized tables", "stg", "unified_sales_raw", "transaction_id", "TEXT", "not null", "Ключ транзакции из Script-8"),
        ("STG", "PostgreSQL", "Customer", "Age/Gender/...", "join by Customer_ID", "stg", "unified_sales_raw", "age/gender", "INT/TEXT", "domain checks", "Атрибуты клиента из PostgreSQL"),
        ("STG", "PostgreSQL", "Item + Category/Size/Color/Season", "Item_Name", "join dimensions", "stg", "unified_sales_raw", "item_purchased/category/size/color/season", "TEXT", "references", "Атрибуты товара из нормализованной PostgreSQL"),
        ("PROM", "Prometheus", "metrics", "metric value", "aggregate", "mart", "prometheus_metrics", "metric_value", "NUMERIC", "numeric", "Метрики sales_exporter/Prometheus"),
        ("INMON", "stg", "unified_sales_raw", "customer/item/payment/location", "normalize to 3NF", "inmon", "transactions", "transaction_id", "TEXT", "business key", "3NF-модель по Script-8"),
        ("KIMBALL_STAR", "stg", "unified_sales_raw", "all attributes", "surrogate dimensions", "kimball_star", "fact_sales", "purchase_amount_usd", "NUMERIC", ">= 0", "Схема звезда"),
        ("KIMBALL_SNOWFLAKE", "stg", "unified_sales_raw", "category/size/color/season", "normalized dimensions", "kimball_snowflake", "dim_item", "*_key", "BIGINT", "reference", "Схема снежинка"),
        ("DATA_VAULT", "stg", "unified_sales_raw", "business keys", "md5 hash keys", "dv", "hub/link/sat", "*_hk", "CHAR(32)", "hash key", "Hub-Link-Satellite"),
        ("ANCHOR", "stg", "unified_sales_raw", "attributes", "anchors, attributes, tie", "anchor_model", "tie_transaction_customer_item", "transaction_anchor_id", "CHAR(32)", "historized", "Anchor Modeling"),
    ]
    with gp_conn() as conn, conn.cursor() as cur:
        psycopg2.extras.execute_values(
            cur,
            """
            INSERT INTO meta.sttm_mapping
            (model_name, source_system, source_entity, source_attribute, transform_rule,
             target_schema, target_entity, target_attribute, target_type, integrity_rule, comment_txt)
            VALUES %s
            """,
            rows,
        )


def insert_raw_postgres(rows: list[tuple[str, str]]) -> None:
    if not rows:
        return
    with gp_conn() as conn, conn.cursor() as cur:
        psycopg2.extras.execute_values(cur, "INSERT INTO stg.raw_postgres(source_table, payload_json) VALUES %s", rows, page_size=1000)


def insert_raw_mongo(rows: list[tuple[str, str, str]]) -> None:
    if not rows:
        return
    with gp_conn() as conn, conn.cursor() as cur:
        psycopg2.extras.execute_values(cur, "INSERT INTO stg.raw_mongo(source_database, source_collection, payload_json) VALUES %s", rows, page_size=1000)


def insert_raw_prometheus(rows: list[tuple[str, float, str]]) -> None:
    if not rows:
        return
    with gp_conn() as conn, conn.cursor() as cur:
        psycopg2.extras.execute_values(cur, "INSERT INTO stg.raw_prometheus(metric_name, metric_value, payload_json) VALUES %s", rows, page_size=1000)


def table_exists(cur, schema: str, table: str) -> bool:
    cur.execute(
        """
        SELECT 1 FROM information_schema.tables
        WHERE lower(table_schema) = lower(%s) AND lower(table_name) = lower(%s)
        LIMIT 1
        """,
        (schema, table),
    )
    return cur.fetchone() is not None


def get_real_table_name(cur, schema: str, table: str) -> str | None:
    cur.execute(
        """
        SELECT table_name FROM information_schema.tables
        WHERE lower(table_schema) = lower(%s) AND lower(table_name) = lower(%s)
        LIMIT 1
        """,
        (schema, table),
    )
    row = cur.fetchone()
    return row[0] if row else None


def extract_postgres_source() -> None:
    execute_gp("TRUNCATE TABLE stg.raw_postgres")
    try:
        schema = env("PG_SOURCE_SCHEMA", "public")
        with source_pg_conn() as conn, conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
            required = ["transactions", "customer", "item", "category", "location", "color", "size", "season", "payment_method"]
            real_names = {name: get_real_table_name(cur, schema, name) for name in required}
            if all(real_names.values()):
                sql = f"""
                    SELECT
                        t.transaction_id,
                        t.purchase_amount_usd,
                        t.review_rating,
                        t.discount_applied,
                        c.customer_id,
                        c.age,
                        c.gender,
                        c.subscription_status,
                        c.previous_purchases,
                        c.frequency_of_purchases,
                        i.item_id,
                        i.item_name,
                        cat.category_name,
                        sz.size,
                        clr.color,
                        ssn.season,
                        loc.location_name,
                        pm.method_name
                    FROM {qident(schema)}.{qident(real_names['transactions'])} t
                    LEFT JOIN {qident(schema)}.{qident(real_names['customer'])} c ON c.customer_id = t.customer_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['item'])} i ON i.item_id = t.item_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['category'])} cat ON cat.category_id = i.category_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['size'])} sz ON sz.size_id = i.size_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['color'])} clr ON clr.color_id = i.color_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['season'])} ssn ON ssn.season_id = i.season_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['location'])} loc ON loc.location_id = t.location_id
                    LEFT JOIN {qident(schema)}.{qident(real_names['payment_method'])} pm ON pm.payment_method_id = t.payment_method_id
                    LIMIT 100000
                """
                cur.execute(sql)
                rows = [("public.shopping_joined", json.dumps(dict(r), ensure_ascii=False, default=json_default)) for r in cur.fetchall()]
            else:
                cur.execute(
                    """
                    SELECT table_name FROM information_schema.tables
                    WHERE table_schema = %s AND table_type = 'BASE TABLE'
                    ORDER BY table_name
                    """,
                    (schema,),
                )
                rows = []
                for rec in cur.fetchall():
                    table = rec["table_name"]
                    cur.execute(f"SELECT * FROM {qident(schema)}.{qident(table)} LIMIT 100000")
                    rows.extend((f"{schema}.{table}", json.dumps(dict(r), ensure_ascii=False, default=json_default)) for r in cur.fetchall())
            insert_raw_postgres(rows)
            LOG.info("Loaded %s PostgreSQL rows", len(rows))
    except Exception as exc:
        LOG.exception("PostgreSQL extraction failed")
        if fail_on_source_error():
            raise
        insert_raw_postgres([("source_error", json.dumps({"error": str(exc)}, ensure_ascii=False))])


def extract_mongo_source() -> None:
    execute_gp("TRUNCATE TABLE stg.raw_mongo")
    try:
        client = MongoClient(env("MONGO_URI", "mongodb://mongo-container:27017"), serverSelectionTimeoutMS=5000)
        client.admin.command("ping")
        db_names = [env("MONGO_DATABASE")] if env("MONGO_DATABASE") else client.list_database_names()
        db_names = [d for d in db_names if d and d not in {"admin", "local", "config"}]
        rows: list[tuple[str, str, str]] = []
        for db_name in db_names:
            db = client[db_name]
            for coll_name in db.list_collection_names():
                for doc in db[coll_name].find({}, limit=100000):
                    doc["_id"] = str(doc.get("_id"))
                    rows.append((db_name, coll_name, json.dumps(doc, ensure_ascii=False, default=json_default)))
        insert_raw_mongo(rows)
        LOG.info("Loaded %s MongoDB documents", len(rows))
    except Exception as exc:
        LOG.exception("MongoDB extraction failed")
        if fail_on_source_error():
            raise
        insert_raw_mongo([("source_error", "source_error", json.dumps({"error": str(exc)}, ensure_ascii=False))])


def extract_prometheus_source() -> None:
    execute_gp("TRUNCATE TABLE stg.raw_prometheus")
    rows: list[tuple[str, float, str]] = []
    try:
        prom_url = env("PROMETHEUS_URL", "http://prak10:9090").rstrip("/")
        queries = [
            "up",
            "wb_clothing_api_up",
            "wb_clothing_products_found",
            "wb_clothing_avg_price_rub",
            "wb_clothing_avg_rating",
            "process_resident_memory_bytes",
        ]
        for query in queries:
            try:
                response = requests.get(f"{prom_url}/api/v1/query", params={"query": query}, timeout=10)
                response.raise_for_status()
                payload = response.json()
                for item in payload.get("data", {}).get("result", []):
                    value = safe_float(item.get("value", [None, 0])[1])
                    rows.append((query, value, json.dumps(item, ensure_ascii=False, default=json_default)))
            except Exception as query_exc:
                LOG.warning("Prometheus query %s failed: %s", query, query_exc)

        exporter_url = env("SALES_EXPORTER_URL", "http://prak10:8000/metrics")
        try:
            response = requests.get(exporter_url, timeout=10)
            if response.ok:
                for line in response.text.splitlines():
                    if line.startswith("#") or not line.strip():
                        continue
                    parts = line.split()
                    if len(parts) >= 2:
                        metric_name = parts[0].split("{")[0]
                        rows.append((metric_name, safe_float(parts[1]), json.dumps({"raw": line}, ensure_ascii=False)))
        except Exception as exporter_exc:
            LOG.warning("sales_exporter scraping failed: %s", exporter_exc)

        insert_raw_prometheus(rows)
        LOG.info("Loaded %s Prometheus/exporter metrics", len(rows))
    except Exception as exc:
        LOG.exception("Prometheus extraction failed")
        if fail_on_source_error():
            raise
        insert_raw_prometheus([("source_error", 0, json.dumps({"error": str(exc)}, ensure_ascii=False))])


def normalize_shopping_record(source_system: str, source_table: str, record: dict[str, Any]) -> tuple:
    source_pk = str(first_present(record, ["_id", "id", "transaction_id", "Transaction ID"], natural_hash(source_system, source_table, record)))
    transaction_id = str(first_present(record, ["transaction_id", "Transaction ID", "id"], source_pk))
    customer_id = str(first_present(record, ["customer_id", "Customer ID"], "unknown_customer"))
    item_id = str(first_present(record, ["item_id", "Item ID", "sku"], natural_hash(first_present(record, ["item_name", "Item Purchased"], "unknown_item"))))
    item_purchased = str(first_present(record, ["item_purchased", "item_name", "Item Purchased"], item_id))
    category = str(first_present(record, ["category", "category_name", "Category"], "unknown"))
    size_name = str(first_present(record, ["size_name", "size", "Size"], "unknown"))
    color = str(first_present(record, ["color", "Color"], "unknown"))
    season = str(first_present(record, ["season", "Season"], "unknown"))
    payment_method = str(first_present(record, ["payment_method", "method_name", "Payment Method"], "unknown"))
    location_name = str(first_present(record, ["location_name", "location", "Location"], "unknown"))
    amount = safe_float(first_present(record, ["purchase_amount_usd", "Purchase Amount (USD)", "amount"], 0))
    rating = safe_float(first_present(record, ["review_rating", "Review Rating"], 0))
    discount = str(first_present(record, ["discount_applied", "Discount Applied"], "No"))
    order_date = parse_date(first_present(record, ["order_date", "date", "created_at", "timestamp"], None))
    return (
        source_system,
        source_table,
        source_pk,
        transaction_id,
        order_date,
        customer_id,
        safe_int(first_present(record, ["age", "Age"], None), None),
        str(first_present(record, ["gender", "Gender"], "unknown")),
        str(first_present(record, ["subscription_status", "Subscription Status"], "unknown")),
        safe_int(first_present(record, ["previous_purchases", "Previous Purchases"], 0)),
        str(first_present(record, ["frequency_of_purchases", "Frequency of Purchases"], "unknown")),
        item_id,
        item_purchased,
        category,
        size_name,
        color,
        season,
        location_name,
        payment_method,
        amount,
        rating,
        discount,
    )


def build_unified_stage() -> None:
    execute_gp("TRUNCATE TABLE stg.unified_sales_raw")
    unified_rows: list[tuple] = []
    with gp_conn() as conn, conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
        cur.execute("SELECT source_table, payload_json FROM stg.raw_postgres")
        for row in cur.fetchall():
            try:
                payload = json.loads(row["payload_json"])
                if "error" not in payload:
                    unified_rows.append(normalize_shopping_record("postgres", row["source_table"], payload))
            except Exception as exc:
                LOG.warning("Bad PostgreSQL payload skipped: %s", exc)

        cur.execute("SELECT source_database, source_collection, payload_json FROM stg.raw_mongo")
        for row in cur.fetchall():
            try:
                payload = json.loads(row["payload_json"])
                if "error" not in payload:
                    unified_rows.append(normalize_shopping_record("mongo", f"{row['source_database']}.{row['source_collection']}", payload))
            except Exception as exc:
                LOG.warning("Bad MongoDB payload skipped: %s", exc)

    if not unified_rows:
        demo = {
            "Customer ID": 1,
            "Age": 55,
            "Gender": "Male",
            "Item Purchased": "Blouse",
            "Category": "Clothing",
            "Purchase Amount (USD)": 53,
            "Location": "Kentucky",
            "Size": "L",
            "Color": "Gray",
            "Season": "Winter",
            "Review Rating": 3.1,
            "Subscription Status": "Yes",
            "Discount Applied": "Yes",
            "Previous Purchases": 14,
            "Payment Method": "Venmo",
            "Frequency of Purchases": "Fortnightly",
        }
        unified_rows.append(normalize_shopping_record("demo", "fallback", demo))

    with gp_conn() as conn, conn.cursor() as cur:
        psycopg2.extras.execute_values(
            cur,
            """
            INSERT INTO stg.unified_sales_raw
            (source_system, source_table, source_pk, transaction_id, order_date, customer_id,
             age, gender, subscription_status, previous_purchases, frequency_of_purchases,
             item_id, item_purchased, category, size_name, color, season, location_name,
             payment_method, purchase_amount_usd, review_rating, discount_applied)
            VALUES %s
            """,
            unified_rows,
            page_size=1000,
        )
    LOG.info("Unified shopping staging rows: %s", len(unified_rows))


def load_all_models() -> None:
    sql = r"""
    TRUNCATE TABLE inmon.customers;
    TRUNCATE TABLE inmon.categories;
    TRUNCATE TABLE inmon.sizes;
    TRUNCATE TABLE inmon.colors;
    TRUNCATE TABLE inmon.seasons;
    TRUNCATE TABLE inmon.locations;
    TRUNCATE TABLE inmon.payment_methods;
    TRUNCATE TABLE inmon.items;
    TRUNCATE TABLE inmon.transactions;

    INSERT INTO inmon.customers(customer_id, age, gender, subscription_status, previous_purchases, frequency_of_purchases)
    SELECT customer_id, max(age), max(gender), max(subscription_status), max(previous_purchases), max(frequency_of_purchases)
    FROM stg.unified_sales_raw GROUP BY customer_id;

    INSERT INTO inmon.categories(category_id, category_name)
    SELECT md5(category), category FROM (SELECT DISTINCT category FROM stg.unified_sales_raw) x;
    INSERT INTO inmon.sizes(size_id, size_name)
    SELECT md5(size_name), size_name FROM (SELECT DISTINCT size_name FROM stg.unified_sales_raw) x;
    INSERT INTO inmon.colors(color_id, color)
    SELECT md5(color), color FROM (SELECT DISTINCT color FROM stg.unified_sales_raw) x;
    INSERT INTO inmon.seasons(season_id, season)
    SELECT md5(season), season FROM (SELECT DISTINCT season FROM stg.unified_sales_raw) x;
    INSERT INTO inmon.locations(location_id, location_name)
    SELECT md5(location_name), location_name FROM (SELECT DISTINCT location_name FROM stg.unified_sales_raw) x;
    INSERT INTO inmon.payment_methods(payment_method_id, method_name)
    SELECT md5(payment_method), payment_method FROM (SELECT DISTINCT payment_method FROM stg.unified_sales_raw) x;

    INSERT INTO inmon.items(item_id, item_name, category_id, size_id, color_id, season_id)
    SELECT item_id, max(item_purchased), md5(max(category)), md5(max(size_name)), md5(max(color)), md5(max(season))
    FROM stg.unified_sales_raw GROUP BY item_id;

    INSERT INTO inmon.transactions(transaction_id, customer_id, item_id, location_id, payment_method_id, order_date, purchase_amount_usd, review_rating, discount_applied)
    SELECT transaction_id, customer_id, item_id, md5(location_name), md5(payment_method), order_date, purchase_amount_usd, review_rating, discount_applied
    FROM stg.unified_sales_raw;

    TRUNCATE TABLE kimball_star.dim_date;
    TRUNCATE TABLE kimball_star.dim_customer;
    TRUNCATE TABLE kimball_star.dim_item;
    TRUNCATE TABLE kimball_star.dim_location;
    TRUNCATE TABLE kimball_star.dim_payment_method;
    TRUNCATE TABLE kimball_star.fact_sales;

    INSERT INTO kimball_star.dim_date(date_key, date_value, year_num, month_num, day_num, quarter_num)
    SELECT DISTINCT to_char(order_date, 'YYYYMMDD')::INT, order_date,
        extract(year from order_date)::INT, extract(month from order_date)::INT,
        extract(day from order_date)::INT, extract(quarter from order_date)::INT
    FROM stg.unified_sales_raw;

    INSERT INTO kimball_star.dim_customer(customer_key, customer_id, age, gender, subscription_status, previous_purchases, frequency_of_purchases)
    SELECT row_number() over(order by customer_id), customer_id, max(age), max(gender), max(subscription_status), max(previous_purchases), max(frequency_of_purchases)
    FROM stg.unified_sales_raw GROUP BY customer_id;

    INSERT INTO kimball_star.dim_item(item_key, item_id, item_purchased, category, size_name, color, season)
    SELECT row_number() over(order by item_id), item_id, max(item_purchased), max(category), max(size_name), max(color), max(season)
    FROM stg.unified_sales_raw GROUP BY item_id;

    INSERT INTO kimball_star.dim_location(location_key, location_name)
    SELECT row_number() over(order by location_name), location_name FROM (SELECT DISTINCT location_name FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_star.dim_payment_method(payment_method_key, payment_method)
    SELECT row_number() over(order by payment_method), payment_method FROM (SELECT DISTINCT payment_method FROM stg.unified_sales_raw) x;

    INSERT INTO kimball_star.fact_sales(transaction_id, date_key, customer_key, item_key, location_key, payment_method_key, order_date, purchase_amount_usd, review_rating, discount_applied)
    SELECT s.transaction_id, d.date_key, c.customer_key, i.item_key, l.location_key, pm.payment_method_key,
           s.order_date, s.purchase_amount_usd, s.review_rating, s.discount_applied
    FROM stg.unified_sales_raw s
    JOIN kimball_star.dim_date d ON d.date_value = s.order_date
    JOIN kimball_star.dim_customer c ON c.customer_id = s.customer_id
    JOIN kimball_star.dim_item i ON i.item_id = s.item_id
    JOIN kimball_star.dim_location l ON l.location_name = s.location_name
    JOIN kimball_star.dim_payment_method pm ON pm.payment_method = s.payment_method;

    TRUNCATE TABLE kimball_snowflake.dim_category;
    TRUNCATE TABLE kimball_snowflake.dim_size;
    TRUNCATE TABLE kimball_snowflake.dim_color;
    TRUNCATE TABLE kimball_snowflake.dim_season;
    TRUNCATE TABLE kimball_snowflake.dim_location;
    TRUNCATE TABLE kimball_snowflake.dim_payment_method;
    TRUNCATE TABLE kimball_snowflake.dim_item;
    TRUNCATE TABLE kimball_snowflake.dim_customer;
    TRUNCATE TABLE kimball_snowflake.fact_sales;

    INSERT INTO kimball_snowflake.dim_category(category_key, category)
    SELECT row_number() over(order by category), category FROM (SELECT DISTINCT category FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_snowflake.dim_size(size_key, size_name)
    SELECT row_number() over(order by size_name), size_name FROM (SELECT DISTINCT size_name FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_snowflake.dim_color(color_key, color)
    SELECT row_number() over(order by color), color FROM (SELECT DISTINCT color FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_snowflake.dim_season(season_key, season)
    SELECT row_number() over(order by season), season FROM (SELECT DISTINCT season FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_snowflake.dim_location(location_key, location_name)
    SELECT row_number() over(order by location_name), location_name FROM (SELECT DISTINCT location_name FROM stg.unified_sales_raw) x;
    INSERT INTO kimball_snowflake.dim_payment_method(payment_method_key, payment_method)
    SELECT row_number() over(order by payment_method), payment_method FROM (SELECT DISTINCT payment_method FROM stg.unified_sales_raw) x;

    INSERT INTO kimball_snowflake.dim_item(item_key, item_id, item_purchased, category_key, size_key, color_key, season_key)
    SELECT row_number() over(order by s.item_id), s.item_id, max(s.item_purchased), max(c.category_key), max(sz.size_key), max(cl.color_key), max(se.season_key)
    FROM stg.unified_sales_raw s
    JOIN kimball_snowflake.dim_category c ON c.category = s.category
    JOIN kimball_snowflake.dim_size sz ON sz.size_name = s.size_name
    JOIN kimball_snowflake.dim_color cl ON cl.color = s.color
    JOIN kimball_snowflake.dim_season se ON se.season = s.season
    GROUP BY s.item_id;

    INSERT INTO kimball_snowflake.dim_customer(customer_key, customer_id, age, gender, subscription_status, previous_purchases, frequency_of_purchases)
    SELECT row_number() over(order by customer_id), customer_id, max(age), max(gender), max(subscription_status), max(previous_purchases), max(frequency_of_purchases)
    FROM stg.unified_sales_raw GROUP BY customer_id;

    INSERT INTO kimball_snowflake.fact_sales(transaction_id, date_key, customer_key, item_key, location_key, payment_method_key, order_date, purchase_amount_usd, review_rating, discount_applied)
    SELECT s.transaction_id, to_char(s.order_date, 'YYYYMMDD')::INT, c.customer_key, i.item_key, l.location_key, pm.payment_method_key,
           s.order_date, s.purchase_amount_usd, s.review_rating, s.discount_applied
    FROM stg.unified_sales_raw s
    JOIN kimball_snowflake.dim_customer c ON c.customer_id = s.customer_id
    JOIN kimball_snowflake.dim_item i ON i.item_id = s.item_id
    JOIN kimball_snowflake.dim_location l ON l.location_name = s.location_name
    JOIN kimball_snowflake.dim_payment_method pm ON pm.payment_method = s.payment_method;

    TRUNCATE TABLE dv.hub_customer;
    TRUNCATE TABLE dv.hub_item;
    TRUNCATE TABLE dv.hub_transaction;
    TRUNCATE TABLE dv.link_transaction_item_customer;
    TRUNCATE TABLE dv.sat_customer_details;
    TRUNCATE TABLE dv.sat_item_details;
    TRUNCATE TABLE dv.sat_transaction_metrics;

    INSERT INTO dv.hub_customer(customer_hk, customer_id, record_source)
    SELECT md5(customer_id), customer_id, max(source_system) FROM stg.unified_sales_raw GROUP BY customer_id;
    INSERT INTO dv.hub_item(item_hk, item_id, record_source)
    SELECT md5(item_id), item_id, max(source_system) FROM stg.unified_sales_raw GROUP BY item_id;
    INSERT INTO dv.hub_transaction(transaction_hk, transaction_id, record_source)
    SELECT md5(transaction_id), transaction_id, max(source_system) FROM stg.unified_sales_raw GROUP BY transaction_id;
    INSERT INTO dv.link_transaction_item_customer(link_hk, transaction_hk, customer_hk, item_hk, record_source)
    SELECT DISTINCT md5(md5(transaction_id) || md5(customer_id) || md5(item_id)), md5(transaction_id), md5(customer_id), md5(item_id), source_system
    FROM stg.unified_sales_raw;

    INSERT INTO dv.sat_customer_details(customer_hk, age, gender, subscription_status, previous_purchases, frequency_of_purchases, hashdiff, record_source)
    SELECT md5(customer_id), max(age), max(gender), max(subscription_status), max(previous_purchases), max(frequency_of_purchases),
           md5(coalesce(max(age)::text,'') || '|' || max(gender) || '|' || max(subscription_status) || '|' || coalesce(max(previous_purchases)::text,'') || '|' || max(frequency_of_purchases)), max(source_system)
    FROM stg.unified_sales_raw GROUP BY customer_id;

    INSERT INTO dv.sat_item_details(item_hk, item_purchased, category, size_name, color, season, hashdiff, record_source)
    SELECT md5(item_id), max(item_purchased), max(category), max(size_name), max(color), max(season),
           md5(max(item_purchased) || '|' || max(category) || '|' || max(size_name) || '|' || max(color) || '|' || max(season)), max(source_system)
    FROM stg.unified_sales_raw GROUP BY item_id;

    INSERT INTO dv.sat_transaction_metrics(transaction_hk, order_date, location_name, payment_method, purchase_amount_usd, review_rating, discount_applied, hashdiff, record_source)
    SELECT md5(transaction_id), order_date, location_name, payment_method, purchase_amount_usd, review_rating, discount_applied,
           md5(order_date::text || '|' || location_name || '|' || payment_method || '|' || purchase_amount_usd::text || '|' || review_rating::text || '|' || discount_applied), source_system
    FROM stg.unified_sales_raw;

    TRUNCATE TABLE anchor_model.a_customer;
    TRUNCATE TABLE anchor_model.a_item;
    TRUNCATE TABLE anchor_model.a_transaction;
    TRUNCATE TABLE anchor_model.attr_customer_profile;
    TRUNCATE TABLE anchor_model.attr_item_details;
    TRUNCATE TABLE anchor_model.tie_transaction_customer_item;

    INSERT INTO anchor_model.a_customer(customer_anchor_id, customer_id)
    SELECT md5(customer_id), customer_id FROM stg.unified_sales_raw GROUP BY customer_id;
    INSERT INTO anchor_model.a_item(item_anchor_id, item_id)
    SELECT md5(item_id), item_id FROM stg.unified_sales_raw GROUP BY item_id;
    INSERT INTO anchor_model.a_transaction(transaction_anchor_id, transaction_id)
    SELECT md5(transaction_id), transaction_id FROM stg.unified_sales_raw GROUP BY transaction_id;
    INSERT INTO anchor_model.attr_customer_profile(customer_anchor_id, age, gender, subscription_status, previous_purchases, frequency_of_purchases)
    SELECT md5(customer_id), max(age), max(gender), max(subscription_status), max(previous_purchases), max(frequency_of_purchases)
    FROM stg.unified_sales_raw GROUP BY customer_id;
    INSERT INTO anchor_model.attr_item_details(item_anchor_id, item_purchased, category, size_name, color, season)
    SELECT md5(item_id), max(item_purchased), max(category), max(size_name), max(color), max(season)
    FROM stg.unified_sales_raw GROUP BY item_id;
    INSERT INTO anchor_model.tie_transaction_customer_item(transaction_anchor_id, customer_anchor_id, item_anchor_id, order_date, location_name, payment_method, purchase_amount_usd, review_rating, discount_applied)
    SELECT md5(transaction_id), md5(customer_id), md5(item_id), order_date, location_name, payment_method, purchase_amount_usd, review_rating, discount_applied
    FROM stg.unified_sales_raw;

    TRUNCATE TABLE mart.prometheus_metrics;
    INSERT INTO mart.prometheus_metrics(metric_name, metric_value, samples_count, max_extracted_at)
    SELECT metric_name, avg(metric_value), count(*), max(extracted_at)
    FROM stg.raw_prometheus
    WHERE metric_name <> 'source_error'
    GROUP BY metric_name;
    """
    execute_gp(sql)


def run_dq_checks() -> None:
    sql = r"""
    INSERT INTO dq.dq_results(layer_name, table_name, check_name, status, failed_rows, comment_txt)
    SELECT 'stg', 'unified_sales_raw', 'completeness_not_null_keys', CASE WHEN count(*) = 0 THEN 'PASS' ELSE 'FAIL' END,
           count(*), 'transaction_id/customer_id/item_id/order_date не должны быть NULL'
    FROM stg.unified_sales_raw
    WHERE transaction_id IS NULL OR customer_id IS NULL OR item_id IS NULL OR order_date IS NULL;

    INSERT INTO dq.dq_results(layer_name, table_name, check_name, status, failed_rows, comment_txt)
    SELECT 'stg', 'unified_sales_raw', 'accuracy_amount_rating_ranges', CASE WHEN count(*) = 0 THEN 'PASS' ELSE 'FAIL' END,
           count(*), 'Сумма покупки >= 0, рейтинг от 0 до 5'
    FROM stg.unified_sales_raw
    WHERE purchase_amount_usd < 0 OR review_rating < 0 OR review_rating > 5;

    INSERT INTO dq.dq_results(layer_name, table_name, check_name, status, failed_rows, comment_txt)
    SELECT 'stg', 'unified_sales_raw', 'valid_discount_flag', CASE WHEN count(*) = 0 THEN 'PASS' ELSE 'WARN' END,
           count(*), 'Discount Applied должен быть Yes/No'
    FROM stg.unified_sales_raw
    WHERE lower(discount_applied) NOT IN ('yes', 'no', 'true', 'false', '1', '0');

    INSERT INTO dq.dq_results(layer_name, table_name, check_name, status, failed_rows, comment_txt)
    SELECT 'stg', 'unified_sales_raw', 'uniqueness_source_pk', CASE WHEN count(*) = 0 THEN 'PASS' ELSE 'FAIL' END,
           count(*), 'Дубликаты source_system/source_table/source_pk'
    FROM (
        SELECT source_system, source_table, source_pk
        FROM stg.unified_sales_raw
        GROUP BY source_system, source_table, source_pk
        HAVING count(*) > 1
    ) d;

    INSERT INTO dq.dq_results(layer_name, table_name, check_name, status, failed_rows, comment_txt)
    SELECT 'mart', 'prometheus_metrics', 'prometheus_loaded', CASE WHEN count(*) > 0 THEN 'PASS' ELSE 'WARN' END,
           CASE WHEN count(*) > 0 THEN 0 ELSE 1 END, 'Проверка загрузки метрик Prometheus/sales_exporter'
    FROM mart.prometheus_metrics;
    """
    execute_gp(sql)


with DAG(
    dag_id="prak11_greenplum_dwh",
    description="Практическая 11: Greenplum DWH для Shopping Trends, 5 моделей, ETL/ELT, DQ",
    default_args=DEFAULT_ARGS,
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=["greenplum", "dwh", "prak11", "shopping"],
) as dag:
    init = PythonOperator(task_id="01_init_greenplum_schema", python_callable=init_greenplum_schema)
    extract_pg = PythonOperator(task_id="02_extract_external_postgres", python_callable=extract_postgres_source)
    extract_mongo = PythonOperator(task_id="03_extract_mongo", python_callable=extract_mongo_source)
    extract_prom = PythonOperator(task_id="04_extract_prometheus", python_callable=extract_prometheus_source)
    stage = PythonOperator(task_id="05_build_unified_stage", python_callable=build_unified_stage)
    load = PythonOperator(task_id="06_load_5_dwh_models", python_callable=load_all_models)
    dq = PythonOperator(task_id="07_run_data_quality_checks", python_callable=run_dq_checks)

    init >> [extract_pg, extract_mongo, extract_prom] >> stage >> load >> dq
