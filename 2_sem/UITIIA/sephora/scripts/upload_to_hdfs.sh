#!/bin/bash
set -e
HDFS_DIR="/user/project"
LOCAL_FILE="/data/sephora_products.csv"

docker exec -it namenode hdfs dfs -mkdir -p ${HDFS_DIR}
docker exec -it namenode hdfs dfs -put -f ${LOCAL_FILE} ${HDFS_DIR}/sephora_products.csv
docker exec -it namenode hdfs dfs -ls ${HDFS_DIR}
docker exec -it namenode hdfs dfs -chmod -R 777 /user/project
