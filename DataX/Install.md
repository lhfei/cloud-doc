

### MySQL

|                |      |      |
| -------------- | ---- | ---- |
| 192.168.58.132 | root |      |
|                |      |      |
|                |      |      |



#### 

```sql
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@01';


GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Mlamp@123';
```



#### Create Database

```sql
CREATE DATABASE mjob_manager
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'mjob_admin'@'localhost' IDENTIFIED BY 'Jobuser_1473';
CREATE USER 'mjob_admin'@'%' IDENTIFIED BY 'Jobuser_1473';

-- for MySQL 8 before
GRANT ALL ON mjob_manager.* TO 'mjob_admin'@'%' IDENTIFIED BY 'Jobuser_1473';

-- for MySQL 8 and higer
GRANT ALL ON mjob_manager.* TO "mjob_admin"@"localhost" WITH GRANT OPTION;
GRANT ALL ON mjob_manager.* TO "mjob_admin"@"%"  WITH GRANT OPTION;

FLUSH PRIVILEGES;
```

