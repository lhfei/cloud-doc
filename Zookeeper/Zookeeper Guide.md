Zookeeper Administrator
=======================

#### Configuration file:

	#conf/zoo.cfg
	#server.id=host:port:port
	tickTime=2000						|
	dataDir=/var/lib/zookeeper/     	|
	clientPort=2181                 	|
	initLimit=5                     	|
	syncLimit=2                     	|
	server.1=ubuntu144.thinker.cn:2888:3888        |	
	server.2=ubuntu145.thinker.cn:2888:3888        |
	server.3=ubuntu146.thinker.cn:2888:3888        |
	server.4=ubuntu147.thinker.cn:2888:3888        |

#### setting myid:

依次在每台机器对应{dataDir} 目录下，创建myid文件， 文件内容为当前机器的{id}， 如ubuntu144 主机下的myid文件为"1"

#### Start a Zookeeper server:

```
bin/zkServer.sh start
#check zookeeper server status:
echo ruok | nc localhost 2181
```

#### check server status

```
bin/zkServer.sh status
 +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
 | [Mode: leader|Mode: follower] |
 +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
```
#### Connecting to ZooKeeper

```
bin/zkCli.sh -server 127.0.0.1:2181

#From the shell, type help to get a listing of commands that can be executed from the client, as in:
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	|[zkshell: 0] help					 |
	|ZooKeeper host:port cmd args        |
	|        get path [watch]            |
	|        ls path [watch]             |
	|        set path data [version]     |
	|        delquota [-n|-b] path       |
	|        quit                        |
	|        printwatches on|off         |
	|        create path data acl        |
	|        stat path [watch]           |
	|        listquota path              |
	|        history                     |
	|        setAcl path acl             |
	|        getAcl path                 |
	|        sync path                   |
	|        redo cmdno                  |
	|        addauth scheme auth         |
	|        delete path [version]       |
	|        deleteall path              |
	|        setquota -n|-b val path     |
```

This creates a new znode and associates the string "my_data" with the node.

```
create /zk_test my_data
|Created /zk_test					 |
	
# Issue another ls / command to see what the directory looks like:
>ls /
[zookeeper, zk_test]
```

Verify that the data was associated with the znode by running the get command, as in:

```
get /zk_test
```

Change the data associated with zk_test by issuing the set command, as in:

```
set /zk_test lhfei
```

Delete the node by issuing:

```
delete /zk_test
```