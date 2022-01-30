# 如何在Ubuntu 18.04上保护Redis的安装

2018-08-07阅读 2220

## **介绍**



[Redis](https://cloud.tencent.com/product/crs?from=10680)是一个使用内存技术，NoSQL，键值缓存及存储，也可以保存到磁盘。它专为*受信任环境*中的*受信任客户端*设计，自身没有强大安全功能。这里是[Redis官方网站](http://redis.io/topics/security)的引用：



>  Redis旨在由受信任环境中的受信任客户端访问。这意味着通常不会将Redis实例直接暴露给Internet，或者通常是不受信任的客户端可以直接访问Redis TCP端口或UNIX socket的环境 .  .  . 一般而言，Redis未针对最大安全性进行优化，而是为了获得最佳性能和简单性。



尽管如此，Redis确实内置了一些基本的安全功能。其中包括创建未加密密码的能力以及重命名和禁用命令的自由。值得注意的是，它缺乏真正的访问控制系统。



这些功能本身不能确保Redis安装的安全性。但是，配置它们仍然是使[数据库](https://cloud.tencent.com/solution/database?from=10680)脱离不安全状态的重要一步。



在本教程中，您将了解如何配置Redis具有的一些安全功能，并对系统配置进行一些更改，这将提高Ubuntu服务器上独立Redis安装的安全性。



请注意，本指南不涉及Redis服务器和客户端应用程序位于不同主机或不同数据中心的情况。Redis流量必须遍历不安全或不受信任的网络的安装需要完全不同的配置集，例如在Redis机器之间设置SSL代理或V**，以及此处给出的配置。



## **准备**



在本教程中，您将需要：



- 一个Ubuntu 18.04服务器。此服务器还应带有具有`sudo`权限的非root用户以及使用UFW设置的防火墙。
- 在服务器上[安装和配置Redis](https://cloud.tencent.com/developer/article/1163860?from=10680)。

## **第一步 - 验证Redis是否正在运行**



首先，使用非root用户SSH连接到您的服务器。



要检查Redis是否正常工作，请使用以下`redis-cli`命令打开Redis命令行：



```javascript
$ redis-cli
```



> **注意**：如果您已为Redis设置了密码，则必须在连接后使用auth命令进行身份验证：



```javascript
127.0.0.1:6379> auth your_redis_password
```



```javascript
OK
```



如果您尚未为Redis设置密码，则可以在本教程的第四步中阅读如何操作。



使用`ping`命令测试连接：



```javascript
127.0.0.1:6379> ping
```



如果Redis工作正常，您将看到以下内容：



```javascript
PONG
```



在此之后，退出Redis命令行：



```javascript
127.0.0.1:6379> quit
```



现在您已确认Redis正在运行且运行正常，您可以继续执行增强服务器安全性的最重要步骤：配置防火墙。



## **第二步 - 使用UFW保护服务器**



Redis只是一个在您的服务器上运行的应用程序。因为它本身只有一些基本的安全功能，所以真正保护它的第一步是保护它运行的服务器。对于像Ubuntu 18.04服务器这样面向公众的服务器，按照Ubuntu 18.04的初始服务器设置指南中的描述配置防火墙是第一步。**如果您还没有，请立即关注该链接并设置防火墙。**



如果您不确定是否设置了防火墙或它是否处于活动状态，则可以通过运行以下命令来检查：



```javascript
$ sudo ufw status
```



如果您按照Ubuntu 18.04的初始服务器设置指南，您将看到以下输出：



```javascript
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere                  
OpenSSH (v6)               ALLOW       Anywhere (v6)             
```



如果您已使用该指南实施了防火墙规则，则无需为Redis添加额外规则，因为默认情况下，除非明确允许，否则UFW会丢弃所有传入流量。由于Redis服务器的默认独立安装仅在环回接口（`127.0.0.1`或**本地主机**）上进行侦听，因此不应关注其默认端口上的传入流量。



## **第三步 - 绑定到localhost**



默认情况下，只能从**localhost**访问Redis。但是，如果您使用不同的教程来配置Redis而不是准备部分中给出的教程，则可能已更新配置文件以允许来自任何位置的连接。但不如绑定到**localhost**那样安全。



打开Redis配置文件进行编辑：



```javascript
$ sudo nano /etc/redis/redis.conf
```



找到此行并确保它已取消注释（#如果存在则删除它）：



> /etc/redis/redis.conf



```javascript
bind 127.0.0.1
```



保存并完成后关闭文件（按`CTRL + X`，`Y`然后`ENTER`）。



然后，重新启动服务以确保systemd读取您的更改：



```javascript
$ sudo systemctl restart redis
```



要检查此更改是否已生效，请运行`netstat`命令：



```javascript
$ sudo netstat -lnp | grep redis
```



```javascript
tcp        0      0 127.0.0.1:6379          0.0.0.0:*               LISTEN      2855/redis-server 1
```



此输出显示`redis-server`程序绑定到**localhost**（`127.0.0.1`），反映您刚刚对配置文件所做的更改。如果您在该列中看到另一个IP地址（`0.0.0.0`例如），则应仔细检查是否取消注释了正确的行并再次重新启动Redis服务。



现在您的Redis安装仅在**localhost**上进行侦听，恶意攻击者更难以发出请求或访问您的服务器。但是，Redis当前未设置为要求用户在更改其配置或其所拥有的数据之前进行身份验证。为了解决这个问题，Redis允许您在通过Redis客户端（`redis-cli`）进行更改之前要求用户使用密码进行身份验证。



## **第四步 - 配置Redis密码**



配置Redis密码可启用其两个内置安全功能之一 -`auth`命令，该命令要求客户端进行身份验证以访问数据库。密码直接在Redis的配置文件`/etc/redis/redis.conf`中配置，因此请使用首选编辑器再次打开该文件：



```javascript
$ sudo nano /etc/redis/redis.conf
```



滚动到该`SECURITY`部分并查找注释指令：



> /etc/redis/redis.conf



```javascript
# requirepass foobared
```



通过删除`#`，并更改`foobared`为安全密码取消注释。



> **注意：**requirepass在redis.conf文件中的指令上方，有一个注释警告： /etc/redis/redis.conf



```javascript
# Warning: since Redis is pretty fast an outside user can try up to
# 150k passwords per second against a good box. This means that you should
# use a very strong password otherwise it will be very easy to break.
#
```



因此，指定一个非常强大且非常长的值作为密码非常重要。您可以使用`openssl`命令生成随机密码，而不是自己编写密码，如下例所示。第二个`openssl`命令的管道将删除第一个命令输出的任何换行符：



```javascript
$ openssl rand 60 | openssl base64 -A
```



您的输出应该类似于：



```javascript
RBOJ9cCNoGCKhlEBwQLHri1g+atWgn4Xn4HwNUbtzoVxAYxkiYBi7aufl4MILv1nxBqR4L6NNzI0X6cE
```



复制并粘贴该命令的输出作为requirepass的新值后，它应显示为：



> /etc/redis/redis.conf



```javascript
requirepass RBOJ9cCNoGCKhlEBwQLHri1g+atWgn4Xn4HwNUbtzoVxAYxkiYBi7aufl4MILv1nxBqR4L6NNzI0X6cE
```



设置密码后，保存文件，然后重新启动Redis：



```javascript
$ sudo systemctl restart redis.service
```



要测试密码是否有效，请访问Redis命令行：



```javascript
$ redis-cli
```



以下显示了用于测试Redis密码是否有效的一系列命令。第一个命令尝试在验证之前将密钥设置为值：



```javascript
127.0.0.1:6379> set key1 10
```



这不起作用，因为您没有进行身份验证，因此Redis返回错误：



```javascript
(error) NOAUTH Authentication required.
```



下一个命令使用Redis配置文件中指定的密码进行身份验证：



```javascript
127.0.0.1:6379> auth your_redis_password
```



Redis认证：



```javascript
OK
```



之后，再次运行上一个命令将成功：



```javascript
127.0.0.1:6379> set key1 10
```



```javascript
OK
```



get key1 查询Redis以获取新密钥的值。



```javascript
127.0.0.1:6379> get key1
```



```javascript
"10"
```



在确认您能够在验证后在Redis客户端中运行命令后，您可以退出redis-cli：



```javascript
127.0.0.1:6379> quit
```



接下来，我们将介绍重命名Redis命令，如果错误输入或恶意行为者输入，可能会对您的计算机造成严重损害。



## **第五步 - 重命名危险命令**



Redis内置的其他安全功能涉及重命名或完全禁用某些被视为危险的命令。



当错误地或未经授权的用户运行时，此类命令可用于重新配置，销毁或以其他方式擦除数据。与身份验证密码一样，重命名或禁用命令也在`/etc/redis/redis.conf`文件的同`SECURITY`部分中配置。



一些被认为是危险的命令包括：**FLUSHDB**，**FLUSHALL**，**KEYS**，**PEXPIRE**，**DEL**，**CONFIG**，**SHUTDOWN**，**BGREWRITEAOF**，**BGSAVE**，**SAVE**，**SPOP**，**SREM**，**RENAME**和**DEBUG**。这些不全，但重命名或禁用该列表中的所有命令是增强Redis服务器安全性的良好起点。



是否应禁用或重命名命令取决于您的特定需求或站点的需求。如果您知道永远不会使用可能被滥用的命令，那么您可以禁用它。否则，重命名它可能符合您的最佳利益。



要启用或禁用Redis命令，请再次打开配置文件：



```javascript
$ sudo nano /etc/redis/redis.conf
```



> **警告：**以下显示如何禁用和重命名命令的步骤是示例。您应该只选择禁用或重命名对您有意义的命令。您可以自己查看完整的命令列表，并确定在[redis.io/commands中](http://redis.io/commands)查看如何滥用这些命令。



要禁用命令，只需将其重命名为空字符串（由一对引号表示，它们之间没有其他字符），如下所示：



> /etc/redis/redis.conf



```javascript
. . .
# It is also possible to completely kill a command by renaming it into
# an empty string:
#
rename-command FLUSHDB ""
rename-command FLUSHALL ""
rename-command DEBUG ""
. . .
```



要重命名命令，请为其命名，如下面的示例所示。重命名的命令应该让其他人难以猜测，但您很容易记住：



> /etc/redis/redis.conf



```javascript
. . .
rename-command CONFIG ""
rename-command SHUTDOWN SHUTDOWN_MENOT
rename-command CONFIG ASC12_CONFIG
. . .
```



保存更改并关闭文件。



重命名命令后，通过重新启动Redis来应用更改：



```javascript
$ sudo systemctl restart redis.service
```



要测试新命令，请输入Redis命令行：



```javascript
$ redis-cli
```



接下来，验证：



```javascript
127.0.0.1:6379> auth your_redis_password
```



```javascript
OK
```



假设您将`CONFIG`命令重命名为`ASC12_CONFIG`，如前面的示例所示。首先，尝试使用原始`CONFIG`命令。应该是失败的，因为你已经重命名它：



```javascript
127.0.0.1:6379> config get requirepass
```



```javascript
(error) ERR unknown command 'config'
```



但是，调用重命名的命令将会成功。它不区分大小写：



```javascript
127.0.0.1:6379> asc12_config get requirepass
```



```javascript
1) "requirepass"
2) "your_redis_password"
```



最后，您可以退出redis-cli：



```javascript
127.0.0.1:6379> exit
```



请注意，如果您已经在使用Redis命令行，然后重新启动Redis，则需要重新进行身份验证。否则，如果输入命令，则会出现此错误：



```javascript
NOAUTH Authentication required.
```



>  关于重命名命令的做法，在本SECURITY节末尾有一条警示性声明`/etc/redis/redis.conf`： Please note that changing the name of commands that are logged into the AOF file or transmitted to slaves may cause problems. **注意**： Redis项目选择使用术语“master”和“slave”，为了避免混淆，我们这里选择使用Redis文档中使用的术语。



这意味着如果重命名的命令不在AOF文件中，或者如果它是但AOF文件尚未传输给slave，则应该没有问题。



因此，在尝试重命名命令时请记住这一点。重命名命令的最佳时间是在您不使用AOF持久性时，或者在安装后，即在部署Redis-using应用程序之前。



当您使用AOF并处理master-slave安装时，请从项目的GitHub问题页面中考虑[此答案](https://github.com/antirez/redis/issues/2783)。以下是对作者问题的回复：



```javascript
- 这些命令记录到AOF并以与发送方式相同的方式复制到slave，因此如果您尝试在没有相同重命名的实例上重放AOF，则可能会因为命令无法执行而面临不一致（对slave也一样）。
```



因此，在这种情况下处理重命名的最佳方法是确保重命名的命令应用于master-slave安装中的所有实例。