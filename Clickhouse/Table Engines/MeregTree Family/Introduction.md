# Table Engines[ ](https://clickhouse.tech/docs/en/engines/table-engines/#table_engines)

The table engine (type of table) determines:

- How and where data is stored, where to write it to, and where to read it from.
- Which queries are supported, and how.
- Concurrent data access.
- Use of indexes, if present.
- Whether multithreaded request execution is possible.
- Data replication parameters.

## Engine Families[ ](https://clickhouse.tech/docs/en/engines/table-engines/#engine-families)

### MergeTree[ ](https://clickhouse.tech/docs/en/engines/table-engines/#mergetree)

The most universal and functional table engines for high-load tasks. The property shared by these engines is quick data insertion with subsequent background data processing. `MergeTree` family engines support data replication (with [Replicated*](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/replication/#table_engines-replication) versions of engines), partitioning, secondary data-skipping indexes, and other features not supported in other engines.

Engines in the family:

- [MergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree)
- [ReplacingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/replacingmergetree/#replacingmergetree)
- [SummingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#summingmergetree)
- [AggregatingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/#aggregatingmergetree)
- [CollapsingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/collapsingmergetree/#table_engine-collapsingmergetree)
- [VersionedCollapsingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/versionedcollapsingmergetree/#versionedcollapsingmergetree)
- [GraphiteMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/graphitemergetree/#graphitemergetree)

### Log[ ](https://clickhouse.tech/docs/en/engines/table-engines/#log)

Lightweight [engines](https://clickhouse.tech/docs/en/engines/table-engines/log-family/) with minimum functionality. They’re the most effective when you need to quickly write many small tables (up to approximately 1 million rows) and read them later as a whole.

Engines in the family:

- [TinyLog](https://clickhouse.tech/docs/en/engines/table-engines/log-family/tinylog/#tinylog)
- [StripeLog](https://clickhouse.tech/docs/en/engines/table-engines/log-family/stripelog/#stripelog)
- [Log](https://clickhouse.tech/docs/en/engines/table-engines/log-family/log/#log)

### Integration Engines[ ](https://clickhouse.tech/docs/en/engines/table-engines/#integration-engines)

Engines for communicating with other data storage and processing systems.

Engines in the family:

- [Kafka](https://clickhouse.tech/docs/en/engines/table-engines/integrations/kafka/#kafka)
- [MySQL](https://clickhouse.tech/docs/en/engines/table-engines/integrations/mysql/#mysql)
- [ODBC](https://clickhouse.tech/docs/en/engines/table-engines/integrations/odbc/#table-engine-odbc)
- [JDBC](https://clickhouse.tech/docs/en/engines/table-engines/integrations/jdbc/#table-engine-jdbc)
- [HDFS](https://clickhouse.tech/docs/en/engines/table-engines/integrations/hdfs/#hdfs)

### Special Engines[ ](https://clickhouse.tech/docs/en/engines/table-engines/#special-engines)

Engines in the family:

- [Distributed](https://clickhouse.tech/docs/en/engines/table-engines/special/distributed/#distributed)
- [MaterializedView](https://clickhouse.tech/docs/en/engines/table-engines/special/materializedview/#materializedview)
- [Dictionary](https://clickhouse.tech/docs/en/engines/table-engines/special/dictionary/#dictionary)
- [Merge](https://clickhouse.tech/docs/en/engines/table-engines/special/merge/#merge)
- [File](https://clickhouse.tech/docs/en/engines/table-engines/special/file/#file)
- [Null](https://clickhouse.tech/docs/en/engines/table-engines/special/null/#null)
- [Set](https://clickhouse.tech/docs/en/engines/table-engines/special/set/#set)
- [Join](https://clickhouse.tech/docs/en/engines/table-engines/special/join/#join)
- [URL](https://clickhouse.tech/docs/en/engines/table-engines/special/url/#table_engines-url)
- [View](https://clickhouse.tech/docs/en/engines/table-engines/special/view/#table_engines-view)
- [Memory](https://clickhouse.tech/docs/en/engines/table-engines/special/memory/#memory)
- [Buffer](https://clickhouse.tech/docs/en/engines/table-engines/special/buffer/#buffer)

## Virtual Columns[ ](https://clickhouse.tech/docs/en/engines/table-engines/#table_engines-virtual_columns)

Virtual column is an integral table engine attribute that is defined in the engine source code.

You shouldn’t specify virtual columns in the `CREATE TABLE` query and you can’t see them in `SHOW CREATE TABLE` and `DESCRIBE TABLE` query results. Virtual columns are also read-only, so you can’t insert data into virtual columns.

To select data from a virtual column, you must specify its name in the `SELECT` query. `SELECT *` doesn’t return values from virtual columns.

If you create a table with a column that has the same name as one of the table virtual columns, the virtual column becomes inaccessible. We don’t recommend doing this. To help avoid conflicts, virtual column names are usually prefixed with an underscore.

[Original article](https://clickhouse.tech/docs/en/engines/table-engines/)