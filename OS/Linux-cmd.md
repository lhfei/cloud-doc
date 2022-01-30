
### scp : remote copy file

    scp [-r] $local_file_path $remote_user@$remote_host:$remote_target_file_path


### Enable Root GUI login in `Ubuntu 14 LTS`
	@see http://askubuntu.com/questions/369012/how-to-run-a-complete-gui-as-root
>sudo apt-get install gksu
>sudo apt-get install gdm

### append the content of 'AllowRoot=true' into /etc/gdm/custom.conf as bellow:
>vi /etc/gdm/custom.conf


### Show Linux Version

	----------------------------------------------
	#To print all information, enter:
	>$ uname -a
	----------------------------------------------
	#/proc/version file
	>cat /proc/version
	----------------------------------------------
	# /etc/centos-release
	>cat /etc/centos-release
	----------------------------------------------
	# cat /etc/redhat-release
	>cat cat /etc/redhat-release
	----------------------------------------------
	#Find Distribution Version
	>lsb_release -a
	----------------------------------------------
	#### -bash: lsb_release: command not found
	>yum install redhat-lsb


### Show disk
	----------------------------------------------
	# show filesystem disk
	>sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
	
	>sudo fdisk -l


?	

### mkdir multi direcotry:

	----------------------------------------------
	#mkdir java/jdk8
	>$ mkdir -p java/jdk8
	----------------------------------------------


### Find Out Which Process Is Listening Upon a Port
>netstat -tulpn | grep :7070


.check thread:

	ps -ef | grep java

.check tomcat console log

	tail -f  ../logs/catalina.out


### compress
tar -zcvf a.gz /home/{folderName}

### decompress
tar xfvz file.tar.gz or tar zxfv file.tar.gz
tar xvzf redis-stable.tar.gz


//
ps -ef | java grep

tail -f {path}catalina.out

### set time
```shell
date +%T -s "11:14:00"

java -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false \
com.example.Main

java -Dcom.sun.management.jmxremote.port=9999 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
com.example.Main

-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.registry.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9999

-Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9999
```



### Find Out The Top 10 Memory Consuming Process
```shell
ps -auxf | sort -nr -k 4 | head -10

vmstat -S M
```




### CeonOS uninstall OpenJDK
```shell
>rpm -qa | grep java
 `java-1.4.2-gcj-compat-1.4.2.0-40jpp.115`
 `java-1.6.0-openjdk-1.6.0.0-1.7.b09.el5`
>rpm -e --nodeps java-1.4.2-gcj-compat-1.4.2.0-40jpp.115
>rpm -e --nodeps java-1.6.0-openjdk-1.6.0.0-1.7.b09.el5
```
### Ubuntu uninstall OpenJDK
```shell
sudo apt-get purge openjdk*
```

### Ubuntu
```ini
"xxx的盘片插入驱动器/cdrom 在按回车键" 解决办法
注释掉/etc/apt/sources.list下的deb cdrom :.............
```



Append the following lines to the opened "/etc/bash.bashrc" file

```ini
sudo gedit|{nano} /etc/profile
1)#add the following lines below to the end of your /etc/profile file:
?	JAVA_HOME=/usr/local/java/jdk1.7.0_45
?	PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
?	export JAVA_HOME
?	export PATH
```



```ini
2)#choose default java
	sudo update-alternatives --config javac
	sudo update-alternatives --config java
	sudo update-alternatives --config javaws

2)#restart source
	>source /etc/profile
```

### Find Out The Top 10 Memory Consuming Process
```shell
ps -auxf | sort -nr -k 4 | head -10
```



### 查看磁盘空间
```shell
df -hl
df -m
```



### Count files in direcotry

```shell
ls | wc -l
```

### Count lines in file
```shell
wc -l {file_name}
```

### Get a few lines from a gz file
```shell
gzip -cd lineitem.tbl.gz | head 
```

### Check folder size
```shell
du -ah
du -ch | grep total
df -h
du -hs {folder}
```

### Find largest folder top 10
```shell
du -k -ch /home/ | sort -n | tail -10

du -Sh /usr | sort -rh | head -5

du -ah --max-depth=1 /*  | sort -rh | head -10
```



```ini
#Linux Check Memory Usage

#/proc/meminfo
egrep --color 'Mem|Cache|Swap' /proc/meminfo		

#free command
free -m

#vmstat command
vmstat

#top command
top

#atop command
atop

#htop command
htop
```



### Enable root SSH login 

```shell
vi /etc/ssh/sshd_config
#comments this line
PermitRootLogin prohibit-password
```



```shell
#and commend out the following line
PermitRootLogin without-password

#Just below it, add the following line
PermitRootLogin yes

#Then restart SSH
service ssh restart
```

### Remove SSH Host

Generate a ssh key

```shell
# generate a ssh key
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

# copy to 
ssh-copy-id -i ~/.ssh/id_rsa.pub root@${target_host}
```



