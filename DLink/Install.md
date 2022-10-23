

### MySQL

|           |      |      |
| --------- | ---- | ---- |
| 10.0.0.25 | root |      |
|           |      |      |
|           |      |      |



#### 

```sql
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@01';


GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Mlamp@123';
```



#### Create Database

```sql
CREATE DATABASE dlink_master
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'dlink_admin'@'localhost' IDENTIFIED BY 'Dlinkuser_1473';

GRANT ALL ON dlink_master.* TO 'dlink_admin'@'%' IDENTIFIED BY 'Dlinkuser_1473';

FLUSH PRIVILEGES;
```

