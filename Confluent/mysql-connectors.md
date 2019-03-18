### MySQL Server

| Host         | User | Password      |
| ------------ | ---- | ------------- |
| 10.182.93.72 | root | Lhfeilaile@01 |
|              |      |               |
|              |      |               |



### Prepare



```sh
git clone --progress https://github.com/datacharmer/test_db.git

cd test_db 

mysql -uroot -p -t < employees.sql

time mysql -t < test_employees_sha.sql

time mysql -t < test_employees_md5.sql
```



![imagemysql-create-db.png](images/mysql-create-db.png)





![](images/mysql-test-sha.png)



![](images/mysql-test-md5.png)



## Sink Example

### Create DB & Tables

```sql
-- mysql -uroot -p -t < employee.sql

CREATE TABLE `accounts` (
  `name` VARCHAR(64) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8
```



### Create Topic

```sql
${CONFLUENT_HOME}/bin/kafka-topics --create --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 \
--replication-factor 1 --partitions 1 --topic mysql-employees
```



### Configure Data Sink Properties

Navegate to `etc/kafka-connect-jdbc/sink-quickstart-mysql.properties`

```ini
# A simple example that copies from a topic to a SQLite database.
# The first few settings are required for all connectors:
# a name, the connector class to run, and the maximum number of tasks to create:
name=mysql-sink
connector.class=io.confluent.connect.jdbc.JdbcSinkConnector
tasks.max=1

# The topics to consume from - required for sink connectors like this one
topics=mysql-employees

# Configuration specific to the JDBC sink connector.
# We want to connect to a SQLite database stored in the file test.db and auto-create tables.
connection.url=jdbc:mysql://10.182.93.72:3306/kafka_conn
connection.user=root
connection.password=Lhfeilaile@01
auto.create=true
```



### Load `mysql-sink` Connector

On Kafka-connect node,`10.182.93.75:8083`

```sh
cd $CONFLUENT_HOME

confluent load mysql-sink -d etc/kafka-connect-jdbc/sink-quickstart-mysql.properties 

-----------------------------------------
{
  "type": null,
  "tasks": [],
  "config": {
    "name": "mysql-sink",
    "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
    "tasks.max": "1",
    "topics": "mysql-employees",
    "connection.url": "jdbc:mysql://10.182.93.72:3306/kafka_conn",
    "connection.user": "root",
    "connection.password": "Lhfeilaile@01",
    "auto.create": "true"
  },
  "name": "mysql-sink"
}
```



Validate it by `curl` on  host`10.182.93.75`

```sh
curl -s http://10.182.93.75:8083/connectors
["mysql-sink"]
```



### Add MySQL JDBC Driver



```sh
cp mysql-connector-java-5.1.47.jar share/java/kafka-connect-jdbc/
```



### Producer a record into the `mysql-employees` topic

Next, navigate to schema-registry-server[10.182.93.73] and start the Avro console producer to import a few records to Kafka:

```sh
./bin/kafka-avro-console-producer --broker-list authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092 --topic mysql-employees \
    --property value.schema='{"type":"record","name":"employeerecord","fields":[{"name":"id","type":"int"}, {"name":"name","type":"string"}]}'
```





Then in the console producer, type in:

```json
{"id": 1, "name": "Alice"}
{"id": 2, "name": "Bob"}
{"id": 3, "name": "John"}
```

The three records entered are published to the Kafka topic test_hdfs in Avro format.



```
./bin/kafka-avro-console-consumer --bootstrap-server 10.182.93.76:9092  --topic mysql-employees --from-beginning
```



---



## Sample 2

---

### Configure Data Sink Properties

Navegate to `etc/kafka-connect-jdbc/sink-quickstart-mysql-bulk.properties`

```ini
# A simple example that copies from a topic to a SQLite database.
# The first few settings are required for all connectors:
# a name, the connector class to run, and the maximum number of tasks to create:
name=mysql-bulk-sink
connector.class=io.confluent.connect.jdbc.JdbcSinkConnector
tasks.max=3

# The topics to consume from - required for sink connectors like this one
topics.regex=^mysql-.*

# Configuration specific to the JDBC sink connector.
# We want to connect to a SQLite database stored in the file test.db and auto-create tables.
connection.url=jdbc:mysql://10.182.93.72:3306/kafka_conn
connection.user=root
connection.password=Lhfeilaile@01
auto.create=true
```



### Producer a record into the `orders` topic

Next, navigate to schema-registry-server[10.182.93.73] and start the Avro console producer to import a few records to Kafka:

```sh


```





Then in the console producer, type in:

