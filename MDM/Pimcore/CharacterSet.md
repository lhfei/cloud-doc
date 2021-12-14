# Ubuntu Server 18.04 与 MySQL 5.7

 原创

[RQSLT](https://blog.51cto.com/walkerqt)2018-05-09 17:45:42博主文章分类：[Ubuntu](https://blog.51cto.com/walkerqt/category24)©著作权

*文章标签*[innodb](https://blog.51cto.com/topic/innodb.html)[buffer](https://blog.51cto.com/topic/buffer.html)[pool](https://blog.51cto.com/topic/pool.html)[utf8mb4](https://blog.51cto.com/topic/utf8mb4.html)*文章分类*[Linux](https://blog.51cto.com/nav/linux)[系统/运维](https://blog.51cto.com/nav/ops)*阅读数*4291

【walker 过程】

- 安装

```bash
sudo apt install mysql-server mysql-client1.
```

- 在 /etc/mysql/mysql.conf.d/mysqld.cnf 文件里面修改或添加

```bash
[mysqld]
# 修改绑定ip
bind-address            = 0.0.0.0
# 设置最大内存
innodb_buffer_pool_size = 20G
# 关闭 timestamp 类型字段自动更新
explicit_defaults_for_timestamp = 11.2.3.4.5.6.7.
```

- 重启 mysql 服务

```bash
sudo systemctl restart mysql.service1.
```

- 查看是否修改成功（数值的单位是 Bytes）

```bash
# 需要 root 权限
mysql -u root
mysql> show variables like  'innodb_buffer_pool_size';
+-------------------------+-------------+
| Variable_name           | Value       |
+-------------------------+-------------+
| innodb_buffer_pool_size | 21474836480 |
+-------------------------+-------------+
1 row in set (0.00 sec)1.2.3.4.5.6.7.8.9.
```

- 设置远程 root 访问

注意：update user set authentication_string=password('xxxx') where user='root'; 语句会与远程授权冲突。

```sql
# 需要 root 权限
mysql -u root
mysql> use mysql;
# authentication_string 以前叫 password
mysql> select user, host, authentication_string from user;
# 设置任意 ip 可使用 root 连接
mysql> update user set host='%' where user='root';
# xxxx 为远程访问密码
mysql> grant all privileges on *.* to 'root'@'%' identified by 'xxxx' with grant option; 
# 刷新权限
mysql> flush privileges;
```



【修改字符集为 utf8/utf8mb4】

- 参考：[ Ubuntu中MySQL5.7设置utf8编码格式步骤](https://blog.csdn.net/qq_32144341/article/details/51318390)
- 查看字符集

```sql
mysql> show variables like 'character_set_%';
mysql> show variables like 'collation_%';1.2.
```

合二为一：

```sql
SHOW VARIABLES WHERE Variable_name LIKE 'character_set_%' OR Variable_name LIKE 'collation_%';
# OR
SHOW VARIABLES WHERE Variable_name REGEXP '^(character_set_|collation_).*';1.2.3.
```

![Ubuntu Server 18.04 与 MySQL 5.7_innodb](https://s4.51cto.com//images/20180721/1532151523509712.png?x-oss-process=image/watermark,size_16,text_QDUxQ1RP5Y2a5a6i,color_FFFFFF,t_100,g_se,x_10,y_10,shadow_90,type_ZmFuZ3poZW5naGVpdGk=)

- 在 /etc/mysql/mysql.conf.d/mysqld.cnf 文件里面修改或添加

```bash
[mysqld]
# ...
lc-messages-dir = /usr/share/mysql
character-set-server = utf8mb4
```

- 在 /etc/mysql/conf.d/mysql.cnf 文件里面修改或添加

```bash
[client]
default-character-set = utf8mb4

[mysql]
default-character-set = utf8mb4
```

- 重启 mysql 服务

```bash
sudo systemctl restart mysql.service1.
```

- 再次查看

```bash
mysql -u root -p
SHOW VARIABLES WHERE Variable_name REGEXP '^(character_set_|collation_).*';1.2.
```

![Ubuntu Server 18.04 与 MySQL 5.7_utf8mb4_02](https://s4.51cto.com//images/20180721/1532151910519597.png?x-oss-process=image/watermark,size_16,text_QDUxQ1RP5Y2a5a6i,color_FFFFFF,t_100,g_se,x_10,y_10,shadow_90,type_ZmFuZ3poZW5naGVpdGk=)



【相关命令】

- 安全检查

```bash
sudo mysql_secure_installation1.
```

- 查看授权

```sql
show grants;1.
```

- 密码策略相关

```sql
# 查看密码策略
mysql> select @@validate_password_policy;

# 修改密码策略
mysql> set global validate_password_policy=0;

# 查看密码长度限制
mysql> select @@validate_password_length;1.2.3.4.5.6.7.8.
```

- 卸载 mysql 及配置文件

```bash
sudo apt remove --purge mysql-server mysql-client1.
```