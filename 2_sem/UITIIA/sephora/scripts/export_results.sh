#!/bin/bash
set -e
mkdir -p ./output/tables

docker exec namenode hdfs dfs -get -f /user/project/output/category_summary /tmp/category_summary
docker exec namenode hdfs dfs -get -f /user/project/output/brand_summary /tmp/brand_summary
docker exec namenode hdfs dfs -get -f /user/project/output/top_discounted_products /tmp/top_discounted_products
docker exec namenode hdfs dfs -get -f /user/project/output/top_value_products /tmp/top_value_products
docker cp namenode:/tmp/category_summary ./output/tables/
docker cp namenode:/tmp/brand_summary ./output/tables/
docker cp namenode:/tmp/top_discounted_products ./output/tables/
docker cp namenode:/tmp/top_value_products ./output/tables/
