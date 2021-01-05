# TinyLog[ ](https://clickhouse.tech/docs/en/engines/table-engines/log-family/tinylog/#tinylog)

The engine belongs to the log engine family. See [Log Engine Family](https://clickhouse.tech/docs/en/engines/table-engines/log-family/) for common properties of log engines and their differences.

This table engine is typically used with the write-once method: write data one time, then read it as many times as necessary. For example, you can use `TinyLog`-type tables for intermediary data that is processed in small batches. Note that storing data in a large number of small tables is inefficient.

Queries are executed in a single stream. In other words, this engine is intended for relatively small tables (up to about 1,000,000 rows). It makes sense to use this table engine if you have many small tables, since it’s simpler than the [Log](https://clickhouse.tech/docs/en/engines/table-engines/log-family/log/) engine (fewer files need to be opened).

[Original article](https://clickhouse.tech/docs/en/operations/table_engines/tinylog/)