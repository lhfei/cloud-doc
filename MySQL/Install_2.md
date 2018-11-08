> 1 Download Mysql Compressed TAR Archive.

​	Official website: https://dev.mysql.com/downloads/mysql/

> 2 Make directory for `Mysql` Install and data store

```sh
mkdir /usr/local/mysql
mkdir /usr/local/mysql/data
```



> 3 Create Account 

Create a system account as `mysql`  for mysql service.

```sh
groupadd mysql
useradd -r -g mysql mysql
```



> 4 Decompress the tar file : 

```sh
tar -zxvf mysql-5.7.24-el7-x86_64.tar.gz

mv mysql-5.7.24-el7-x86_64.tar.gz/*  /usr/local/mysql/
```



> 5 Install MySQL Server:

```sh
cd /usr/local/mysql
./bin/mysql_install_db --user=mysql --basedir=/usr/local/mysql/ --datadir=/usr/local/mysql/data/
```



> 6 Configurated the `MySQL Service`  

```sh
sudo touch  /etc/my.cnf 
vi /etc/my.cnf
```



 Edit `[mysqld]` section, and append some lines as below:

```ini
[mysqld]

skip-grant-tables
basedir = /usr/local/mysql
adir = /usr/local/mysql/data
port = 3306
socket = /tmp/mysql.sock
character-set-server = utf8

```



Add `mysqld` to System service

```sh
cp -a ./support-files/mysql.server /etc/init.d/mysqld
```



> 7 Make `mysql` soft link:

```
ln -s /usr/local/mysql/bin/mysql /usr/bin/
```



> 8 Start MySQL

```sh
service mysqld start
```



> 9 Update password:



```
mysql -u root -p
```



```sql
use mysql;

update user set authentication_string=password('Lhfeilaile@01') where user='root';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Lhfeilaile@01' PASSWORD EXPIRE NEVER;

flush privileges;

quit;
```



> 10 Enable privilage

```sh
service mysqld stop

vi /etc/my.cnf
```



comment `skip-grant-tables` line in `my.conf`, just like this:



```ini
[mysqld]

#skip-grant-tables
basedir = /usr/local/mysql
adir = /usr/local/mysql/data
port = 3306
socket = /tmp/mysql.sock
character-set-server = utf8
```

Now ,restart MySQL Server.