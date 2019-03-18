









> spark-defaults.properties

```ini
spark.master yarn-client
spark.yarn.dist.files /usr/hdp/3.1.0.0-78/spark2/conf/carbon.properties
spark.yarn.dist.archives /usr/hdp/3.1.0.0-78/spark2/carbonlib/carbondata.tar.gz
spark.executor.extraJavaOptions -Dcarbon.properties.filepath=carbon.properties -XX:+OmitStackTraceInFastThrow -XX:+UseGCOverheadLimit
spark.executor.extraClassPath carbondata.tar.gz/carbonlib/*:/home/hadoop/hive/lib/*
spark.driver.extraClassPath /usr/hdp/3.1.0.0-78/spark2/carbonlib/*
spark.driver.extraJavaOptions -Dcarbon.properties.filepath=/usr/hdp/3.1.0.0-78/spark2/conf/carbon.properties -Dhdp.version=current
```



