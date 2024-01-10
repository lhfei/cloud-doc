

#### CK

```shell
pip install clickhouse-sqlalchemy
```



> pilot/connections/rdbms/conn_clickhouse.py

```python
db_url: str = (
            cls.driver
            + "+http://"
            + user
            + ":"
            + pwd
            + "@"
            + host
            + ":"
            + str(port)
            + "/"
            + db_name
        )
```







```shell
pip install cryptography
```



#### DuckDB

```shell
pip uninstall duckdb
pip install duckdb==0.9.1
```

