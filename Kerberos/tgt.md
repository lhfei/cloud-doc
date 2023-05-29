



> ## Hive



```
klist -ket /etc/security/keytabs/hive.service.keytab
kinit hive/a01-r03-i164-157-515w8ey.test.local@POLARIS.TESTD.COM -kt /etc/security/keytabs/hive.service.keytab 
```



> ## Spark



```
klist -ket  /etc/security/keytabs/spark.headless.keytab 
kinit spark-pss_cloud_dev@POLARIS.TESTD.COM -kt /etc/security/keytabs/spark.headless.keytab 
```



> ## HDFS



```
klist -ket /etc/security/keytabs/hdfs.headless.keytab
kinit hdfs-pss_cloud_dev@POLARIS.TESTD.COM -kt /etc/security/keytabs/hdfs.headless.keytab
```







