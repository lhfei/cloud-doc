

### MySQL

|                |      |      |
| -------------- | ---- | ---- |
| 192.168.58.132 | root |      |
|                |      |      |
|                |      |      |



#### 

```sql
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@01';
```



#### Create Database

```sql
CREATE DATABASE datax_web
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'datax_user'@'localhost' IDENTIFIED BY 'DataX_1473';

GRANT ALL ON datax_web.* TO 'datax_user'@'%' IDENTIFIED BY 'DataX_1473';

FLUSH PRIVILEGES;
```