### No passwd loging with ssh-copy-id
```shell
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 0600 ~/.ssh/authorized_keys
```




### Rsync (Remote Sync):
[@see:](http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/)

```shell
#Copy/Sync Files and Directory Locally
rsync -zvh backup.tar /tmp/backups/
```

​	

```shell
#Copy/Sync a Directory on Local Computer
>rsync -avzh /root/rpmpkgs /tmp/backups/

#Copy/Sync Files and Directory to or From a Server
>rsync -avz rpmpkgs/ root@192.168.0.101:/home/

#Copy/Sync a Remote Directory to a Local Machine
>rsync -avzh root@192.168.0.100:/home/tarunika/rpmpkgs /tmp/myrpms

#Rsync Over SSH
>rsync -avzhe ssh root@192.168.0.100:/root/install.log /tmp/

#Copy a File from a Local Server to a Remote Server with SSH
>rsync -avzhe ssh backup.tar root@192.168.0.100:/backups/

#Show Progress While Transferring Data with rsync
>rsync -avzhe ssh --progress /home/rpmpkgs root@192.168.0.100:/root/rpmpkgs

#Use of –include and –exclude Options
>rsync -avze ssh --include 'R*' --exclude '*' root@192.168.0.101:/var/lib/rpm/ /root/rpm
```

#删除 swap 文件

```shell
swapoff -a后再ls -al
```




### create a symbolic link command
```shell
ln -s {/path/to/file-name} {link-name}
```



### delete a symbolic link

```shell
rm {link-name}
```



### E45: 'readonly' option is set (add ! to override)
```shell
:w !sudo tee %
```



### Compress

```shell
tar -zcvf a.gz 	/home/{folderName}
tar -jcvf a.tar /home/{folderName}
```



### Decompress
```shell
tar xfvz file.tar.gz or tar zxfv file.tar.gz
tar xvzf redis-stable.tar.gz
```



### uncompress file to target folder:

```shell
#uncompress file to /usr/local/java/jdk8
tar xvzf jdk-8u31-linux-x64.gz -C ${locatiobn}
```

### gunzip multiple compressed files to another directory without deleting the .gz files

```shell
cd druid-data; for f in *.gz ; do gunzip -c "$f" > /${destination_dir}/"${f%.*}" ; done
```

### read some line to a new file.
	tail largt.txt -n 100 > small.txt


### Centos check/change TimeZone
```shell
vi /etc/sysconfig/clock
```



### [See](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/v2v_guide/preparation_before_the_p2v_migration-enable_root_login_over_ssh)
Enable ssh root access:

```shell
# edit /etc/ssh/sshd_config, and commend out the following line:

PermitRootLogin without-password

#Just below it, add the following line:
PermitRootLogin yes

# restart ssh service
sudo service ssh restart
```

### Restart network or hostname.

```shell
/etc/init.d/network restart
```



### Setting the Hostname
### Centos
```shell
sudo vi /etc/sysconfig/network
```

首先查看当前的主机名hostname，方法有两种：

1、打开一个终端，在命令提示符中可以看到主机名，主机名通常位于“@”符号后；

2、在终端输入hostname指令:

**hostname**

