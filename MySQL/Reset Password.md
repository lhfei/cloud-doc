## Reset a MySQL root password

- Last updated on: 2016-06-13
-  

- Authored by: Rackspace Support

The MySQL root password allows the root user to have full access to the MySQL database. You must have (Linux) root or (Windows) Administrator access to the Cloud Server to reset the MySQL root password.

**Note:** The Cloud Server (Linux) root or (Windows) Administrator account password is not the same as the MySQL password. The Cloud Server password allows access to the server. The MySQL root password allows access only to the MySQL database.

Use the following steps to reset a MySQL root password by using the command line interface.

### Stop the MySQL service

(Ubuntu and Debian) Run the following command:

```
sudo /etc/init.d/mysql stop
```

(CentOS, Fedora, and Red Hat Enterprise Linux) Run the following command:

```
sudo /etc/init.d/mysqld stop
```

### Start MySQL without a password

Run the following command. The ampersand (&) at the end of the command is required.

```
sudo mysqld_safe --skip-grant-tables &
```

### Connect to MySQL

Run the following command:

```
mysql -uroot
```

### Set a new MySQL root password

Run the following command:

```
use mysql;

## for MySQL 5.7-
update user set password=PASSWORD("mynewpassword") where User='root';

## for MySQL 5.7+
update user set authentication_string=PASSWORD("yourpassword") where User='root';

flush privileges;

quit
```

### Stop and start the MySQL service

(Ubuntu and Debian) Run the following commands:

```
sudo /etc/init.d/mysql stop
...
sudo /etc/init.d/mysql start
```

(CentOS, Fedora, and Red Hat Enterprise Linux) Run the following commands:

```
sudo /etc/init.d/mysqld stop
...
sudo /etc/init.d/mysqld start
```

### Log in to the database

Test the new password by logging in to the database.

```
mysql -u root -p
```

You are prompted for your new password.