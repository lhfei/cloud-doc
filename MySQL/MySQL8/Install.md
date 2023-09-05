# How To Install MySQL 8.0 on CentOS 7 / RHEL 7

By

[Josphat Mutai](https://computingforgeeks.com/author/mutai-josphat/)

\-

November 17, 2022

19245

[0](https://computingforgeeks.com/installing-mysql-server-on-centos-rhel/#respond)

This guide is to help you with the installation of MySQL 8 Server on CentOS 7 / RHEL 7 Linux system. MySQL 8 is the latest release of powerful MySQL database management system. It powers many enterprise applications, websites and transactional real-time systems.

To start installing MySQL 8.0 server on CentOS 7 / RHEL 7, you need to add the official MySQL community repository to your system. Run below commands to add it,



```
sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-7.noarch.rpm
```

```shell
sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-9.noarch.rpm
```



Press **y** key to proceed with the installation:

```
....
Dependencies Resolved

======================================================================================================================================================================================================
 Package                                               Arch                               Version                           Repository                                                           Size
======================================================================================================================================================================================================
Installing:
 mysql80-community-release                             noarch                             el7-7                             /mysql80-community-release-el7-7.noarch                              10 k

Transaction Summary
======================================================================================================================================================================================================
Install  1 Package

Total size: 10 k
Installed size: 10 k
Is this ok [y/d/N]: y
```



## Install MySQL 8.0 on CentOS 7 / RHEL 7

Now that repo is added, you can install MysQL 8 without editing repository content since repo for 8 is enabled by default.

```
sudo yum --enablerepo=mysql80-community install mysql-community-server
```

A number of dependencies are installed automatically for you:

```
....
Dependencies Resolved

======================================================================================================================================================================================================
 Package                                                      Arch                                 Version                                      Repository                                       Size
======================================================================================================================================================================================================
Installing:
 mysql-community-server                                       x86_64                               8.0.31-1.el7                                 mysql80-community                                64 M
Installing for dependencies:
 mysql-community-client                                       x86_64                               8.0.31-1.el7                                 mysql80-community                                16 M
 mysql-community-client-plugins                               x86_64                               8.0.31-1.el7                                 mysql80-community                               2.5 M
 mysql-community-common                                       x86_64                               8.0.31-1.el7                                 mysql80-community                               647 k
 mysql-community-icu-data-files                               x86_64                               8.0.31-1.el7                                 mysql80-community                               2.1 M
 mysql-community-libs                                         x86_64                               8.0.31-1.el7                                 mysql80-community                               1.5 M

Transaction Summary
======================================================================================================================================================================================================
Install  1 Package (+5 Dependent packages)

Total download size: 87 M
Installed size: 409 M
Is this ok [y/d/N]: y
```



## Installing MySQL 5.7 on CentOS 7 / RHEL 7 (Reference only)

To install MySQL 5.7, you need to disable *mysql80-community re*pository then download it.

```
sudo yum --disablerepo=mysql80-community --enablerepo=mysql57-community install mysql-community-server
```

## Starting MySQL 8 Service on CentOS 7 / RHEL 7

For CentOS 7 / RHEL 7, use systemd to start mysql service:

```
sudo systemctl enable  --now mysqld.service
```

Confirm that service status return as **running:**

```
$ systemctl status mysqld
● mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2021-09-29 19:46:31 UTC; 13s ago
     Docs: man:mysqld(8)
           http://dev.mysql.com/doc/refman/en/using-systemd.html
  Process: 9114 ExecStartPre=/usr/bin/mysqld_pre_systemd (code=exited, status=0/SUCCESS)
 Main PID: 9192 (mysqld)
   Status: "Server is operational"
   CGroup: /system.slice/mysqld.service
           └─9192 /usr/sbin/mysqld

Sep 29 19:46:24 centos systemd[1]: Starting MySQL Server...
Sep 29 19:46:31 centos systemd[1]: Started MySQL Server.
```



To restart the service use the command:

```
sudo systemctl restart mysqld.service
```

## Set MySQL root password

Installation of MySQL 8.0 on CentOS 7 / RHEL 7 generates a temporary password for you. You can get it by running:

```
grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1
```

It will look like below:

```
2021-09-29T19:46:27.745095Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: 3F24r/ik%pTd
```

Change mysql root user password and secure database server installation:

```
$ sudo mysql_secure_installation

Securing the MySQL server deployment.

Enter password for user root: 3F24r/ik%pTd

The existing password for the user account root has expired. Please set a new password.

New password:

Re-enter new password:
The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
Using existing password for root.

Estimated strength of the password: 100

Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done!
```



## Configure Firewall if Database Server is accessed remotely

With iptables:

```
sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
sudo service iptables restartt
```

Firewalld:

```
sudo firewall-cmd --add-service mysql --permanent
sudo firewall-cmd --reload
```

Test your settings:

```
$ mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.26 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 8.0.26    |
+-----------+
1 row in set (0.00 sec)

mysql> quit
Bye
```



We have successfully installed MySQL 8.0 on CentOS 7 / RHEL 7 Linux System. We also secured the database server by setting root password, removing test database and disabling remote root user logins to the database server.