![zhujiming](https://yqfile.alicdn.com/6db3660515c612b64107e61d293e3917b0623dcf.png)

其次，更改主机名需要root权限，这里切到root账户（用sudo也可以），如果已经是root用户就不用切换了。

**su – root**

这里我们将主机名（hostname）从appmoney改成appjzw，输入以下命令即可：

```shell
hostnamectl set-hostname data-thinker
```



这样再次查看主机名就变成appjzw，无需重启只需新开会话便可变为新的主机名。

注意，主机名一般不包括“.”,"等特殊符合，如果我将上面换成www.appjzw.com都默认为data-thinker，“.”前后的省略，但实际的主机名还是你设置的那个。

此外，除了以上方法之外，还可以通过修改hosts文件来完成，具体过程如下：

1、修改/etc/hosts，将/etc/hosts内出现的appmoney都改成appjzw，如下图：

![zhujimin](https://yqfile.alicdn.com/4af061c42fe7e837804c877b8ec2aed0b0e2be1c.png)

2、修改/etc/sysconfig/network，将hostname改为appjzw, 如下：

![zhujimi](https://yqfile.alicdn.com/0a8acd1a140ce00c027d3aad38dbd0b346475675.png)

3、由于上面的改动必须重启系统才能生效。

**reboot**

4、设置好之后，只要重新登入，命令提示字符就会变为[root@appjzw ~] # 即表示hostname修改成功。



### Ubuntu
```shell
sudo vi /etc/hostname /etc/hosts
hostnamectl set-hostname {new_hostname}
```





#查看 DNS Server

```shell
> vi /etc/resolv.conf

#Ubuntu
>sudo vi /etc/resolvconf/resolv.conf.d/base
#append: nameserver 114.114.114.114 
>sudo resolvconf -u
```



```shell
查看当前登陆的用户
$ who
loongson tty7         2012-04-27 08:58 (:0)
loongson pts/0        2012-04-27 09:00 (:0.0)
loongson pts/1        2012-04-27 09:00 (:0.0)
loongson pts/2        2012-04-27 09:15 (:0.0)


$ finger
Login     Name       Tty      Idle  Login Time   Office     Office Phone
loongson  loongson   tty7       12  Apr 27 08:58 (:0)
loongson  loongson   pts/0       4  Apr 27 09:00 (:0.0)
loongson  loongson   pts/1          Apr 27 09:00 (:0.0)

查看用户的信息
$ finger loongson
Login: loongson                   Name: loongson
Directory: /home/loongson               Shell: /bin/bash
On since Fri Apr 27 08:58 (CST) on tty7 from :0
?    13 minutes 52 seconds idle
On since Fri Apr 27 09:00 (CST) on pts/0 from :0.0
   5 minutes 50 seconds idle
On since Fri Apr 27 09:00 (CST) on pts/1 from :0.0
No mail.
No Plan

查看用户所属组别
$ groups loongson
loongson : loongson adm dialout cdrom plugdev lpadmin admin sambashare libvirtd

添加用户到指定组：
usermod -a -G testgroup loongson
```



### User Account

```shell
# Create User
>useradd lhfei -d /home/lhfei -s /bin/bash -g {groupid}

# Change or rename user name and UID 
>usermod -l login-name old-name

# Change the default home directory of a user
>usermod -m -d /{home}/{username} username
# Remove User
>userdel lhfei

# Find out if user exists in /etc/passwd fil
>egrep -i "^{username}" /etc/passwd

# Find out if group exists in /etc/group file
>egrep -i "^{groupname}" /etc/group

# Add user to groups
sudo usermod -aG {GROUPS1,GROUPS2...GROUPSn} {USERNAME}

# Add user to the sudoers file 
>usermod -a -G sudo {username}
>usermod -a -G adm,cdrom,sudo,dip,plugdev,lpadmin,sambashare {username}
```


?	

### Permission COnfig
```shell
# Change Owner
>chown {owner} {file or folder}

# Change user group
>chown -R {username}:{groupname} /{file or folder}
```




### Check Firewall status:
```shell
>sudo ufw status
```

### Enable or disable firewall:
```shell
>sudo ufw [enable | disable]

netstat -anp | grep 8080
```



### Kill running process in special port
```shell
fuser -k {port}/tcp
```

### Enable assignment port: 3306
```shell
/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT	
```

### rsync
```shell
rsync -avz etc/hadoop/core-site.xml ubuntu134:$HADOOP_HOME/etc/hadoop/core-site.xml
```

### Problem running eclipse on ubuntu
```shell
cd /usr/bin
ln -s $JAVA_HOME/bin/java  java
```

### Find All Large Files On A Linux System

```shell
>du -a /var | sort -n -r | head -n 10
>find / -type f -size +20M -exec ls -lh {} \; | awk '{ print $NF ": " $5 }'
>find / -type f -size +20M -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }'

>find / -type f -size +20M -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }' | sort -nk 2,2
>find / -type f -size +20000k -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }' | sort -nrk 2,2
```





### OpenSSL 

### check version
```shell
openssl version
apt-cache search libssl | grep SSL
```



# vim set file format

```shell
>: set ff=unix
>or
>: set fileformat=unix
```



```shell
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
```



### Regular Expression

### Replace all character in ()
```shell
/\([^\)]*\)/g
```




### Unmanaged network icon - Network manangement disabled

this happens after a bad shutdown. Just change managed from false to true in `/etc/NetworkManager/nm-system-settings.conf`

2. vi /etc/NetworkManager/NetworkManager.conf

3. vi /var/lib/NetworkManager/NetworkManager.state

```ini
[main]
NetworkingEnabled=true
WirelessEnabled=true
WWANEnabled=true
```



# Ubuntu install/uninstall .deb file

```shell
dpkg -i {file_name}.deb
dpkg --remove {file_name}.deb
```



# check rpm installed

```shell
rpm -qa | grep -i 
```



### Ask Ubuntu

## Ubuntu 14.04 hangs on boot after starting CUPS

More details see http://askubuntu.com/questions/526115/ubuntu-14-04-hangs-on-boot-after-starting-cups

## Enter BIOS

press F12

```shell
cat /tmp/hbase-${USER}-1-master.pid |xargs kill -9
```



### Check network interface/card
```shell
sudo /sbin/ifconfig
```




### check bandwidth

### Centos

```shell
wget http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el6/en/x86_64/rpmforge/RPMS/iftop-0.17-1.el6.rf.x86_64.rpm
```





























































