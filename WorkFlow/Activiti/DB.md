

### Install MySQL



#### Hostname

| Host         | User | Passwd   |
| ------------ | ---- | -------- |
| 10.182.88.74 | root | Lhfei@01 |



#### Start MySQL

```
systemctl start mysqld
```



#### Get temporary password

```
cat /var/log/mysqld.log | grep password
```



#### Update Password

```
>mysqladmin password -u root -p
Enter password: [Lhfei@01]
New password: [Lhfei@01]
Confirm new password: 
Warning: Since password will be sent to server in plain text, use ssl connection to ensure password safety.
```



#### Set Password Policy

```
mysql> SHOW VARIABLES LIKE 'validate_password%';

mysql> SET GLOBAL validate_password_policy=LOW;
```

Or we can set it in `my.cnf` file

```
[mysqld]
validate_password_policy=LOW
```





| Databases    | User           | Passpord   | DDL  |
| :----------- | :------------- | :--------- | ---- |
| activiti_app | activiti_admin | Admin_1473 |      |
|              |                |            |      |
|              |                |            |      |
|              |                |            |      |





# Create database

- [x] activiti-app

```sql
CREATE DATABASE activiti_app
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'activiti_admin'@'localhost' IDENTIFIED BY 'Admin_1473';

GRANT ALL ON activiti_app.* TO 'activiti_admin'@'10.182.99.103' IDENTIFIED BY 'Admin_1473';
GRANT ALL ON activiti_app.* TO 'activiti_admin'@'%' IDENTIFIED BY 'Admin_1473';

FLUSH PRIVILEGES;
```



- [x] activiti-admin

```sql
CREATE DATABASE activiti_admin
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'activiti_admin'@'localhost' IDENTIFIED BY 'Admin_1473';

GRANT ALL ON activiti_admin.* TO 'activiti_admin'@'10.182.99.103' IDENTIFIED BY 'Admin_1473';
GRANT ALL ON activiti_admin.* TO 'activiti_admin'@'%' IDENTIFIED BY 'Admin_1473';

FLUSH PRIVILEGES;
```





```sql
mysql>FLUSH HOSTS;

$mysqladmin flush-hosts -u

```



update max_connect_errors

```sql
show variables like '%max_connect_errors%';

set global max_connections = 100000;
set global max_connect_errors = 1844674407370954751;

```



Establishing SSL connection without server’s identity verification is not recommended

```sql
jdbc.url=jdbc:mysql://***/***?useSSL=false

```



 

