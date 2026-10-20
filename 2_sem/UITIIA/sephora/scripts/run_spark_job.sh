#!/bin/bash
set -e

docker exec -it spark /opt/spark/bin/spark-submit \
  --master local[*] \
  /opt/project/spark/price_analysis.py