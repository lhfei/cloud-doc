```
schematool -dbType mysql -userName hive -passWord hive -initSchema
schematool -dbType mysql -initSchema
 
hive --service metastore 
```

###### Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient



```
```
# FAQs
```
```


#### 1 Class ...SQLStdConfOnlyAuthorizerFactory ClassNotFound


```
Error: java.lang.ClassNotFoundException: org.apache.hadoop.hive.ql.security.authorization.plugin.sqlstd.SQLStdConfOnlyAuthorizerFactory
```
Changed the hive-site.xml, update property of ```hive.security.authorization.manager``` as below:
```
hive.security.authorization.manager = org.apache.hadoop.hive.ql.security.authorization.DefaultHiveAuthorizationProvider
```