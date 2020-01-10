### Conf

> metadata.properties

```ini
meta.storage.mode=extern
meta.extern.schema.driver    = com.mysql.jdbc.Driver
meta.extern.schema.url       = jdbc:mysql://10.182.99.90:3306/cloud_qsql?useUnicode=true&characterEncoding=gbk 
meta.extern.schema.user      = cloud_qsql 
meta.extern.schema.password  = QsqlUser_1473 
```

> base-env.sh

```ini
export SPARK_HOME=/usr/hdp/3.1.0.0-78/spark2
export JAVA_HOME=/export/cloud/jdk1.8.0_191
export QSQL_CLUSTER_URL=/qsql
export QSQL_HDFS_TMP=/tmp
```



### Metadata DB

#### Create Database

```sql
CREATE DATABASE cloud_qsql
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_qsql'@'localhost' IDENTIFIED BY 'QsqlUser_1473';

GRANT ALL ON cloud_qsql.* TO 'cloud_qsql'@'%' IDENTIFIED BY 'QsqlUser_1473';
```

#### Init DB

```sql
./bin/metadata --dbType mysql --action init
```

then you can verify it:

```sql
mysql> show tables;
+----------------------+
| Tables_in_cloud_qsql |
+----------------------+
| COLUMNS              |
| DATABASE_PARAMS      |
| DBS                  |
| TBLS                 |
+----------------------+
4 rows in set (0.00 sec)
```



### Integrated ES

```shell
./bin/meta-extract -p "{\"esNodes\": \"10.182.93.182\",\"esPort\": \"9200\",\"esUser\": \"admin\",\"esPass\": \"admin\",\"esIndex\": \"yellow_tripdata\"}" -d "es" -r "yellow_tripdata"
```



The console output as below:

```ini
2020-01-02 11:43:47,181 [main] INFO  - Input params: properties({"esNodes": "10.182.93.182","esPort": "9200","esUser": "admin","esPass": "admin","esIndex": "yellow_tripdata"}), type(es), filter regex(yellow_tripdata)
2020-01-02 11:43:47,182 [main] INFO  - Connecting server.....
2020-01-02 11:43:48,002 [main] INFO  - Connected successfully!!
2020-01-02 11:43:48,033 [main] INFO  - Insert database yellow_tripdata successfully!!
2020-01-02 11:43:48,124 [main] INFO  - Successfully collected metadata for 0 tables!!
```

