## **介绍**

[Redis](https://redis.io/)是一个内存中的键值存储器，以其灵活性，性能和广泛的语言支持而闻名。它通常用作[数据库](https://cloud.tencent.com/solution/database?from=10680)，缓存和消息代理，并支持各种数据结构。

本教程演示如何在Ubuntu 18.04服务器上从源进行安装和配置[Redis](https://cloud.tencent.com/product/crs?from=10680)。请注意，通过官方Ubuntu存储库下载和安装Redis可以减少安装步骤。

## **准备**

一个Ubuntu 18.04服务器，具有sudo权限的非root用户和防火墙。没有服务器的用户可以购买和使用[腾讯云服务器](https://cloud.tencent.com/product/cvm?from=10680)或者直接在[腾讯云实验室Ubuntu服务器](https://cloud.tencent.com/developer/labs/gallery?tagId=14&from=10680)上直接上机安装Redis。

## **第一步，安装构建和测试依赖项**

为了获得最新版本的Redis，我们将从源代码编译和安装该软件。但是，在下载源代码之前，必须构建依赖项，以便您可以进行软件编译。

请从Ubuntu存储库安装`build-essential`元数据包。另外，下载可用于测试二进制文件的`tcl`软件包。

键入以下命令更新本地apt程序包缓存并安装依赖项：

```js
$ sudo apt update
$ sudo apt install build-essential tcl
```

接下来，您可以开始安装Redis。

## **第二步，下载、编译和安装Redis**

安装依赖项后，您就可以通过下载，编译和构建源代码来安装Redis。由于您不需要长期保留Redis源代码（您可以随时重新下载），因此请将源代码下载到您的`/tmp`目录中。

首先进入此目录：

```js
$ cd /tmp
```

接下来，使用curl下载Redis的最新稳定版本。最新版本始终可以在稳定的下载URL找到：

```js
$ curl -O http://download.redis.io/redis-stable.tar.gz
```

输入以下命令解压缩tarball：

```js
$ tar xzvf redis-stable.tar.gz
```

然后进入刚刚解压缩的Redis源目录结构：

```js
$ cd redis-stable
```

输入以下命令编译Redis二进制文件：

```js
$ make
```

二进制文件完成编译后，运行测试套件以确保所有内容都正确编译：

```js
$ make test
```

这通常需要几分钟才能完成。测试完成后，输入以下命令将二进制文件安装到系统上：

```js
$ sudo make install
```

接下来，您需要创建配置目录。Redis配置目录通常位于`/etc/`目录中，您可以通过输入以下内容来创建它：

```js
$ sudo mkdir /etc/redis
```

接下来，复制Redis源存档附带的示例Redis配置文件：

```js
$ sudo cp /tmp/redis-stable/redis.conf /etc/redis
```

使用首选文本编辑器打开文件，对配置进行一些更改：

```js
$ sudo nano /etc/redis/redis.conf
```

在文件中，找到`supervised`指令。该指令允许您声明一个init系统来管理Redis作为服务，使您可以更好地控制其操作。该`supervised`指令默认设置为`no`。由于您运行的是使用`systemd`初始化的Ubuntu系统，因此将其更改为`systemd`：

> /etc/redis/redis.conf 

```js
   . . .
   
   # If you run Redis from upstart or systemd, Redis can interact with your
   # supervision tree. Options:
   #   supervised no      - no supervision interaction
   #   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
   #   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
   #   supervised auto    - detect upstart or systemd method based on
   #                        UPSTART_JOB or NOTIFY_SOCKET environment variables
   # Note: these supervision methods only signal "process is ready."
   #       They do not enable continuous liveness pings back to your supervisor.
   supervised systemd
   
   . . .
```

接下来，找该`dir`指令。此选项指定Redis将用于转储持久数据的目录。您需要将其更改为Redis具有写权限且普通用户无法查看的位置。

使用`/var/lib/redis`目录; 您将在第4步中创建此目录并调整其权限：

> /etc/redis/redis.conf 

```js
. . .

# The working directory.
#
# The DB will be written inside this directory, with the filename specified
# above using the 'dbfilename' configuration directive.
#
# The Append Only File will also be created inside this directory.
#
# Note that you must specify a directory here, not a file name.
dir /var/lib/redis

. . .
```

完成后保存并关闭文件，接下来，我们将Redis配置为作为服务运行并创建其专用用户和组。

## **第三步，创建Redis systemd单元文件**

为了更好地控制Redis的管理方式，您可以创建一个systemd单元文件，使其可以作为systemd服务。这样做的好处是可以服务器启动时启动Redis。

创建并打开`/etc/systemd/system/redis.service`文件：

```js
$ sudo nano /etc/systemd/system/redis.service
```

进入后，通过添加服务描述并定义网络要求来启动Unit：

> /etc/systemd/system/redis.service 

```js
[Unit]
Description=Redis In-Memory Data Store
After=network.target
```

Service部分用来指定服务行为。出于安全考虑，您不应以**root用户**身份运行此服务。您应该使用专用的用户和组。

要启动该服务，只需调用`redis-server`二进制文件并将其指向您的配置即可。要停止该服务，请使用Redis

`shutdown`命令，您可以使用`redis-cli`二进制文件执行该命令。此外，由于我们更希望在出现故障的时候Redis可以尽快的恢复，因此我们将`Restart`指令设置为`always`：

> /etc/systemd/system/redis.service 

```js
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always
```

最后，添加一个Install部分。定义应该附加到服务上的systemd目标（如果它已启用）：

> /etc/systemd/system/redis.service

```js
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
```

完成后保存并关闭文件。

Redis systemd单元文件已全部设置。但是，在它可以投入使用之前，您必须创建在该Service部分中引用的专用用户和组，并授予它们运行所需的权限。

## **第四步， 创建Redis用户，组和目录**

在开始和测试Redis之前，您需要做的最后一件事是创建在前两个文件中引用的用户，组和目录。

首先创建**redis**用户和组。您可以通过输入以下命令在单个命令中执行此操作

```js
$ sudo adduser --system --group --no-create-home redis
```

接下来，输入以下命令创建`/var/lib/redis`目录（`redis.conf`在步骤2中创建的文件中引用）：

```js
$ sudo mkdir /var/lib/redis
```

为此目录授予`redis`用户和组所有权：

```js
$ sudo chown redis:redis /var/lib/redis
```

最后，调整权限，阻止普通用户访问此位置：

```js
$ sudo chmod 770 /var/lib/redis
```

现在我们可以启动Redis服务并测试其功能。

## **第五步，启动和测试Redis**

输入以下命令启动systemd服务：

```js
$ sudo systemctl start redis
```

运行以下命令检查服务有没有错误：

```js
$ sudo systemctl status redis
```

这将产生类似于以下的输出：

```js
● redis.service - Redis In-Memory Data Store
   Loaded: loaded (/etc/systemd/system/redis.service; disabled; vendor preset: enabled)
   Active: active (running) since Tue 2018-05-29 17:49:11 UTC; 4s ago
 Main PID: 12720 (redis-server)
    Tasks: 4 (limit: 4704)
   CGroup: /system.slice/redis.service
           └─12720 /usr/local/bin/redis-server 127.0.0.1:6379
. . .
```

要测试您的服务是否正常运行，请使用命令行客户端连接到Redis服务器：

```js
$ redis-cli
```

在随后的提示中，键入以下内容来测试连接：

```js
127.0.0.1:6379> ping
```

这将返回：

```js
PONG
```

接下来，通过输入以下内容检查是否可以设置键：

```js
127.0.0.1:6379> set test "It's working!"
OK
```

键入以下内容检索test值：

```js
127.0.0.1:6379> get test
```

您应该能够检索存储的值：

```js
"It's working!"
```

确认您可以获取该值后，退出Redis提示符，返回到shell：

```js
127.0.0.1:6379> exit
```

作为最终测试，我们将检查Redis是否能够在数据被停止或重新启动后保留数据。要执行此操作，请首先重新启动Redis实例：

```js
$ sudo systemctl restart redis
```

然后再次与客户端连接并确认您的测试值仍然可用：

```js
$ redis-cli
127.0.0.1:6379> get test
```

您的密钥值仍应该可以访问：

```js
"It's working!"
```

完成后再次退出shell：

```js
127.0.0.1:6379> exit
```

假设所有这些测试都有效并且您希望在服务器引导时自动启动Redis，请启用systemd服务：

```js
$ sudo systemctl enable redis
Created symlink from /etc/systemd/system/multi-user.target.wants/redis.service to /etc/systemd/system/redis.service.
```

至此，您的Redis安装可完全运行。