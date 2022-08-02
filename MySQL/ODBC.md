## 从软件库安装稳定版

```shell
yum install unixODBC unixODBC-devel libtool-ltdl libtool-ltdl-devel
yum install mysql-connector-odbc -y
```

查看是否正确安装

```ini
#  odbcinst -j
unixODBC 2.3.1
DRIVERS............: /etc/odbcinst.ini
SYSTEM DATA SOURCES: /etc/odbc.ini
FILE DATA SOURCES..: /etc/ODBCDataSources
USER DATA SOURCES..: /root/.odbc.ini
SQLULEN Size.......: 8
SQLLEN Size........: 8
SQLSETPOSIROW Size.: 8
```

## 配置驱动相关文件

默认的libmyodbc5.so只支持ANSI字符集，为支持中文字符，需要使用libmyodbc5w.so。

```ini
#  sudo vim  /etc/odbcinst.ini

#在文件中添加如下内容
[MySQLw]
Description     = ODBC for MySQL w
Driver          = /usr/lib/libmyodbc5w.so
Setup           = /usr/lib/libodbcmyS.so
Driver64        = /usr/lib64/libmyodbc5w.so
Setup64         = /usr/lib64/libodbcmyS.so
FileUsage       = 1
```

查看已经配置的驱动

```ini
#odbcinst -q -d 
[PostgreSQL]
[MySQL] 
[MySQLw]
```

## 配置数据源

```ini
# sudo vim /etc/odbc.ini
[my_db]
Description     = Data source MySQL w
Driver          = MySQLw
Server          = 127.0.0.1
Host            = 127.0.0.1
Database        = my_db
Port            = 3306
User            = root
Password        = ******
CHARSET         = UTF8
```

## 验证是否配置成功

```ini
isql -v my_db
```

