@deprecate https://dinfratechsource.com/2018/11/10/how-to-install-latest-mysql-5-7-21-on-rhel-centos-7/



https://tecadmin.net/install-mysql-5-7-centos-rhel/



https://linuxize.com/post/install-mysql-on-centos-7/





## Install MySQL 8.0 on CentOS 7

At the time of writing this article, the latest version of MySQL is version 8.0. To install it on your CentOS 7 server follow the steps below:

1. Enable the MySQL 8.0 repository with the following command:

   ```
   sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
   ```

2. Install MySQL 8.0 package with yum:

   ```
   sudo yum install mysql-community-server
   ```

   During the installation yum may prompt you to import the MySQL GPG key. Type `y` and hit `Enter`.

## Install MySQL 5.7 on CentOS 7

To install the previous stable release of MySQL, [MySQL version](https://linuxize.com/post/how-to-check-mysql-version/) 5.7 on a CentOS 7 server, follow the steps below:

1. Enable the MySQL 5.7 repository with the following command:

   ```
   sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
   ```



> Update GPG Key

```shell
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
```



```shell
yum install mysql-community-libs\*
```

1. Install MySQL 5.7 package with:

   Install MySQL as any other package using yum:

   ```
   sudo yum install mysql-community-server 
   ```

Sections below are relevant for both MySQL 8.0 and MySQL 5.7.

## Starting MySQL

Once the installation is completed, start the MySQL service and enable it to automatically start on boot with:

```
sudo systemctl enable mysqld  
sudo systemctl start mysqld
```

We can check the MySQL service status by typing:

```
sudo systemctl status mysqld
● mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2018-05-23 11:02:43 UTC; 14min ago
     Docs: man:mysqld(8)
           http://dev.mysql.com/doc/refman/en/using-systemd.html
  Process: 4293 ExecStartPre=/usr/bin/mysqld_pre_systemd (code=exited, status=0/SUCCESS)
 Main PID: 4310 (mysqld)
   Status: "SERVER_OPERATING"
   CGroup: /system.slice/mysqld.service
           └─4310 /usr/sbin/mysqld
```

## Securing MySQL

When the MySQL server is started for the first time, a temporary password is generated for the MySQL root user. You can find the password by running the following command:

```
sudo grep 'temporary password' /var/log/mysqld.log 
```

The output should look something like this:

```output
2018-05-23T10:59:51.251159Z 5 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: q&0)V!?fjksL

```

Make note of the password, because the next command will ask you to enter the temporary root password.

Run the `mysql_secure_installation` command to improve the security of our MySQL installation:

```
sudo mysql_secure_installation
Securing the MySQL server deployment.

Enter password for user root:

```

After entering the temporary password you will be asked to set a new password for user root. The password needs to be at least 8-characters long and to contain at least one uppercase letter, one lowercase letter, one number, and one special character.

```output
The existing password for the user account root has expired. Please set a new password.

New password:

Re-enter new password:

```

The script will also ask you to remove the anonymous user, restrict root user access to the local machine and remove the test database. You should answer “Y” (yes) to all questions.

## Connecting to MySQL from the command line

To interact with MySQL through the terminal we will use the MySQL client which is installed as a dependency of the MySQL server package.

To log in to the MySQL server as the root user type:

```
mysql -u root -p
```

You will be prompted to enter the root password you have previously set when the `mysql_secure_installation` script was run.

Once you enter the password you will be presented with the mysql shell as shown below:



```output
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.11 MySQL Community Server - GPL

right (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

```

## Create a Database

Once you are connected to the MySQL shell, you can create a new database by typing the following command:

```
CREATE DATABASE new_database;
Query OK, 1 row affected (0.00 sec)
```

## Create Tables

Now that we created a database we can create a table to store some data.

Before running the SQL statements for creating a table we need to connect to the database:

```
use new_database;
```

In this example we will create a simple table named `contacts` with three fields, `id`, `name` and `email`:

```sql
CREATE TABLE contacts (
  id INT PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);
```



```output
Query OK, 1 row affected (0.00 sec)
```