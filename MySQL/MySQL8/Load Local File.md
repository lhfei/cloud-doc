

```shell
mysql> show variables like 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | OFF   |
+---------------+-------+
```



> Enable load local file

append `local_infile=ON` in `mysqld` section.

```ini
[mysqld]
...
local_infile=ON
```



```sql
set global set local_infile=on;
```

