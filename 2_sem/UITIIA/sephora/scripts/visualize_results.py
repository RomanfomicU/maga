import os
import glob
import pandas as pd
import matplotlib.pyplot as plt

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_PATH = os.path.join(BASE_DIR, "data", "sephora_products.csv")
CHARTS_DIR = os.path.join(BASE_DIR, "output", "charts")
os.makedirs(CHARTS_DIR, exist_ok=True)

df = pd.read_csv(DATA_PATH)
df["final_price"] = df["sale_price_usd"].fillna(df["price_usd"])
df["discount_abs"] = (df["price_usd"] - df["final_price"]).clip(lower=0)
df["discount_percent"] = (df["discount_abs"] / df["price_usd"] * 100).fillna(0)
df["value_score"] = (df["rating"].fillna(0) * (1 + df["discount_percent"] / 100) * (1 + df["reviews"].fillna(0).clip(0, 1000) / 1000)) / df["final_price"].replace(0, pd.NA)

category_summary = df.groupby("primary_category", dropna=False).agg(
    products=("product_id", "count"),
    avg_price=("final_price", "mean"),
    avg_discount=("discount_percent", "mean"),
    avg_rating=("rating", "mean")
).reset_index().sort_values("avg_price", ascending=False)

brand_summary = df.groupby("brand_name", dropna=False).agg(
    products=("product_id", "count"),
    avg_price=("final_price", "mean"),
    avg_rating=("rating", "mean"),
    total_loves=("loves_count", "sum")
).reset_index().query("products >= 5").sort_values("avg_price", ascending=False)

category_summary.to_csv(os.path.join(BASE_DIR, "output", "tables", "category_summary.csv"), index=False)
brand_summary.to_csv(os.path.join(BASE_DIR, "output", "tables", "brand_summary.csv"), index=False)
df.sort_values("discount_percent", ascending=False).head(10).to_csv(os.path.join(BASE_DIR, "output", "tables", "top_discounted_products.csv"), index=False)
df.sort_values("value_score", ascending=False).head(10).to_csv(os.path.join(BASE_DIR, "output", "tables", "top_value_products.csv"), index=False)

plt.figure(figsize=(10, 5))
category_summary.head(10).plot(kind="bar", x="primary_category", y="avg_price", legend=False, ax=plt.gca())
plt.title("Average product price by category")
plt.ylabel("Average price (USD)")
plt.xlabel("Category")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "01_average_price_by_category.png"), dpi=160)
plt.close()

plt.figure(figsize=(10, 5))
category_summary.sort_values("avg_discount", ascending=False).head(10).plot(kind="bar", x="primary_category", y="avg_discount", legend=False, ax=plt.gca())
plt.title("Average discount by category")
plt.ylabel("Average discount (%)")
plt.xlabel("Category")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "02_average_discount_by_category.png"), dpi=160)
plt.close()

plt.figure(figsize=(10, 5))
brand_summary.head(10).plot(kind="bar", x="brand_name", y="avg_price", legend=False, ax=plt.gca())
plt.title("Top 10 brands by average price")
plt.ylabel("Average price (USD)")
plt.xlabel("Brand")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "03_top_brands_by_avg_price.png"), dpi=160)
plt.close()

plt.figure(figsize=(9, 5))
df["final_price"].dropna().plot(kind="hist", bins=40)
plt.title("Distribution of product prices")
plt.xlabel("Final price (USD)")
plt.ylabel("Number of products")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "04_price_distribution.png"), dpi=160)
plt.close()

plt.figure(figsize=(9, 5))
plt.scatter(df["final_price"], df["rating"], alpha=0.35, s=10)
plt.title("Price vs rating")
plt.xlabel("Final price (USD)")
plt.ylabel("Rating")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "05_price_vs_rating.png"), dpi=160)
plt.close()

plt.figure(figsize=(10, 5))
top_value = df.sort_values("value_score", ascending=False).head(10)
plt.bar(top_value["product_name"], top_value["value_score"])
plt.title("Top 10 value products")
plt.ylabel("Value score")
plt.xticks(rotation=50, ha="right")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "06_top_value_products.png"), dpi=160)
plt.close()

plt.figure(figsize=(6, 6))
labels = ["With discount", "Without discount"]
values = [(df["discount_percent"] > 0).sum(), (df["discount_percent"] <= 0).sum()]
plt.pie(values, labels=labels, autopct="%1.1f%%")
plt.title("Share of discounted products")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "07_discount_share.png"), dpi=160)
plt.close()

popular = df["primary_category"].value_counts().head(6).index
plt.figure(figsize=(10, 5))
df[df["primary_category"].isin(popular)].boxplot(column="final_price", by="primary_category", rot=35)
plt.title("Price spread in popular categories")
plt.suptitle("")
plt.xlabel("Category")
plt.ylabel("Final price (USD)")
plt.tight_layout()
plt.savefig(os.path.join(CHARTS_DIR, "08_price_spread_popular_categories.png"), dpi=160)
plt.close()

summary = pd.DataFrame([
    ["Total products", len(df)],
    ["Total categories", df["primary_category"].nunique()],
    ["Total brands", df["brand_name"].nunique()],
    ["Average product price", round(df["final_price"].mean(), 2)],
    ["Average discount percent", round(df["discount_percent"].mean(), 2)],
    ["Average rating", round(df["rating"].mean(), 2)],
    ["Discounted products share", round((df["discount_percent"] > 0).mean() * 100, 2)],
    ["Most expensive category", category_summary.iloc[0]["primary_category"]],
    ["Highest discount category", category_summary.sort_values("avg_discount", ascending=False).iloc[0]["primary_category"]],
], columns=["metric", "value"])
summary.to_csv(os.path.join(BASE_DIR, "output", "tables", "summary_report.csv"), index=False)
