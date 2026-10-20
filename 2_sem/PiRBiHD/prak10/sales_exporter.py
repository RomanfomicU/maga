#!/usr/bin/env python3
"""
Wildberries Clothing Prometheus Exporter
http://localhost:8000/metrics
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import quote
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
import json
import os
import resource
import socket
import time
from statistics import mean


HOST = "0.0.0.0"
PORT = 8000

# Запросы связаны с магазином одежды/обуви.
SEARCH_QUERIES = [
    "футболка",
    "платье",
    "джинсы",
    "куртка",
    "кроссовки",
]

CACHE_TTL_SECONDS = 60
REQUEST_TIMEOUT_SECONDS = 10
MAX_PRODUCTS_PER_QUERY = 40

# Регион доставки. -1257786 (Москва).
WB_DEST = os.getenv("WB_DEST", "-1257786")


class WildberriesExporter:
    def __init__(self):
        self.cache = {}
        self.cache_time = 0
        self.last_fetch_duration = 0.0
        self.api_up = 0
        self.last_error = ""

    @staticmethod
    def _escape_label(value: str) -> str:
        """Экранирование значений label для Prometheus."""
        return str(value).replace("\\", "\\\\").replace('"', '\\"').replace("\n", " ")

    @staticmethod
    def _to_float(value, default=0.0) -> float:
        try:
            if value is None:
                return default
            return float(value)
        except (TypeError, ValueError):
            return default

    @staticmethod
    def _normalize_price(product: dict) -> float:
        """
        Wildberries в разных версиях JSON может отдавать цену в разных полях:
        salePriceU / priceU / salePrice / price или в sizes[0].price.total.
        Поля с суффиксом U обычно хранят цену в копейках, поэтому делим на 100.
        """
        for key in ("salePriceU", "priceU"):
            value = product.get(key)
            if value not in (None, "", 0):
                return WildberriesExporter._to_float(value) / 100.0

        # Новые варианты структуры: sizes -> price -> total/product/basic
        sizes = product.get("sizes") or []
        if sizes and isinstance(sizes, list):
            price_obj = (sizes[0] or {}).get("price") or {}
            for key in ("total", "product", "basic"):
                value = price_obj.get(key)
                if value not in (None, "", 0):
                    return WildberriesExporter._to_float(value) / 100.0

        # На некоторых выдачах цена уже может быть в рублях.
        for key in ("salePrice", "price"):
            value = product.get(key)
            if value not in (None, "", 0):
                return WildberriesExporter._to_float(value)

        return 0.0

    def _make_urls(self, query: str):
        """
        Несколько вариантов URL нужны потому, что публичная поисковая выдача WB
        периодически меняет версию: v13, v9, v5 и т.д.
        """
        q = quote(query)
        common = (
            f"ab_testing=false&appType=1&curr=rub&dest={WB_DEST}"
            f"&lang=ru&locale=ru&page=1&query={q}"
            f"&resultset=catalog&sort=popular&spp=30&suppressSpellcheck=false"
        )

        return [
            f"https://search.wb.ru/exactmatch/ru/common/v13/search?{common}",
            f"https://search.wb.ru/exactmatch/ru/common/v9/search?{common}",
            f"https://search.wb.ru/exactmatch/ru/common/v5/search?{common}",
            f"https://search.wb.ru/exactmatch/ru/common/v4/search?{common}",
        ]

    def _fetch_json(self, url: str) -> dict:
        headers = {
            "User-Agent": (
                "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
                "(KHTML, like Gecko) Chrome/120.0 Safari/537.36"
            ),
            "Accept": "application/json, text/plain, */*",
            "Accept-Language": "ru-RU,ru;q=0.9,en;q=0.8",
            "Referer": "https://www.wildberries.ru/",
            "Origin": "https://www.wildberries.ru",
        }
        request = Request(url, headers=headers)
        with urlopen(request, timeout=REQUEST_TIMEOUT_SECONDS) as response:
            raw = response.read().decode("utf-8")
            return json.loads(raw)

    @staticmethod
    def _extract_products(payload: dict):
        if not isinstance(payload, dict):
            return []

        data = payload.get("data")
        if isinstance(data, dict):
            products = data.get("products")
            if isinstance(products, list):
                return products

        products = payload.get("products")
        if isinstance(products, list):
            return products

        return []

    def _fetch_products_for_query(self, query: str):
        errors = []

        for url in self._make_urls(query):
            try:
                payload = self._fetch_json(url)
                products = self._extract_products(payload)

                # Если endpoint вернул товары, используем его.
                if products:
                    return products[:MAX_PRODUCTS_PER_QUERY], url, ""

                errors.append("empty products")
            except (HTTPError, URLError, TimeoutError, socket.timeout, json.JSONDecodeError) as e:
                errors.append(f"{type(e).__name__}: {e}")
            except Exception as e:
                errors.append(f"{type(e).__name__}: {e}")

        return [], "", "; ".join(errors[-3:])

    def fetch_data(self) -> bool:
        start = time.time()
        result = {}
        any_success = False
        error_parts = []

        for query in SEARCH_QUERIES:
            products, source_url, error = self._fetch_products_for_query(query)

            prices = []
            ratings = []
            feedbacks = []
            product_rows = []

            for product in products:
                price = self._normalize_price(product)
                rating = self._to_float(product.get("reviewRating") or product.get("rating"))
                feedback_count = self._to_float(product.get("feedbacks"))

                if price > 0:
                    prices.append(price)
                if rating > 0:
                    ratings.append(rating)
                if feedback_count > 0:
                    feedbacks.append(feedback_count)

                product_id = str(product.get("id") or product.get("root") or "")
                name = str(product.get("name") or "unknown")
                brand = str(product.get("brand") or "unknown")

                # Ограничиваем количество товарных метрик, чтобы Prometheus не раздувался.
                if product_id and price > 0 and len(product_rows) < 10:
                    product_rows.append({
                        "id": product_id,
                        "name": name[:80],
                        "brand": brand[:60],
                        "price": price,
                        "rating": rating,
                        "feedbacks": feedback_count,
                    })

            if products:
                any_success = True

            if error:
                error_parts.append(f"{query}: {error}")

            result[query] = {
                "source_url": source_url,
                "products_found": len(products),
                "avg_price": mean(prices) if prices else 0.0,
                "min_price": min(prices) if prices else 0.0,
                "max_price": max(prices) if prices else 0.0,
                "avg_rating": mean(ratings) if ratings else 0.0,
                "feedbacks_total": sum(feedbacks) if feedbacks else 0.0,
                "products": product_rows,
            }

        self.cache = result
        self.cache_time = time.time()
        self.last_fetch_duration = self.cache_time - start
        self.api_up = 1 if any_success else 0
        self.last_error = " | ".join(error_parts)[:500]

        print(
            f"[INFO] fetch finished: api_up={self.api_up}, "
            f"duration={self.last_fetch_duration:.3f}s, "
            f"queries={len(SEARCH_QUERIES)}"
        )
        if self.last_error:
            print(f"[WARN] {self.last_error}")

        return any_success

    def _refresh_if_needed(self):
        if not self.cache or time.time() - self.cache_time > CACHE_TTL_SECONDS:
            self.fetch_data()

    @staticmethod
    def _resident_memory_bytes() -> int:
        """
        process_resident_memory_bytes без внешних зависимостей.
        На Linux ru_maxrss возвращается в KB.
        """
        return int(resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * 1024)

    def get_metrics(self) -> str:
        self._refresh_if_needed()

        ts_ms = int(time.time() * 1000)
        out = []

        out.append("# HELP wb_clothing_api_up 1 if at least one Wildberries query returned products, 0 otherwise")
        out.append("# TYPE wb_clothing_api_up gauge")
        out.append(f"wb_clothing_api_up {self.api_up} {ts_ms}")

        out.append("# HELP wb_clothing_last_fetch_timestamp_seconds Unix timestamp of last exporter refresh")
        out.append("# TYPE wb_clothing_last_fetch_timestamp_seconds gauge")
        out.append(f"wb_clothing_last_fetch_timestamp_seconds {self.cache_time:.3f} {ts_ms}")

        out.append("# HELP wb_clothing_last_fetch_duration_seconds Duration of last API refresh")
        out.append("# TYPE wb_clothing_last_fetch_duration_seconds gauge")
        out.append(f"wb_clothing_last_fetch_duration_seconds {self.last_fetch_duration:.3f} {ts_ms}")

        # 1 если по конкретному запросу товары есть, 0 если нет.
        out.append("# HELP wb_clothing_query_up 1 if this search query returned products, 0 otherwise")
        out.append("# TYPE wb_clothing_query_up gauge")
        for query, data in sorted(self.cache.items()):
            q = self._escape_label(query)
            value = 1 if data["products_found"] > 0 else 0
            out.append(f'wb_clothing_query_up{{query="{q}"}} {value} {ts_ms}')

        metric_defs = [
            ("wb_clothing_products_found", "Number of products returned by Wildberries search query", "products_found"),
            ("wb_clothing_avg_price_rub", "Average product price in RUB by search query", "avg_price"),
            ("wb_clothing_min_price_rub", "Minimum product price in RUB by search query", "min_price"),
            ("wb_clothing_max_price_rub", "Maximum product price in RUB by search query", "max_price"),
            ("wb_clothing_avg_rating", "Average product rating by search query", "avg_rating"),
            ("wb_clothing_feedbacks_total", "Total feedback count by search query", "feedbacks_total"),
        ]

        for metric_name, help_text, key in metric_defs:
            out.append(f"# HELP {metric_name} {help_text}")
            out.append(f"# TYPE {metric_name} gauge")
            for query, data in sorted(self.cache.items()):
                q = self._escape_label(query)
                out.append(f'{metric_name}{{query="{q}"}} {data[key]:.4f} {ts_ms}')

        out.append("# HELP wb_clothing_product_price_rub Product price in RUB")
        out.append("# TYPE wb_clothing_product_price_rub gauge")
        for query, data in sorted(self.cache.items()):
            for product in data["products"]:
                labels = (
                    f'query="{self._escape_label(query)}",'
                    f'product_id="{self._escape_label(product["id"])}",'
                    f'brand="{self._escape_label(product["brand"])}",'
                    f'name="{self._escape_label(product["name"])}"'
                )
                out.append(f'wb_clothing_product_price_rub{{{labels}}} {product["price"]:.2f} {ts_ms}')

        out.append("# HELP wb_clothing_product_rating Product rating")
        out.append("# TYPE wb_clothing_product_rating gauge")
        for query, data in sorted(self.cache.items()):
            for product in data["products"]:
                labels = (
                    f'query="{self._escape_label(query)}",'
                    f'product_id="{self._escape_label(product["id"])}",'
                    f'brand="{self._escape_label(product["brand"])}"'
                )
                out.append(f'wb_clothing_product_rating{{{labels}}} {product["rating"]:.2f} {ts_ms}')

        out.append("# HELP wb_clothing_product_feedbacks Product feedback count")
        out.append("# TYPE wb_clothing_product_feedbacks gauge")
        for query, data in sorted(self.cache.items()):
            for product in data["products"]:
                labels = (
                    f'query="{self._escape_label(query)}",'
                    f'product_id="{self._escape_label(product["id"])}",'
                    f'brand="{self._escape_label(product["brand"])}"'
                )
                out.append(f'wb_clothing_product_feedbacks{{{labels}}} {product["feedbacks"]:.0f} {ts_ms}')

        out.append("# HELP process_resident_memory_bytes Resident memory size of exporter process")
        out.append("# TYPE process_resident_memory_bytes gauge")
        out.append(f"process_resident_memory_bytes {self._resident_memory_bytes()} {ts_ms}")

        return "\n".join(out) + "\n"


class ExporterHandler(BaseHTTPRequestHandler):
    exporter = WildberriesExporter()

    def do_GET(self):
        if self.path == "/metrics":
            metrics = self.exporter.get_metrics()
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; version=0.0.4; charset=utf-8")
            self.end_headers()
            self.wfile.write(metrics.encode("utf-8"))
            return

        if self.path == "/":
            html = """<!doctype html>
<html lang="ru">
<head><meta charset="utf-8"><title>Wildberries Exporter</title></head>
<body>
<h2>Wildberries Clothing Prometheus Exporter</h2>
<p>Метрики: <a href="/metrics">/metrics</a></p>
<p>Источник: публичная JSON-выдача поиска Wildberries.</p>
</body>
</html>"""
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.end_headers()
            self.wfile.write(html.encode("utf-8"))
            return

        self.send_response(404)
        self.end_headers()
        self.wfile.write(b"Not Found")

    def log_message(self, fmt, *args):
        print(f"[HTTP] {self.address_string()} - {fmt % args}")


def run():
    server = HTTPServer((HOST, PORT), ExporterHandler)
    print("=" * 70)
    print("Wildberries Clothing Prometheus Exporter")
    print(f"Listening: http://{HOST}:{PORT}/metrics")
    print(f"Queries: {', '.join(SEARCH_QUERIES)}")
    print("=" * 70)
    server.serve_forever()


if __name__ == "__main__":
    run()
