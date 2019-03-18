## Step 1: Create Kafka Topics

```sh
${CONFLUENT_HOME}/bin/kafka-topics --create --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 \
--replication-factor 1 --partitions 1 --topic users


${CONFLUENT_HOME}/bin/kafka-topics --create --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 \
--replication-factor 1 --partitions 1 --topic pageviews
```



## Step 2: Install and Load Connectors



```sh
wget https://github.com/confluentinc/kafka-connect-datagen/raw/master/config/connector_pageviews_cos.config
curl -X POST -H "Content-Type: application/json" --data @connector_pageviews_cos.config http://10.182.93.75:8083/connectors

wget https://github.com/confluentinc/kafka-connect-datagen/raw/master/config/connector_users_cos.config
curl -X POST -H "Content-Type: application/json" --data @connector_users_cos.config http://10.182.93.75:8083/connectors
```



## Step 3: Generate Sample Data

```sh
./bin/ksql-datagen quickstart=pageviews format=AVERO topic=pageviews maxInterval=100 iterations=10000000 schemaRegistryUrl=http://10.182.93.73:8081


./bin/ksql-datagen quickstart=users format=AVERO topic=users maxInterval=1000 iterations=10000000 schemaRegistryUrl=http://10.182.93.73:8081
```



## Step 5: Create and Write to a Stream and Table using KSQL

