

### Install MySQL



#### Hostname

| Host         | User | Passwd        |
| ------------ | ---- | ------------- |
| 10.182.99.89 | root | Lhfeilaile@01 |



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
Enter password: [Lhfeilaile@01]
New password: [Lhfeilaile@01]
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



### Account

| Databases | User | Passpord | DDL  |
| :-------- | :--- | :------- | ---- |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |
|           |      |          |      |





## Creating Databases for Cloudera Software



Create databases and service accounts for components that require databases:

- Cloudera Manager Server
- Cloudera Management Service roles:
  - Activity Monitor (if using the MapReduce service in a CDH 5 cluster)
  - Reports Manager
- Each Hive metastore
- Sentry Server
- Cloudera Navigator Audit Server
- Cloudera Navigator Metadata Server

The databases must be configured to support the MySQL utf8 character set encoding.

Record the values you enter for database names, usernames, and passwords. The Cloudera Manager installation wizard requires this information to correctly connect to these databases.



1. Log in as the

    

   root

    

   user, or another user with privileges to create database and grant privileges:

   ```
   mysql -u root -p
   ```

   ```
   Enter password:
   ```

2. Create databases for each service you are using from the below table:

   ```
   CREATE DATABASE <database> DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
   ```

   ```
   Query OK, 1 row affected (0.00 sec)
   ```

   ```
   GRANT ALL ON <database>.* TO '<user>'@'%' IDENTIFIED BY '<password>';
   ```

   ```
   Query OK, 0 rows affected (0.00 sec)
   ```

   You can use any value you want for <database>, <user>, and <password>. The following examples are the default names provided in the Cloudera Manager configuration settings, but you are not required to use them:

   | Service                            | Database  | User   |
   | ---------------------------------- | --------- | ------ |
   | Cloudera Manager Server            | scm       | scm    |
   | Activity Monitor                   | amon      | amon   |
   | Reports Manager                    | rman      | rman   |
   | Hue                                | hue       | hue    |
   | Hive Metastore Server              | metastore | hive   |
   | Sentry Server                      | sentry    | sentry |
   | Cloudera Navigator Audit Server    | nav       | nav    |
   | Cloudera Navigator Metadata Server | navms     | navms  |
   | Oozie                              | oozie     | oozie  |

3. Confirm that you have created all of the databases:

   ```
   SHOW DATABASES;
   ```

   You can also confirm the privilege grants for a given user by running:

   ```
   SHOW GRANTS FOR '<user>'@'%';
   ```



## Setting Up the Cloudera Manager Database

After completing the above instructions to install and configure MySQL databases for Cloudera software, continue to [Step 5: Set up the Cloudera Manager Database](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/prepare_cm_database.html) to configure a database for Cloudera Manager.

**Categories:** [Configuring](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_configuring.html) | [Databases](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_databases.html) | [Installing](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_installing.html) | [JDBC](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_jdbc.html) | [MySQL](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_mysql.html) | [Starting and Stopping](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub_starting_and_stopping.html) | [All Categories](https://www.cloudera.com/documentation/enterprise/6/6.0/categories/hub.html)



# Create database

- [x] Enable Root Login

```
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfeilaile@01';
```

- [x] Master

```shell
CREATE DATABASE cloud_master
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'cloud_admin'@'localhost' IDENTIFIED BY 'Admin_1473';

GRANT ALL ON cloud_master.* TO 'cloud_admin'@'localhost' IDENTIFIED BY 'Admin_1473';
GRANT ALL ON cloud_master.* TO 'cloud_admin'@'%' IDENTIFIED BY 'Admin_1473';

FLUSH PRIVILEGES;
```



- [x] Hive

```
CREATE DATABASE cloud_hive
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_hive'@'localhost' IDENTIFIED BY 'Hiveuser_1473';

GRANT ALL ON cloud_hive.* TO 'cloud_hive'@'10.182.63.239' IDENTIFIED BY 'Hiveuser_1473';
GRANT ALL ON cloud_hive.* TO 'cloud_hive'@'%' IDENTIFIED BY 'Hiveuser_1473';

FLUSH PRIVILEGES;
```



- [x] Oozie

```
CREATE DATABASE cloud_oozie
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_oozie'@'localhost' IDENTIFIED BY 'Oozieuser_1473';
GRANT ALL ON cloud_oozie.* TO 'cloud_oozie'@'10.182.63.239' IDENTIFIED BY 'Oozieuser_1473';
GRANT ALL ON cloud_oozie.* TO 'cloud_oozie'@'%' IDENTIFIED BY 'Oozieuser_1473';

FLUSH PRIVILEGES;
```



- [x] Druid

```
CREATE DATABASE cloud_druid
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'polaris_druid'@'localhost' IDENTIFIED BY 'Druid_1473';

GRANT ALL ON cloud_druid.* TO 'polaris_druid'@'10.182.63.239' IDENTIFIED BY 'Druid_1473';

GRANT ALL ON cloud_druid.* TO 'polaris_druid'@'%' IDENTIFIED BY 'Druid_1473';

FLUSH PRIVILEGES;
```



- [x] Superset

```
CREATE DATABASE cloud_superset
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_superset'@'localhost' IDENTIFIED BY 'Superset_1473';

GRANT ALL ON cloud_superset.* TO 'cloud_superset'@'10.182.63.239' IDENTIFIED BY 'Superset_1473';

GRANT ALL ON cloud_superset.* TO 'cloud_superset'@'%' IDENTIFIED BY 'Superset_1473';

FLUSH PRIVILEGES;
```



- [x] Ranger

```
CREATE DATABASE cloud_ranger
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_ranger'@'localhost' IDENTIFIED BY 'Rangeruser_1473';
GRANT ALL ON cloud_ranger.* TO 'cloud_ranger'@'10.182.63.239' IDENTIFIED BY 'Rangeruser_1473';
GRANT ALL ON cloud_ranger.* TO 'cloud_ranger'@'%' IDENTIFIED BY 'Rangeruser_1473';

FLUSH PRIVILEGES;
```



- [x] KMS

```
CREATE DATABASE cloud_kms
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_rangerkms'@'localhost' IDENTIFIED BY 'KMSuser_1473';

GRANT ALL ON cloud_kms.* TO 'cloud_rangerkms'@'10.182.63.239' IDENTIFIED BY 'KMSuser_1473';

GRANT ALL ON cloud_kms.* TO 'cloud_rangerkms'@'%' IDENTIFIED BY 'KMSuser_1473';
```

```
GRANT ALL ON cloud_kms.* TO 'cloud_rangerkms'@'10.182.63.239' IDENTIFIED BY 'KMSuser_1473';

GRANT ALL ON cloud_kms.* TO 'cloud_rangerkms'@'%' IDENTIFIED BY 'KMSuser_1473';
```



```
mysql>FLUSH HOSTS;

$mysqladmin flush-hosts -u
```



update max_connect_errors

```
show variables like '%max_connect_errors%';

set global max_connect_errors = 1844674407370954751;
```



Establishing SSL connection without server’s identity verification is not recommended

```
jdbc.url=jdbc:mysql://***/***?useSSL=false
```



 

