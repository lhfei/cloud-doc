

```sql
CREATE USER 'root'@'localhost' IDENTIFIED BY 'Lhfei@GT4$Root#01';


CREATE USER 'root'@'%' IDENTIFIED BY 'Lhfei@GT4$Root#01';

GRANT ALL ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;
```



```sql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password by 'Lhfei@GPT$Root#01';

GRANT ALL ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;
```





```sql
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Lhfei@GPT$Root#01';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@GPT$Root#01' WITH GRANT OPTION;
FLUSH PRIVILEGES;

```

