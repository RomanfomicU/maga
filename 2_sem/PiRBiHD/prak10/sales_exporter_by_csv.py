#!/usr/bin/env python3
"""
Sales Data Prometheus Exporter
Источник данных: Kaggle Sample Sales Data
https://www.kaggle.com/datasets/kyanyoga/sample-sales-data
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import csv
import time
import os
import urllib.request
from collections import defaultdict

DATA_FILE = "sales_data_sample.csv"

# Если файла нет — генерируем демо-данные, полностью совместимые с kaggle-датасетом
DEMO_ROWS = [
    {"ORDERNUMBER":"10107","QUANTITYORDERED":"30","PRICEEACH":"95.7","ORDERLINENUMBER":"2",
     "SALES":"2871.0","ORDERDATE":"2/24/2003 0:00","STATUS":"Shipped","QTR_ID":"1",
     "MONTH_ID":"2","YEAR_ID":"2003","PRODUCTLINE":"Motorcycles","MSRP":"95",
     "PRODUCTCODE":"S10_1678","CUSTOMERNAME":"Land of Toys Inc.","PHONE":"2125557818",
     "ADDRESSLINE1":"897 Long Airport Avenue","CITY":"NYC","STATE":"NY",
     "POSTALCODE":"10022","COUNTRY":"USA","TERRITORY":"NA","CONTACTLASTNAME":"Yu",
     "CONTACTFIRSTNAME":"Kwai","DEALSIZE":"Small"},
    {"ORDERNUMBER":"10121","QUANTITYORDERED":"34","PRICEEACH":"81.35","ORDERLINENUMBER":"5",
     "SALES":"2765.9","ORDERDATE":"5/7/2003 0:00","STATUS":"Shipped","QTR_ID":"2",
     "MONTH_ID":"5","YEAR_ID":"2003","PRODUCTLINE":"Motorcycles","MSRP":"95",
     "PRODUCTCODE":"S10_1678","CUSTOMERNAME":"Reims Collectables","PHONE":"26.47.1555",
     "ADDRESSLINE1":"59 rue de l'Abbaye","CITY":"Reims","STATE":"","POSTALCODE":"51100",
     "COUNTRY":"France","TERRITORY":"EMEA","CONTACTLASTNAME":"Henriot",
     "CONTACTFIRSTNAME":"Paul","DEALSIZE":"Small"},
    {"ORDERNUMBER":"10134","QUANTITYORDERED":"41","PRICEEACH":"94.74","ORDERLINENUMBER":"2",
     "SALES":"3884.34","ORDERDATE":"7/1/2003 0:00","STATUS":"Shipped","QTR_ID":"3",
     "MONTH_ID":"7","YEAR_ID":"2003","PRODUCTLINE":"Motorcycles","MSRP":"95",
     "PRODUCTCODE":"S10_1678","CUSTOMERNAME":"Lyon Souveniers","PHONE":"+33 1 46 62 7555",
     "ADDRESSLINE1":"27 rue du Colonel Pierre Avia","CITY":"Paris","STATE":"",
     "POSTALCODE":"75508","COUNTRY":"France","TERRITORY":"EMEA",
     "CONTACTLASTNAME":"Da Cunha","CONTACTFIRSTNAME":"Daniel","DEALSIZE":"Medium"},
    {"ORDERNUMBER":"10145","QUANTITYORDERED":"45","PRICEEACH":"83.26","ORDERLINENUMBER":"6",
     "SALES":"3746.7","ORDERDATE":"8/25/2003 0:00","STATUS":"Shipped","QTR_ID":"3",
     "MONTH_ID":"8","YEAR_ID":"2003","PRODUCTLINE":"Classic Cars","MSRP":"214",
     "PRODUCTCODE":"S18_1749","CUSTOMERNAME":"Muscle Machine Inc","PHONE":"5145551450",
     "ADDRESSLINE1":"4080 Enterprise Way","CITY":"NYC","STATE":"NY","POSTALCODE":"10022",
     "COUNTRY":"USA","TERRITORY":"NA","CONTACTLASTNAME":"Young",
     "CONTACTFIRSTNAME":"Jeff","DEALSIZE":"Medium"},
    {"ORDERNUMBER":"10159","QUANTITYORDERED":"49","PRICEEACH":"100.0","ORDERLINENUMBER":"14",
     "SALES":"5205.27","ORDERDATE":"10/10/2003 0:00","STATUS":"Shipped","QTR_ID":"4",
     "MONTH_ID":"10","YEAR_ID":"2003","PRODUCTLINE":"Classic Cars","MSRP":"214",
     "PRODUCTCODE":"S18_1749","CUSTOMERNAME":"AV Stores, Co.","PHONE":"(0)20.7555.4000",
     "ADDRESSLINE1":"Fauntleroy Circus","CITY":"Manchester","STATE":"",
     "POSTALCODE":"EC2 5NT","COUNTRY":"UK","TERRITORY":"EMEA",
     "CONTACTLASTNAME":"Hirano","CONTACTFIRSTNAME":"Juri","DEALSIZE":"Large"},
    {"ORDERNUMBER":"10168","QUANTITYORDERED":"36","PRICEEACH":"96.66","ORDERLINENUMBER":"1",
     "SALES":"3479.76","ORDERDATE":"10/28/2003 0:00","STATUS":"Shipped","QTR_ID":"4",
     "MONTH_ID":"10","YEAR_ID":"2003","PRODUCTLINE":"Trucks and Buses","MSRP":"84",
     "PRODUCTCODE":"S18_4933","CUSTOMERNAME":"Technics Stores Inc.","PHONE":"6505556809",
     "ADDRESSLINE1":"9408 Furth Circle","CITY":"Burlingame","STATE":"CA",
     "POSTALCODE":"94217","COUNTRY":"USA","TERRITORY":"NA","CONTACTLASTNAME":"Hashimoto",
     "CONTACTFIRSTNAME":"Juri","DEALSIZE":"Medium"},
    {"ORDERNUMBER":"10180","QUANTITYORDERED":"29","PRICEEACH":"86.13","ORDERLINENUMBER":"8",
     "SALES":"2497.77","ORDERDATE":"11/11/2003 0:00","STATUS":"Shipped","QTR_ID":"4",
     "MONTH_ID":"11","YEAR_ID":"2003","PRODUCTLINE":"Planes","MSRP":"68",
     "PRODUCTCODE":"S24_1628","CUSTOMERNAME":"Danish Wholesale Imports",
     "PHONE":"31 12 3555","ADDRESSLINE1":"Vinb'ltet 34","CITY":"Kobenhavn","STATE":"",
     "POSTALCODE":"1734","COUNTRY":"Denmark","TERRITORY":"EMEA",
     "CONTACTLASTNAME":"Petersen","CONTACTFIRSTNAME":"Jytte","DEALSIZE":"Small"},
    {"ORDERNUMBER":"10201","QUANTITYORDERED":"22","PRICEEACH":"98.57","ORDERLINENUMBER":"2",
     "SALES":"2168.54","ORDERDATE":"12/1/2003 0:00","STATUS":"Shipped","QTR_ID":"4",
     "MONTH_ID":"12","YEAR_ID":"2003","PRODUCTLINE":"Ships","MSRP":"172",
     "PRODUCTCODE":"S24_2840","CUSTOMERNAME":"Online Diopter Creation",
     "PHONE":"(03) 9520 4555","ADDRESSLINE1":"Level 6/114 Plunkett Street",
     "CITY":"Melbourne","STATE":"Victoria","POSTALCODE":"3004","COUNTRY":"Australia",
     "TERRITORY":"APAC","CONTACTLASTNAME":"Graham","CONTACTFIRSTNAME":"Mark",
     "DEALSIZE":"Small"},
    {"ORDERNUMBER":"10207","QUANTITYORDERED":"50","PRICEEACH":"108.06","ORDERLINENUMBER":"1",
     "SALES":"5403.0","ORDERDATE":"1/6/2004 0:00","STATUS":"Shipped","QTR_ID":"1",
     "MONTH_ID":"1","YEAR_ID":"2004","PRODUCTLINE":"Classic Cars","MSRP":"54",
     "PRODUCTCODE":"S10_4698","CUSTOMERNAME":"Baane Mini Imports","PHONE":"07-98 9555",
     "ADDRESSLINE1":"Erling Skakkes gate 78","CITY":"Stavern","STATE":"",
     "POSTALCODE":"4110","COUNTRY":"Norway","TERRITORY":"EMEA",
     "CONTACTLASTNAME":"Bergulfsen","CONTACTFIRSTNAME":"Jonas","DEALSIZE":"Large"},
    {"ORDERNUMBER":"10211","QUANTITYORDERED":"41","PRICEEACH":"117.26","ORDERLINENUMBER":"14",
     "SALES":"4808.66","ORDERDATE":"1/15/2004 0:00","STATUS":"Shipped","QTR_ID":"1",
     "MONTH_ID":"1","YEAR_ID":"2004","PRODUCTLINE":"Motorcycles","MSRP":"95",
     "PRODUCTCODE":"S10_1678","CUSTOMERNAME":"Auto Canal+ Petit","PHONE":"(1) 47.55.6555",
     "ADDRESSLINE1":"25, rue Lauriston","CITY":"Paris","STATE":"","POSTALCODE":"75016",
     "COUNTRY":"France","TERRITORY":"EMEA","CONTACTLASTNAME":"Perrier",
     "CONTACTFIRSTNAME":"Dominique","DEALSIZE":"Medium"},
]


class SalesDataExporter:
    def __init__(self):
        self.data_file = DATA_FILE
        self.cache = {}
        self.cache_time = 0
        self.cache_ttl = 30  # seconds — обновление кэша каждые 30 сек

    # ------------------------------------------------------------------
    # Загрузка / генерация данных
    # ------------------------------------------------------------------
    def _ensure_data_file(self):
        """Создаёт демо-CSV если настоящий файл отсутствует."""
        if os.path.exists(self.data_file):
            return
        print(f"[INFO] '{self.data_file}' не найден — генерируем демо-данные ({len(DEMO_ROWS)} строк).")
        fieldnames = list(DEMO_ROWS[0].keys())
        with open(self.data_file, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(DEMO_ROWS)

    def fetch_data(self):
        """Читает CSV и агрегирует метрики."""
        try:
            self._ensure_data_file()

            rows = []
            with open(self.data_file, newline="", encoding="latin-1") as f:
                reader = csv.DictReader(f)
                for row in reader:
                    rows.append(row)

            # ---------- агрегация ----------
            sales_by_productline   = defaultdict(float)
            orders_by_productline  = defaultdict(int)
            qty_by_productline     = defaultdict(float)
            sales_by_country       = defaultdict(float)
            orders_by_country      = defaultdict(int)
            sales_by_dealsize      = defaultdict(float)
            orders_by_dealsize     = defaultdict(int)
            sales_by_status        = defaultdict(float)
            orders_by_status       = defaultdict(int)
            sales_by_year          = defaultdict(float)
            orders_by_year         = defaultdict(int)
            sales_by_territory     = defaultdict(float)
            orders_by_territory    = defaultdict(int)

            for row in rows:
                pl   = row.get("PRODUCTLINE", "Unknown")
                co   = row.get("COUNTRY",     "Unknown")
                ds   = row.get("DEALSIZE",    "Unknown")
                st   = row.get("STATUS",      "Unknown")
                yr   = row.get("YEAR_ID",     "Unknown")
                ter  = row.get("TERRITORY",   "Unknown")

                try:
                    sale = float(row.get("SALES", 0) or 0)
                    qty  = float(row.get("QUANTITYORDERED", 0) or 0)
                except ValueError:
                    sale, qty = 0.0, 0.0

                sales_by_productline[pl]  += sale
                orders_by_productline[pl] += 1
                qty_by_productline[pl]    += qty

                sales_by_country[co]  += sale
                orders_by_country[co] += 1

                sales_by_dealsize[ds]  += sale
                orders_by_dealsize[ds] += 1

                sales_by_status[st]  += sale
                orders_by_status[st] += 1

                sales_by_year[yr]  += sale
                orders_by_year[yr] += 1

                sales_by_territory[ter]  += sale
                orders_by_territory[ter] += 1

            self.cache = {
                "total_rows":             len(rows),
                "sales_by_productline":   dict(sales_by_productline),
                "orders_by_productline":  dict(orders_by_productline),
                "qty_by_productline":     dict(qty_by_productline),
                "sales_by_country":       dict(sales_by_country),
                "orders_by_country":      dict(orders_by_country),
                "sales_by_dealsize":      dict(sales_by_dealsize),
                "orders_by_dealsize":     dict(orders_by_dealsize),
                "sales_by_status":        dict(sales_by_status),
                "orders_by_status":       dict(orders_by_status),
                "sales_by_year":          dict(sales_by_year),
                "orders_by_year":         dict(orders_by_year),
                "sales_by_territory":     dict(sales_by_territory),
                "orders_by_territory":    dict(orders_by_territory),
            }
            self.cache_time = time.time()
            print(f"[INFO] Загружено {len(rows)} строк из '{self.data_file}'")
            return True

        except Exception as e:
            print(f"[ERROR] fetch_data: {e}")
            return False

    # ------------------------------------------------------------------
    # Форматирование метрик в формат Prometheus text exposition
    # ------------------------------------------------------------------
    @staticmethod
    def _label(key: str, value: str) -> str:
        safe = value.replace('"', '\\"').replace("\\", "\\\\")
        return f'{key}="{safe}"'

    def get_metrics(self) -> str:
        if time.time() - self.cache_time > self.cache_ttl or not self.cache:
            self.fetch_data()

        ts  = int(time.time() * 1000)
        out = []

        def block(help_text, metric_type, name, data_dict, label_key, value_key=None):
            out.append(f"# HELP {name} {help_text}")
            out.append(f"# TYPE {name} gauge")
            for k, v in sorted(data_dict.items()):
                lbl = self._label(label_key, k)
                out.append(f"{name}{{{lbl}}} {v:.4f} {ts}")

        # 1. Общее количество строк (записей)
        out.append("# HELP sales_total_records Total number of sales records loaded")
        out.append("# TYPE sales_total_records gauge")
        out.append(f"sales_total_records {self.cache.get('total_rows', 0)} {ts}")

        # 2. Продажи по линейке продуктов
        block("Total sales amount by product line",
              "gauge", "sales_amount_by_productline",
              self.cache["sales_by_productline"], "productline")

        # 3. Количество заказов по линейке продуктов
        block("Number of orders by product line",
              "gauge", "sales_orders_by_productline",
              self.cache["orders_by_productline"], "productline")

        # 4. Количество единиц товара по линейке продуктов
        block("Total quantity ordered by product line",
              "gauge", "sales_quantity_by_productline",
              self.cache["qty_by_productline"], "productline")

        # 5. Продажи по стране
        block("Total sales amount by country",
              "gauge", "sales_amount_by_country",
              self.cache["sales_by_country"], "country")

        # 6. Количество заказов по стране
        block("Number of orders by country",
              "gauge", "sales_orders_by_country",
              self.cache["orders_by_country"], "country")

        # 7. Продажи по размеру сделки (Small / Medium / Large)
        block("Total sales amount by deal size",
              "gauge", "sales_amount_by_dealsize",
              self.cache["sales_by_dealsize"], "dealsize")

        # 8. Количество заказов по размеру сделки
        block("Number of orders by deal size",
              "gauge", "sales_orders_by_dealsize",
              self.cache["orders_by_dealsize"], "dealsize")

        # 9. Продажи по статусу заказа
        block("Total sales amount by order status",
              "gauge", "sales_amount_by_status",
              self.cache["sales_by_status"], "status")

        # 10. Количество заказов по статусу
        block("Number of orders by order status",
              "gauge", "sales_orders_by_status",
              self.cache["orders_by_status"], "status")

        # 11. Продажи по году
        block("Total sales amount by year",
              "gauge", "sales_amount_by_year",
              self.cache["sales_by_year"], "year")

        # 12. Количество заказов по году
        block("Number of orders by year",
              "gauge", "sales_orders_by_year",
              self.cache["orders_by_year"], "year")

        # 13. Продажи по территории (NA / EMEA / APAC / Japan)
        block("Total sales amount by territory",
              "gauge", "sales_amount_by_territory",
              self.cache["sales_by_territory"], "territory")

        # 14. Количество заказов по территории
        block("Number of orders by territory",
              "gauge", "sales_orders_by_territory",
              self.cache["orders_by_territory"], "territory")

        return "\n".join(out) + "\n"


class ExporterHandler(BaseHTTPRequestHandler):
    exporter = SalesDataExporter()

    def do_GET(self):
        if self.path == "/metrics":
            metrics = self.exporter.get_metrics()
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; version=0.0.4; charset=utf-8")
            self.end_headers()
            self.wfile.write(metrics.encode("utf-8"))
        elif self.path == "/":
            html = b"""<html><body>
            <h2>Sales Data Prometheus Exporter</h2>
            <p>Source: <a href='https://www.kaggle.com/datasets/kyanyoga/sample-sales-data'>
            Kaggle Sample Sales Data</a></p>
            <p><a href='/metrics'>View Metrics</a></p>
            </body></html>"""
            self.send_response(200)
            self.send_header("Content-Type", "text/html")
            self.end_headers()
            self.wfile.write(html)
        else:
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b"Not Found")

    def log_message(self, fmt, *args):
        print(f"[HTTP] {self.address_string()} - {fmt % args}")


def run():
    server = HTTPServer(("0.0.0.0", 8000), ExporterHandler)
    print("=" * 55)
    print("  Sales Data Prometheus Exporter")
    print("  http://0.0.0.0:8000/metrics")
    print("=" * 55)
    server.serve_forever()


if __name__ == "__main__":
    run()