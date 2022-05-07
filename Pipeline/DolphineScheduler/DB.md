

### MySQL

| IP        | PORT | HostName       |
| --------- | ---- | -------------- |
| 10.0.0.19 | 3306 | data-thinker-0 |



### data-link

```sql
CREATE DATABASE data_link
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'dlink_admin'@'localhost' IDENTIFIED BY 'DLinkuser_1473';

GRANT ALL ON data_link.* TO 'dlink_admin'@'%' IDENTIFIED BY 'DLinkuser_1473';

FLUSH PRIVILEGES;
```



```sql
CREATE DATABASE dlink_hive
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'dlink_hive'@'localhost' IDENTIFIED BY 'Hiveuser_1473';

GRANT ALL ON dlink_hive.* TO 'dlink_hive'@'%' IDENTIFIED BY 'Hiveuser_1473';

FLUSH PRIVILEGES;
```





ENV

```ini
export HADOOP_HOME=/usr/hdp/3.1.5.6091-7/hadoop
export HADOOP_CONF_DIR=/etc/hadoop/conf
export SPARK_HOME1=/opt/soft/spark1
export SPARK_HOME=/usr/hdp/3.1.5.6091-7/spark2
export PYTHON_HOME=/usr/bin/python
export JAVA_HOME=${JAVA_HOME:-/export/cloud/jdk1.8.0_301}
export HIVE_HOME=/usr/hdp/3.1.5.6091-7/hive
export FLINK_HOME=/export/cloud/flink-1.13.2
export DATAX_HOME=/export/cloud/datax
```







### dlink-ingest

```sql
CREATE DATABASE mjob_manager
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'mjob_admin'@'localhost' IDENTIFIED BY 'Jobuser_1473';

GRANT ALL ON mjob_manager.* TO 'mjob_admin'@'%' IDENTIFIED BY 'Jobuser_1473';

FLUSH PRIVILEGES;
```





#### mlink-bi

```shell
CREATE DATABASE datalink_bi
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'bi_admin'@'localhost' IDENTIFIED BY 'BIuser_1473';

GRANT ALL ON datalink_bi.* TO 'bi_admin'@'%' IDENTIFIED BY 'BIuser_1473';

FLUSH PRIVILEGES;
```

