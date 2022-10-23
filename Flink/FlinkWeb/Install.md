



```sql
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@01';


GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Mlamp@123';
```



#### Create Database

```sql
CREATE DATABASE flink_web
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'flink_admin'@'localhost' IDENTIFIED BY 'Flinkuser_1473';

GRANT ALL ON flink_web.* TO 'flink_admin'@'%' IDENTIFIED BY 'Flinkuser_1473';

FLUSH PRIVILEGES;
```

