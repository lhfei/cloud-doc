https://clickhouse.com/docs/en/operations/settings/settings/#settings-input_format_allow_errors_num



### input_format_allow_errors_num[ ](https://clickhouse.com/docs/en/operations/settings/settings/#settings-input_format_allow_errors_num)

Sets the maximum number of acceptable errors when reading from text formats (CSV, TSV, etc.).

The default value is 0.

Always pair it with `input_format_allow_errors_ratio`.

If an error occurred while reading rows but the error counter is still less than `input_format_allow_errors_num`, ClickHouse ignores the row and moves on to the next one.

If both `input_format_allow_errors_num` and `input_format_allow_errors_ratio` are exceeded, ClickHouse throws an exception.

### input_format_allow_errors_ratio[ ](https://clickhouse.com/docs/en/operations/settings/settings/#settings-input_format_allow_errors_ratio)

Sets the maximum percentage of errors allowed when reading from text formats (CSV, TSV, etc.).
The percentage of errors is set as a floating-point number between 0 and 1.

The default value is 0.

Always pair it with `input_format_allow_errors_num`.

If an error occurred while reading rows but the error counter is still less than `input_format_allow_errors_ratio`, ClickHouse ignores the row and moves on to the next one.

If both `input_format_allow_errors_num` and `input_format_allow_errors_ratio` are exceeded, ClickHouse throws an exception.



### Example

```shell
cat a.csv | clickhouse-client --host 127.0.0.1 --port 9000 --database default  \ 
--user default  --query="INSERT INTO tb_a FORMAT CSVWithNames "  \ 
--format_csv_delimiter="|" --input_format_allow_errors_num=10000 \ 
--input_format_allow_errors_ratio=0.1 
```

