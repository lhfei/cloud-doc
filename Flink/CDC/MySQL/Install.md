# Flink CDC Connectors

Flink CDC Connectors is a set of source connectors for Apache Flink, ingesting changes from different databases using change data capture (CDC).
The Flink CDC Connectors integrates Debezium as the engine to capture data changes. So it can fully leverage the ability of Debezium. See more about what is [Debezium](https://github.com/debezium/debezium).

This README is meant as a brief walkthrough on the core features with Flink CDC Connectors. For a fully detailed documentation, please see [Documentation](https://github.com/ververica/flink-cdc-connectors/wiki).

## Supported (Tested) Connectors

| Database   | Version                                             |
| ---------- | --------------------------------------------------- |
| MySQL      | Database: 5.7, 8.0.x <br/>JDBC Driver: 8.0.16       |
| PostgreSQL | Database: 9.6, 10, 11, 12 <br/>JDBC Driver: 42.2.12 |

## Features

1. Supports reading database snapshot and continues to read binlogs with **exactly-once processing** even failures happen.
2. CDC connectors for DataStream API, users can consume changes on multiple databases and tables in a single job without Debezium and Kafka deployed.
3. CDC connectors for Table/SQL API, users can use SQL DDL to create a CDC source to monitor changes on a single table.

## Usage for Table/SQL API

We need several steps to setup a Flink cluster with the provided connector.

1. Setup a Flink cluster with version 1.12+ and Java 8+ installed.
2. Download the connector SQL jars from the [Download](https://github.com/ververica/flink-cdc-connectors/releases) page (or [build yourself](#building-from-source)).
3. Put the downloaded jars under `FLINK_HOME/lib/`.
4. Restart the Flink cluster.

The example shows how to create a MySQL CDC source in [Flink SQL Client](https://ci.apache.org/projects/flink/flink-docs-release-1.13/dev/table/sqlClient.html) and execute queries on it.

```sql
-- creates a mysql cdc table source
CREATE TABLE mysql_binlog (
 id INT NOT NULL,
 name STRING,
 description STRING,
 weight DECIMAL(10,3)
) WITH (
 'connector' = 'mysql-cdc',
 'hostname' = 'localhost',
 'port' = '3306',
 'username' = 'flinkuser',
 'password' = 'flinkpw',
 'database-name' = 'inventory',
 'table-name' = 'products'
);

-- read snapshot and binlog data from mysql, and do some transformation, and show on the client
SELECT id, UPPER(name), description, weight FROM mysql_binlog;
```

## Usage for DataStream API

Include following Maven dependency (available through Maven Central):

```
<dependency>
  <groupId>com.ververica</groupId>
  <!-- add the dependency matching your database -->
  <artifactId>flink-connector-mysql-cdc</artifactId>
  <version>2.0.0</version>
</dependency>
```

```java
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.source.SourceFunction;
import com.ververica.cdc.debezium.StringDebeziumDeserializationSchema;
import com.ververica.cdc.connectors.mysql.MySqlSource;

public class MySqlBinlogSourceExample {
  public static void main(String[] args) throws Exception {
    SourceFunction<String> sourceFunction = MySqlSource.<String>builder()
      .hostname("localhost")
      .port(3306)
      .databaseList("inventory") // monitor all tables under inventory database
      .username("flinkuser")
      .password("flinkpw")
      .deserializer(new StringDebeziumDeserializationSchema()) // converts SourceRecord to String
      .build();

    StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

    env
      .addSource(sourceFunction)
      .print().setParallelism(1); // use parallelism 1 for sink to keep message ordering

    env.execute();
  }
}
```

## Building from source

- Prerequisites:
    - git
    - Maven
    - At least Java 8

```
git clone https://github.com/ververica/flink-cdc-connectors.git
cd flink-cdc-connectors
mvn clean install -DskipTests
```

Flink CDC Connectors is now available at your local `.m2` repository.

## License

The code in this repository is licensed under the [Apache Software License 2](https://github.com/ververica/flink-cdc-connectors/blob/master/LICENSE).

## Contributing

The Flink CDC Connectors welcomes anyone that wants to help out in any way, whether that includes reporting problems, helping with documentation, or contributing code changes to fix bugs, add tests, or implement new features. You can report problems to request features in the [GitHub Issues](https://github.com/ververica/flink-cdc-connectors/issues).

## Community

* [DingTalk](https://www.dingtalk.com/) Chinese User Group

  You can search the group number [**33121212**] or scan the following QR code to join in the group.
  
  <div align=center>
     <img src="https://user-images.githubusercontent.com/5163645/128969750-6a6c9832-eab3-4c72-8c76-32dd66539dbd.png" width=400 />
   </div>

## Documents
To get started, please see https://ververica.github.io/flink-cdc-connectors/