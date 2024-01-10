- [x] createdb: could not connect to database template1: FATAL:  role "root" does not exist

```
sudo su - postgres
```



### 安装

可以参考官网[https://www.postgresql.org/download/linux/redhat/](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fjavajgs.com%2Fgo%3Furl%3Dhttps%3A%2F%2Fwww.postgresql.org%2Fdownload%2Flinux%2Fredhat%2F) ＃安装存储库RPM：

```javascript
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```

复制

安装[PostgreSQL](https://cloud.tencent.com/product/postgresql?from_column=20065&from=20065)：

```javascript
sudo yum install -y postgresql13-server
```

复制

＃初始化[数据库](https://cloud.tencent.com/solution/database?from_column=20065&from=20065)并启用自动启动：

```javascript
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
sudo systemctl enable postgresql-13
sudo systemctl start postgresql-13
```

复制

### 使用

切换到postgres用户

```javascript
su - postgres
```

复制

进入到命令行

>  默认端口号为5432 直接psql 如果设置了其他的端口号psql -pxxx(端口号) 

```javascript
psql 
```

复制

创建用户

```javascript
create user test with password '123.com';
```

复制

创建数据库

```javascript
create database test_db owner test;
```

复制

退出

```javascript
\q

exit
```

复制

### 设置远程连接

修改配置文件postgresql.conf – 允许远程

位置：/var/lib/pgsql/13/data/postgresql.conf 修改：取消# 注释或者按照我这样新增 listen_addresses = ‘*’ 

![在这里插入图片描述](https://ask.qcloudimg.com/http-save/yehe-1011815/blhbfznccl.png)

在这里插入图片描述

 修改配置文件pg_hba.conf – 访问规则

位置：/var/lib/pgsql/13/data/pg_hba.conf 修改：新增 host all all 0.0.0.0/0 trust 访问规则

重启服务

```javascript
systemctl restart postgresql-13.service
```

复制

关闭防火墙沙盒

```javascript
systemctl stop firewalld
setenforce 0
```

复制

### 连接工具测试
