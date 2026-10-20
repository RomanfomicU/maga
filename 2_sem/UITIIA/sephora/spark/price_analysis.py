from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when, avg, count, sum as spark_sum, round as spark_round

spark = SparkSession.builder.appName("Sephora Price Analysis").getOrCreate()

input_path = "hdfs://namenode:9000/user/project/sephora_products.csv"
output_path = "hdfs://namenode:9000/user/project/output"

df = spark.read.csv(input_path, header=True, inferSchema=True)

selected = df.select(
    "product_id", "product_name", "brand_name", "primary_category", "price_usd",
    "sale_price_usd", "rating", "reviews", "loves_count", "out_of_stock"
).dropna(subset=["product_id", "product_name", "brand_name", "primary_category", "price_usd"])

clean = selected.withColumn(
    "final_price", when(col("sale_price_usd").isNotNull(), col("sale_price_usd")).otherwise(col("price_usd"))
).withColumn(
    "discount_abs", when(col("price_usd") > col("final_price"), col("price_usd") - col("final_price")).otherwise(0)
).withColumn(
    "discount_percent", when(col("price_usd") > 0, col("discount_abs") / col("price_usd") * 100).otherwise(0)
).withColumn(
    "value_score", (col("rating") * (1 + col("discount_percent") / 100)) / col("final_price")
)

category_summary = clean.groupBy("primary_category").agg(
    count("product_id").alias("products"),
    spark_round(avg("final_price"), 2).alias("avg_price"),
    spark_round(avg("discount_percent"), 2).alias("avg_discount"),
    spark_round(avg("rating"), 2).alias("avg_rating")
).orderBy(col("avg_price").desc())

brand_summary = clean.groupBy("brand_name").agg(
    count("product_id").alias("products"),
    spark_round(avg("final_price"), 2).alias("avg_price"),
    spark_round(avg("rating"), 2).alias("avg_rating"),
    spark_sum("loves_count").alias("total_loves")
).where(col("products") >= 5).orderBy(col("avg_price").desc())

top_discounted = clean.orderBy(col("discount_percent").desc()).limit(10)
top_value = clean.orderBy(col("value_score").desc()).limit(10)

clean.write.mode("overwrite").parquet(f"{output_path}/clean_products")
category_summary.write.mode("overwrite").option("header", True).csv(f"{output_path}/category_summary")
brand_summary.write.mode("overwrite").option("header", True).csv(f"{output_path}/brand_summary")
top_discounted.write.mode("overwrite").option("header", True).csv(f"{output_path}/top_discounted_products")
top_value.write.mode("overwrite").option("header", True).csv(f"{output_path}/top_value_products")

spark.stop()