In this step KSQL queries are run on the `pageviews` and `users` topics that were created in the previous step. The following KSQL commands are run from the [KSQL CLI](https://docs.confluent.io/current/ksql/docs/installation/installing.html#install-ksql-cli). Enter these commands in your terminal and press **Enter**.

Important

- Confluent Platform must be [installed and running](https://docs.confluent.io/current/quickstart/ce-quickstart.html#download-start-cp).
- To try out the preview KSQL web interface, see the Confluent Platform [quick start](https://docs.confluent.io/current/quickstart/ce-quickstart.html#ce-quickstart) with commercial components.
- All KSQL commands must end with a closing semicolon (`;`).

### Create Streams and Tables

1. Start the KSQL CLI in your terminal with this command. ..

   ```sql
   LOG_DIR=./ksql_logs <path-to-confluent>/bin/ksql
   
   set 'ksql.schema.registry.url'='http://10.182.93.73:8081';
   ```

   

   Important

   By default KSQL attempts to store its logs in a directory called `logs` that is relative to the location of the `ksql` executable. For example, if `ksql` is installed at `/usr/local/bin/ksql`, then it would attempt to store its logs in `/usr/local/logs`. If you are running `ksql` from the default Confluent Platform location, `<path-to-confluent>/bin`, you must override this default behavior by using the `LOG_DIR` variable.

2. Create a stream (`pageviews`) from the Kafka topic `pageviews`, specifying the `value_format` of `AVRO`.

   ```sh
   CREATE STREAM pageviews (viewtime BIGINT, userid VARCHAR, pageid VARCHAR) \
   WITH (KAFKA_TOPIC='pageviews', VALUE_FORMAT='AVRO');
   ```

   

   **Tip:** Enter the `SHOW STREAMS;` command to view your streams. For example:

   ```ini
    Stream Name      | Kafka Topic      | Format
   -------------------------------------------------
    PAGEVIEWS        | pageviews        | AVRO
   -------------------------------------------------
   ```

   

3. Create a table (`users`) with several columns from the Kafka topic `users`, with the `value_format` of `AVRO`.

   ```sh
   CREATE TABLE users (registertime BIGINT, userid VARCHAR, regionid VARCHAR, gender VARCHAR, interests ARRAY<VARCHAR(STRING)>, contact_info MAP<VARCHAR, VARCHAR>) \
   WITH (KAFKA_TOPIC='users', VALUE_FORMAT='AVRO', KEY = 'userid');
   ```

   Copy

   **Tip:** Enter the `SHOW TABLES;` query to view your tables.

   ```ini
    Table Name        | Kafka Topic       | Format    | Windowed
   --------------------------------------------------------------
    USERS             | users             | AVRO      | false
   --------------------------------------------------------------
   ```

   

### Write Queries

These examples write queries using KSQL. The following KSQL commands are run from the [KSQL CLI](https://docs.confluent.io/current/ksql/docs/index.html#ksql-home). Enter these commands in your terminal and press **Enter**.

1. Add the custom query property `earliest` for the `auto.offset.reset` parameter. This instructs KSQL queries to read all available topic data from the beginning. This configuration is used for each subsequent query. For more information, see the [KSQL Configuration Parameter Reference](https://docs.confluent.io/current/ksql/docs/installation/server-config/config-reference.html#ksql-param-reference).

   ```sh
   SET 'auto.offset.reset'='earliest';
   ```

   

   Your output should resemble:

   ```ini
   Successfully changed local property 'auto.offset.reset' from 'null' to 'earliest'
   ```

   

   Your may check it as below:

   ```ini
   ksql> show properties;
   
    Property                                               | Default override | Effective Value                                                                                 
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ksql.extension.dir                                     |                  | ext                                                                                             
    ksql.functions.substring.legacy.args                   |                  | false                                                                                           
    ksql.output.topic.name.prefix                          |                  |                                                                                                 
    ksql.persistent.prefix                                 |                  | query_                                                                                          
    ksql.schema.registry.url                               | SERVER           | http://10.182.93.73:8081                                                                        
    ksql.service.id                                        |                  | default_                                                                                        
    ksql.sink.partitions                                   |                  | 4                                                                                               
    ksql.sink.replicas                                     |                  | 1                                                                                               
    ksql.sink.window.change.log.additional.retention       |                  | 1000000                                                                                         
    ksql.statestore.suffix                                 |                  | _ksql_statestore                                                                                
    ksql.streams.application.id                            | SERVER           | KSQL_REST_SERVER_DEFAULT_APP_ID                                                                 
    ksql.streams.auto.offset.reset                         | SESSION          | earliest                                                                                        
    ksql.streams.bootstrap.servers                         | SERVER           | authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092 
    ksql.streams.cache.max.bytes.buffering                 | SERVER           | 10000000                                                                                        
    ksql.streams.commit.interval.ms                        | SERVER           | 2000                                                                                            
    ksql.streams.default.deserialization.exception.handler | SERVER           | io.confluent.ksql.errors.LogMetricAndContinueExceptionHandler                                   
    ksql.streams.num.stream.threads                        | SERVER           | 4                                                                                               
    ksql.transient.prefix                                  |                  | transient_                                                                                      
    ksql.udf.collect.metrics                               |                  | false                                                                                           
    ksql.udf.enable.security.manager                       |                  | true                                                                                            
    ksql.udfs.enabled                                      |                  | true                                                                                            
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   ```

   

   

2. Create a query that returns data from a stream with the results limited to three rows.

   ```sql
   SELECT pageid FROM pageviews LIMIT 3;
   ```

   

   Your output should resemble:

   ```ini
   Page_45
   Page_38
   Page_11
   LIMIT reached for the partition.
   Query terminated
   ```

   

3. Create a persistent query that filters for female users. The results from this query are written to the Kafka `PAGEVIEWS_FEMALE` topic. This query enriches the `pageviews` STREAM by doing a `LEFT JOIN` with the `users` TABLE on the user ID, where a condition (`gender = 'FEMALE'`) is met.

   ```sql
   CREATE STREAM pageviews_female AS SELECT users.userid AS userid, pageid, \
   regionid, gender FROM pageviews LEFT JOIN users ON pageviews.userid = users.userid \
   WHERE gender = 'FEMALE';
   ```

   

   Your output should resemble:

   ```ini
    Message
   ----------------------------
    Stream created and running
   ----------------------------
   ```

   

4. Create a persistent query where a condition (`regionid`) is met, using `LIKE`. Results from this query are written to a Kafka topic named `pageviews_enriched_r8_r9`.

   ```sql
   CREATE STREAM pageviews_female_like_89 WITH (kafka_topic='pageviews_enriched_r8_r9', \
   value_format='AVRO') AS SELECT * FROM pageviews_female WHERE regionid LIKE '%_8' OR regionid LIKE '%_9';
   ```

   

   Your output should resemble:

   ```ini
    Message
   ----------------------------
    Stream created and running
   ----------------------------
   ```

   

5. Create a persistent query that counts the pageviews for each region and gender combination in a [tumbling window](https://docs.confluent.io/current/streams/developer-guide/dsl-api.html#windowing-tumbling) of 30 seconds when the count is greater than 1. Because the procedure is grouping and counting, the result is now a table, rather than a stream. Results from this query are written to a Kafka topic called `PAGEVIEWS_REGIONS`.

   ```sql
   CREATE TABLE pageviews_regions AS SELECT gender, regionid , \
   COUNT(*) AS numusers FROM pageviews_female WINDOW TUMBLING (size 30 second) \
   GROUP BY gender, regionid HAVING COUNT(*) > 1;
   ```

   

   Your output should resemble:

   ```ini
    Message
   ---------------------------
    Table created and running
   ---------------------------
   ```

   

## Step 5: Monitor Streaming Data

Now that your streams are running you can monitor them.

- View the details for your stream or table with the `DESCRIBE EXTENDED` command. For example, run this command to view the `pageviews_female_like_89`stream:

  ```sql
  DESCRIBE EXTENDED pageviews_female_like_89;
  ```

  

  Your output should look like this:

  ```ini
  Type                 : STREAM
  Key field            : PAGEVIEWS.USERID
  Timestamp field      : Not set - using <ROWTIME>
  Key format           : STRING
  Value format         : AVRO
  Kafka output topic   : pageviews_enriched_r8_r9 (partitions: 4, replication: 1)
  
   Field    | Type
  --------------------------------------
   ROWTIME  | BIGINT           (system)
   ROWKEY   | VARCHAR(STRING)  (system)
   USERID   | VARCHAR(STRING)  (key)
   PAGEID   | VARCHAR(STRING)
   REGIONID | VARCHAR(STRING)
   GENDER   | VARCHAR(STRING)
  --------------------------------------
  
  Queries that write into this STREAM
  -----------------------------------
  id:CSAS_PAGEVIEWS_FEMALE_LIKE_89 - CREATE STREAM pageviews_female_like_89 WITH (kafka_topic='pageviews_enriched_r8_r9', value_format='AVRO') AS SELECT * FROM pageviews_female WHERE regionid LIKE '%_8' OR regionid LIKE '%_9';
  
  For query topology and execution plan please run: EXPLAIN <QueryId>
  
  Local runtime statistics
  ------------------------
  messages-per-sec:      2.01   total-messages:     10515     last-message: 3/14/18 2:25:40 PM PDT
   failed-messages:         0 failed-messages-per-sec:         0      last-failed:       n/a
  (Statistics of the local KSQL server interaction with the Kafka topic pageviews_enriched_r8_r9)
  ```

  

- Discover the query execution plan with the `EXPLAIN` command. For example, run this command to view the query execution plan for `CTAS_PAGEVIEWS_REGIONS`:

  ```sql
  EXPLAIN CTAS_PAGEVIEWS_REGIONS;
  ```

  

  Your should look like this:

  ```ini
  Type                 : QUERY
  SQL                  : CREATE TABLE pageviews_regions AS SELECT gender, regionid , COUNT(*) AS numusers FROM pageviews_female WINDOW TUMBLING (size 30 second) GROUP BY gender, regionid HAVING COUNT(*) > 1;
  
  
  Local runtime statistics
  ------------------------
  messages-per-sec:      1.42   total-messages:     13871     last-message: 3/14/18 2:50:02 PM PDT
   failed-messages:         0 failed-messages-per-sec:         0      last-failed:       n/a
  (Statistics of the local KSQL server interaction with the Kafka topic PAGEVIEWS_REGIONS)
  
  Execution plan
  --------------
   > [ PROJECT ] Schema: [GENDER : STRING , REGIONID : STRING , NUMUSERS : INT64].
           > [ FILTER ] Schema: [PAGEVIEWS_FEMALE.GENDER : STRING , PAGEVIEWS_FEMALE.REGIONID : STRING , PAGEVIEWS_FEMALE.ROWTIME : INT64 , KSQL_AGG_VARIABLE_0 : INT64 , KSQL_AGG_VARIABLE_1 : INT64].
                   > [ AGGREGATE ] Schema: [PAGEVIEWS_FEMALE.GENDER : STRING , PAGEVIEWS_FEMALE.REGIONID : STRING , PAGEVIEWS_FEMALE.ROWTIME : INT64 , KSQL_AGG_VARIABLE_0 : INT64 , KSQL_AGG_VARIABLE_1 : INT64].
                           > [ PROJECT ] Schema: [PAGEVIEWS_FEMALE.GENDER : STRING , PAGEVIEWS_FEMALE.REGIONID : STRING , PAGEVIEWS_FEMALE.ROWTIME : INT64].
                                   > [ SOURCE ] Schema: [PAGEVIEWS_FEMALE.ROWTIME : INT64 , PAGEVIEWS_FEMALE.ROWKEY : STRING , PAGEVIEWS_FEMALE.USERID : STRING , PAGEVIEWS_FEMALE.PAGEID : STRING , PAGEVIEWS_FEMALE.REGIONID : STRING , PAGEVIEWS_FEMALE.GENDER : STRING].
  
  
  Processing topology
  -------------------
  Topologies:
     Sub-topology: 0
      Source: KSTREAM-SOURCE-0000000000 (topics: [PAGEVIEWS_FEMALE])
        --> KSTREAM-MAPVALUES-0000000001
      Processor: KSTREAM-MAPVALUES-0000000001 (stores: [])
        --> KSTREAM-TRANSFORMVALUES-0000000002
        <-- KSTREAM-SOURCE-0000000000
      ...
  
    Sub-topology: 1
      Source: KSTREAM-SOURCE-0000000008 (topics: [KSQL_Agg_Query_1521052072079-repartition])
        --> KSTREAM-AGGREGATE-0000000005
      Processor: KSTREAM-AGGREGATE-0000000005 (stores: [KSQL_Agg_Query_1521052072079])
        --> KTABLE-FILTER-0000000009
        <-- KSTREAM-SOURCE-0000000008
      ...
  ```

  

For more information about KSQL syntax, see [KSQL Syntax Reference](https://docs.confluent.io/current/ksql/docs/developer-guide/syntax-reference.html#ksql-syntax-reference).