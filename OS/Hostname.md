





### Centos 6.8

###  1.临时修改主机名

 

显示主机名：
spark@master:~$ hostname
master

修改主机名：
spark@master:~$ sudo hostname hadoop
spark@master:~$ hostname
hadoop

 

PS:以上的修改只是临时修改，重启后就恢复原样了。

 

## 2.永久修改主机名

 

**redhat/centos上永久修改**

[root@localhost ~]# cat /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=localhost.localdomain
GATEWAY=192.168.10.1

修改network的HOSTNAME项。点前面是主机名，点后面是域名。没有点就是主机名。

[root@localhost ~]# vi /etc/sysconfig/network

NETWORKING=yes
NETWORKING_IPV6=no
HOSTNAME=master

这个是永久修改，重启后生效。目前不知道怎么立即生效。

想立即生效，可以同时采用第一种方法。

还有一个修改是：

/etc/hosts

127.0.0.1       localhost.localdomain

127.0.0.1后面的那一部分。

 

**deb/ubuntu上修改** ：

hostname
localhost.localdomain

sudo vi /etc/hostname

在/etc/hostname里面直接填上hostname为master

spark@localhost:~$ cat /etc/hostname
localhost

重启后，提示符变成了。

spark@master:~$

如果不想重启，则用hostname名令。

 

**3. 其他修改方式**

 

用sysctl 修改kernel.hostname

查看：

spark@master:~$ sysctl kernel.hostname
kernel.hostname = master

修改：

spark@master:~$ sudo sysctl kernel.hostname=hadoop
kernel.hostname = hadoop

重新打开shell就变成如下hostname了hadoop

spark@master:~$