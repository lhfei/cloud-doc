# MergeTree[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engines-mergetree)

The `MergeTree` engine and other engines of this family (`*MergeTree`) are the most robust ClickHouse table engines.

Engines in the `MergeTree` family are designed for inserting a very large amount of data into a table. The data is quickly written to the table part by part, then rules are applied for merging the parts in the background. This method is much more efficient than continually rewriting the data in storage during insert.

Main features:

- Stores data sorted by primary key.

  This allows you to create a small sparse index that helps find data faster.

- Partitions can be used if the [partitioning key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/custom-partitioning-key/) is specified.

  ClickHouse supports certain operations with partitions that are more effective than general operations on the same data with the same result. ClickHouse also automatically cuts off the partition data where the partitioning key is specified in the query. This also improves query performance.

- Data replication support.

  The family of `ReplicatedMergeTree` tables provides data replication. For more information, see [Data replication](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/replication/).

- Data sampling support.

  If necessary, you can set the data sampling method in the table.

Info

The [Merge](https://clickhouse.tech/docs/en/engines/table-engines/special/merge/#merge) engine does not belong to the `*MergeTree` family.

## Creating a Table[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-creating-a-table)

```
CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
(
    name1 [type1] [DEFAULT|MATERIALIZED|ALIAS expr1] [TTL expr1],
    name2 [type2] [DEFAULT|MATERIALIZED|ALIAS expr2] [TTL expr2],
    ...
    INDEX index_name1 expr1 TYPE type1(...) GRANULARITY value1,
    INDEX index_name2 expr2 TYPE type2(...) GRANULARITY value2
) ENGINE = MergeTree()
ORDER BY expr
[PARTITION BY expr]
[PRIMARY KEY expr]
[SAMPLE BY expr]
[TTL expr [DELETE|TO DISK 'xxx'|TO VOLUME 'xxx'], ...]
[SETTINGS name=value, ...]
```

For a description of parameters, see the [CREATE query description](https://clickhouse.tech/docs/en/sql-reference/statements/create/table/).

### Query Clauses[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-query-clauses)

- `ENGINE` — Name and parameters of the engine. `ENGINE = MergeTree()`. The `MergeTree` engine does not have parameters.

- `ORDER BY` — The sorting key.

  A tuple of column names or arbitrary expressions. Example: `ORDER BY (CounterID, EventDate)`.

  ClickHouse uses the sorting key as a primary key if the primary key is not defined obviously by the `PRIMARY KEY` clause.

  Use the `ORDER BY tuple()` syntax, if you don’t need sorting. See [Selecting the Primary Key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#selecting-the-primary-key).

- `PARTITION BY` — The [partitioning key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/custom-partitioning-key/). Optional.

  For partitioning by month, use the `toYYYYMM(date_column)` expression, where `date_column` is a column with a date of the type [Date](https://clickhouse.tech/docs/en/sql-reference/data-types/date/). The partition names here have the `"YYYYMM"` format.

- `PRIMARY KEY` — The primary key if it [differs from the sorting key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#choosing-a-primary-key-that-differs-from-the-sorting-key). Optional.

  By default the primary key is the same as the sorting key (which is specified by the `ORDER BY` clause). Thus in most cases it is unnecessary to specify a separate `PRIMARY KEY` clause.

- `SAMPLE BY` — An expression for sampling. Optional.

  If a sampling expression is used, the primary key must contain it. Example: `SAMPLE BY intHash32(UserID) ORDER BY (CounterID, EventDate, intHash32(UserID))`.

- `TTL` — A list of rules specifying storage duration of rows and defining logic of automatic parts movement [between disks and volumes](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-multiple-volumes). Optional.

  Expression must have one `Date` or `DateTime` column as a result. Example:
  `TTL date + INTERVAL 1 DAY`

  Type of the rule `DELETE|TO DISK 'xxx'|TO VOLUME 'xxx'` specifies an action to be done with the part if the expression is satisfied (reaches current time): removal of expired rows, moving a part (if expression is satisfied for all rows in a part) to specified disk (`TO DISK 'xxx'`) or to volume (`TO VOLUME 'xxx'`). Default type of the rule is removal (`DELETE`). List of multiple rules can specified, but there should be no more than one `DELETE` rule.

  For more details, see [TTL for columns and tables](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-ttl)

- `SETTINGS` — Additional parameters that control the behavior of the `MergeTree` (optional):

  - `index_granularity` — Maximum number of data rows between the marks of an index. Default value: 8192. See [Data Storage](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-data-storage).
  - `index_granularity_bytes` — Maximum size of data granules in bytes. Default value: 10Mb. To restrict the granule size only by number of rows, set to 0 (not recommended). See [Data Storage](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-data-storage).
  - `min_index_granularity_bytes` — Min allowed size of data granules in bytes. Default value: 1024b. To provide a safeguard against accidentally creating tables with very low index_granularity_bytes. See [Data Storage](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-data-storage).
  - `enable_mixed_granularity_parts` — Enables or disables transitioning to control the granule size with the `index_granularity_bytes` setting. Before version 19.11, there was only the `index_granularity` setting for restricting granule size. The `index_granularity_bytes` setting improves ClickHouse performance when selecting data from tables with big rows (tens and hundreds of megabytes). If you have tables with big rows, you can enable this setting for the tables to improve the efficiency of `SELECT` queries.
  - `use_minimalistic_part_header_in_zookeeper` — Storage method of the data parts headers in ZooKeeper. If `use_minimalistic_part_header_in_zookeeper=1`, then ZooKeeper stores less data. For more information, see the [setting description](https://clickhouse.tech/docs/en/operations/server-configuration-parameters/settings/#server-settings-use_minimalistic_part_header_in_zookeeper) in “Server configuration parameters”.
  - `min_merge_bytes_to_use_direct_io` — The minimum data volume for merge operation that is required for using direct I/O access to the storage disk. When merging data parts, ClickHouse calculates the total storage volume of all the data to be merged. If the volume exceeds `min_merge_bytes_to_use_direct_io` bytes, ClickHouse reads and writes the data to the storage disk using the direct I/O interface (`O_DIRECT` option). If `min_merge_bytes_to_use_direct_io = 0`, then direct I/O is disabled. Default value: `10 * 1024 * 1024 * 1024` bytes.
  - `merge_with_ttl_timeout` — Minimum delay in seconds before repeating a merge with TTL. Default value: 86400 (1 day).
  - `write_final_mark` — Enables or disables writing the final index mark at the end of data part (after the last byte). Default value: 1. Don’t turn it off.
  - `merge_max_block_size` — Maximum number of rows in block for merge operations. Default value: 8192.
  - `storage_policy` — Storage policy. See [Using Multiple Block Devices for Data Storage](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-multiple-volumes).
  - `min_bytes_for_wide_part`, `min_rows_for_wide_part` — Minimum number of bytes/rows in a data part that can be stored in `Wide` format. You can set one, both or none of these settings. See [Data Storage](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-data-storage).

**Example of Sections Setting**

```
ENGINE MergeTree() PARTITION BY toYYYYMM(EventDate) ORDER BY (CounterID, EventDate, intHash32(UserID)) SAMPLE BY intHash32(UserID) SETTINGS index_granularity=8192
```

In the example, we set partitioning by month.

We also set an expression for sampling as a hash by the user ID. This allows you to pseudorandomize the data in the table for each `CounterID` and `EventDate`. If you define a [SAMPLE](https://clickhouse.tech/docs/en/sql-reference/statements/select/sample/#select-sample-clause) clause when selecting the data, ClickHouse will return an evenly pseudorandom data sample for a subset of users.

The `index_granularity` setting can be omitted because 8192 is the default value.

<details open="" style="box-sizing: border-box; background: rgb(68, 68, 81); color: rgb(238, 238, 238); padding: 1rem; margin-bottom: 1rem; margin-top: 1rem; font-family: -apple-system, BlinkMacSystemFont, &quot;segoe ui&quot;, &quot;noto sans&quot;, &quot;helvetica neue&quot;, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;, &quot;noto color emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; font-weight: 700; color: rgb(238, 238, 238);">Deprecated Method for Creating a Table</summary><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"></p><div class="admonition attention alert pb-0 mb-4 alert-warning" role="alert" style="box-sizing: border-box; position: relative; padding-top: 0.75rem; padding-right: 1.25rem; padding-bottom: 0px !important; padding-left: 1.25rem; margin-bottom: 1.5rem !important; border: 1px solid rgb(255, 238, 186); border-radius: 0.25rem; color: rgb(133, 100, 4); background-color: rgb(255, 243, 205);"><p class="admonition-title alert-heading display-6 mb-2" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem !important; color: inherit; font-size: 1.75rem; font-weight: 300; line-height: 1.2;">Attention</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;">Do not use this method in new projects. If possible, switch old projects to the method described above.</p></div><div class="codehilite" style="box-sizing: border-box;"><pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(33, 37, 41); background: rgb(239, 239, 239); padding: 1rem; line-height: 1.25;"><img src="https://clickhouse.tech/images/mkdocs/copy.svg" alt="Copy" title="Copy" class="code-copy btn float-right m-0 p-0" style="box-sizing: border-box; vertical-align: middle; border: 1px solid transparent; display: inline-block; font-weight: 400; color: rgb(33, 37, 41); text-align: center; cursor: pointer; user-select: none; background-color: transparent; padding: 0px !important; font-size: 1rem; line-height: 1.5; border-radius: 0.25rem; float: right !important; margin: 0px !important;"><span style="box-sizing: border-box;"></span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: inherit; color: rgb(0, 0, 0); overflow-wrap: break-word; word-break: normal; background: rgb(238, 238, 238); padding: 0px;"><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">CREATE</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">TABLE</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">IF</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">NOT</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">EXISTS</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">db</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">.]</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">table_name</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ON</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">CLUSTER</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">cluster</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span>
<span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span>
    <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">name1</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">type1</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">DEFAULT</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MATERIALIZED</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ALIAS</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">expr1</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span>
    <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">name2</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">type2</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">DEFAULT</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MATERIALIZED</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ALIAS</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">expr2</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span>
    <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">...</span>
<span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">)</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">ENGINE</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">=</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MergeTree</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="nb" style="box-sizing: border-box; color: rgb(47, 30, 46);">date</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">-</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">column</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[,</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">sampling_expression</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">primary</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">key</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">),</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">index_granularity</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">)</span>
</code></pre></div><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"><strong style="box-sizing: border-box; font-weight: bolder;">MergeTree() Parameters</strong></p><ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"><li style="box-sizing: border-box;"><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">date-column</code><span>&nbsp;</span>— The name of a column of the<span>&nbsp;</span><a href="https://clickhouse.tech/docs/en/sql-reference/data-types/date/" style="box-sizing: border-box; color: rgb(241, 70, 0); text-decoration: none; background-color: transparent;">Date</a><span>&nbsp;</span>type. ClickHouse automatically creates partitions by month based on this column. The partition names are in the<span>&nbsp;</span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">"YYYYMM"</code><span>&nbsp;</span>format.</li><li style="box-sizing: border-box;"><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">sampling_expression</code><span>&nbsp;</span>— An expression for sampling.</li><li style="box-sizing: border-box;"><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">(primary, key)</code><span>&nbsp;</span>— Primary key. Type:<span>&nbsp;</span><a href="https://clickhouse.tech/docs/en/sql-reference/data-types/tuple/" style="box-sizing: border-box; color: rgb(241, 70, 0); text-decoration: none; background-color: transparent;">Tuple()</a></li><li style="box-sizing: border-box;"><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">index_granularity</code><span>&nbsp;</span>— The granularity of an index. The number of data rows between the “marks” of an index. The value 8192 is appropriate for most tasks.</li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"><strong style="box-sizing: border-box; font-weight: bolder;">Example</strong></p><div class="codehilite" style="box-sizing: border-box;"><pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(33, 37, 41); background: rgb(239, 239, 239); padding: 1rem; line-height: 1.25;"><img src="https://clickhouse.tech/images/mkdocs/copy.svg" alt="Copy" title="Copy" class="code-copy btn float-right m-0 p-0" style="box-sizing: border-box; vertical-align: middle; border: 1px solid transparent; display: inline-block; font-weight: 400; color: rgb(33, 37, 41); text-align: center; cursor: pointer; user-select: none; background-color: transparent; padding: 0px !important; font-size: 1rem; line-height: 1.5; border-radius: 0.25rem; float: right !important; margin: 0px !important;"><span style="box-sizing: border-box;"></span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: inherit; color: rgb(0, 0, 0); overflow-wrap: break-word; word-break: normal; background: rgb(238, 238, 238); padding: 0px;"><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MergeTree</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">EventDate</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">intHash32</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">UserID</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">),</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">CounterID</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">EventDate</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">intHash32</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">UserID</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">)),</span> <span class="mi" style="box-sizing: border-box; color: rgb(0, 136, 255);">8192</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">)</span>
</code></pre></div><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;">The<span>&nbsp;</span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">MergeTree</code><span>&nbsp;</span>engine is configured in the same way as in the example above for the main engine configuration method.</p></details>

## Data Storage[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-data-storage)

A table consists of data parts sorted by primary key.

When data is inserted in a table, separate data parts are created and each of them is lexicographically sorted by primary key. For example, if the primary key is `(CounterID, Date)`, the data in the part is sorted by `CounterID`, and within each `CounterID`, it is ordered by `Date`.

Data belonging to different partitions are separated into different parts. In the background, ClickHouse merges data parts for more efficient storage. Parts belonging to different partitions are not merged. The merge mechanism does not guarantee that all rows with the same primary key will be in the same data part.

Data parts can be stored in `Wide` or `Compact` format. In `Wide` format each column is stored in a separate file in a filesystem, in `Compact` format all columns are stored in one file. `Compact` format can be used to increase performance of small and frequent inserts.

Data storing format is controlled by the `min_bytes_for_wide_part` and `min_rows_for_wide_part` settings of the table engine. If the number of bytes or rows in a data part is less then the corresponding setting's value, the part is stored in `Compact` format. Otherwise it is stored in `Wide` format. If none of these settings is set, data parts are stored in `Wide` format.

Each data part is logically divided into granules. A granule is the smallest indivisible data set that ClickHouse reads when selecting data. ClickHouse doesn’t split rows or values, so each granule always contains an integer number of rows. The first row of a granule is marked with the value of the primary key for the row. For each data part, ClickHouse creates an index file that stores the marks. For each column, whether it’s in the primary key or not, ClickHouse also stores the same marks. These marks let you find data directly in column files.

The granule size is restricted by the `index_granularity` and `index_granularity_bytes` settings of the table engine. The number of rows in a granule lays in the `[1, index_granularity]` range, depending on the size of the rows. The size of a granule can exceed `index_granularity_bytes` if the size of a single row is greater than the value of the setting. In this case, the size of the granule equals the size of the row.

## Primary Keys and Indexes in Queries[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#primary-keys-and-indexes-in-queries)

Take the `(CounterID, Date)` primary key as an example. In this case, the sorting and index can be illustrated as follows:

```
  Whole data:     [---------------------------------------------]
  CounterID:      [aaaaaaaaaaaaaaaaaabbbbcdeeeeeeeeeeeeefgggggggghhhhhhhhhiiiiiiiiikllllllll]
  Date:           [1111111222222233331233211111222222333211111112122222223111112223311122333]
  Marks:           |      |      |      |      |      |      |      |      |      |      |
                  a,1    a,2    a,3    b,3    e,2    e,3    g,1    h,2    i,1    i,3    l,3
  Marks numbers:   0      1      2      3      4      5      6      7      8      9      10
```

If the data query specifies:

- `CounterID in ('a', 'h')`, the server reads the data in the ranges of marks `[0, 3)` and `[6, 8)`.
- `CounterID IN ('a', 'h') AND Date = 3`, the server reads the data in the ranges of marks `[1, 3)` and `[7, 8)`.
- `Date = 3`, the server reads the data in the range of marks `[1, 10]`.

The examples above show that it is always more effective to use an index than a full scan.

A sparse index allows extra data to be read. When reading a single range of the primary key, up to `index_granularity * 2` extra rows in each data block can be read.

Sparse indexes allow you to work with a very large number of table rows, because in most cases, such indexes fit in the computer’s RAM.

ClickHouse does not require a unique primary key. You can insert multiple rows with the same primary key.

You can use `Nullable`-typed expressions in the `PRIMARY KEY` and `ORDER BY` clauses. To allow this feature, turn on the [allow_nullable_key](https://clickhouse.tech/docs/en/operations/settings/settings/#allow-nullable-key) setting.

The [NULLS_LAST](https://clickhouse.tech/docs/en/sql-reference/statements/select/order-by/#sorting-of-special-values) principle applies for `NULL` values in the `ORDER BY` clause.

### Selecting the Primary Key[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#selecting-the-primary-key)

The number of columns in the primary key is not explicitly limited. Depending on the data structure, you can include more or fewer columns in the primary key. This may:

- Improve the performance of an index.

  If the primary key is `(a, b)`, then adding another column `c` will improve the performance if the following conditions are met:

  - There are queries with a condition on column `c`.
  - Long data ranges (several times longer than the `index_granularity`) with identical values for `(a, b)` are common. In other words, when adding another column allows you to skip quite long data ranges.

- Improve data compression.

  ClickHouse sorts data by primary key, so the higher the consistency, the better the compression.

- Provide additional logic when merging data parts in the [CollapsingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/collapsingmergetree/#table_engine-collapsingmergetree) and [SummingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/) engines.

  In this case it makes sense to specify the *sorting key* that is different from the primary key.

A long primary key will negatively affect the insert performance and memory consumption, but extra columns in the primary key do not affect ClickHouse performance during `SELECT` queries.

You can create a table without a primary key using the `ORDER BY tuple()` syntax. In this case, ClickHouse stores data in the order of inserting. If you want to save data order when inserting data by `INSERT ... SELECT` queries, set [max_insert_threads = 1](https://clickhouse.tech/docs/en/operations/settings/settings/#settings-max-insert-threads).

To select data in the initial order, use [single-threaded](https://clickhouse.tech/docs/en/operations/settings/settings/#settings-max_threads) `SELECT` queries.

### Choosing a Primary Key that Differs from the Sorting Key[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#choosing-a-primary-key-that-differs-from-the-sorting-key)

It is possible to specify a primary key (an expression with values that are written in the index file for each mark) that is different from the sorting key (an expression for sorting the rows in data parts). In this case the primary key expression tuple must be a prefix of the sorting key expression tuple.

This feature is helpful when using the [SummingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/summingmergetree/) and
[AggregatingMergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/aggregatingmergetree/) table engines. In a common case when using these engines, the table has two types of columns: *dimensions* and *measures*. Typical queries aggregate values of measure columns with arbitrary `GROUP BY` and filtering by dimensions. Because SummingMergeTree and AggregatingMergeTree aggregate rows with the same value of the sorting key, it is natural to add all dimensions to it. As a result, the key expression consists of a long list of columns and this list must be frequently updated with newly added dimensions.

In this case it makes sense to leave only a few columns in the primary key that will provide efficient range scans and add the remaining dimension columns to the sorting key tuple.

[ALTER](https://clickhouse.tech/docs/en/sql-reference/statements/alter/) of the sorting key is a lightweight operation because when a new column is simultaneously added to the table and to the sorting key, existing data parts don’t need to be changed. Since the old sorting key is a prefix of the new sorting key and there is no data in the newly added column, the data is sorted by both the old and new sorting keys at the moment of table modification.

### Use of Indexes and Partitions in Queries[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#use-of-indexes-and-partitions-in-queries)

For `SELECT` queries, ClickHouse analyzes whether an index can be used. An index can be used if the `WHERE/PREWHERE` clause has an expression (as one of the conjunction elements, or entirely) that represents an equality or inequality comparison operation, or if it has `IN` or `LIKE` with a fixed prefix on columns or expressions that are in the primary key or partitioning key, or on certain partially repetitive functions of these columns, or logical relationships of these expressions.

Thus, it is possible to quickly run queries on one or many ranges of the primary key. In this example, queries will be fast when run for a specific tracking tag, for a specific tag and date range, for a specific tag and date, for multiple tags with a date range, and so on.

Let’s look at the engine configured as follows:

```
  ENGINE MergeTree() PARTITION BY toYYYYMM(EventDate) ORDER BY (CounterID, EventDate) SETTINGS index_granularity=8192
```

In this case, in queries:

```
SELECT count() FROM table WHERE EventDate = toDate(now()) AND CounterID = 34
SELECT count() FROM table WHERE EventDate = toDate(now()) AND (CounterID = 34 OR CounterID = 42)
SELECT count() FROM table WHERE ((EventDate >= toDate('2014-01-01') AND EventDate <= toDate('2014-01-31')) OR EventDate = toDate('2014-05-01')) AND CounterID IN (101500, 731962, 160656) AND (CounterID = 101500 OR EventDate != toDate('2014-05-01'))
```

ClickHouse will use the primary key index to trim improper data and the monthly partitioning key to trim partitions that are in improper date ranges.

The queries above show that the index is used even for complex expressions. Reading from the table is organized so that using the index can’t be slower than a full scan.

In the example below, the index can’t be used.

```
SELECT count() FROM table WHERE CounterID = 34 OR URL LIKE '%upyachka%'
```

To check whether ClickHouse can use the index when running a query, use the settings [force_index_by_date](https://clickhouse.tech/docs/en/operations/settings/settings/#settings-force_index_by_date) and [force_primary_key](https://clickhouse.tech/docs/en/operations/settings/settings/).

The key for partitioning by month allows reading only those data blocks which contain dates from the proper range. In this case, the data block may contain data for many dates (up to an entire month). Within a block, data is sorted by primary key, which might not contain the date as the first column. Because of this, using a query with only a date condition that does not specify the primary key prefix will cause more data to be read than for a single date.

### Use of Index for Partially-monotonic Primary Keys[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#use-of-index-for-partially-monotonic-primary-keys)

Consider, for example, the days of the month. They form a [monotonic sequence](https://en.wikipedia.org/wiki/Monotonic_function) for one month, but not monotonic for more extended periods. This is a partially-monotonic sequence. If a user creates the table with partially-monotonic primary key, ClickHouse creates a sparse index as usual. When a user selects data from this kind of table, ClickHouse analyzes the query conditions. If the user wants to get data between two marks of the index and both these marks fall within one month, ClickHouse can use the index in this particular case because it can calculate the distance between the parameters of a query and index marks.

ClickHouse cannot use an index if the values of the primary key in the query parameter range don’t represent a monotonic sequence. In this case, ClickHouse uses the full scan method.

ClickHouse uses this logic not only for days of the month sequences, but for any primary key that represents a partially-monotonic sequence.

### Data Skipping Indexes[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-data_skipping-indexes)

The index declaration is in the columns section of the `CREATE` query.

```
INDEX index_name expr TYPE type(...) GRANULARITY granularity_value
```

For tables from the `*MergeTree` family, data skipping indices can be specified.

These indices aggregate some information about the specified expression on blocks, which consist of `granularity_value` granules (the size of the granule is specified using the `index_granularity` setting in the table engine). Then these aggregates are used in `SELECT` queries for reducing the amount of data to read from the disk by skipping big blocks of data where the `where` query cannot be satisfied.

**Example**

```
CREATE TABLE table_name
(
    u64 UInt64,
    i32 Int32,
    s String,
    ...
    INDEX a (u64 * i32, s) TYPE minmax GRANULARITY 3,
    INDEX b (u64 * length(s)) TYPE set(1000) GRANULARITY 4
) ENGINE = MergeTree()
...
```

Indices from the example can be used by ClickHouse to reduce the amount of data to read from disk in the following queries:

```
SELECT count() FROM table WHERE s < 'z'
SELECT count() FROM table WHERE u64 * i32 == 10 AND u64 * length(s) >= 1234
```

#### Available Types of Indices[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#available-types-of-indices)

- `minmax`

  Stores extremes of the specified expression (if the expression is `tuple`, then it stores extremes for each element of `tuple`), uses stored info for skipping blocks of data like the primary key.

- `set(max_rows)`

  Stores unique values of the specified expression (no more than `max_rows` rows, `max_rows=0` means “no limits”). Uses the values to check if the `WHERE` expression is not satisfiable on a block of data.

- `ngrambf_v1(n, size_of_bloom_filter_in_bytes, number_of_hash_functions, random_seed)`

  Stores a [Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter) that contains all ngrams from a block of data. Works only with strings. Can be used for optimization of `equals`, `like` and `in` expressions.

  - `n` — ngram size,
  - `size_of_bloom_filter_in_bytes` — Bloom filter size in bytes (you can use large values here, for example, 256 or 512, because it can be compressed well).
  - `number_of_hash_functions` — The number of hash functions used in the Bloom filter.
  - `random_seed` — The seed for Bloom filter hash functions.

- `tokenbf_v1(size_of_bloom_filter_in_bytes, number_of_hash_functions, random_seed)`

  The same as `ngrambf_v1`, but stores tokens instead of ngrams. Tokens are sequences separated by non-alphanumeric characters.

- `bloom_filter([false_positive])` — Stores a [Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter) for the specified columns.

  The optional `false_positive` parameter is the probability of receiving a false positive response from the filter. Possible values: (0, 1). Default value: 0.025.

  Supported data types: `Int*`, `UInt*`, `Float*`, `Enum`, `Date`, `DateTime`, `String`, `FixedString`, `Array`, `LowCardinality`, `Nullable`.

  The following functions can use it: [equals](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/), [notEquals](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/), [in](https://clickhouse.tech/docs/en/sql-reference/functions/in-functions/), [notIn](https://clickhouse.tech/docs/en/sql-reference/functions/in-functions/), [has](https://clickhouse.tech/docs/en/sql-reference/functions/array-functions/).

```
INDEX sample_index (u64 * length(s)) TYPE minmax GRANULARITY 4
INDEX sample_index2 (u64 * length(str), i32 + f64 * 100, date, str) TYPE set(100) GRANULARITY 4
INDEX sample_index3 (lower(str), str) TYPE ngrambf_v1(3, 256, 2, 0) GRANULARITY 4
```

#### Functions Support[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#functions-support)

Conditions in the `WHERE` clause contains calls of the functions that operate with columns. If the column is a part of an index, ClickHouse tries to use this index when performing the functions. ClickHouse supports different subsets of functions for using indexes.

The `set` index can be used with all functions. Function subsets for other indexes are shown in the table below.

| Function (operator) / Index                                  | primary key | minmax | ngrambf_v1 | tokenbf_v1 | bloom_filter |
| ------------------------------------------------------------ | ----------- | ------ | ---------- | ---------- | ------------ |
| [equals (=, ==)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-equals) | ✔           | ✔      | ✔          | ✔          | ✔            |
| [notEquals(!=, \<>)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-notequals) | ✔           | ✔      | ✔          | ✔          | ✔            |
| [like](https://clickhouse.tech/docs/en/sql-reference/functions/string-search-functions/#function-like) | ✔           | ✔      | ✔          | ✔          | ✗            |
| [notLike](https://clickhouse.tech/docs/en/sql-reference/functions/string-search-functions/#function-notlike) | ✔           | ✔      | ✔          | ✔          | ✗            |
| [startsWith](https://clickhouse.tech/docs/en/sql-reference/functions/string-functions/#startswith) | ✔           | ✔      | ✔          | ✔          | ✗            |
| [endsWith](https://clickhouse.tech/docs/en/sql-reference/functions/string-functions/#endswith) | ✗           | ✗      | ✔          | ✔          | ✗            |
| [multiSearchAny](https://clickhouse.tech/docs/en/sql-reference/functions/string-search-functions/#function-multisearchany) | ✗           | ✗      | ✔          | ✗          | ✗            |
| [in](https://clickhouse.tech/docs/en/sql-reference/functions/in-functions/#in-functions) | ✔           | ✔      | ✔          | ✔          | ✔            |
| [notIn](https://clickhouse.tech/docs/en/sql-reference/functions/in-functions/#in-functions) | ✔           | ✔      | ✔          | ✔          | ✔            |
| [less (\<)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-less) | ✔           | ✔      | ✗          | ✗          | ✗            |
| [greater (>)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-greater) | ✔           | ✔      | ✗          | ✗          | ✗            |
| [lessOrEquals (\<=)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-lessorequals) | ✔           | ✔      | ✗          | ✗          | ✗            |
| [greaterOrEquals (>=)](https://clickhouse.tech/docs/en/sql-reference/functions/comparison-functions/#function-greaterorequals) | ✔           | ✔      | ✗          | ✗          | ✗            |
| [empty](https://clickhouse.tech/docs/en/sql-reference/functions/array-functions/#function-empty) | ✔           | ✔      | ✗          | ✗          | ✗            |
| [notEmpty](https://clickhouse.tech/docs/en/sql-reference/functions/array-functions/#function-notempty) | ✔           | ✔      | ✗          | ✗          | ✗            |
| hasToken                                                     | ✗           | ✗      | ✗          | ✔          | ✗            |

Functions with a constant argument that is less than ngram size can’t be used by `ngrambf_v1` for query optimization.

Note

Bloom filters can have false positive matches, so the `ngrambf_v1`, `tokenbf_v1`, and `bloom_filter` indexes can’t be used for optimizing queries where the result of a function is expected to be false, for example:

- Can be optimized:
  - `s LIKE '%test%'`
  - `NOT s NOT LIKE '%test%'`
  - `s = 1`
  - `NOT s != 1`
  - `startsWith(s, 'test')`
- Can’t be optimized:
  - `NOT s LIKE '%test%'`
  - `s NOT LIKE '%test%'`
  - `NOT s = 1`
  - `s != 1`
  - `NOT startsWith(s, 'test')`

## Concurrent Data Access[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#concurrent-data-access)

For concurrent table access, we use multi-versioning. In other words, when a table is simultaneously read and updated, data is read from a set of parts that is current at the time of the query. There are no lengthy locks. Inserts do not get in the way of read operations.

Reading from a table is automatically parallelized.

## TTL for Columns and Tables[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-ttl)

Determines the lifetime of values.

The `TTL` clause can be set for the whole table and for each individual column. Table-level TTL can also specify logic of automatic move of data between disks and volumes.

Expressions must evaluate to [Date](https://clickhouse.tech/docs/en/sql-reference/data-types/date/) or [DateTime](https://clickhouse.tech/docs/en/sql-reference/data-types/datetime/) data type.

Example:

```
TTL time_column
TTL time_column + interval
```

To define `interval`, use [time interval](https://clickhouse.tech/docs/en/sql-reference/operators/#operators-datetime) operators.

```
TTL date_time + INTERVAL 1 MONTH
TTL date_time + INTERVAL 15 HOUR
```

### Column TTL[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-column-ttl)

When the values in the column expire, ClickHouse replaces them with the default values for the column data type. If all the column values in the data part expire, ClickHouse deletes this column from the data part in a filesystem.

The `TTL` clause can’t be used for key columns.

Examples:

Creating a table with TTL

```
CREATE TABLE example_table
(
    d DateTime,
    a Int TTL d + INTERVAL 1 MONTH,
    b Int TTL d + INTERVAL 1 MONTH,
    c String
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(d)
ORDER BY d;
```

Adding TTL to a column of an existing table

```
ALTER TABLE example_table
    MODIFY COLUMN
    c String TTL d + INTERVAL 1 DAY;
```

Altering TTL of the column

```
ALTER TABLE example_table
    MODIFY COLUMN
    c String TTL d + INTERVAL 1 MONTH;
```

### Table TTL[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#mergetree-table-ttl)

Table can have an expression for removal of expired rows, and multiple expressions for automatic move of parts between [disks or volumes](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-multiple-volumes). When rows in the table expire, ClickHouse deletes all corresponding rows. For parts moving feature, all rows of a part must satisfy the movement expression criteria.

```
TTL expr [DELETE|TO DISK 'aaa'|TO VOLUME 'bbb'], ...
```

Type of TTL rule may follow each TTL expression. It affects an action which is to be done once the expression is satisfied (reaches current time):

- `DELETE` - delete expired rows (default action);
- `TO DISK 'aaa'` - move part to the disk `aaa`;
- `TO VOLUME 'bbb'` - move part to the disk `bbb`.

Examples:

Creating a table with TTL

```
CREATE TABLE example_table
(
    d DateTime,
    a Int
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(d)
ORDER BY d
TTL d + INTERVAL 1 MONTH [DELETE],
    d + INTERVAL 1 WEEK TO VOLUME 'aaa',
    d + INTERVAL 2 WEEK TO DISK 'bbb';
```

Altering TTL of the table

```
ALTER TABLE example_table
    MODIFY TTL d + INTERVAL 1 DAY;
```

**Removing Data**

Data with an expired TTL is removed when ClickHouse merges data parts.

When ClickHouse see that data is expired, it performs an off-schedule merge. To control the frequency of such merges, you can set `merge_with_ttl_timeout`. If the value is too low, it will perform many off-schedule merges that may consume a lot of resources.

If you perform the `SELECT` query between merges, you may get expired data. To avoid it, use the [OPTIMIZE](https://clickhouse.tech/docs/en/sql-reference/statements/optimize/) query before `SELECT`.

## Using Multiple Block Devices for Data Storage[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-multiple-volumes)

### Introduction[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#introduction)

`MergeTree` family table engines can store data on multiple block devices. For example, it can be useful when the data of a certain table are implicitly split into “hot” and “cold”. The most recent data is regularly requested but requires only a small amount of space. On the contrary, the fat-tailed historical data is requested rarely. If several disks are available, the “hot” data may be located on fast disks (for example, NVMe SSDs or in memory), while the “cold” data - on relatively slow ones (for example, HDD).

Data part is the minimum movable unit for `MergeTree`-engine tables. The data belonging to one part are stored on one disk. Data parts can be moved between disks in the background (according to user settings) as well as by means of the [ALTER](https://clickhouse.tech/docs/en/sql-reference/statements/alter/partition/#alter_move-partition) queries.

### Terms[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#terms)

- Disk — Block device mounted to the filesystem.
- Default disk — Disk that stores the path specified in the [path](https://clickhouse.tech/docs/en/operations/server-configuration-parameters/settings/#server_configuration_parameters-path) server setting.
- Volume — Ordered set of equal disks (similar to [JBOD](https://en.wikipedia.org/wiki/Non-RAID_drive_architectures)).
- Storage policy — Set of volumes and the rules for moving data between them.

The names given to the described entities can be found in the system tables, [system.storage_policies](https://clickhouse.tech/docs/en/operations/system-tables/storage_policies/#system_tables-storage_policies) and [system.disks](https://clickhouse.tech/docs/en/operations/system-tables/disks/#system_tables-disks). To apply one of the configured storage policies for a table, use the `storage_policy` setting of `MergeTree`-engine family tables.

### Configuration[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engine-mergetree-multiple-volumes_configure)

Disks, volumes and storage policies should be declared inside the `<storage_configuration>` tag either in the main file `config.xml` or in a distinct file in the `config.d` directory.

Configuration structure:

```
<storage_configuration>
    <disks>
        <disk_name_1> <!-- disk name -->
            <path>/mnt/fast_ssd/clickhouse/</path>
        </disk_name_1>
        <disk_name_2>
            <path>/mnt/hdd1/clickhouse/</path>
            <keep_free_space_bytes>10485760</keep_free_space_bytes>
        </disk_name_2>
        <disk_name_3>
            <path>/mnt/hdd2/clickhouse/</path>
            <keep_free_space_bytes>10485760</keep_free_space_bytes>
        </disk_name_3>

        ...
    </disks>

    ...
</storage_configuration>
```

Tags:

- `<disk_name_N>` — Disk name. Names must be different for all disks.
- `path` — path under which a server will store data (`data` and `shadow` folders), should be terminated with ‘/’.
- `keep_free_space_bytes` — the amount of free disk space to be reserved.

The order of the disk definition is not important.

Storage policies configuration markup:

```
<storage_configuration>
    ...
    <policies>
        <policy_name_1>
            <volumes>
                <volume_name_1>
                    <disk>disk_name_from_disks_configuration</disk>
                    <max_data_part_size_bytes>1073741824</max_data_part_size_bytes>
                </volume_name_1>
                <volume_name_2>
                    <!-- configuration -->
                </volume_name_2>
                <!-- more volumes -->
            </volumes>
            <move_factor>0.2</move_factor>
        </policy_name_1>
        <policy_name_2>
            <!-- configuration -->
        </policy_name_2>

        <!-- more policies -->
    </policies>
    ...
</storage_configuration>
```

Tags:

- `policy_name_N` — Policy name. Policy names must be unique.
- `volume_name_N` — Volume name. Volume names must be unique.
- `disk` — a disk within a volume.
- `max_data_part_size_bytes` — the maximum size of a part that can be stored on any of the volume’s disks.
- `move_factor` — when the amount of available space gets lower than this factor, data automatically start to move on the next volume if any (by default, 0.1).
- `prefer_not_to_merge` — Disables merging of data parts on this volume. When this setting is enabled, merging data on this volume is not allowed. This allows controlling how ClickHouse works with slow disks.

Cofiguration examples:

```
<storage_configuration>
    ...
    <policies>
        <hdd_in_order> <!-- policy name -->
            <volumes>
                <single> <!-- volume name -->
                    <disk>disk1</disk>
                    <disk>disk2</disk>
                </single>
            </volumes>
        </hdd_in_order>

        <moving_from_ssd_to_hdd>
            <volumes>
                <hot>
                    <disk>fast_ssd</disk>
                    <max_data_part_size_bytes>1073741824</max_data_part_size_bytes>
                </hot>
                <cold>
                    <disk>disk1</disk>
                </cold>
            </volumes>
            <move_factor>0.2</move_factor>
        </moving_from_ssd_to_hdd>

        <small_jbod_with_external_no_merges>
            <volumes>
                <main>
                    <disk>jbod1</disk>
                </main>
                <external>
                    <disk>external</disk>
                    <prefer_not_to_merge>true</prefer_not_to_merge>
                </external>
            </volumes>
        </small_jbod_with_external_no_merges>
    </policies>
    ...
</storage_configuration>
```

In given example, the `hdd_in_order` policy implements the [round-robin](https://en.wikipedia.org/wiki/Round-robin_scheduling) approach. Thus this policy defines only one volume (`single`), the data parts are stored on all its disks in circular order. Such policy can be quite useful if there are several similar disks are mounted to the system, but RAID is not configured. Keep in mind that each individual disk drive is not reliable and you might want to compensate it with replication factor of 3 or more.

If there are different kinds of disks available in the system, `moving_from_ssd_to_hdd` policy can be used instead. The volume `hot` consists of an SSD disk (`fast_ssd`), and the maximum size of a part that can be stored on this volume is 1GB. All the parts with the size larger than 1GB will be stored directly on the `cold` volume, which contains an HDD disk `disk1`.
Also, once the disk `fast_ssd` gets filled by more than 80%, data will be transferred to the `disk1` by a background process.

The order of volume enumeration within a storage policy is important. Once a volume is overfilled, data are moved to the next one. The order of disk enumeration is important as well because data are stored on them in turns.

When creating a table, one can apply one of the configured storage policies to it:

```
CREATE TABLE table_with_non_default_policy (
    EventDate Date,
    OrderID UInt64,
    BannerID UInt64,
    SearchPhrase String
) ENGINE = MergeTree
ORDER BY (OrderID, BannerID)
PARTITION BY toYYYYMM(EventDate)
SETTINGS storage_policy = 'moving_from_ssd_to_hdd'
```

The `default` storage policy implies using only one volume, which consists of only one disk given in `<path>`. Once a table is created, its storage policy cannot be changed.

The number of threads performing background moves of data parts can be changed by [background_move_pool_size](https://clickhouse.tech/docs/en/operations/settings/settings/#background_move_pool_size) setting.

### Details[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#details)

In the case of `MergeTree` tables, data is getting to disk in different ways:

- As a result of an insert (`INSERT` query).
- During background merges and [mutations](https://clickhouse.tech/docs/en/sql-reference/statements/alter/#alter-mutations).
- When downloading from another replica.
- As a result of partition freezing [ALTER TABLE … FREEZE PARTITION](https://clickhouse.tech/docs/en/sql-reference/statements/alter/partition/#alter_freeze-partition).

In all these cases except for mutations and partition freezing, a part is stored on a volume and a disk according to the given storage policy:

1. The first volume (in the order of definition) that has enough disk space for storing a part (`unreserved_space > current_part_size`) and allows for storing parts of a given size (`max_data_part_size_bytes > current_part_size`) is chosen.
2. Within this volume, that disk is chosen that follows the one, which was used for storing the previous chunk of data, and that has free space more than the part size (`unreserved_space - keep_free_space_bytes > current_part_size`).

Under the hood, mutations and partition freezing make use of [hard links](https://en.wikipedia.org/wiki/Hard_link). Hard links between different disks are not supported, therefore in such cases the resulting parts are stored on the same disks as the initial ones.

In the background, parts are moved between volumes on the basis of the amount of free space (`move_factor` parameter) according to the order the volumes are declared in the configuration file.
Data is never transferred from the last one and into the first one. One may use system tables [system.part_log](https://clickhouse.tech/docs/en/operations/system-tables/part_log/#system_tables-part-log) (field `type = MOVE_PART`) and [system.parts](https://clickhouse.tech/docs/en/operations/system-tables/parts/#system_tables-parts) (fields `path` and `disk`) to monitor background moves. Also, the detailed information can be found in server logs.

User can force moving a part or a partition from one volume to another using the query [ALTER TABLE … MOVE PART|PARTITION … TO VOLUME|DISK …](https://clickhouse.tech/docs/en/sql-reference/statements/alter/partition/#alter_move-partition), all the restrictions for background operations are taken into account. The query initiates a move on its own and does not wait for background operations to be completed. User will get an error message if not enough free space is available or if any of the required conditions are not met.

Moving data does not interfere with data replication. Therefore, different storage policies can be specified for the same table on different replicas.

After the completion of background merges and mutations, old parts are removed only after a certain amount of time (`old_parts_lifetime`).
During this time, they are not moved to other volumes or disks. Therefore, until the parts are finally removed, they are still taken into account for evaluation of the occupied disk space.

[Original article](https://clickhouse.tech/docs/ru/operations/table_engines/mergetree/)