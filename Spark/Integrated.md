

### Hudi

```shell
# Spark 3.2
spark-shell \
  --packages org.apache.hudi:hudi-spark3.2-bundle_2.12:0.11.0 \
  --conf 'spark.serializer=org.apache.spark.serializer.KryoSerializer' \
  --conf 'spark.sql.catalog.spark_catalog=org.apache.spark.sql.hudi.catalog.HoodieCatalog' \
  --conf 'spark.sql.extensions=org.apache.spark.sql.hudi.HoodieSparkSessionExtension'
```

```shell
wget https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3.2-bundle_2.12/0.11.0/hudi-spark3.2-bundle_2.12-0.11.0.jar
```





### Delta

```shell
bin/spark-shell --packages io.delta:delta-core_2.12:1.2.1 --conf "spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension" --conf "spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog"
```



```shell
wget https://repo1.maven.org/maven2/io/delta/delta-core_2.12/1.2.1/delta-core_2.12-1.2.1.jar -o jars/
```

