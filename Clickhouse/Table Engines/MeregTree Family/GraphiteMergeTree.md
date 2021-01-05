```xml
GraphiteMergeTree 
This engine is designed for thinning and aggregating/averaging (rollup) Graphite data. It may be helpful to developers who want to use ClickHouse as a data store for Graphite.

You can use any ClickHouse table engine to store the Graphite data if you don’t need rollup, but if you need a rollup use GraphiteMergeTree. The engine reduces the volume of storage and increases the efficiency of queries from Graphite.

The engine inherits properties from MergeTree.

Creating a Table 
CREATE TABLE [IF NOT EXISTS] [db.]table_name [ON CLUSTER cluster]
(
    Path String,
    Time DateTime,
    Value <Numeric_type>,
    Version <Numeric_type>
    ...
) ENGINE = GraphiteMergeTree(config_section)
[PARTITION BY expr]
[ORDER BY expr]
[SAMPLE BY expr]
[SETTINGS name=value, ...]
See a detailed description of the CREATE TABLE query.

A table for the Graphite data should have the following columns for the following data:

Metric name (Graphite sensor). Data type: String.

Time of measuring the metric. Data type: DateTime.

Value of the metric. Data type: any numeric.

Version of the metric. Data type: any numeric.

ClickHouse saves the rows with the highest version or the last written if versions are the same. Other rows are deleted during the merge of data parts.

The names of these columns should be set in the rollup configuration.

GraphiteMergeTree parameters

config_section — Name of the section in the configuration file, where are the rules of rollup set.
Query clauses

When creating a GraphiteMergeTree table, the same clauses are required, as when creating a MergeTree table.

Deprecated Method for Creating a Table
Rollup Configuration 
The settings for rollup are defined by the graphite_rollup parameter in the server configuration. The name of the parameter could be any. You can create several configurations and use them for different tables.

Rollup configuration structure:

  required-columns
  patterns
Required Columns 
path_column_name — The name of the column storing the metric name (Graphite sensor). Default value: Path.
time_column_name — The name of the column storing the time of measuring the metric. Default value: Time.
value_column_name — The name of the column storing the value of the metric at the time set in time_column_name. Default value: Value.
version_column_name — The name of the column storing the version of the metric. Default value: Timestamp.
Patterns 
Structure of the patterns section:

pattern
    regexp
    function
pattern
    regexp
    age + precision
    ...
pattern
    regexp
    function
    age + precision
    ...
pattern
    ...
default
    function
    age + precision
    ...
Attention

Patterns must be strictly ordered:

Patterns without function or retention.
Patterns with both function and retention.
Pattern default.
When processing a row, ClickHouse checks the rules in the pattern sections. Each of pattern (including default) sections can contain function parameter for aggregation, retention parameters or both. If the metric name matches the regexp, the rules from the pattern section (or sections) are applied; otherwise, the rules from the default section are used.

Fields for pattern and default sections:

regexp– A pattern for the metric name.
age – The minimum age of the data in seconds.
precision– How precisely to define the age of the data in seconds. Should be a divisor for 86400 (seconds in a day).
function – The name of the aggregating function to apply to data whose age falls within the range [age, age + precision].
Configuration Example 
<graphite_rollup>
    <version_column_name>Version</version_column_name>
    <pattern>
        <regexp>click_cost</regexp>
        <function>any</function>
        <retention>
            <age>0</age>
            <precision>5</precision>
        </retention>
        <retention>
            <age>86400</age>
            <precision>60</precision>
        </retention>
    </pattern>
    <default>
        <function>max</function>
        <retention>
            <age>0</age>
            <precision>60</precision>
        </retention>
        <retention>
            <age>3600</age>
            <precision>300</precision>
        </retention>
        <retention>
            <age>86400</age>
            <precision>3600</precision>
        </retention>
    </default>
</graphite_rollup>
Original articlexxxxxxxxxx <graphite_rollup>    <pattern>        <regexp>click_cost</regexp>        <function>any</function>        <retention>            <age>0</age>            <precision>5</precision>        </retention>        <retention>            <age>86400</age>            <precision>60</precision>        </retention>    </pattern>    <default>        <function>max</function>        <retention>            <age>0</age>            <precision>60</precision>        </retention>        <retention>            <age>3600</age>            <precision>300</precision>        </retention>        <retention>            <age>86400</age>            <precision>3600</precision>        </retention>    </default></graphite_rollup>xml
```