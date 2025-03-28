# Debezium Connector for MySQL

Table of Contents

- [Overview](https://debezium.io/docs/connectors/mysql/#overview)
- Setting up MySQL
  - [Enabling the binlog](https://debezium.io/docs/connectors/mysql/#enabling-the-binlog)
  - [Enabling GTIDs (optional)](https://debezium.io/docs/connectors/mysql/#enabling-gtids-optional)
  - [Enabling Query Log Events (optional)](https://debezium.io/docs/connectors/mysql/#enabling-query-log-events-optional)
  - [Create a MySQL user for the connector](https://debezium.io/docs/connectors/mysql/#create-a-mysql-user-for-the-connector)
- Supported MySQL topologies
  - [MySQL standalone](https://debezium.io/docs/connectors/mysql/#mysql-standalone)
  - [MySQL master and slave](https://debezium.io/docs/connectors/mysql/#mysql-master-and-slave)
  - [Highly Available MySQL clusters](https://debezium.io/docs/connectors/mysql/#highly-available-mysql-clusters)
  - [Multi-Master MySQL](https://debezium.io/docs/connectors/mysql/#multi-master-mysql)
  - [Hosted MySQL](https://debezium.io/docs/connectors/mysql/#hosted-mysql)
- How the MySQL connector works
  - [Database schema history](https://debezium.io/docs/connectors/mysql/#database-schema-history)
  - [Snapshots](https://debezium.io/docs/connectors/mysql/#snapshots)
  - [Reading the MySQL binlog](https://debezium.io/docs/connectors/mysql/#reading-the-binlog)
  - [Topics names](https://debezium.io/docs/connectors/mysql/#topic-names)
  - [Schema change topic](https://debezium.io/docs/connectors/mysql/#schema-change-topic)
  - [Events](https://debezium.io/docs/connectors/mysql/#events)
  - [Data types](https://debezium.io/docs/connectors/mysql/#data-types)
  - [When things go wrong](https://debezium.io/docs/connectors/mysql/#when-things-go-wrong)
- Deploying a connector
  - [Monitoring](https://debezium.io/docs/connectors/mysql/#monitoring)
  - [Example configuration](https://debezium.io/docs/connectors/mysql/#example-configuration)
  - [Connector properties](https://debezium.io/docs/connectors/mysql/#connector-properties)

Debezium’s MySQL Connector can monitor and record all of the row-level changes in the databases on a MySQL server or HA MySQL cluster. The first time it connects to a MySQL server/cluster, it reads a consistent snapshot of all of the databases. When that snapshot is complete, the connector continuously reads the changes that were committed to MySQL 5.6 or later and generates corresponding insert, update and delete events. All of the events for each table are recorded in a separate Kafka topic, where they can be easily consumed by applications and services.

As of Debezium 0.4.0, this connector adds preliminary support for [Amazon RDS](https://aws.amazon.com/rds/mysql/) and [Amazon Aurora (MySQL compatibility)](https://aws.amazon.com/rds/aurora/). However, due to limitations of these hosted forms of MySQL, the connector retains locks during an initial consistent snapshot [for the duration of the snapshot](https://debezium.io/docs/connectors/mysql/#snapshots-without-global-read-locks).

## Overview

MySQL’s [*binary log*](http://dev.mysql.com/doc/refman/5.7/en/binary-log.html), or *binlog*, records all operations in the same order they are committed by the database, including changes to the schemas of tables or changes to data stored within the tables. MySQL uses its binlog for replication and recovery.

Debezium’s MySQL connector reads MySQL’s binary log to understand what and in what order data has changed. It then produces a *change event* for every row-level insert, update, and delete operation in the binlog, recording all the change events for each table in a separate Kafka topic. Your client applications read the Kafka topics that correspond to the database tables it’s interested in following, and react to every row-level event it sees in those topics.

MySQL is usually set up to purge the binary logs after some period of time. This means that the binary log won’t have the complete history of all changes that have been made to the database. Therefore, when the MySQL connector first connects to a particular MySQL sever or cluster, it starts by performing a [*consistent snapshot*](https://debezium.io/docs/connectors/mysql/#snapshot) of each of the databases. When the connector completes the snapshot, it then starts reading the binlog from the exact point at which the snapshot was made. This way, we start with a consistent view of all of the data, yet continue reading without having lost any of the changes made while the snapshot was being made.

The connector is also very tolerant of failures. As the connector reads the binlog and produces events, it records the binlog position with each event. If the connector stops for any reason (including communication failures, network problems, or crashes), upon restart it simply continues reading the binlog where it last left off. This includes snapshots: if the snapshot was not completed when the connector is stopped, upon restart it will begin a new snapshot. We’ll talk later about how the connector behaves [when things go wrong](https://debezium.io/docs/connectors/mysql/#when-things-go-wrong).

## Setting up MySQL

Before the Debezium MySQL connector can be used to monitor the changes committed on a MySQL server, the server must be set up to use *row-level binary logging* and have a database user with appropriate privileges. If MySQL is configured to use global transaction identifiers (GTIDs), then the Debezium connector can more easily reestablish connection should one of the MySQL servers fail.

The following sections outline in more detail how to set up these features in MySQL.

### Enabling the binlog

The MySQL server must be configured to use a *row-level* binary log, which is described in more detail in the [MySQL documentation](http://dev.mysql.com/doc/refman/5.7/en/replication-options.html). This is most often done in the MySQL server configuration file, and will look similar to the following fragment:

```ini
server-id         = 223344
log_bin           = mysql-bin
binlog_format     = row
binlog_row_image  = full
expire_logs_days  = 10
```

where:

- the value for [`server-id`](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_server_id) must be unique for each server and replication client within the MySQL cluster. When we set up the connector, we’ll also assign the connector a unique server ID.
- the value for [`log_bin`](http://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_log_bin) is the base name for the sequence of binlog files.
- the value for [`binlog_format`](http://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_binlog_format) must be set to `row` or `ROW`.
- the value for [`binlog_row_image`](https://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_binlog_row_image) must be set to `full` or `FULL`.
- the value for [`expire_log_days`](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_expire_logs_days) is the number of days for automatic binary log file removal. The default is 0, which means "no automatic removal," so be sure to set a value that is appropriate for your environment.

|      | Running a MySQL server with binary logging enabled does slightly reduce performance of the MySQL server, but the benefits generally outweigh the costs. Each binlog reader will also place a small load on the server, so using Debezium is a great way to minimize this load while providing the change events to a large variety and number of consumers. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Enabling GTIDs (optional)

The MySQL server can be configured to use [GTID-based replication](https://dev.mysql.com/doc/refman/5.6/en/replication-gtids.html). Global transaction identifiers, or GTIDs, were introduced in MySQL 5.6.5, and they uniquely identify a transaction that occurred on a particular server within a cluster. Using GTIDs greatly simplifies replication and makes it possible to easily confirm whether masters and slaves are consistent. **Note that if you’re using an earlier version of MySQL, you will not be able to enable GTIDs.**

Enabling GTIDs can be done in the MySQL server configuration file, and will look similar to the following fragment:

```
gtid_mode                 = on
enforce_gtid_consistency  = on
```

where:

- the value for [`gtid_mode`](https://dev.mysql.com/doc/refman/5.6/en/replication-options-gtids.html#option_mysqld_gtid-mode) specifies the GTID mode of the MySQL server.
- the value for [`enforce_gtid_consistency`](https://dev.mysql.com/doc/refman/5.6/en/replication-options-gtids.html) instructs the server to enforce GTID consistency by allowing execution of only those statements that can be logged in a transactionally safe manner, and is required when using GTIDs.

Consult the [MySQL documentation](https://dev.mysql.com/doc/refman/5.6/en/replication-options-gtids.html#option_mysqld_gtid-mode) for details and specifics about setting up GTIDs.

|      | The MySQL connector does not require MySQL to use GTIDs and GTID-based replication. Each time the connector starts up, it will automatically detect whether it is enabled and adjust its behavior accordingly. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Enabling Query Log Events (optional)

Starting with MySQL 5.6 row based replication can be configured to include the original SQL statement with each binlog event. **Note that if you’re using an earlier version of MySQL, you will not be able to enable this feature.**

Enabling this option can be done in the MySQL server configuration file, and will look similar to the following fragment:

```
binlog_rows_query_log_events = on
```

where:

- the value for [`binlog_rows_query_log_events`](https://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_binlog_rows_query_log_events) can be set to `on` or `ON` to enable support for including the original SQL statement in the binlog entry.

### Create a MySQL user for the connector

A MySQL user must be defined that has all of the following permissions on all of the databases that the connector will monitor:

- [`SELECT`](http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_select) - enables the connector to select rows from tables in databases; used only when performing a snapshot
- [`RELOAD`](http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_reload) - enables the connector of the [`FLUSH`](http://dev.mysql.com/doc/refman/5.7/en/flush.html) statement to clear or reload various internal caches, flush tables, or acquire locks; used only when performing a snapshot
- [`SHOW DATABASES`](http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_show-databases) - enables the connector to see database names by issuing the `SHOW DATABASE` statement; used only when performing a snapshot
- [`REPLICATION SLAVE`](http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_replication-slave) - enables the connector to connect to and read the binlog of its MySQL server; always required for the connector
- [`REPLICATION CLIENT`](http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_replication-client) - enables the use of `SHOW MASTER STATUS`, `SHOW SLAVE STATUS`, and `SHOW BINARY LOGS`; always required for the connector

For example, the following statement grants these permissions for a user `debezium` that authenticates with the password `dbz`, where the user can be on any machine:

```
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium' IDENTIFIED BY 'dbz';
```

|      | Choose a good password that is different from what we use above.Also, the above grant is equivalent to specifying any authenticating client on *any* hosts, so obviously this is not recommended for production. Instead, in production you would almost certainly limit the replication user to the machine(s) where the MySQL connector is running within a Kafka Connect service, such as `… 'debezium'@'connect.host.acme.com' …`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | When using the MySQL connector with [Amazon RDS](https://aws.amazon.com/rds/mysql/), [Amazon Aurora (MySQL compatibility)](https://aws.amazon.com/rds/aurora/), or any other server where the connector’s database user is unable to obtain a global read lock, the database user must also have the `LOCK TABLES` permission. See the section on [snapshots without global read locks](https://debezium.io/docs/connectors/mysql/#snapshots-without-global-read-locks) and [DBZ-140](https://issues.jboss.org/projects/DBZ/issues/DBZ-140) for additional details. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Supported MySQL topologies

The MySQL connector can be used with a variety of MySQL topologies.

### MySQL standalone

When a single MySQL server is used by itself, then that server must have the binlog enabled (and optionally GTIDs enabled) so that the MySQL connector can be able to monitor it. This is often acceptable, since the binary log can also be used as an [incremental backup](http://dev.mysql.com/doc/refman/5.7/en/backup-methods.html). In this case, the MySQL connector will always connect to and follow this standalone MySQL server instance.

### MySQL master and slave

[MySQL replication](http://dev.mysql.com/doc/refman/5.7/en/replication-solutions.html) can be used to set up a cluster of MySQL instances, where one of the MySQL server instances is considered the *master* and the other(s) a *slave*. Topologies can include single master with single slave, single master with multiple slaves, and multiple masters with multiple slaves. Which you choose will depend on your requirements, your backup and recovery strategy, and how you are scaling MySQL to handle large data volumes and queries.

To use the MySQL connector with one of these topologies, the connector can follow one of the masters or one of the slaves (if that slave has its binlog enabled), but the connector will see only those changes in the cluster that are visible to that server. Generally, this is not a problem except for the multi-master topologies.

The connector records its position in the server’s binlog, which is different on each server in the cluster. Therefore, the connector will need to follow just one MySQL server instance. If that server fails, it must be restarted or recovered before the connector can continue.

### Highly Available MySQL clusters

A [variety of high availability solutions](https://dev.mysql.com/doc/mysql-ha-scalability/en/) exist for MySQL, and they make it far easier to tolerate and almost immediately recover from problems and failures. Most HA MySQL clusters use GTIDs so that slaves are able to keep track of all changes on any of the master.

### Multi-Master MySQL

A [multi-master MySQL](https://dev.mysql.com/doc/refman/5.7/en/mysql-cluster-replication-multi-master.html) topology uses one or more MySQL slaves that each replicate from *multiple* masters. This is a powerful way to aggregate the replication of multiple MySQL clusters, and requires using GTIDs.

As of Debezium 0.3.5, the Debezium MySQL connector can use these multi-master MySQL slaves as sources, and can fail over to *different* multi-master MySQL slaves as long as thew new slave is caught up to the old slave (e.g., the new slave has all of the transactions that were last seen on the first slave). This works even if the connector is only using a subset of databases and/or tables, as the connector can be configured to include or exclude specific GTID sources when attempting to reconnect to a new multi-master MySQL slave and find the correct position in the binlog.

### Hosted MySQL

As of Debezium 0.4.0, the MySQL connector adds preliminary support for [Amazon RDS](https://aws.amazon.com/rds/mysql/) and [Amazon Aurora (MySQL compatibility)](https://aws.amazon.com/rds/aurora/). The connector works as usual when reading the binlog, but in these environments the [connector does perform snapshots differently](https://debezium.io/docs/connectors/mysql/#snapshots-without-global-read-locks). This is because these hosted forms of MySQL prevent database users from being able to obtain a global read lock, so the only way for the connector to obtain a consistent snapshot is to use table-level locks instead. Unfortunately, table-level locks [affect current transactions](https://dev.mysql.com/doc/refman/5.7/en/lock-tables-and-transactions.html), and this means that the locks cannot be released until after the connector completes reading all data and commits its transaction.

## How the MySQL connector works

This section goes into detail about how the MySQL connector tracks the structure of the tables, performs snapshots, transform binlog events into Debezium change events, where those events are recorded in Kafka, and how the connector behaves when things go wrong.

### Database schema history

When a database client queries a database, it uses the database’s current schema. However, the database schema can be changed at any time, which means that the connector must know what the schema looked like at the time each insert, update, or delete operation is *recorded*. It can’t just use the current schema, either, since it may be processing events that are relatively old and may have been recorded before the tables' schemas were changed. Luckily, MySQL includes in the binlog the row-level changes to the data *and* the DDL statements that are applied to the database. As the connector reads the binlog and comes across these DDL statements, it parses them and updates an in-memory representation of each table’s schema, which is then used to understand the structure of the tables at the time each insert, update, or delete occurs and to produce the appropriate change event. It also records in a separate *database history* Kafka topic all of the DDL statements along with the position in the binlog where each DDL statement appeared.

When the connector restarts after having crashed or been stopped gracefully, the connector will start reading the binlog from a specific position (i.e., a specific point in time). The connector rebuilds the table structures that existed *at this point in time* by reading the database history Kafka topic and parsing all DDL statements up until the point in the binlog where the connector is starting.

This database history topic is for connector use only, but the connector can optionally generate *schema change events* on a different topic that is intended for consumer applications. We’ll cover this in the [Schema Change Topic](https://debezium.io/docs/connectors/mysql/#schema-change-topic) section.

|      | It is vital that there is a global order of the events in the database schema history, therefore the database history topic must not be partitioned. This means a partition count of 1 must be specified when creating this topic. When relying on auto topic creation, make sure that Kafka’s `num.partitions` configuration option (the default number of partitions) is set to 1. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Snapshots

When a MySQL connector that is configured to follow a MySQL server instance is first started, it will by default perform an initial *consistent snapshot* of a database. This is the default mode, since much of the time the MySQL binlogs no longer contain the complete history of the database.

The connector performs the following steps each time it takes a snapshot:

1. Grab a global read lock that blocks writes by other database clients.
2. Start a transaction with [*repeatable read* semantics](https://dev.mysql.com/doc/refman/5.6/en/innodb-consistent-read.html) to ensure that all subsequent reads within this transaction are done against a single consistent snapshot.
3. Read the current position of the binlog.
4. Read the schema of the databases and tables allowed by the connector’s configuration.
5. Release the global read lock, allowing other DB clients to again write to the database
6. Optionally write the DDL changes to the *schema change topic*, including all necessary `DROP …` and `CREATE …` DDL statements
7. Scans all of the database tables and generates on the appropriate table-specific Kafka topics `CREATE` events for each row.
8. Commit the transaction.
9. Record in the connector offsets that the connector successfully completed the snapshot.

The transaction started in step 1 does not prevent other clients from making changes to the tables rows, but will instead provide the connector with a consistent and unchanging view of the data in the tables. However, the transaction does not prevent other clients from applying DDL, which could interfere with the connector’s attempt to read the binlog position and the table schemas. So, the connector obtains a global read lock in step 2 to prevent such problems, and it keeps this lock for a very short period of time while it reads the binlog position and table schemas in steps 3 and 4. This global read lock is released in step 5, before the connector performs the bulk of the work of copying the data.

If the connector fails, is rebalanced, or stops before the snapshot is complete, the connector will begin a new snapshot when it is restarted. Once the connector does complete its initial snapshot, the MySQL connector then proceeds to read the binlog from the position read during step 3, ensuring that the connector does not miss any updates. If the connector stops again for any reason, upon restart it will simply continue reading the binlog where it previously left off. However, if the connector remains stopped for long enough, MySQL might purge older binlog files and the connector’s last position may be lost. In this case, when the connector configured with *initial* snapshot mode (the default) is finally restarted, the MySQL server will no longer have the starting point and the connector will fail with an error.

A second snapshot mode allows the connector to perform snapshots *whenever necessary*. This behavior is similar to the default *initial* snapshot behavior mentioned above, except with one exception: if the connector is restarted *and* MySQL no longer has its starting point in the binlog, rather than failing the connector will instead perform another snapshot. This mode is perhaps the most automated, but at the risk of performing additional snapshots when things go wrong (generally when the connector is down too long).

The third snapshot mode ensures the connector *never* performs snapshots. When a new connector is configured this way, it will start reading the binlog from the beginning. This is not the default behavior because starting a new connector in this mode (without a snapshot) requires the MySQL binlog contain the entire history of all monitored databases, and MySQL instances are rarely configured this way. Specifically, the binlog must contain at least the `CREATE TABLE …` statement for every monitored table. If this requirement is not satisfied, the connector will not be able to properly interpret the structure of the low-level events in the binlog, and it will simply skip all events for those missing table definitions. (The connector cannot rely upon the current definition of those tables, since the tables may have been altered after the initial events were recorded in the binlog, preventing the connector from properly interpreting the binlog events.)

As of 0.3.4, a fourth snapshot mode allows the connector to start reading the MySQL binlog from its current position when the connector is started. With the `schema_only` mode the connector reads the current binlog position, captures the current table schemas without reading any data, and then proceeds to read the binlog from its current position. This happens very quickly, and the resulting change event streams include only those change events that occurred **after the snapshot started**. This may be useful for consumers that don’t need to know the complete state of the database but only need to know the changes that were made since the connector was started.

As of 0.7.2, a fifth snapshot mode `schema_only_recovery` allows an existing connector to recover a corrupted or lost database history topic. It behaves similarly to `schema_only`, in that it captures the current table schemas without reading any data. The differences are:

- It can only be used on an existing connector, as an update to the connector’s configuration.
- It begins reading the binlog at the last committed offset for this existing connector, rather than the binlog’s current position.

`schema_only_recovery` can also be used to periodically "clean up" a database history topic (which requires infinite retention) that may be growing unexpectedly. To do this, the database history topic must be manually deleted before updating the connector’s snapshot mode to `schema_only_recovery`. Note that this mode is safe to use **only** if no schema changes have happened after the committed offset. Otherwise, the binlog events between the committed offset and the binlog position with the schema change will be emitted with an inconsistent schema (already based on the altered schema, which didn’t apply yet for these previous events). It is therefore recommended — once recovery of the history topic has succeeded — to return to one of the other snapshotting modes, to prevent further snapshots after subsequent restarts of the connector.

Because of how the connector records offsets when performing a snapshot, the connector now defaults to `include.schema.events=true`. This writes all DDL changes performed during a snapshot to a topic that can be consumed by apps. And, more importantly, during the final step mentioned above it ensures that the updated offsets are recorded immediately (rather than waiting until a database change occurs).

#### Snapshots without global read locks

Some MySQL environments, including [Amazon RDS](https://aws.amazon.com/rds/mysql/) and [Amazon Aurora (MySQL compatibility)](https://aws.amazon.com/rds/aurora/), do not allow users to obtain global read locks. As of 0.4.0, when the MySQL connector detects that a global read lock is not allowed, it falls back to table-level locks (requiring the database user also has the `LOCK TABLES` privilege) and performs a snapshot using these steps:

1. Start a transaction with [*repeatable read* semantics](https://dev.mysql.com/doc/refman/5.6/en/innodb-consistent-read.html) to ensure that all subsequent reads within this transaction are done against a single consistent snapshot.
2. Fail to obtain a global read lock to block writes by other database clients.
3. Read names of the databases and tables, filtering them using the connector’s configuration.
4. Acquire a table-level lock on all configured tables.
5. Read the current position of the binlog.
6. Read the schema of all configured databases and tables.
7. Optionally write the DDL changes to the *schema change topic*, including all necessary `DROP …` and `CREATE …` DDL statements
8. Scans all of the database tables and generates on the appropriate table-specific Kafka topics `CREATE` events for each row.
9. Commit the transaction.
10. Release the table-level locks.
11. Record in the connector offsets that the connector successfully completed the snapshot.

Note that the *table-level locks are held for nearly all of the consistent snapshot*, including the reading of all database table content in step 7. This is very different than when a global read lock can be used, since that is held for a very short period of time. Unfortunately, this is the only way that the MySQL connector can obtain a consistent snapshot, since [releasing the table-level locks implicitly commits any open transaction held by the session](https://dev.mysql.com/doc/refman/5.7/en/lock-tables-and-transactions.html). Since we need the transaction to obtain a consistent snapshot of the database content, we are unable to release the table-level locks until after we’ve read the data in step 7 and committed our transaction in step 8.

### Reading the MySQL binlog

The MySQL connector will typically spend the vast majority of its time reading the binlog of the MySQL server to which it is connected.

As the MySQL connector reads the binlog, it transforms the binary log events into Debezium *create*, *update*, or *delete* events that include the position in the binlog (including GTIDs if they are used) where the event was found. The MySQL connector forwards these change events to the Kafka Connect framework (running in the same process), which then synchronously writes them to the appropriate Kafka topic. Kafka Connect uses the term *offset* for the source-specific position information that Debezium includes with each event, and Kafka Connect periodically records the most recent offset in another Kafka topic.

When Kafka Connect gracefully shuts down, it stops the connectors, flushes all events to Kafka, and records the last offset received from each connector. Upon restart, Kafka Connect reads the last recorded offset for each connector, and starts the connector from that point. The MySQL connector uses the binlog filename, the position in that file, and the GTIDs (if they are enabled in MySQL server) recorded in its offset to request that MySQL send it the binlog events starting just after that position.

### Topics names

The MySQL connector writes events for all insert, update, and delete operations on a single table to a single Kafka topic. The name of the Kafka topics always takes the form *serverName*.*databaseName*.*tableName*, where *serverName* is the logical name of the connector as specified with the `database.server.name` configuration property, *databaseName* is the name of the database where the operation occurred, and *tableName* is the name of the database table on which the operation occurred.

For example, consider a MySQL installation with an `inventory` database that contains four tables: `products`, `products_on_hand`, `customers`, and `orders`. If the connector monitoring this database were given a logical server name of `fulfillment`, then the connector would produce events on these four Kafka topics:

- `fulfillment.inventory.products`
- `fulfillment.inventory.products_on_hand`
- `fulfillment.inventory.customers`
- `fulfillment.inventory.orders`

### Schema change topic

It is often useful for applications to consume events that describe the changes in the database schemas, so the MySQL connector can be configured to produce *schema change events* with all of the DDL statements applied to databases in the MySQL server. When enabled, the connector writes all such events to a Kafka topic named *serverName*, where *serverName* is the logical name of the connector as specified with the `database.server.name` configuration property. In our previous example where the logical server name is `fulfillment`, the schema change events would be recorded in the topic `fulfillment`.

|      | The [database history topic](https://debezium.io/docs/connectors/mysql/#database-schema-history) and *schema change topic* both contain events with the DDL statement. However, we’ve designed the events on the schema change topic to be easier to consume, so they are more granular and always have the database name. If you’re going to consume schema change events, be sure to use the schema change topic and *never* consume the database history topic. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | In order to keep the correct order of schema changes, the schema change topic must not be partitioned. This means a partition count of 1 must be specified when creating this topic. When relying on auto topic creation, make sure that Kafka’s `num.partitions` configuration option (the default number of partitions) is set to 1. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Each message written to the schema change topic will have a message key that contains the name of the database to which the client was connected and using when they applied the DDL statement(s):

```json
{
  "schema": {
    "type": "struct",
    "name": "io.debezium.connector.mysql.SchemaChangeKey",
    "optional": false,
    "fields": [
      {
        "field": "databaseName",
        "type": "string",
        "optional": false
      }
    ]
  },
  "payload": {
    "databaseName": "inventory"
  }
}
```

Meanwhile, the schema change event message’s value will contain a structure containing the DDL statement(s), the database to which the statements were *applied*, and the position in the binlog where the statement(s) appeared:

```json
{
  "schema": {
    "type": "struct",
    "name": "io.debezium.connector.mysql.SchemaChangeValue",
    "optional": false,
    "fields": [
      {
        "field": "databaseName",
        "type": "string",
        "optional": false
      },
      {
        "field": "ddl",
        "type": "string",
        "optional": false
      },
      {
        "field": "source",
        "type": "struct",
        "name": "io.debezium.connector.mysql.Source",
        "optional": false,
        "fields": [
          {
            "type": "string",
            "optional": true,
            "field": "version"
          },
          {
            "type": "string",
            "optional": false,
            "field": "name"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "server_id"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "ts_sec"
          },
          {
            "type": "string",
            "optional": true,
            "field": "gtid"
          },
          {
            "type": "string",
            "optional": false,
            "field": "file"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "pos"
          },
          {
            "type": "int32",
            "optional": false,
            "field": "row"
          },
          {
            "type": "boolean",
            "optional": true,
            "default": false,
            "field": "snapshot"
          },
          {
            "type": "int64",
            "optional": true,
            "field": "thread"
          },
          {
            "type": "string",
            "optional": true,
            "field": "db"
          },
          {
            "type": "string",
            "optional": true,
            "field": "table"
          },
          {
            "type": "string",
            "optional": true,
            "field": "query"
          }
        ]
      }
    ]
  },
  "payload": {
    "databaseName": "inventory",
    "ddl": "CREATE TABLE products ( id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255) NOT NULL, description VARCHAR(512), weight FLOAT ); ALTER TABLE products AUTO_INCREMENT = 101;",
    "source" : {
      "version": "0.9.1.Final",
      "name": "mysql-server-1",
      "server_id": 0,
      "ts_sec": 0,
      "gtid": null,
      "file": "mysql-bin.000003",
      "pos": 154,
      "row": 0,
      "snapshot": true,
      "thread": null,
      "db": null,
      "table": null,
      "query": null
    }
  }
}
```

The `ddl` field may contain multiple DDL statements, but every statement in the event will apply to the database named in the `databaseName` field and they will appear in the same order as applied to the database. Additionally, all of the events in the schema change topic will appear in the same order as applied to the MySQL server.

|      | The `source` field is the exact same structure that appears in normal data change events written to table-specific topics. You can use the contents of this field to correlate the events on different topics. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

As mentioned above, each schema change event will contain one or more DDL statements that apply to a single database. What happens if a client submits a series of DDL statements that apply to *multiple* databases (e.g., perhaps they use fully-qualified names)? If MySQL applies those statements atomically (e.g., as a single transaction), then the connector will take those DDL statements *in order*, group them by the affected database, and then create a schema change event for each of those groups. On the other hand, if MySQL applies those statements individually, then the connector will create a separate schema change event for each statement.

### Events

All data change events produced by the MySQL connector have a key and a value, although the structure of the key and value depend on the table from which the change events originated (see [Topic Names](https://debezium.io/docs/connectors/mysql/#topic-names)).

|      | Starting with Kafka 0.10, Kafka can optionally record with the message key and value the [*timestamp*](http://kafka.apache.org/documentation.html#upgrade_10_performance_impact) at which the message was created (recorded by the producer) or written to the log by Kafka. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | As of Debezium 0.3, the Debezium MySQL connector ensures that all Kafka Connect *schema names* are [valid Avro schema names](http://avro.apache.org/docs/current/spec.html#names). This means that the logical server name must start with Latin letters or an underscore (e.g., [a-z,A-Z,_]), and the remaining characters in the logical server name and all characters in the database and table names must be Latin letters, digits, or an underscore (e.g., [a-z,A-Z,0-9,\_]). If not, then all invalid characters will automatically be replaced with an underscore character.This can lead to unexpected conflicts in schemas names when the logical server name, database names, and table names contain other characters, and the only distinguishing characters between table full names are invalid and thus replaced with underscores. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Debezium and Kafka Connect are designed around *continuous streams of event messages*, and the structure of these events may change over time. This could be difficult for consumers to deal with, so to make it very easy Kafka Connect makes each event self-contained. Every message key and value has two parts: a *schema* and *payload*. The schema describes the structure of the payload, while the payload contains the actual data.

#### Change event’s key

For a given table, the change event’s key will have a structure that contains a field for each column in the primary key (or unique key constraint) of the table at the time the event was created. Consider an `inventory` database with a `customers` table defined as:

```sql
CREATE TABLE customers (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE KEY
) AUTO_INCREMENT=1001;
```

Every change event for the `customers` table while it has this definition will feature the same key structure, which in JSON looks like this:

```json
{
  "schema": {
    "type": "struct",
    "name": "mysql-server-1.inventory.customers.Key",
    "optional": false,
    "fields": [
      {
        "field": "id",
        "type": "int32",
        "optional": false
      }
    ]
  },
  "payload": {
    "id": 1001
  }
}
```

The `schema` portion of the key contains a Kafka Connect schema describing what is in the payload portion, and in our case that means that the `payload` value is not optional, is a structure defined by a schema named `mysql-server-1.inventory.customers.Key`, and has one required field named `id` of type `int32`. If we look at the value of the key’s `payload`field, we’ll see that it is indeed a structure (which in JSON is just an object) with a single `id` field, whose value is `1004`.

Therefore, we interpret this key as describing the row in the `inventory.customers` table (output from the connector named `mysql-server-1`) whose `id` primary key column had a value of `1004`.

|      | Although the `column.blacklist` configuration property allows you to remove columns from the event values, all columns in a primary or unique key are always included in the event’s key. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | If the table does not have a primary or unique key, then the change event’s key will be null. This makes sense since the rows in a table without a primary or unique key constraint cannot be uniquely identified. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### Change event’s value

The value of the change event message is a bit more complicated. Like the key message, it has a *schema* section and *payload*section. Starting with Debezium 0.2, the payload section of every change event value produced by the MySQL connector has an *envelope* structure with the following fields:

- `op` is a mandatory field that contains a string value describing the type of operation. Values for the MySQL connector are `c` for create (or insert), `u` for update, `d` for delete, and `r` for read (in the case of a non-initial snapshot).
- `before` is an optional field that if present contains the state of the row *before* the event occurred. The structure will be described by the `mysql-server-1.inventory.customers.Value` Kafka Connect schema, which the `mysql-server-1`connector uses for all rows in the `inventory.customers` table.
- `after` is an optional field that if present contains the state of the row *after* the event occurred. The structure is described by the same `mysql-server-1.inventory.customers.Value` Kafka Connect schema used in `before`.
- `source` is a mandatory field that contains a structure describing the source metadata for the event, which in the case of MySQL contains several fields: the Debezium version, the connector name, the name of the binlog file where the event was recorded, the position in that binlog file where the event appeared, the row within the event (if there is more than one), whether this event was part of a snapshot, name of the affected database and table, id of the MySQL thread creating the event (non-snapshot events only), and if available the MySQL server ID, and the timestamp in seconds. For non-snapshot events, if the MySQL server has the [binlog_rows_query_log_events](https://debezium.io/docs/connectors/mysql/#enabling-query-log-events-optional) option enabled, and the connector is configured with the `include.query` option enabled, the query field will contain the original SQL statement that generated the event.
- `ts_ms` is optional and if present contains the time (using the system clock in the JVM running the Kafka Connect task) at which the connector processed the event.

And of course, the *schema* portion of the event message’s value contains a schema that describes this envelope structure and the nested fields within it.

Let’s look at what a *create* event value might look like for our `customers` table:

```json
{
  "schema": {
    "type": "struct",
    "optional": false,
    "name": "mysql-server-1.inventory.customers.Envelope",
    "version": 1,
    "fields": [
      {
        "field": "op",
        "type": "string",
        "optional": false
      },
      {
        "field": "before",
        "type": "struct",
        "optional": true,
        "name": "mysql-server-1.inventory.customers.Value",
        "fields": [
          {
            "type": "int32",
            "optional": false,
            "field": "id"
          },
          {
            "type": "string",
            "optional": false,
            "field": "first_name"
          },
          {
            "type": "string",
            "optional": false,
            "field": "last_name"
          },
          {
            "type": "string",
            "optional": false,
            "field": "email"
          }
        ]
      },
      {
        "field": "after",
        "type": "struct",
        "name": "mysql-server-1.inventory.customers.Value",
        "optional": true,
        "fields": [
          {
            "type": "int32",
            "optional": false,
            "field": "id"
          },
          {
            "type": "string",
            "optional": false,
            "field": "first_name"
          },
          {
            "type": "string",
            "optional": false,
            "field": "last_name"
          },
          {
            "type": "string",
            "optional": false,
            "field": "email"
          }
        ]
      },
      {
        "field": "source",
        "type": "struct",
        "name": "io.debezium.connector.mysql.Source",
        "optional": false,
        "fields": [
          {
            "type": "string",
            "optional": true,
            "field": "version"
          },
          {
            "type": "string",
            "optional": false,
            "field": "name"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "server_id"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "ts_sec"
          },
          {
            "type": "string",
            "optional": true,
            "field": "gtid"
          },
          {
            "type": "string",
            "optional": false,
            "field": "file"
          },
          {
            "type": "int64",
            "optional": false,
            "field": "pos"
          },
          {
            "type": "int32",
            "optional": false,
            "field": "row"
          },
          {
            "type": "boolean",
            "optional": true,
            "default": false,
            "field": "snapshot"
          },
          {
            "type": "int64",
            "optional": true,
            "field": "thread"
          },
          {
            "type": "string",
            "optional": true,
            "field": "db"
          },
          {
            "type": "string",
            "optional": true,
            "field": "table"
          },
          {
            "type": "string",
            "optional": true,
            "field": "query"
          }
        ]
      },
      {
        "field": "ts_ms",
        "type": "int64",
        "optional": true
      }
    ]
  },
  "payload": {
    "op": "c",
    "ts_ms": 1465491411815,
    "before": null,
    "after": {
      "id": 1004,
      "first_name": "Anne",
      "last_name": "Kretchmar",
      "email": "annek@noanswer.org"
    },
    "source": {
      "version": "0.9.1.Final",
      "name": "mysql-server-1",
      "server_id": 0,
      "ts_sec": 0,
      "gtid": null,
      "file": "mysql-bin.000003",
      "pos": 154,
      "row": 0,
      "snapshot": false,
      "thread": 7,
      "db": "inventory",
      "table": "customers",
      "query": "INSERT INTO customers (first_name, last_name, email) VALUES ('Anne', 'Kretchmar', 'annek@noanswer.org')"
    }
  }
}
```

If we look at the `schema` portion of this event’s *value*, we can see the schema for the *envelope*, the schema for the `source`structure (which is specific to the MySQL connector and reused across all events), and the table-specific schemas for the `before` and `after` fields.

|      | The names of the schemas for the `before` and `after` fields are of the form "*logicalName*.*tableName*.Value", and thus are entirely independent from all other schemas for all other tables. This means that when using the [Avro Converter](https://debezium.io/docs/faq/#avro-converter), the resulting Avro schemas for *each table* in each *logical source* have their own evolution and history. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

If we look at the `payload` portion of this event’s *value*, we can see the information in the event, namely that it is describing that the row was created (since `op=c`), and that the `after` field value contains the values of the new inserted row’s' `id`, `first_name`, `last_name`, and `email` columns.

|      | It may appear that the JSON representations of the events are much larger than the rows they describe. This is true, because the JSON representation must include the *schema* and the *payload* portions of the message. It is possible and even recommended to use the [Avro Converter](https://debezium.io/docs/faq/#avro-converter) to dramatically decrease the size of the actual messages written to the Kafka topics. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

The value of an *update* change event on this table will actually have the exact same *schema*, and its payload will be structured the same but will hold different values. Here’s an example:

Here’s that new event’s *value* formatted to be easier to read:

```json
{
  "schema": { ... },
  "payload": {
    "before": {
      "id": 1004,
      "first_name": "Anne",
      "last_name": "Kretchmar",
      "email": "annek@noanswer.org"
    },
    "after": {
      "id": 1004,
      "first_name": "Anne Marie",
      "last_name": "Kretchmar",
      "email": "annek@noanswer.org"
    },
    "source": {
      "version": "0.9.1.Final",
      "name": "mysql-server-1",
      "server_id": 223344,
      "ts_sec": 1465581,
      "gtid": null,
      "file": "mysql-bin.000003",
      "pos": 484,
      "row": 0,
      "snapshot": false,
      "thread": 7,
      "db": "inventory",
      "table": "customers",
      "query": "UPDATE customers SET first_name='Anne Marie' WHERE id=1004"
    },
    "op": "u",
    "ts_ms": 1465581029523
  }
}
```

When we compare this to the value in the *insert* event, we see a couple of differences in the `payload` section:

- The `op` field value is now `u`, signifying that this row changed because of an update
- The `before` field now has the state of the row with the values before the database commit
- The `after` field now has the updated state of the row, and here was can see that the `first_name` value is now `Anne Marie`.
- The `source` field structure has the same fields as before, but the values are different since this event is from a different position in the binlog.
- The `ts_ms` shows the timestamp that Debezium processed this event.

There are several things we can learn by just looking at this `payload` section. We can compare the `before` and `after`structures to determine what actually changed in this row because of the commit. The `source` structure tells us information about MySQL’s record of this change (providing traceability), but more importantly this has information we can compare to other events in this and other topics to know whether this event occurred before, after, or as part of the same MySQL commit as other events.

|      | When the columns for a row’s primary/unique key are updated, the value of the row’s key has changed so Debezium will output *three* events: a `DELETE` event and [tombstone event](https://debezium.io/docs/connectors/mysql/#tombstone-events) with the old key for the row, followed by an `INSERT` event with the new key for the row. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

So far we’ve seen samples of *create* and *update* events. Now, let’s look at the value of a *delete* event for the same table. Once again, the `schema` portion of the value will be exactly the same as with the *create* and *update* events:

```json
{
  "schema": { ... },
  "payload": {
    "before": {
      "id": 1004,
      "first_name": "Anne Marie",
      "last_name": "Kretchmar",
      "email": "annek@noanswer.org"
    },
    "after": null,
    "source": {
      "version": "0.9.1.Final",
      "name": "mysql-server-1",
      "server_id": 223344,
      "ts_sec": 1465581,
      "gtid": null,
      "file": "mysql-bin.000003",
      "pos": 805,
      "row": 0,
      "snapshot": false,
      "thread": 7,
      "db": "inventory",
      "table": "customers",
      "query": "DELETE FROM customers WHERE id=1004"
    },
    "op": "d",
    "ts_ms": 1465581902461
  }
}
```

If we look at the `payload` portion, we see a number of differences compared with the *create* or *update* event payloads:

- The `op` field value is now `d`, signifying that this row was deleted
- The `before` field now has the state of the row that was deleted with the database commit
- The `after` field is null, signifying that the row no longer exists
- The `source` field structure has many of the same values as before, except the `ts_sec` and `pos` fields have changed (and the `file` might have changed in other circumstances).
- The `ts_ms` shows the timestamp that Debezium processed this event.

This event gives a consumer all kinds of information that it can use to process the removal of this row. We include the old values so that some consumers might require them in order to properly handle the removal, and without it they may have to resort to far more complex behavior.

The MySQL connector’s events are designed to work with [Kafka log compaction](https://cwiki.apache.org/confluence/display/KAFKA/Log+Compaction), which allows for the removal of some older messages as long as at least the most recent message for every key is kept. This allows Kafka to reclaim storage space while ensuring the topic contains a complete dataset and can be used for reloading key-based state.

When a row is deleted, the *delete* event value listed above still works with log compaction, since Kafka can still remove all earlier messages with that same key. But only if the message value is null will Kafka know that it can remove *all messages* with that same key. To make this possible, Debezium’s MySQL connector always follows *delete* event with a special *tombstone*event that has the same key but null value.

|      | As of Kafka 0.10, the JSON converter provided by Kafka Connect never results in a null value for the message ([KAFKA-3832](https://issues.apache.org/jira/browse/KAFKA-3832)). Therefore, Kafka’s log compaction will always retain the last message, even when the tombstone event is supplied, though it will be free to remove all prior messages with the same key. In other words, until this is fixed using the JSON Converter will reduce the effectiveness of Kafka’s log compaction.In the meantime, consider using the [Avro Converter](https://debezium.io/docs/faq/#avro-converter), which does properly return a null value and will thus take full advantage of Kafka log compaction. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Data types

As described above, the MySQL connector represents the changes to rows with events that are structured like the table in which the row exist. The event contains a field for each column value, and how that value is represented in the event depends on the MySQL data type of the column. This section describes this mapping.

The following table describes how the connector maps each of the MySQL data types to a *literal type* and *semantic type* within the events' fields. Here, the *literal type* describes how the value is literally represented using Kafka Connect schema types, namely `INT8`, `INT16`, `INT32`, `INT64`, `FLOAT32`, `FLOAT64`, `BOOLEAN`, `STRING`, `BYTES`, `ARRAY`, `MAP`, and `STRUCT`. The *semantic type* describes how the Kafka Connect schema captures the *meaning* of the field using the name of the Kafka Connect schema for the field.

| MySQL Data Type       | Literal type (schema type) | Semantic type (schema name)       | Notes                                                        |
| --------------------- | -------------------------- | --------------------------------- | ------------------------------------------------------------ |
| `TIMESTAMP[(M)]`      | `STRING`                   | `io.debezium.time.ZonedTimestamp` | Contains an ISO8601 formatted date and time (with up to microsecond precision) in a particular time zone. MySQL allows `M`to be in the range 0-6 to store up to microsecond precision. |
| `BOOLEAN`, `BOOL`     | `BOOLEAN`                  | n/a                               |                                                              |
| `BIT(1)`              | `BOOLEAN`                  | n/a                               |                                                              |
| `BIT( > 1)`           | `BYTES`                    | `io.debezium.data.Bits`           | The `length` schema parameter contains an integer representing the number of bits. The resulting `byte[]` will contain the bits in little-endian form and will be sized to contain at least the specified number of bits (e.g., `numBytes = n/8 + (n%8== 0 ? 0 : 1)` where `n` is the number of bits). |
| `TINYINT`             | `INT8`                     | n/a                               |                                                              |
| `SMALLINT[(M)]`       | `INT16`                    | n/a                               |                                                              |
| `MEDIUMINT[(M)]`      | `INT32`                    | n/a                               |                                                              |
| `INT`, `INTEGER[(M)]` | `INT32`                    | n/a                               |                                                              |
| `BIGINT[(M)]`         | `INT64`                    | n/a                               |                                                              |
| `REAL[(M,D)]`         | `FLOAT32`                  | n/a                               |                                                              |
| `FLOAT[(M,D)]`        | `FLOAT64`                  | n/a                               |                                                              |
| `DOUBLE[(M,D)]`       | `FLOAT64`                  | n/a                               |                                                              |
| `CHAR(M)]`            | `STRING`                   | n/a                               |                                                              |
| `VARCHAR(M)]`         | `STRING`                   | n/a                               |                                                              |
| `BINARY(M)]`          | `BYTES`                    | n/a                               |                                                              |
| `VARBINARY(M)]`       | `BYTES`                    | n/a                               |                                                              |
| `TINYBLOB`            | `BYTES`                    | n/a                               |                                                              |
| `TINYTEXT`            | `STRING`                   | n/a                               |                                                              |
| `BLOB`                | `BYTES`                    | n/a                               |                                                              |
| `TEXT`                | `STRING`                   | n/a                               |                                                              |
| `MEDIUMBLOB`          | `BYTES`                    | n/a                               |                                                              |
| `MEDIUMTEXT`          | `STRING`                   | n/a                               |                                                              |
| `LONGBLOB`            | `BYTES`                    | n/a                               |                                                              |
| `LONGTEXT`            | `STRING`                   | n/a                               |                                                              |
| `JSON`                | `STRING`                   | `io.debezium.data.Json`           | Contains the string representation of a JSON document, array, or scalar. |
| `ENUM`                | `STRING`                   | `io.debezium.data.Enum`           | The `allowed` schema parameter contains the comma-separated list of allowed values. |
| `SET`                 | `STRING`                   | `io.debezium.data.EnumSet`        | The `allowed` schema parameter contains the comma-separated list of allowed values. |
| `YEAR[(2|4)]`         | `INT32`                    | `io.debezium.time.Year`           |                                                              |

Columns that store strings are defined in MySQL with a character set and collation, either explicitly on the column’s definition or implicitly by inheriting the table’s, database’s, or server’s default character sets and collations. As of 0.3.1, the MySQL connector uses the column’s character set when reading the binary representation of the column values in the binlog events.

Other data type mappings are described in the following sections.

If present, a column’s default value will be propagated to the corresponding field’s Kafka Connect schema. For `TIMESTAMP`columns who’s default value is specified as `CURRENT_TIMESTAMP` or `NOW`, the value *1970-01-01 00:00:00* will be used as the default value in the Kafka Connect schema. Change messages will contain the field’s default value (unless an explicit column value had been given), so there should rarely be the need to obtain the default value from the schema. Passing the default value helps though with satisfying the compatibility rules when [using Avro](https://debezium.io/docs/configuration/avro/) as serialization format together with the Confluent schema registry.

#### Temporal values

Other than MySQL’s `TIMESTAMP` data type, the MySQL temporal types depend on the value of the `time.precision.mode`configuration property.

|      | As of Debezium 0.7 `adaptive_time_microseconds` mode was introduced and is the default `time.precision.mode` for the MySQL connector. Mode `adaptive` was marked as deprecated. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

|      | When the `time.precision.mode` is set to `adaptive`, only positive TIME field values in the range of 00:00:00.000000 to 23:59:59.999999 can be captured correctly. When the `time.precision.mode` is set to `connect` only values in the range of `00:00:00.000` to `23:59:59.999` can be handled.The `adaptive` and `connect` time precision modes should only be used if you can make sure that the TIME values in your tables will never exceed the supported ranges. These modes will be removed in a future version of Debezium. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

When the `time.precision.mode` configuration property is set to `adaptive_time_microseconds` (the default), then the connector will determine the literal type and semantic type for MySQL types `TIME`, `DATE` and `DATETIME` based on the column’s data type definition so that events *exactly* represent the values in the database, all TIME fields will be captured as microseconds:

| MySQL Data Type                                              | Literal type (schema type) | Semantic type (schema name)       | Notes                                                        |
| ------------------------------------------------------------ | -------------------------- | --------------------------------- | ------------------------------------------------------------ |
| `DATETIME(4)`, `DATETIME(5)`, `DATETIME(6)`                  | `INT64`                    | `io.debezium.time.MicroTimestamp` | Represents the number of microseconds past epoch, and does not include timezone information. |
| `DATE`                                                       | `INT32`                    | `io.debezium.time.Date`           | Represents the number of days since epoch.                   |
| `TIME[(M)]`                                                  | `INT64`                    | `io.debezium.time.MicroTime`      | Represents the time value in microseconds and does not include timezone information. MySQL allows `M`to be in the range 0-6 to store up to microsecond precision. |
| `DATETIME`, `DATETIME(0)`, `DATETIME(1)`, `DATETIME(2)`, `DATETIME(3)` | `INT64`                    | `io.debezium.time.Timestamp`      | Represents the number of milliseconds past epoch, and does not include timezone information. |

When the `time.precision.mode` configuration property is set to `adaptive` (deprecated), then the connector will determine the literal type and semantic type for the temporal types based on the column’s data type definition so that events *exactly* represent the values in the database:

| MySQL Data Type                                              | Literal type (schema type) | Semantic type (schema name)       | Notes                                                        |
| ------------------------------------------------------------ | -------------------------- | --------------------------------- | ------------------------------------------------------------ |
| `DATETIME(4)`, `DATETIME(5)`, `DATETIME(6)`                  | `INT64`                    | `io.debezium.time.MicroTimestamp` | Represents the number of microseconds past epoch, and does not include timezone information. |
| `DATE`                                                       | `INT32`                    | `io.debezium.time.Date`           | Represents the number of days since epoch.                   |
| `TIME`, `TIME(0)`, `TIME(1)`, `TIME(2)`, `TIME(3)`           | `INT32`                    | `io.debezium.time.Time`           | Represents the number of milliseconds past midnight, and does not include timezone information. |
| `TIME(4)`, `TIME(5)`, `TIME(6)`                              | `INT64`                    | `io.debezium.time.MicroTime`      | Represents the number of microseconds past midnight, and does not include timezone information. |
| `DATETIME`, `DATETIME(0)`, `DATETIME(1)`, `DATETIME(2)`, `DATETIME(3)` | `INT64`                    | `io.debezium.time.Timestamp`      | Represents the number of milliseconds past epoch, and does not include timezone information. |

When the `time.precision.mode` configuration property is set to `connect`, then the connector will use the predefined Kafka Connect logical types as was the case with the 0.2.x MySQL connector. This may be useful when consumers only know about the built-in Kafka Connect logical types and are unable to handle variable-precision time values. On the other hand, since MySQL allows both `TIME` and `DATETIME` to have *fractional second precision* of 0-6 to store up to microsecond precision, the events generated by a connector with the `connect` time precision mode will **result in a loss of precision** when the database column has a *fractional second precision* value greater than 3:

| MySQL Data Type | Literal type (schema type) | Semantic type (schema name)               | Notes                                                        |
| --------------- | -------------------------- | ----------------------------------------- | ------------------------------------------------------------ |
| `DATETIME[(M)]` | `INT64`                    | `org.apache.kafka.connect.data.Timestamp` | Represents the number of milliseconds since epoch, and does not include timezone information. MySQL allows `M`to be in the range 0-6 to store up to microsecond precision, though this mode results in a loss of precision when `M` > 3. |
| `DATE`          | `INT32`                    | `org.apache.kafka.connect.data.Date`      | Represents the number of days since epoch.                   |
| `TIME[(M)]`     | `INT64`                    | `org.apache.kafka.connect.data.Time`      | Represents the number of milliseconds since midnight, and does not include timezone information. MySQL allows `M`to be in the range 0-6 to store up to microsecond precision, though this mode results in a loss of precision when `M` > 3. |

MySQL allows [zero-values](http://dev.mysql.com/doc/refman/5.7/en/date-and-time-types.html) for `DATE`, `DATETIME`, and `TIMESTAMP` columns, which are sometimes preferred over null values. These values cannot be represented using any of the Java types with either of the `time.precision.mode` options, and therefore the MySQL connector will represent them as `null` values when the column definition allows nulls, or as the *epoch day* when the column does not allow nulls.

##### Temporal values without time zone

The `DATETIME` type represents a local date and time such as "2018-01-13 09:48:27", i.e. there’s no time zone information. Such columns are converted into epoch milli-seconds or micro-seconds (based on the column’s precision) using UTC. So e.g. the value "2018-06-20 06:37:03" of a column of type `DATETIME` (no precision given) will be represented by the value 1529476623000.

The `TIMESTAMP` type represents a timestamp without time zone information and is converted by MySQL from the server (or session’s) current time zone into UTC when writing and vice versa when reading back the value. Such columns are converted into an equivalent `io.debezium.time.ZonedTimestamp` in UTC based on the server (or session’s) current time zone. The timezone will be queried from the server by default. If this fails, it must be specified explicitly as a connector option using the `database.serverTimezone` option. So if for instance the database’s time zone (either globally or configured for the connector by means of aforementioned option) is "America/Los_Angeles", the `TIMESTAMP` value "2018-06-20 06:37:03" will be represented by a `ZonedTimestamp` with the value "2018-06-20T13:37:03Z".

Note that the timezone of the JVM running Kafka Connect and Debezium does not affect these conversions.

|      | The handling of these column types is based on using the non-legacy date/time handling mode of the MySQL JDBC connector. It is therefore strongly advised against passing the `database.useLegacyDatetimeCode` connector option with a value of `false`, as that may result in unexpected values of temporal columns in emitted change data messages. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### Decimal values

When `decimal.handling.mode` configuration property is set to `precise`, then the connector will use the predefined Kafka Connect `org.apache.kafka.connect.data.Decimal` logical type for all `DECIMAL` and `NUMERIC` columns. This is the default mode.

| MySQL Data Type    | Literal type (schema type) | Semantic type (schema name)             | Notes                                                        |
| ------------------ | -------------------------- | --------------------------------------- | ------------------------------------------------------------ |
| `DECIMAL[(M[,D])]` | `BYTES`                    | `org.apache.kafka.connect.data.Decimal` | The `scaled` schema parameter contains an integer representing how many digits the decimal point was shifted. |
| `NUMERIC[(M[,D])]` | `BYTES`                    | `org.apache.kafka.connect.data.Decimal` | The `scaled` schema parameter contains an integer representing how many digits the decimal point was shifted. |

However, when `decimal.handling.mode` configuration property is set to `double`, then the connector will represent all `DECIMAL`and `NUMERIC` values as Java double values and encodes them as follows:

| MySQL Data Type    | Literal type (schema type) | Semantic type (schema name) | Notes |
| ------------------ | -------------------------- | --------------------------- | ----- |
| `DECIMAL[(M[,D])]` | `FLOAT64`                  |                             |       |
| `NUMERIC[(M[,D])]` | `FLOAT64`                  |                             |       |

The last option for `decimal.handling.mode` configuration property is `string`. In this case the connector will represent all `DECIMAL` and `NUMERIC` values as their formatted string representation and encodes them as follows:

| MySQL Data Type    | Literal type (schema type) | Semantic type (schema name) | Notes |
| ------------------ | -------------------------- | --------------------------- | ----- |
| `DECIMAL[(M[,D])]` | `STRING`                   |                             |       |
| `NUMERIC[(M[,D])]` | `STRING`                   |                             |       |

#### Spatial Data Types

As of version 0.5.1, the MySQL connector also has limited support for some of the following [spatial data types](https://dev.mysql.com/doc/refman/5.7/en/spatial-datatypes.html):

| Spatial Data Type | Literal type (schema type) | Semantic type (schema name)       | Notes                                                        |
| ----------------- | -------------------------- | --------------------------------- | ------------------------------------------------------------ |
| `POINT`           | `STRUCT`                   | `io.debezium.data.geometry.Point` | Contains a structure with 2 `FLOAT64`fields - `(x,y)` - each representing the coordinates of a geometric point and 1 optional `BYTES` field - `wkb` - representing the Well-Known Binary (WKB) of the coordinates of a geometric point |

As of version 0.7.2, the MySQL connector has full support for all of the following [spatial data types](https://dev.mysql.com/doc/refman/5.7/en/spatial-datatypes.html):

| Spatial Data Type                                            | Literal type (schema type) | Semantic type (schema name)          | Notes                                                        |
| ------------------------------------------------------------ | -------------------------- | ------------------------------------ | ------------------------------------------------------------ |
| `GEOMETRY` `LINESTRING` `POLYGON` `MULTIPOINT` `MULTILINESTRING` `MULTIPOLYGON` `GEOMETRYCOLLECTION` | `STRUCT`                   | `io.debezium.data.geometry.Geometry` | Contains a structure with 2 fields `srid (INT32)` - Spatial Reference System Identifier defining what type of geometry object is stored in the structure`wkb (BYTES)` - a binary representation of the geometry object encoded in the Well-Known-Binary format. Please see [Open Geospatial Consortium Simple Features Access specification](http://www.opengeospatial.org/standards/sfa) for the format details. |

### When things go wrong

Debezium is a distributed system that captures all changes in multiple upstream databases, and will never miss or lose an event. Of course, when the system is operating nominally or being administered carefully, then Debezium provides *exactly once*delivery of every change event. However, if a fault does happen then the system will still not lose any events, although while it is recovering from the fault it may repeat some change events. Thus, in these abnormal situations Debezium (like Kafka) provides *at least once* delivery of change events.

The rest of this section describes how Debezium handles various kinds of faults and problems.

#### Configuration and startup errors

The connector will fail upon startup, report an error/exception in the log, and stop running when the connector’s configuration is invalid, when the connector cannot successfully connect to MySQL using the specified connectivity parameters, or when the connector is restarting from a previously-recorded position in the MySQL history (via binlog coordinates or GTID set) and MySQL no longer has that history available.

In these cases, the error will have more details about the problem and possibly a suggested work around. The connector can be restarted when the configuration has been corrected or the MySQL problem has been addressed.

#### MySQL becomes unavailable

Once the connector is running, if the MySQL server it has been connected to becomes unavailable for any reason, the connector will fail with an error and the connector will stop. Simply restart the connector when the server is available.

Note that when using GTIDs and a highly available MySQL cluster, you can simply restart the connector immediately, and the connector will connect to a different MySQL server in the cluster, find the location in that server’s binlog that represents the last transaction that was processed completely, and start reading the new server’s binlog from that location.

When the connector and MySQL are not using GTIDs, the connector records the position within the specific binlog of the MySQL server to which it is connected. These binlog coordinates are only valid on that MySQL server, so to recover the connector must do so only by connecting to that server (or to another server that has been recovered from backups of the MySQL server).

#### Kafka Connect process stops gracefully

If Kafka Connect is being run in distributed mode, and a Kafka Connect process is stopped gracefully, then prior to shutdown of that processes Kafka Connect will migrate all of the process' connector tasks to another Kafka Connect process in that group, and the new connector tasks will pick up exactly where the prior tasks left off. There will be a short delay in processing while the connector tasks are stopped gracefully and restarted on the new processes.

#### Kafka Connect process crashes

If the Kafka Connector process stops unexpectedly, then any connector tasks it was running will obviously terminate without recording their most recently-processed offsets. When Kafka Connect is being run in distributed mode, it will restart those connector tasks on other processes. However, the MySQL connectors will resume from the last offset *recorded* by the earlier processes, which means that the new replacement tasks may generate some of the same change events that were processed just prior to the crash. The number of duplicate events will depend on the offset flush period and the volume of data changes just before the crash.

|      | Because there is a chance that some events may be duplicated during a recovery from failure, consumers should always anticipate some events may be duplicated. Debezium change are idempotent, so a sequence of events always results in the same state.Debezium also includes with each change event message the source-specific information about the origin of the event, including the MySQL server’s time of the event, its binlog filename and position, and GTID (if used). Consumers can keep track of this information (especially GTIDs) to know whether it has already seen a particular event. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

#### Kafka becomes unavailable

As the connector generates change events, the Kafka Connect framework records those events in Kafka using the Kafka producer API. Kafka Connect will also periodically record the latest offset that appears in those change events, at a frequency you’ve specified in the Kafka Connect worker configuration. If the Kafka brokers become unavailable, the Kafka Connect worker process running the connectors will simply repeatedly attempt to reconnect to the Kafka brokers. In other words, the connector tasks will simply pause until a connection can be reestablished, at which point the connectors will resume exactly where they left off.

#### Connector is stopped for a duration

If the connector is gracefully stopped, the database can continue to be used and any new changes will be recorded in the MySQL server’s binlog. When the connector is restarted, it will resume reading the MySQL binlog where it last left off, recording change events for all of the changes that were made while the connector was stopped.

A properly configured Kafka cluster is able to [massive throughput](https://engineering.linkedin.com/kafka/benchmarking-apache-kafka-2-million-writes-second-three-cheap-machines). Kafka Connect is written with Kafka best practices, and given enough resources will also be able to handle very large numbers of database change events. Because of this, when a connector has been restarted after a while, it is very likely to catch up with the database, though how quickly will depend upon the capabilities and performance of Kafka and the volume of changes being made to the data in MySQL.

|      | If the connector remains stopped for long enough, MySQL might purge older binlog files and the connector’s last position may be lost. In this case, when the connector configured with *initial* snapshot mode (the default) is finally restarted, the MySQL server will no longer have the starting point and the connector will perform an initial snapshot. On the other hand, if the connector’s snapshot mode is disabled, then the connector will fail with an error. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Deploying a connector

If you’ve already installed [Zookeeper](https://zookeeper.apache.org/), [Kafka](http://kafka.apache.org/), and [Kafka Connect](http://kafka.apache.org/documentation.html#connect), then using Debezium’s MySQL connector is easy. Simply download the [connector’s plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/0.3.0/debezium-connector-mysql-0.3.0-plugin.tar.gz), extract the JARs into your Kafka Connect environment, and add the directory with the JARs to [Kafka Connect’s classpath](http://docs.confluent.io/3.0.0/connect/userguide.html#installing-connector-plugins). Restart your Kafka Connect process to pick up the new JARs.

If immutable containers are your thing, then check out [Debezium’s Docker images](https://hub.docker.com/r/debezium/) for Zookeeper, Kafka, and Kafka Connect with the MySQL connector already pre-installed and ready to go. Our [tutorial](http://debezium.io/docs/tutorial) even walks you through using these images, and this is a great way to learn what Debezium is all about. You can even [run Debezium on Kubernetes and OpenShift](https://debezium.io/blog/2016/05/31/Debezium-on-Kubernetes/).

To use the connector to produce change events for a particular MySQL server or cluster, simply create a [configuration file for the MySQL Connector](https://debezium.io/docs/connectors/mysql/#configuration) and use the [Kafka Connect REST API](http://docs.confluent.io/3.0.0/connect/userguide.html#rest-interface) to add that connector to your Kafka Connect cluster. When the connector starts, it will grab a consistent snapshot of the databases in your MySQL server and start reading the MySQL binlog, producing events for every inserted, updated, and deleted row. The connector can optionally produce events with the DDL statements that were applied, and you can even choose to produce events for a subset of the databases and tables. Optionally ignore, mask, or truncate columns that are sensitive, too large, or not needed.

### Monitoring

Kafka, Zookeeper, and Kafka Connect all have [built-in support](https://debezium.io/docs/monitoring/) for JMX metrics. The MySQL connector also publishes a number of metrics about the connector’s activities that can be monitored through JMX. The connector has two types of metrics. Snapshot metrics help you monitor the snapshot activity and are available when the connector is performing a snapshot. Binlog metrics help you monitor the progress and activity while the connector reads the MySQL binlog.

#### Snapshot Metrics

##### **MBean: debezium.mysql:type=connector-metrics,context=snapshot,server=<database.server.name>**

| Attribute Name              | Type                | Description                                                  |
| --------------------------- | ------------------- | ------------------------------------------------------------ |
| `RowsScanned`               | `Map<String, Long>` | Map containing the number of rows scanned for each table in the snapshot. Tables are incrementally added to the Map during processing. Updates every 10,000 rows scanned and upon completing a table. |
| `TotalTableCount`           | `int`               | The total number of tables that are being included in the snapshot. |
| `RemainingTableCount`       | `int`               | The number of tables that the snapshot has yet to copy.      |
| `HoldingGlobalLock`         | `boolean`           | Whether the connector currently holds a global or table write lock. |
| `SnapshotRunning`           | `boolean`           | Whether the snapshot was started.                            |
| `SnapshotAborted`           | `boolean`           | Whether the snapshot was aborted.                            |
| `SnapshotCompleted`         | `boolean`           | Whether the snapshot completed.                              |
| `SnapshotDurationInSeconds` | `long`              | The total number of seconds that the snapshot has taken so far, even if not complete. |

#### Binlog Metrics

##### **MBean: debezium.mysql:type=connector-metrics,context=binlog,server=<database.server.name>**

| Attribute Name                      | Type      | Description                                                  |
| ----------------------------------- | --------- | ------------------------------------------------------------ |
| `NumberOfLargeTransactions`         | `long`    | The number of transactions that have not fitted into the look-ahead buffer. Should be significantly smaller than `NumberOfCommittedTransactions` and `NumberOfRolledBackTransactions` for optimal performance. |
| `Connected`                         | `boolean` | Flag that denotes whether the connector is currently connected to the MySQL server. |
| `BinlogFilename`                    | `string`  | The name of the binlog filename that the connector has most recently read. |
| `BinlogPosition`                    | `long`    | The most recent position (in bytes) within the binlog that the connector has read. |
| `GtidSet`                           | `string`  | The string representation of the most recent GTID set seen by the connector when reading the binlog. |
| `LastEvent`                         | `string`  | The last binlog event that the connector has read.           |
| `SecondsSinceLastEvent`             | `long`    | The number of seconds since the connector has read and processed the most recent event. |
| `SecondsBehindMaster`               | `long`    | The number of seconds between the last event’s MySQL timestamp and the connector processing it. The values will incorporate any differences between the clocks on the machines where the MySQL server and the MySQL connector are running. |
| `TotalNumberOfEventsSeen`           | `long`    | The total number of events that this connector has seen since last started or reset. |
| `NumberOfSkippedEvents`             | `long`    | The number of events that have been skipped by the MySQL connector. |
| `NumberOfDisconnects`               | `long`    | The number of disconnects by the MySQL connector.            |
| `NumberOfCommittedTransactions`     | `long`    | The number of processed transactions that were committed.    |
| `NumberOfRolledBackTransactions`    | `long`    | The number of processed transactions that were rolled back and not streamed. |
| `NumberOfNotWellFormedTransactions` | `long`    | The number of transactions that have not conformed to expected protocol `BEGIN` + `COMMIT`/`ROLLBACK`. Should be `0` under normal conditions. |

*Note:* The transactions related attributes are available only if binlog event buffering is enabled - see `binlog.buffer.size` for more details

### Example configuration

Using the MySQL connector is straightforward. Here is an example of the configuration for a MySQL connector that monitors a MySQL server at port 3306 on 192.168.99.100, which we logically name `fullfillment`:

```json
{
  "name": "inventory-connector",  (1)
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector", (2)
    "database.hostname": "192.168.99.100", (3)
    "database.port": "3306", (4)
    "database.user": "debezium", (5)
    "database.password": "dbz", (6)
    "database.server.id": "184054", (7)
    "database.server.name": "fullfillment", (8)
    "database.whitelist": "inventory", (9)
    "database.history.kafka.bootstrap.servers": "kafka:9092", (10)
    "database.history.kafka.topic": "dbhistory.fullfillment", (11)
    "include.schema.changes": "true" (12)
  }
}
```

| **1**  | The name of our connector when we register it with a Kafka Connect service. |
| ------ | ------------------------------------------------------------ |
| **2**  | The name of this MySQL connector class.                      |
| **3**  | The address of the MySQL server.                             |
| **4**  | The port number of the MySQL server.                         |
| **5**  | The name of the MySQL user that has the [required privileges](https://debezium.io/docs/connectors/mysql/#mysql-user). |
| **6**  | The password for the MySQL user that has the [required privileges](https://debezium.io/docs/connectors/mysql/#mysql-user). |
| **7**  | The connector’s identifier that must be unique within the MySQL cluster and similar to MySQL’s `server-id` configuration property. |
| **8**  | The logical name of the MySQL server/cluster, which forms a namespace and is used in all the names of the Kafka topics to which the connector writes, the Kafka Connect schema names, and the namespaces of the corresponding Avro schema when the [Avro Connector](https://debezium.io/docs/connectors/mysql/#avro-converter) is used. |
| **9**  | A list of all databases hosted by this server that this connector will monitor. This is optional, and there are other properties for listing the databases and tables to include or exclude from monitoring. |
| **10** | The list of Kafka brokers that this connector will use to write and recover DDL statements to the database history topic. |
| **11** | The name of the [database history topic](https://debezium.io/docs/connectors/mysql/#database-schema-history) where the connector will write and recover DDL statements. This topic is for internal use only and should not be used by consumers. |
| **12** | The flag specifying that the connector should generate on the [schema change topic](https://debezium.io/docs/connectors/mysql/#schema-change-topic) named `fullfillment` events with the DDL changes that *can* be used by consumers. |

See the [complete list of connector properties](https://debezium.io/docs/connectors/mysql/#connector-properties) that can be specified in these configurations.

This configuration can be sent via POST to a running Kafka Connect service, which will then record the configuration and start up the one connector task that will connect to the MySQL database, read the binlog, and record events to Kafka topics.

### Connector properties

The following configuration properties are *required* unless a default value is available.

| Property                                                     | Default                      | Description                                                  |
| ------------------------------------------------------------ | ---------------------------- | ------------------------------------------------------------ |
| `ddl.parser.mode` 0.8.0 and later                            | `antlr`                      | Controls which parser should be used for parsing DDL statements when building up the meta-model of the captured database structure. Can be one of `legacy` (for the legacy hand-written parser implementation) or `antlr` (for new Antlr based implementation introduced in Debezium 0.8.0). While the legacy parser remains the default for Debezium 0.8.x, please try out the new implementation and report back any issues you encounter. The new parser is the default as of 0.9, followed by the removal of the old implementation in a future version. |
| `name`                                                       |                              | Unique name for the connector. Attempting to register again with the same name will fail. (This property is required by all Kafka Connect connectors.) |
| `connector.class`                                            |                              | The name of the Java class for the connector. Always use a value of `io.debezium.connector.mysql.MySqlConnector` for the MySQL connector. |
| `tasks.max`                                                  | `1`                          | The maximum number of tasks that should be created for this connector. The MySQL connector always uses a single task and therefore does not use this value, so the default is always acceptable. |
| `database.hostname`                                          |                              | IP address or hostname of the MySQL database server.         |
| `database.port`                                              | `3306`                       | Integer port number of the MySQL database server.            |
| `database.user`                                              |                              | Name of the MySQL database to use when when connecting to the MySQL database server. |
| `database.password`                                          |                              | Password to use when when connecting to the MySQL database server. |
| `database.server.name`                                       | *host:port*                  | Logical name that identifies and provides a namespace for the particular MySQL database server/cluster being monitored. The logical name should be unique across all other connectors, since it is used as a prefix for all Kafka topic names emanating from this connector. Defaults to '*host*:_port_', where *host* is the value of the `database.hostname` property and *port* is the value of the `database.port` property, though we recommend using an explicit and meaningful logical name. |
| `database.server.id`                                         | *random*                     | A numeric ID of this database client, which must be unique across all currently-running database processes in the MySQL cluster. This connector joins the MySQL database cluster as another server (with this unique ID) so it can read the binlog. By default, a random number is generated between 5400 and 6400, though we recommend setting an explicit value. |
| `database.history.kafka.topic`                               |                              | The full name of the Kafka topic where the connector will store the database schema history. |
| `database.history.kafka.bootstrap.servers`                   |                              | A list of host/port pairs that the connector will use for establishing an initial connection to the Kafka cluster. This connection will be used for retrieving database schema history previously stored by the connector, and for writing each DDL statement read from the source database. This should point to the same Kafka cluster used by the Kafka Connect process. |
| `database.whitelist`                                         | *empty string*               | An optional comma-separated list of regular expressions that match database names to be monitored; any database name not included in the whitelist will be excluded from monitoring. By default all databases will be monitored. May not be used with `database.blacklist`. |
| `database.blacklist`                                         | *empty string*               | An optional comma-separated list of regular expressions that match database names to be excluded from monitoring; any database name not included in the blacklist will be monitored. May not be used with `database.whitelist`. |
| `table.whitelist`                                            | *empty string*               | An optional comma-separated list of regular expressions that match fully-qualified table identifiers for tables to be monitored; any table not included in the whitelist will be excluded from monitoring. Each identifier is of the form *databaseName*.*tableName*. By default the connector will monitor every non-system table in each monitored database. May not be used with `table.blacklist`. |
| `table.blacklist`                                            | *empty string*               | An optional comma-separated list of regular expressions that match fully-qualified table identifiers for tables to be excluded from monitoring; any table not included in the blacklist will be monitored. Each identifier is of the form *databaseName*.*tableName*. May not be used with `table.whitelist`. |
| `column.blacklist`                                           | *empty string*               | An optional comma-separated list of regular expressions that match the fully-qualified names of columns that should be excluded from change event message values. Fully-qualified names for columns are of the form *databaseName*.*tableName*.*columnName*, or *databaseName*.*schemaName*.*tableName*.*columnName*. |
| `column.truncate.to.*length*.chars`                          | *n/a*                        | An optional comma-separated list of regular expressions that match the fully-qualified names of character-based columns whose values should be truncated in the change event message values if the field values are longer than the specified number of characters. Multiple properties with different lengths can be used in a single configuration, although in each the length must be a positive integer. Fully-qualified names for columns are of the form *databaseName*.*tableName*.*columnName*, or *databaseName*.*schemaName*.*tableName*.*columnName*. |
| `column.mask.with.*length*.chars`                            | *n/a*                        | An optional comma-separated list of regular expressions that match the fully-qualified names of character-based columns whose values should be replaced in the change event message values with a field value consisting of the specified number of asterisk (`*`) characters. Multiple properties with different lengths can be used in a single configuration, although in each the length must be a positive integer. Fully-qualified names for columns are of the form *databaseName*.*tableName*.*columnName*, or *databaseName*.*schemaName*.*tableName*.*columnName*. |
| `column.propagate.source.type` 0.8.0 and later               | *n/a*                        | An optional comma-separated list of regular expressions that match the fully-qualified names of columns whose original type and length should be added as a parameter to the corresponding field schemas in the emitted change messages. The schema parameters `__debezium.source.column.type`, `__debezium.source.column.length` and `_debezium.source.column.scale` will be used to propagate the original type name and length (for variable-width types), respectively. Useful to properly size corresponding columns in sink databases. Fully-qualified names for columns are of the form *databaseName*.*tableName*.*columnName*, or *databaseName*.*schemaName*.*tableName*.*columnName*. |
| `time.precision.mode`                                        | `adaptive_time_microseconds` | Time, date, and timestamps can be represented with different kinds of precision, including: `adaptive_time_microseconds` (the default) captures the date, datetime and timestamp values exactly as in the database using either millisecond, microsecond, or nanosecond precision values based on the database column’s type, with the exception of TIME type fields, which are always captured as microseconds; `adaptive`(deprecated) captures the time and timestamp values exactly as in the database using either millisecond, microsecond, or nanosecond precision values based on the database column’s type; or `connect` always represents time and timestamp values using Kafka Connect’s built-in representations for Time, Date, and Timestamp, which uses millisecond precision regardless of the database columns' precision. See [Temporal values](https://debezium.io/docs/connectors/mysql/#temporal-values). |
| `decimal.handling.mode` `string` in 0.7.4 and later          | `precise`                    | Specifies how the connector should handle values for `DECIMAL`and `NUMERIC` columns: `precise` (the default) represents them precisely using `java.math.BigDecimal` values represented in change events in a binary form; or `double` represents them using `double` values, which may result in a loss of precision but will be far easier to use. `string` option encodes values as formatted string which is easy to consume but a semantic information about the real type is lost. See [Decimal values](https://debezium.io/docs/connectors/mysql/#decimal-values). |
| `bigint.unsigned.handling.mode` 0.6.1 and later              | `long`                       | Specifies how BIGINT UNSIGNED columns should be represented in change events, including: `precise` uses `java.math.BigDecimal` to represent values, which are encoded in the change events using a binary representation and Kafka Connect’s `org.apache.kafka.connect.data.Decimal` type; `long` (the default) represents values using Java’s `long`, which may not offer the precision but will be far easier to use in consumers. `long` is usually the preferable setting. Only when working with values larger than 2^63, the `precise` setting should be used as those values can’t be conveyed using `long`. See [Data types](https://debezium.io/docs/connectors/mysql/#data-types). |
| `include.schema.changes`                                     | `true`                       | Boolean value that specifies whether the connector should publish changes in the database schema to a Kafka topic with the same name as the database server ID. Each schema change will be recorded using a key that contains the database name and whose value includes the DDL statement(s). This is independent of how the connector internally records database history. The default is `true`. |
| `include.query`                                              | `false`                      | Boolean value that specifies whether the connector should include the original SQL query that generated the change event. Note: This option requires MySQL be configured with the binlog_rows_query_log_events option set to ON. Query will not be present for events generated from the snapshot process. WARNING: Enabling this option may expose tables or fields explicitly blacklisted or masked by including the original SQL statement in the change event. For this reason this option is defaulted to 'false'. |
| `event.deserialization.failure.handling.mode` 0.6.2 and later | `fail`                       | Specifies how the connector should react to exceptions during deserialization of binlog events. `fail` will propagate the exception (indicating the problematic event and its binlog offset), causing the connector to stop. `warn` will cause the problematic event to be skipped and the problematic event and its binlog offset to be logged (make sure that [the logger](https://debezium.io/docs/configuration/logging/) is set to the `WARN` or `ERROR` level). `ignore` will cause problematic event will be skipped. |
| `inconsistent.schema.handling.mode` 0.7.3 and later          | `fail`                       | Specifies how the connector should react to binlog events that relate to tables that are not present in internal schema representation (i.e. internal representation is not consistent with database) `fail` will throw an exception (indicating the problematic event and its binlog offset), causing the connector to stop. `warn` will cause the problematic event to be skipped and the problematic event and its binlog offset to be logged (make sure that [the logger](https://debezium.io/docs/configuration/logging/) is set to the `WARN` or `ERROR` level). `ignore` will cause the problematic event to be skipped. |
| `max.queue.size`                                             | `8192`                       | Positive integer value that specifies the maximum size of the blocking queue into which change events read from the database log are placed before they are written to Kafka. This queue can provide backpressure to the binlog reader when, for example, writes to Kafka are slower or if Kafka is not available. Events that appear in the queue are not included in the offsets periodically recorded by this connector. Defaults to 8192, and should always be larger than the maximum batch size specified in the `max.batch.size` property. |
| `max.batch.size`                                             | `2048`                       | Positive integer value that specifies the maximum size of each batch of events that should be processed during each iteration of this connector. Defaults to 2048. |
| `poll.interval.ms`                                           | `1000`                       | Positive integer value that specifies the number of milliseconds the connector should wait during each iteration for new change events to appear. Defaults to 1000 milliseconds, or 1 second. |
| `connect.timeout.ms`                                         | `30000`                      | A positive integer value that specifies the maximum time in milliseconds this connector should wait after trying to connect to the MySQL database server before timing out. Defaults to 30 seconds. |
| `gtid.source.includes`                                       |                              | A comma-separated list of regular expressions that match source UUIDs in the GTID set used to find the binlog position in the MySQL server. Only the GTID ranges that have sources matching one of these include patterns will be used. May not be used with `gtid.source.excludes`. |
| `gtid.source.excludes`                                       |                              | A comma-separated list of regular expressions that match source UUIDs in the GTID set used to find the binlog position in the MySQL server. Only the GTID ranges that have sources matching none of these exclude patterns will be used. May not be used with `gtid.source.includes`. |
| `gtid.new.channel.position` 0.9.0 and later                  | `latest`                     | When set to `latest`, when the connector sees a new GTID channel, it will start consuming from the last executed transaction in that GTID channel. If set to `earliest`, the connector starts reading that channel from the first available (not purged) GTID position. `earliest` is useful when you have a active-passive MySQL setup where Debezium is connected to master, in this case during failover the slave with new UUID (and GTID channel) starts receiving writes before Debezium is connected. These writes would be lost when using `latest`. |
| `tombstones.on.delete` 0.7.3 and later                       | `true`                       | Controls whether a tombstone event should be generated after a delete event. When `true` the delete operations are represented by a delete event and a subsequent tombstone event. When `false` only a delete event is sent. Emitting the tombstone event (the default behavior) allows Kafka to completely delete all events pertaining to the given key once the source record got deleted. |

The following *advanced* configuration properties have good defaults that will work in most situations and therefore rarely need to be specified in the connector’s configuration.

| Property                                                     | Default                | Description                                                  |
| ------------------------------------------------------------ | ---------------------- | ------------------------------------------------------------ |
| `snapshot.delay.ms` 0.8.0 and later                          |                        | An interval in milli-seconds that the connector should wait before taking a snapshot after starting up; Can be used to avoid snapshot interruptions when starting multiple connectors in a cluster, which may cause re-balancing of connectors. |
| `connect.keep.alive`                                         | `true`                 | A boolean value that specifies whether a separate thread should be used to ensure the connection to the MySQL server/cluster is kept alive. |
| `table.ignore.builtin`                                       | `true`                 | Boolean value that specifies whether built-in system tables should be ignored. This applies regardless of the table whitelist or blacklists. By default system tables are excluded from monitoring, and no events are generated when changes are made to any of the system tables. |
| `database.history.kafka.recovery.poll.interval.ms`           | `100`                  | An integer value that specifies the maximum number of milliseconds the connector should wait during startup/recovery while polling for persisted data. The default is 100ms. |
| `database.history.kafka.recovery.attempts`                   | `4`                    | The maximum number of times that the connector should attempt to read persisted history data before the connector recovery fails with an error. The maximum amount of time to wait after receiving no data is `recovery.attempts` x `recovery.poll.interval.ms`. |
| `database.history.skip.unparseable.ddl`                      | `false`                | Boolean value that specifies if connector should ignore malformed or unknown database statements or stop processing and let operator to fix the issue. The safe default is `false`. Skipping should be used only with care as it can lead to data loss or mangling when binlog is processed. |
| `database.history.store.only.monitored.tables.ddl` 0.7.2 and later | `false`                | Boolean value that specifies if connector should should record all DDL statements or (when `true`) only those that are relevant to tables that are monitored by Debezium (via filter configuration). The safe default is `false`. This feature should be used only with care as the missing data might be necessary when the filters are changed. |
| `binlog.buffer.size` 0.7.0 and later                         | 0                      | The size of a look-ahead buffer used by the binlog reader. Under specific conditions it is possible that MySQL binlog contains uncommitted data finished by a `ROLLBACK` statement. Typical examples are using savepoints or mixing temporary and regular table changes in a single transaction. When a beginning of a transaction is detected then Debezium tries to roll forward the binlog position and find either `COMMIT` or `ROLLBACK` so it can decide whether the changes from the transaction will be streamed or not. The size of the buffer defines the maximum number of changes in the transaction that Debezium can buffer while searching for transaction boundaries. If the size of transaction is larger than the buffer then Debezium needs to rewind and re-read the events that has not fit into the buffer while streaming. Value `0` disables buffering. Disabled by default. *Note:* This feature should be considered an incubating one. We need a feedback from customers but it is expected that it is not completely polished. |
| `snapshot.mode`                                              | `initial`              | Specifies the criteria for running a snapshot upon startup of the connector. The default is `initial`, and specifies the connector can run a snapshot only when no offsets have been recorded for the logical server name. The `when_needed` option specifies that the connector run a snapshot upon startup whenever it deems it necessary (when no offsets are available, or when a previously recorded offset specifies a binlog location or GTID that is not available in the server). The `never` option specifies that the connect should never use snapshots and that upon first startup with a logical server name the connector should read from the beginning of the binlog; this should be used with care, as it is only valid when the binlog is guaranteed to contain the entire history of the database. If you don’t need the topics to contain a consistent snapshot of the data but only need them to have the changes since the connector was started, you can use the `schema_only` option, where the connector only snapshots the schemas (not the data).`schema_only_recovery` is a recovery option for an existing connector to recover a corrupted or lost database history topic, or to periodically "clean up" a database history topic (which requires infinite retention) that may be growing unexpectedly. |
| `snapshot.locking.mode` *0.7.3 and later*                    | `minimal`              | Controls if and how long the connector holds onto the global MySQL read lock (preventing any updates to the database) while it is performing a snapshot. There are three possible values `minimal`, `extended`, and `none`. `minimal` The connector holds the global read lock for just the initial portion of the snapshot while the connector reads the database schemas and other metadata. The remaining work in a snapshot involves selecting all rows from each table, and this can be done in a consistent fashion using the REPEATABLE READ transaction even when the global read lock is no longer held and while other MySQL clients are updating the database. `extended` In some cases where clients are submitting operations that MySQL excludes from REPEATABLE READ semantics, it may be desirable to block all writes for the entire duration of the snapshot. For these such cases, use this option. `none` Will prevent the connector from acquiring any table locks during the snapshot process. This value can be used with all snapshot modes but it is safe to use if and *only* if no schema changes are happening while the snapshot is taken. Note that for tables defined with MyISAM engine, the tables would still be locked despite this property being set as MyISAM acquires a table lock. This behaviour is unlike InnoDB engine which acquires row level locks. |
| `snapshot.minimal.locks` *deprecated since 0.7.3*            | `true`                 | Controls how long the connector holds onto the global MySQL read lock (preventing any updates to the database) while it is performing a snapshot. The default is `true`, meaning the connector holds the global read lock for just the initial portion of the snapshot while the connector reads the database schemas and other metadata. The remaining work in a snapshot involves selecting all rows from each table, and this can be done in a consistent fashion using the `REPEATABLE READ` transaction even when the global read lock is no longer held and while other MySQL clients are updating the database. However, in some cases where clients are submitting operations that MySQL excludes from `REPEATABLE READ` semantics, it may be desirable to *block all writes* for the entire duration of the snapshot. In only such cases, set this property to `false`. *Deprecated:* This option has been deprecated and replaced with the `snapshot.locking.mode`configuration option. This option will be removed in a future release. A `snapshot.minimal.locks` value of `true` should be replaced with `snapshot.locking.mode` set to `minimal`. A `snapshot.minimal.locks` value of `false` should be replaced with `snapshot.locking.mode` set to `extended`. |
| `snapshot.select.statement.overrides` 0.7.0 and later        |                        | Controls which rows from tables will be included in snapshot. This property contains a comma-separated list of fully-qualified tables *(DB_NAME.TABLE_NAME)*. Select statements for the individual tables are specified in further configuration properties, one for each table, identified by the id `snapshot.select.statement.overrides.[DB_NAME].[TABLE_NAME]`. The value of those properties is the SELECT statement to use when retrieving data from the specific table during snapshotting. *A possible use case for large append-only tables is setting a specific point where to start (resume) snapshotting, in case a previous snapshotting was interrupted.* **Note**: This setting has impact on snapshots only. Events captured from binlog are not affected by it at all. |
| `min.row.count.to.stream.results`                            | `1000`                 | During a snapshot operation, the connector will query each included table to produce a read event for all rows in that table. This parameter determines whether the MySQL connection will pull all results for a table into memory (which is fast but requires large amounts of memory), or whether the results will instead be streamed (can be slower, but will work for very large tables). The value specifies the minimum number of rows a table must contain before the connector will stream results, and defaults to 1,000. Set this parameter to '0' to skip all table size checks and always stream all results during a snapshot. |
| `heartbeat.interval.ms` 0.7.3 and later                      | `0`                    | Controls how frequently the heartbeat messages are sent. This property contains an interval in milli-seconds that defines how frequently the connector sends heartbeat messages into a heartbeat topic. Set this parameter to `0` to not send heartbeat messages at all. Disabled by default. |
| `heartbeat.topics.prefix` 0.7.3 and later                    | `__debezium-heartbeat` | Controls the naming of the topic to which heartbeat messages are sent. The topic is named according to the pattern `<heartbeat.topics.prefix>.<server.name>`. |
| `database.initial.statements` 0.8.0 and later                |                        | A semicolon separated list of SQL statements to be executed when a JDBC connection (not the transaction log reading connection) to the database is established. Use doubled semicolon (';;') to use a semicolon as a character and not as a delimiter. *Note: The connector may establish JDBC connections at its own discretion, so this should typically be used for configuration of session parameters only, but not for executing DML statements.* |

The connector also supports *pass-through* configuration properties that are used when creating the Kafka producer and consumer. Specifically, all connector configuration properties that begin with the `database.history.producer.` prefix are used (without the prefix) when creating the Kafka producer that writes to the database history, and all those that begin with the prefix `database.history.consumer.` are used (without the prefix) when creating the Kafka consumer that reads the database history upon connector startup.

For example, the following connector configuration properties can be used to [secure connections to the Kafka broker](http://kafka.apache.org/documentation.html#security_configclients):

In addition to the *pass-through* to the Kafka producer and consumer, the properties starting with `database.`, e.g. `database.tinyInt1isBit=false` are passed to the JDBC URL.

```
database.history.producer.security.protocol=SSL
database.history.producer.ssl.keystore.location=/var/private/ssl/kafka.server.keystore.jks
database.history.producer.ssl.keystore.password=test1234
database.history.producer.ssl.truststore.location=/var/private/ssl/kafka.server.truststore.jks
database.history.producer.ssl.truststore.password=test1234
database.history.producer.ssl.key.password=test1234
database.history.consumer.security.protocol=SSL
database.history.consumer.ssl.keystore.location=/var/private/ssl/kafka.server.keystore.jks
database.history.consumer.ssl.keystore.password=test1234
database.history.consumer.ssl.truststore.location=/var/private/ssl/kafka.server.truststore.jks
database.history.consumer.ssl.truststore.password=test1234
database.history.consumer.ssl.key.password=test1234
```

Be sure to consult the [Kafka documentation](http://kafka.apache.org/documentation.html) for all of the configuration properties for Kafka producers and consumers. (The MySQL connector does use the [new consumer](http://kafka.apache.org/documentation.html#newconsumerconfigs).)