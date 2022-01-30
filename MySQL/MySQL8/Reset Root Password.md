# 如何在MySQL 8.0中重置Root密码

2021-06-18阅读 6670

在遗忘或丢失[MySQL](https://cloud.tencent.com/product/cdb?from=10680) root密码的不幸事件中，您肯定需要一种方法来恢复或重置MySQL 8.0版本中的root密码。

在忘记或丢失MySQL root密码的不幸事件中，您肯定需要一种方法来以某种方式恢复它。 我们需要知道的是密码存储在users表中。 这意味着我们需要找到绕过MySQL身份验证的方法，以便我们可以更新密码记录。

幸运的是，有一个很容易实现，本教程将指导您完成恢复或重置MySQL 8.0版本中的root密码的过程。

根据MySQL文档，有两种方法可以重置root MySQL密码。 我们将审查两者。

### 使用-init-file重置MySQL Root密码

重置root密码的方法之一是创建本地文件，然后使用`--init-file`选项启动MySQL服务，如图所示。

```javascript
# vim /home/user/init-file.txt
```

确保mysql用户可以读取该文件非常重要。 在该文件中粘贴以下内容：

```javascript
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
```

在上面更改“ **new_password** ”，其中包含您要使用的密码。

![img](https://ask.qcloudimg.com/http-save/2323866/9nxn29obvw.png?imageView2/2/w/1620)

使用新的MySQL Root密码创建文件

现在确保MySQL服务已停止。 您可以执行以下操作：

```javascript
# systemctl stop mysqld.service     # for distros using systemd 
# /etc/init.d/mysqld stop           # for distros using init
```

然后运行以下命令：

```javascript
# mysqld --user=mysql --init-file=/home/user/init-file.txt --console
```

这将启动MySQL服务，在此过程中它将执行您创建的init文件，从而更新root用户的密码。 重置密码后，请务必删除该文件。

![img](https://ask.qcloudimg.com/http-save/2323866/55kajumqpa.png?imageView2/2/w/1620)

重置MySQL Root密码

确保在此之后停止服务器并正常启动它。

```javascript
# systemctl stop mysqld.service        # for distros using systemd 
# systemctl restart mysqld.service     # for distros using systemd 

# /etc/init.d/mysqld stop              # for distros using init
# /etc/init.d/mysqld restart           # for distros using init
```

您现在应该能够使用新密码以root身份连接到MySQL服务器。

```javascript
# mysql -u root -p
```

![img](https://ask.qcloudimg.com/http-save/2323866/qfhtecuz1r.png?imageView2/2/w/1620)

使用新的Root密码连接到MySQL

### 使用-skip-grant-tables重置MySQL Root密码

我们的第二个选择是使用`--skip-grant-tables`选项启动MySQL服务。 这样安全性较低，因为当服务以这种方式启动时，所有用户都可以无需密码即可连接。

如果服务器已启动`--skip-grant-tables` ，则会自动激活`--skip-networking`选项，以便远程连接不可用。

首先确保MySQL服务已停止。

```javascript
# systemctl stop mysqld.service     # for distros using systemd 
# /etc/init.d/mysqld stop           # for distros using init
```

然后使用以下选项启动服务。

```javascript
# mysqld --skip-grant-tables --user=mysql &
```

然后，您只需运行即可连接到mysql服务器。

```javascript
# mysql
```

由于在使用`--skip-grant-tables`选项启动服务时禁用了帐户管理，因此我们必须重新加载授权。 这样我们以后就可以更改密码了：

```javascript
# FLUSH PRIVILEGES;
```

现在，您可以运行以下查询来更新密码。 确保使用您要使用的实际密码更改“new_password”。

```javascript
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_passowrd';
```

![img](https://ask.qcloudimg.com/http-save/2323866/1k36qfjajj.png?imageView2/2/w/1620)

在MySQL 8中重置Root密码

现在停止MySQL服务器并正常启动它。

```javascript
# systemctl stop mysqld.service        # for distros using systemd 
# systemctl restart mysqld.service     # for distros using systemd 

# /etc/init.d/mysqld stop              # for distros using init
# /etc/init.d/mysqld restart           # for distros using init
```

您应该能够使用新密码进行连接。

```javascript
# mysql -u root -p
```

![img](https://ask.qcloudimg.com/http-save/2323866/tcp5f8mwy1.png?imageView2/2/w/1620)

使用新的Root密码登录MySQL