

```ini
# default for Spark Metastore
metastore.catalog.default=spark
spark.sql.warehouse.dir=/apps/spark/warehouse

# For Hive Metastore
metastore.catalog.default=hive
hive.metastore.warehouse.dir=/warehouse/tablespace/managed/hive
```



```ini
javax.jdo.option.ConnectionDriverName
com.mysql.jdbc.Driver
   
javax.jdo.option.ConnectionPassword
Hiveuser_1473
   
javax.jdo.option.ConnectionURL
jdbc:mysql://10.0.0.5/cloud_hive?useSSL=false&characterEncoding=UTF-8
   
javax.jdo.option.ConnectionUserName
cloud_hive

hive.metastore.schema.verification false
   
```



```ini
# Add MySQL JDBC Driver to ${SPARK_HOME}/jars
```

