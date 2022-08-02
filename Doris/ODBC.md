



```mysql
CREATE DATABASE dlink_doris
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'doris_admin'@'localhost' IDENTIFIED BY 'Dorisuser_1473';

GRANT ALL ON dlink_doris.* TO 'doris_admin'@'%' IDENTIFIED BY 'Dorisuser_1473';

FLUSH PRIVILEGES;
```





/etc/odbcinst.ini

```ini
[Doris_MySQL8]
Driver=/usr/lib64/libmyodbc8w.so
UsageCount=1
```





/etc/odbc.ini

```ini
[doris_mysql8]
Description     = Data source MySQL for Doris
Driver          = Doris_MySQL8
Server          = dlink-hadoop-18
Host            = dlink-hadoop-18
Database        = dlink_doris
Port            = 3306
User            = doris_admin
Password        = Dorisuser_1473
CHARSET         = UTF8
```

