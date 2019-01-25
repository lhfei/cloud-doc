# Connections

```sh
airflow connections -[options]
```



Options:

```ini
  -h, --help            show this help message and exit
  -l, --list            List all connections
  -a, --add             Add a connection
  -d, --delete          Delete a connection
  --conn_id CONN_ID     Connection id, required to add/delete a connection
  --conn_uri CONN_URI   Connection URI, required to add a connection without
                        conn_type
  --conn_extra CONN_EXTRA
                        Connection `Extra` field, optional when adding a
                        connection
  --conn_type CONN_TYPE
                        Connection type, required to add a connection without
                        conn_uri
  --conn_host CONN_HOST
                        Connection host, optional when adding a connection
  --conn_login CONN_LOGIN
                        Connection login, optional when adding a connection
  --conn_password CONN_PASSWORD
                        Connection password, optional when adding a connection
  --conn_schema CONN_SCHEMA
                        Connection schema, optional when adding a connection
  --conn_port CONN_PORT
                        Connection port, optional when adding a connection
```



### Hive



```sh
airflow connections -a --conn_id {conn_id} --conn_type hive_cli --conn_host {host}

[2019-01-10 14:16:00,424] {settings.py:174} INFO - setting.configure_orm(): Using pool settings. pool_size=100, pool_recycle=1800
[2019-01-10 14:16:00,690] {__init__.py:51} INFO - Using executor SequentialExecutor

        Successfully added `conn_id`=hive_cli_test : hive_cli://:@host-10-182-61-102:10000/benchmark:

```

