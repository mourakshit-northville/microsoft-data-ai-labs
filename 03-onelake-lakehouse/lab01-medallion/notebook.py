# Fabric Lakehouse medallion lab
# Designed as a notebook-friendly PySpark script.

from pyspark.sql import functions as F
from pyspark.sql.types import StructType, StructField, StringType, DoubleType, TimestampType

schema = StructType([
    StructField("order_id", StringType(), False),
    StructField("customer_id", StringType(), False),
    StructField("product", StringType(), False),
    StructField("quantity", DoubleType(), False),
    StructField("unit_price", DoubleType(), False),
    StructField("order_ts", TimestampType(), False),
    StructField("region", StringType(), True),
])

# Bronze: append raw source data as received.
bronze = (
    spark.read
    .option("header", True)
    .schema(schema)
    .csv("Files/input/orders/*.csv")
    .withColumn("ingested_at", F.current_timestamp())
    .withColumn("source_file", F.input_file_name())
)

bronze.write.mode("append").format("delta").saveAsTable("bronze_orders")

# Silver: standardize, validate and deduplicate.
silver = (
    spark.table("bronze_orders")
    .filter(F.col("quantity") > 0)
    .filter(F.col("unit_price") >= 0)
    .withColumn("region", F.upper(F.trim(F.col("region"))))
    .withColumn("order_amount", F.round(F.col("quantity") * F.col("unit_price"), 2))
    .withColumn("rn", F.row_number().over(
        __import__("pyspark.sql.window", fromlist=["Window"]).Window
        .partitionBy("order_id")
        .orderBy(F.col("ingested_at").desc())
    ))
    .filter(F.col("rn") == 1)
    .drop("rn")
)

silver.write.mode("overwrite").option("overwriteSchema", "true").format("delta").saveAsTable("silver_orders")

# Gold: simple business aggregate for BI.
gold = (
    spark.table("silver_orders")
    .withColumn("order_date", F.to_date("order_ts"))
    .groupBy("order_date", "region")
    .agg(
        F.countDistinct("order_id").alias("orders"),
        F.countDistinct("customer_id").alias("customers"),
        F.round(F.sum("order_amount"), 2).alias("revenue"),
        F.round(F.avg("order_amount"), 2).alias("avg_order_value"),
    )
)

gold.write.mode("overwrite").format("delta").saveAsTable("gold_daily_sales")

print("Created bronze_orders, silver_orders and gold_daily_sales")
