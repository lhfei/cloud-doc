### Datasource

> Hive

```json
{
  "user": "hive",
  "password": "******",
  "address": "jdbc:hive2://10.0.0.7:10000",
  "database": "app",
  "jdbcUrl": "jdbc:hive2://10.0.0.7:10000/app",
  "driverClassName": "org.apache.hive.jdbc.HiveDriver",
  "validationQuery": "select 1",
  "other": "serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2;",
  "props": {
    "serviceDiscoveryMode": "zooKeeper",
    "zooKeeperNamespace": "hiveserver2"
  }
}
```



> Clickhouse

```json
{
  "user": "default",
  "password": "******",
  "address": "jdbc:clickhouse://10.0.0.17:8123",
  "database": "snsoft",
  "jdbcUrl": "jdbc:clickhouse://10.0.0.17:8123/snsoft",
  "driverClassName": "ru.yandex.clickhouse.ClickHouseDriver",
  "validationQuery": "select 1"
}
```