```json
{"id": 991, "product": "foo", "quantity": 92 , "price": 42}
{"id": 992, "product": "foo", "quantity": 93 , "price": 43}
{"id": 993, "product": "foo", "quantity": 94 , "price": 44}
{"id": 994, "product": "foo", "quantity": 95 , "price": 45}
{"id": 995, "product": "foo", "quantity": 96 , "price": 46}
{"id": 996, "product": "foo", "quantity": 97 , "price": 47}
{"id": 997, "product": "foo", "quantity": 98 , "price": 48}
{"id": 998, "product": "foo", "quantity": 99 , "price": 49}
{"id": 999, "product": "foo", "quantity": 100, "price": 50}
```

The three records entered are published to the Kafka topic test_hdfs in Avro format.



## Source Example

### Load the JDBC Source Connector

Load the predefined JDBC source connector.

1. Optional: View the available predefined connectors with this command:

   ```sh
   confluent list connectors
   ```

   

   Your output should resemble:

   ```ini
   Bundled Predefined Connectors (edit configuration under etc/):
     elasticsearch-sink
     file-source
     file-sink
     jdbc-source
     jdbc-sink
     hdfs-sink
     s3-sink
   ```

   

2. Load the `jdbc-source` connector. The `test.db` file must be in the same directory where Connect is started.

   Edit source configuration file on `etc/kafka-connect-jdbc/source-quickstart-mysql.properties`

   ```ini
   # A simple example that copies from a topic to a SQLite database.
   # The first few settings are required for all connectors:
   # a name, the connector class to run, and the maximum number of tasks to create:
   name=mysql-source
   connector.class=io.confluent.connect.jdbc.JdbcSourceConnector
   tasks.max=1
   
   # The topics to consume from - required for sink connectors like this one
   topic.prefix=mysql-source-
   
   # Configuration specific to the JDBC sink connector.
   # We want to connect to a SQLite database stored in the file test.db and auto-create tables.
   connection.url=jdbc:mysql://10.182.93.72:3306/kafka_conn
   connection.user=root
   connection.password=Lhfeilaile@01
   
   mode=incrementing
   incrementing.column.name=id
   ```

   

   Navigate to  host`10.182.93.75`,  open an terminal:

   ```sh
   On Kafka-connect node,10.182.93.75:8083
   
   cd $CONFLUENT_HOME   
   confluent load mysql-source -d etc/kafka-connect-jdbc/source-quickstart-mysql.properties
   ```

   

   Your output should resemble:

   ```sh
   {
     "name": "mysql-source",
     "config": {
       "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
       "tasks.max": "1",
       "connection.url": "jdbc:mysql://10.182.93.72:3306/kafka_conn",
       "connection.user": "root",
       "connection.password": "Lhfeilaile@01",
       "topic.prefix": "mysql-source-",
       "mode": "incrementing",
       "incrementing.column.name": "id",
       "name": "mysql-source"
     },
     "tasks": [],
     "type": null
   }
   ```

   

   For non-CLI users, you can load the JDBC sink connector with this command:

   ```sh
   <path-to-confluent>/bin/connect-standalone \
   <path-to-confluent>/etc/schema-registry/connect-avro-standalone.properties \
   <path-to-confluent>/etc/kafka-connect-jdbc/sink-quickstart-sqlite.properties
   ```

   

   In the MySQL DB `kafka_conn`, the table name of `orders`, the kafka will auto crete a topic for it as name `mysql-source-orders`, you may check it as below:

   

   ```sh
   ${CONFLUENT_HOME}/bin/kafka-topics --list --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181
   ```

   And the output as below:

   ```ini
   ... ... 
   _schemas
   connect-configs
   connect-offsets
   connect-statuses
   mysql-source-orders
   ```

   

   

   To check that it has copied the data that was present when you started Kafka Connect, start a console consumer, reading from the beginning of the topic:

   ```sh
     ./bin/kafka-avro-console-consumer --bootstrap-server authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092 --topic mysql-source-orders --from-beginning
   
   ```

   

The output shows the two records as expected, one per line, in the JSON encoding of the Avro records. Each row is represented as an Avro record and each column is a field in the record. You can see both columns in the table, `id` and `name`. The IDs were auto-generated and the column is of type `INTEGER NOT NULL`, which can be encoded directly as an integer. The `name` column has type `STRING` and can be `NULL`. The JSON encoding of Avro encodes the strings in the format `{"type": value}`, so you can see that both rows have `string` values with the names specified when you inserted the data.

### Add a Record to the Consumer

Add another record via the SQLite command prompt:

```sql
sqlite> INSERT INTO accounts(name) VALUES('cathy');
```



You can switch back to the console consumer and see the new record is added and, importantly, the old entries are not repeated:

```sql
{"id":3,"name":{"string":"cathy"}}
```



Note that the default polling interval is five seconds, so it may take a few seconds to show up. Depending on your expected rate of updates or desired latency, a smaller poll interval could be used to deliver updates more quickly.

[All the features of Kafka Connect](https://docs.confluent.io/current/connect/userguide.html#connect-userguide), including offset management and fault tolerance, work with the source connector. You can restart and kill the processes and they will pick up where they left off, copying only new data (as defined by the `mode` setting).