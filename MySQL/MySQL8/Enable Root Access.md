

```sql
CREATE USER 'root'@'localhost' IDENTIFIED BY 'Lhfei@GT4$Root#01';

CREATE USER 'root'@'%' IDENTIFIED BY 'Lhfei@GT4$Root#01';

GRANT ALL ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;
```



```sql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Lhfei@GT4$Root#01';

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Lhfei@GT4$Root#01';

FLUSH PRIVILEGES;
```

