# Databricks notebook source
# Original workshop lab: incremental Bronze ingestion into Delta.

from pyspark.sql import functions as F
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, DoubleType, TimestampType

schema = StructType([
    StructField("order_id", StringType(), False),
    StructField("customer_id", StringType(), False),
    StructField("product_id", StringType(), False),
    StructField("quantity", IntegerType(), False),
    StructField("unit_price", DoubleType(), False),
    StructField("order_ts", TimestampType(), False),
    StructField("region", StringType(), True),
])

source_path = "/Volumes/workshop/raw/orders"
target_table = "workshop.bronze.orders"

raw = (
    spark.readStream
    .format("cloudFiles")
    .option("cloudFiles.format", "json")
    .schema(schema)
    .load(source_path)
    .withColumn("_ingested_at", F.current_timestamp())
    .withColumn("_source_file", F.input_file_name())
)

query = (
    raw.writeStream
    .format("delta")
    .option("checkpointLocation", "/Volumes/workshop/checkpoints/orders_bronze")
    .trigger(availableNow=True)
    .toTable(target_table)
)

query.awaitTermination()
print(f"Bronze ingestion completed: {target_table}")
