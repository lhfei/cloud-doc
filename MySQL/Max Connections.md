

```sh
mysql> show variables like "max_connections";
+-----------------+-------+
| Variable_name   | Value |
+-----------------+-------+
| max_connections | 151   |
+-----------------+-------+
```



```sh
mysql> set global max_connections = 1000000;
Query OK, 0 rows affected, 1 warning (0.00 sec)
```

