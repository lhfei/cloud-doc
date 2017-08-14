```
schematool -dbType mysql -userName hive -passWord hive -initSchema
schematool -dbType mysql -initSchema
 
hive --service metastore 
```

###### Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient