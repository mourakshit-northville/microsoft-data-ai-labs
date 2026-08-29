# Databricks notebook source
# Original workshop lab: validate, standardize and deduplicate Bronze orders.

from pyspark.sql import functions as F
from pyspark.sql.window import Window

bronze = spark.table("workshop.bronze.orders")

window = Window.partitionBy("order_id").orderBy(F.col("_ingested_at").desc())

silver = (
    bronze
    .withColumn("region", F.upper(F.trim("region")))
    .withColumn("order_amount", F.round(F.col("quantity") * F.col("unit_price"), 2))
    .withColumn("_row_number", F.row_number().over(window))
    .filter(F.col("_row_number") == 1)
    .drop("_row_number")
    .filter(F.col("quantity") > 0)
    .filter(F.col("unit_price") >= 0)
    .withColumn(
        "data_quality_status",
        F.when(F.col("region").isNull(), F.lit("REVIEW")).otherwise(F.lit("VALID")),
    )
)

(
    silver.write
    .mode("overwrite")
    .option("overwriteSchema", "true")
    .saveAsTable("workshop.silver.orders")
)

print("Created workshop.silver.orders")
