

> MySQL

```json
{
  "type": "jdbc",
  "driver": "com.mysql.jdbc.Driver",
  "url": "jdbc:mysql://localhost:3306",
  "username": "root",
  "password": "mypassword",
  "enabled": true
}
```



> Clickhouse

```sql
{
  "type": "jdbc",
  "driver": "ru.yandex.clickhouse.ClickHouseDriver",
  "url": "jdbc:clickhouse://10.182.57.104:9000",
  "username": "default",
  "password": "Lhfei",
  "enabled": true
}

```





### Clickhouse JDBC URL

```ini
jdbc:clickhouse://<host>:<port>[/<database>]
```



### Clickhouse Driver Class

```ini
ru.yandex.clickhouse.ClickHouseDriver
```



### Clickhouse JDBC Driver

```shell
wget http://central.maven.org/maven2/ru/yandex/clickhouse/clickhouse-jdbc/0.1.42/clickhouse-jdbc-0.1.42.jar
```

