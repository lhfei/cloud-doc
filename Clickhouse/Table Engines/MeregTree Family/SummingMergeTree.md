# SummingMergeTree[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#summingmergetree)

The engine inherits from [MergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engines-mergetree). The difference is that when merging data parts for `SummingMergeTree` tables ClickHouse replaces all the rows with the same primary key (or more accurately, with the same [sorting key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/)) with one row which contains summarized values for the columns with the numeric data type. If the sorting key is composed in a way that a single key value corresponds to large number of rows, this significantly reduces storage volume and speeds up data selection.

We recommend to use the engine together with `MergeTree`. Store complete data in `MergeTree` table, and use `SummingMergeTree` for aggregated data storing, for example, when preparing reports. Such an approach will prevent you from losing valuable data due to an incorrectly composed primary key.

## Creating a Table[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#creating-a-table)

```sql
CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
(
    name1 [type1] [DEFAULT|MATERIALIZED|ALIAS expr1],
    name2 [type2] [DEFAULT|MATERIALIZED|ALIAS expr2],
    ...
) ENGINE = SummingMergeTree([columns])
[PARTITION BY expr]
[ORDER BY expr]
[SAMPLE BY expr]
[SETTINGS name=value, ...]
```

For a description of request parameters, see [request description](https://clickhouse.tech/docs/en/sql-reference/statements/create/table/).

**Parameters of SummingMergeTree**

- `columns` - a tuple with the names of columns where values will be summarized. Optional parameter.
  The columns must be of a numeric type and must not be in the primary key.

  If `columns` not specified, ClickHouse summarizes the values in all columns with a numeric data type that are not in the primary key.

**Query clauses**

When creating a `SummingMergeTree` table the same [clauses](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/) are required, as when creating a `MergeTree` table.

<details style="box-sizing: border-box; background: rgb(68, 68, 81); color: rgb(238, 238, 238); padding: 1rem; margin-bottom: 1rem; margin-top: 1rem; font-family: -apple-system, BlinkMacSystemFont, &quot;segoe ui&quot;, &quot;noto sans&quot;, &quot;helvetica neue&quot;, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;, &quot;noto color emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; font-weight: 700; color: rgb(238, 238, 238);">Deprecated Method for Creating a Table</summary></details>

## Usage Example[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#usage-example)

Consider the following table:

```sql
CREATE TABLE summtt
(
    key UInt32,
    value UInt32
)
ENGINE = SummingMergeTree()
ORDER BY key
```

Insert data to it:

```sql
INSERT INTO summtt Values(1,1),(1,2),(2,1)
```

ClickHouse may sum all the rows not completely ([see below](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#data-processing)), so we use an aggregate function `sum` and `GROUP BY` clause in the query.

```sql
SELECT key, sum(value) FROM summtt GROUP BY key
┌─key─┬─sum(value)─┐
│   2 │          1 │
│   1 │          3 │
└─────┴────────────┘
```

## Data Processing[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#data-processing)

When data are inserted into a table, they are saved as-is. ClickHouse merges the inserted parts of data periodically and this is when rows with the same primary key are summed and replaced with one for each resulting part of data.

ClickHouse can merge the data parts so that different resulting parts of data cat consist rows with the same primary key, i.e. the summation will be incomplete. Therefore (`SELECT`) an aggregate function [sum()](https://clickhouse.tech/docs/en/sql-reference/aggregate-functions/reference/sum/#agg_function-sum) and `GROUP BY` clause should be used in a query as described in the example above.

### Common Rules for Summation[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#common-rules-for-summation)

The values in the columns with the numeric data type are summarized. The set of columns is defined by the parameter `columns`.

If the values were 0 in all of the columns for summation, the row is deleted.

If column is not in the primary key and is not summarized, an arbitrary value is selected from the existing ones.

The values are not summarized for columns in the primary key.

### The Summation in the Aggregatefunction Columns[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#the-summation-in-the-aggregatefunction-columns)

For columns of [AggregateFunction type](https://clickhouse.tech/docs/en/sql-reference/data-types/aggregatefunction/) ClickHouse behaves as [AggregatingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/) engine aggregating according to the function.

### Nested Structures[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/#nested-structures)

Table can have nested data structures that are processed in a special way.

If the name of a nested table ends with `Map` and it contains at least two columns that meet the following criteria:

- the first column is numeric `(*Int*, Date, DateTime)` or a string `(String, FixedString)`, let’s call it `key`,
- the other columns are arithmetic `(*Int*, Float32/64)`, let’s call it `(values...)`,

then this nested table is interpreted as a mapping of `key => (values...)`, and when merging its rows, the elements of two data sets are merged by `key` with a summation of the corresponding `(values...)`.

Examples:

```
[(1, 100)] + [(2, 150)] -> [(1, 100), (2, 150)]
[(1, 100)] + [(1, 150)] -> [(1, 250)]
[(1, 100)] + [(1, 150), (2, 150)] -> [(1, 250), (2, 150)]
[(1, 100), (2, 150)] + [(1, -100)] -> [(2, 150)]
```

When requesting data, use the [sumMap(key, value)](https://clickhouse.tech/docs/en/sql-reference/aggregate-functions/reference/summap/) function for aggregation of `Map`.

For nested data structure, you do not need to specify its columns in the tuple of columns for summation.

[Original article](https://clickhouse.tech/docs/en/operations/table_engines/summingmergetree/)