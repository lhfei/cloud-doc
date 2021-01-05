# Aggregatingmergetree[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/#aggregatingmergetree)

The engine inherits from [MergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engines-mergetree), altering the logic for data parts merging. ClickHouse replaces all rows with the same primary key (or more accurately, with the same [sorting key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/)) with a single row (within a one data part) that stores a combination of states of aggregate functions.

You can use `AggregatingMergeTree` tables for incremental data aggregation, including for aggregated materialized views.

The engine processes all columns with the following types:

- [AggregateFunction](https://clickhouse.tech/docs/en/sql-reference/data-types/aggregatefunction/)
- [SimpleAggregateFunction](https://clickhouse.tech/docs/en/sql-reference/data-types/simpleaggregatefunction/)

It is appropriate to use `AggregatingMergeTree` if it reduces the number of rows by orders.

## Creating a Table[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/#creating-a-table)

```
CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
(
    name1 [type1] [DEFAULT|MATERIALIZED|ALIAS expr1],
    name2 [type2] [DEFAULT|MATERIALIZED|ALIAS expr2],
    ...
) ENGINE = AggregatingMergeTree()
[PARTITION BY expr]
[ORDER BY expr]
[SAMPLE BY expr]
[TTL expr]
[SETTINGS name=value, ...]
```

For a description of request parameters, see [request description](https://clickhouse.tech/docs/en/sql-reference/statements/create/table/).

**Query clauses**

When creating a `AggregatingMergeTree` table the same [clauses](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/) are required, as when creating a `MergeTree` table.

<details style="box-sizing: border-box; background: rgb(68, 68, 81); color: rgb(238, 238, 238); padding: 1rem; margin-bottom: 1rem; margin-top: 1rem; font-family: -apple-system, BlinkMacSystemFont, &quot;segoe ui&quot;, &quot;noto sans&quot;, &quot;helvetica neue&quot;, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;, &quot;noto color emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; font-weight: 700; color: rgb(238, 238, 238);">Deprecated Method for Creating a Table</summary></details>

## SELECT and INSERT[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/#select-and-insert)

To insert data, use [INSERT SELECT](https://clickhouse.tech/docs/en/sql-reference/statements/insert-into/) query with aggregate -State- functions.
When selecting data from `AggregatingMergeTree` table, use `GROUP BY` clause and the same aggregate functions as when inserting data, but using `-Merge` suffix.

In the results of `SELECT` query, the values of `AggregateFunction` type have implementation-specific binary representation for all of the ClickHouse output formats. If dump data into, for example, `TabSeparated` format with `SELECT` query then this dump can be loaded back using `INSERT` query.

## Example of an Aggregated Materialized View[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/#example-of-an-aggregated-materialized-view)

`AggregatingMergeTree` materialized view that watches the `test.visits` table:

```
CREATE MATERIALIZED VIEW test.basic
ENGINE = AggregatingMergeTree() PARTITION BY toYYYYMM(StartDate) ORDER BY (CounterID, StartDate)
AS SELECT
    CounterID,
    StartDate,
    sumState(Sign)    AS Visits,
    uniqState(UserID) AS Users
FROM test.visits
GROUP BY CounterID, StartDate;
```

Inserting data into the `test.visits` table.

```
INSERT INTO test.visits ...
```

The data are inserted in both the table and view `test.basic` that will perform the aggregation.

To get the aggregated data, we need to execute a query such as `SELECT ... GROUP BY ...` from the view `test.basic`:

```
SELECT
    StartDate,
    sumMerge(Visits) AS Visits,
    uniqMerge(Users) AS Users
FROM test.basic
GROUP BY StartDate
ORDER BY StartDate;
```

[Original article](https://clickhouse.tech/docs/en/operations/table_engines/aggregatingmergetree/)