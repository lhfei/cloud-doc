# ReplacingMergeTree[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/replacingmergetree/#replacingmergetree)

The engine differs from [MergeTree](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/#table_engines-mergetree) in that it removes duplicate entries with the same [sorting key](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/) value (`ORDER BY` table section, not `PRIMARY KEY`).

Data deduplication occurs only during a merge. Merging occurs in the background at an unknown time, so you can’t plan for it. Some of the data may remain unprocessed. Although you can run an unscheduled merge using the `OPTIMIZE` query, don’t count on using it, because the `OPTIMIZE` query will read and write a large amount of data.

Thus, `ReplacingMergeTree` is suitable for clearing out duplicate data in the background in order to save space, but it doesn’t guarantee the absence of duplicates.

## Creating a Table[ ](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/replacingmergetree/#creating-a-table)

```
CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
(
    name1 [type1] [DEFAULT|MATERIALIZED|ALIAS expr1],
    name2 [type2] [DEFAULT|MATERIALIZED|ALIAS expr2],
    ...
) ENGINE = ReplacingMergeTree([ver])
[PARTITION BY expr]
[ORDER BY expr]
[PRIMARY KEY expr]
[SAMPLE BY expr]
[SETTINGS name=value, ...]
```

For a description of request parameters, see [statement description](https://clickhouse.tech/docs/en/sql-reference/statements/create/table/).

Attention

Uniqueness of rows is determined by the `ORDER BY` table section, not `PRIMARY KEY`.

**ReplacingMergeTree Parameters**

- `ver` — column with version. Type `UInt*`, `Date` or `DateTime`. Optional parameter.

  When merging, `ReplacingMergeTree` from all the rows with the same sorting key leaves only one:

  - The last in the selection, if `ver` not set. A selection is a set of rows in a set of parts participating in the merge. The most recently created part (the last insert) will be the last one in the selection. Thus, after deduplication, the very last row from the most recent insert will remain for each unique sorting key.
  - With the maximum version, if `ver` specified.

**Query clauses**

When creating a `ReplacingMergeTree` table the same [clauses](https://clickhouse.tech/docs/en/engines/table-engines/mergetree-family/mergetree/) are required, as when creating a `MergeTree` table.

<details open="" style="box-sizing: border-box; background: rgb(68, 68, 81); color: rgb(238, 238, 238); padding: 1rem; margin-bottom: 1rem; margin-top: 1rem; font-family: -apple-system, BlinkMacSystemFont, &quot;segoe ui&quot;, &quot;noto sans&quot;, &quot;helvetica neue&quot;, Arial, sans-serif, &quot;apple color emoji&quot;, &quot;segoe ui emoji&quot;, &quot;segoe ui symbol&quot;, &quot;noto color emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; font-weight: 700; color: rgb(238, 238, 238);">Deprecated Method for Creating a Table</summary><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"></p><div class="admonition attention alert pb-0 mb-4 alert-warning" role="alert" style="box-sizing: border-box; position: relative; padding-top: 0.75rem; padding-right: 1.25rem; padding-bottom: 0px !important; padding-left: 1.25rem; margin-bottom: 1.5rem !important; border: 1px solid rgb(255, 238, 186); border-radius: 0.25rem; color: rgb(133, 100, 4); background-color: rgb(255, 243, 205);"><p class="admonition-title alert-heading display-6 mb-2" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem !important; color: inherit; font-size: 1.75rem; font-weight: 300; line-height: 1.2;">Attention</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;">Do not use this method in new projects and, if possible, switch the old projects to the method described above.</p></div><div class="codehilite" style="box-sizing: border-box;"><pre style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; margin-top: 0px; margin-bottom: 1rem; overflow: auto; display: block; color: rgb(33, 37, 41); background: rgb(239, 239, 239); padding: 1rem; line-height: 1.25;"><img src="https://clickhouse.tech/images/mkdocs/copy.svg" alt="Copy" title="Copy" class="code-copy btn float-right m-0 p-0" style="box-sizing: border-box; vertical-align: middle; border: 1px solid transparent; display: inline-block; font-weight: 400; color: rgb(33, 37, 41); text-align: center; cursor: pointer; user-select: none; background-color: transparent; padding: 0px !important; font-size: 1rem; line-height: 1.5; border-radius: 0.25rem; float: right !important; margin: 0px !important;"><span style="box-sizing: border-box;"></span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: inherit; color: rgb(0, 0, 0); overflow-wrap: break-word; word-break: normal; background: rgb(238, 238, 238); padding: 0px;"><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">CREATE</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">TABLE</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">IF</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">NOT</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">EXISTS</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">db</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">.]</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">table_name</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ON</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">CLUSTER</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">cluster</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span>
<span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span>
    <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">name1</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">type1</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">DEFAULT</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MATERIALIZED</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ALIAS</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">expr1</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span>
    <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">name2</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">type2</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">DEFAULT</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">MATERIALIZED</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">|</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">ALIAS</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">expr2</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span>
    <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">...</span>
<span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">)</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">ENGINE</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">=</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">]</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">ReplacingMergeTree</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="nb" style="box-sizing: border-box; color: rgb(47, 30, 46);">date</span><span class="o" style="box-sizing: border-box; color: rgb(136, 0, 0);">-</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">column</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[,</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">sampling_expression</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">],</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">(</span><span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">primary</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="k" style="box-sizing: border-box; color: rgb(0, 0, 0); font-weight: 700;">key</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">),</span> <span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">index_granularity</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">,</span> <span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">[</span><span class="n" style="box-sizing: border-box; color: rgb(47, 30, 46);">ver</span><span class="p" style="box-sizing: border-box; color: rgb(47, 30, 46);">])</span>
</code></pre></div><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;">All of the parameters excepting<span>&nbsp;</span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">ver</code><span>&nbsp;</span>have the same meaning as in<span>&nbsp;</span><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">MergeTree</code>.</p><ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;"><li style="box-sizing: border-box;"><code class="syntax" style="box-sizing: border-box; font-family: SFMono-Regular, Menlo, Monaco, Consolas, &quot;liberation mono&quot;, &quot;courier new&quot;, monospace; font-size: 14px; color: rgb(0, 0, 0); overflow-wrap: break-word; background: rgb(238, 238, 238); padding: 0px;">ver</code><span>&nbsp;</span>- column with the version. Optional parameter. For a description, see the text above.</li></ul></details>

[Original article](https://clickhouse.tech/docs/en/operations/table_engines/replacingmergetree/)