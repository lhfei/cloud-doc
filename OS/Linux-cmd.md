## Rempte SCP 

```sh
# scp : remote copy file

    scp [-r] $local_file_path $remote_user@$remote_host:$remote_target_file_path
	
```

## Enable Root GUI Login 
```sh
# Enable Root GUI login in `Ubuntu 14 LTS`
# @see http://askubuntu.com/questions/369012/how-to-run-a-complete-gui-as-root

>sudo apt-get install gksu
>sudo apt-get install gdm

# append the content of 'AllowRoot=true' into /etc/gdm/custom.conf as bellow:
>vi /etc/gdm/custom.conf
```


## Show Linux Version

```sh
#To print all information, enter:
>$ uname -a

#/proc/version file
>cat /proc/version
```

## Find Distribution Version

```sh
>lsb_release -a

# -bash: lsb_release: command not found
>yum install redhat-lsb
	
```

## Show disk

```
# show filesystem disk
>sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
	
>sudo fdisk -l		
```

## mkdir multi direcotry:
	
```
# mkdir java/jdk8
>$ mkdir -p java/jdk8
```


## Find Out Which Process Is Listening Upon a Port

```sh
>netstat -tulpn | grep :7070

```

## check thread:

```sh
ps -ef | grep java
```

## compress

```sh
tar -zcvf a.gz /home/{folderName}
```

## decompress

```sh
tar xfvz file.tar.gz or tar zxfv file.tar.gz
tar xvzf redis-stable.tar.gz
```

//
ps -ef | java grep

tail -f {path}catalina.out

## set time

```sh
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

## Find Out The Top 10 Memory Consuming Process

```sh
ps -auxf | sort -nr -k 4 | head -10

vmstat -S M
```

## Uninstall OpenJDK

```
# CentOS

>rpm -qa | grep java
 `java-1.4.2-gcj-compat-1.4.2.0-40jpp.115`
 `java-1.6.0-openjdk-1.6.0.0-1.7.b09.el5`
>rpm -e --nodeps java-1.4.2-gcj-compat-1.4.2.0-40jpp.115
>rpm -e --nodeps java-1.6.0-openjdk-1.6.0.0-1.7.b09.el5

# Ubuntu uninstall OpenJDK
>sudo apt-get purge openjdk*
```

## Install JDK

```sh
>sudo gedit|{nano} /etc/profile
#add the following lines below to the end of your /etc/profile file:
JAVA_HOME=/usr/local/java/jdk1.7.0_45
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export PATH

#choose default java
sudo update-alternatives --config javac
sudo update-alternatives --config java
sudo update-alternatives --config javaws

#restart source
>source /etc/profile
```

## Find Out The Top 10 Memory Consuming Process

```sh
ps -auxf | sort -nr -k 4 | head -10
```

## Check disk space

```sh
>df -hl
```

## Check folder size

```sh
>du -ah
>du -ch | grep total
>df -h
>du -hs {folder}
```

## Find largest folder top 10

```sh
>du -k -ch /home/ | sort -n | tail -10

>du -Sh /usr | sort -rh | head -5
```

## Linux Check Memory Usage

- /proc/meminfo

    ```sh
    >egrep --color 'Mem|Cache|Swap' /proc/meminfo
    ```
		
- free command

    ```sh
    >free -m
    ```

- vmstat command

    ```sh
    >vmstat
    ```

- top command

    ```sh
    >top
    ```

- atop command

    ```sh
    >atop
    ```

- htop command

    ```sh
    >htop
    ```

## Enable root SSH login 

```sh
>vi /etc/ssh/sshd_config
#comments this line
PermitRootLogin prohibit-password

#and commend out the following line
PermitRootLogin without-password
	
#Just below it, add the following line
PermitRootLogin yes
	
#Then restart SSH
service ssh restart
```


## Remove SSH Host

```sh
>ssh-keygen -f "/home/cloudland/.ssh/known_hosts" -R ubuntu144
>ssh-keygen -f "/root/.ssh/known_hosts" -R centos124.thinker.cn

#copy
ssh-copy-id -i ~/.ssh/id_dsa.pub cloudland@ubuntu133
ssh-copy-id -i ~/.ssh/id_dsa.pub root@ubuntu133
```
## No passwd loging with ssh-copy-id

```sh
> ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
> cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
> chmod 0600 ~/.ssh/authorized_keys
```

## Rsync (Remote Sync):
@see: http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

```sh	
#Copy/Sync Files and Directory Locally
>rsync -zvh backup.tar /tmp/backups/
	
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
	
#Use of �Cinclude and �Cexclude Options
>rsync -avze ssh --include 'R*' --exclude '*' root@192.168.0.101:/var/lib/rpm/ /root/rpm
	
```
## remove swap file

```sh
>swapoff -a����ls -al
```

## Create a symbolic link command

```sh
>ln -s {/path/to/file-name} {link-name}
```

##delete a symbolic link

```sh
>rm {link-name}
```


## E45: 'readonly' option is set (add ! to override)
```sh
>:w !sudo tee %
```


## compress

```sh
tar -zcvf a.gz 	/home/{folderName}
tar -jcvf a.tar /home/{folderName}
```

## decompress

```sh
tar xfvz file.tar.gz or tar zxfv file.tar.gz
tar xvzf redis-stable.tar.gz
```

## uncompress file to target folder:
	
```
#uncompress file to /usr/local/java/jdk8
>$ tar xvzf jdk-8u31-linux-x64.gz -C ${locatiobn}
```

## read some line to a new file.

```sh
>tail largt.txt -n 100 > small.txt
```

## Centos check/change TimeZone

```sh
>vi /etc/sysconfig/clock
```



## Enable ssh root access:

```sh
# edit /etc/ssh/sshd_config, and commend out the following line:
	
PermitRootLogin without-password
	
#Just below it, add the following line:
PermitRootLogin yes
	
# restart ssh service
sudo service ssh restart
```

## Restart network or hostname.

```sh
>/etc/init.d/network restart
```

## Setting the Hostname

```sh
# Centos
>sudo vi /etc/sysconfig/network

# Ubuntu
>sudo vi /etc/hostname /etc/hosts
>hostnamectl set-hostname {new_hostname}
```


# Check DNS Server

```sh
> vi /etc/resolv.conf

#Ubuntu
>sudo vi /etc/resolvconf/resolv.conf.d/base
#append: nameserver 114.114.114.114 
>sudo resolvconf -u

```

## SHow Current login user

```sh
$ who
loongson tty7         2012-04-27 08:58 (:0)
loongson pts/0        2012-04-27 09:00 (:0.0)
loongson pts/1        2012-04-27 09:00 (:0.0)
loongson pts/2        2012-04-27 09:15 (:0.0)
```

```sh
$ finger
Login     Name       Tty      Idle  Login Time   Office     Office Phone
loongson  loongson   tty7       12  Apr 27 08:58 (:0)
loongson  loongson   pts/0       4  Apr 27 09:00 (:0.0)
loongson  loongson   pts/1          Apr 27 09:00 (:0.0)
```

## Show User info by User ID

```sh
$ finger loongson
Login: loongson                   Name: loongson
Directory: /home/loongson               Shell: /bin/bash
On since Fri Apr 27 08:58 (CST) on tty7 from :0
    13 minutes 52 seconds idle
On since Fri Apr 27 09:00 (CST) on pts/0 from :0.0
   5 minutes 50 seconds idle
On since Fri Apr 27 09:00 (CST) on pts/1 from :0.0
No mail.
No Plan
```


## Check user groups by User ID

```sh
$ groups loongson
loongson : loongson adm dialout cdrom plugdev lpadmin admin sambashare libvirtd
```

## Add user into group

```sh
usermod -a -G testgroup loongson
```

## User Account

```sh
# Create User
>useradd lhfei -d /home/lhfei -s /bin/bash
	
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
	
# Add user to the sudoers file 
>usermod -a -G sudo {username}
>usermod -a -G adm,cdrom,sudo,dip,plugdev,lpadmin,sambashare {username}
		
```


## Permission COnfig
```sh
# Change Owner
>chown {owner} {file or folder}
	
# Change user group
>chown -R {username}:{groupname} /{file or folder}
```


## Check Firewall status:

```sh
>sudo ufw status

# Enable or disable firewall:
	>sudo ufw [enable | disable]
```

## Check port status

```sh
>netstat -anp | grep 8080
	
# Kill running process in special port
>fuser -k {port}/tcp
	
# Enable assignment port: 3306
>/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT	
```

## rsync

```sh
>rsync -avz etc/hadoop/core-site.xml ubuntu134:$HADOOP_HOME/etc/hadoop/core-site.xml
```

## Problem running eclipse on ubuntu
	
```sh	
>cd /usr/bin
>ln -s $JAVA_HOME/bin/java  java
```
## Find All Large Files On A Linux System

```sh
>du -a /var | sort -n -r | head -n 10
>find / -type f -size +20M -exec ls -lh {} \; | awk '{ print $NF ": " $5 }'
>find / -type f -size +20M -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }'
	
>find / -type f -size +20M -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }' | sort -nk 2,2
>find / -type f -size +20000k -exec ls -lh {} \; 2> /dev/null | awk '{ print $NF ": " $5 }' | sort -nrk 2,2
```

## OpenSSL 

```sh
# check version
>openssl version
>apt-cache search libssl | grep SSL
```

```
## vim set file format

```sh
>: set ff=unix
or
>: set fileformat=unix
```

## Enable the port to access in IP-Tables

```sh
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
```

## Regular Expression

```sh
# Replace all character in ()
>/\([^\)]*\)/g
```

## Unmanaged network icon - Network manangement disabled

```sh
# 1.this happens after a bad shutdown. Just change managed 
# 	from false to true in /etc/NetworkManager/nm-system-settings.conf

# 2. vi /etc/NetworkManager/NetworkManager.conf

# 3. vi /var/lib/NetworkManager/NetworkManager.state

[main]
NetworkingEnabled=true
WirelessEnabled=true
WWANEnabled=true
```

## Ubuntu install/uninstall .deb file

```sg
>dpkg -i {file_name}.deb
>dpkg --remove {file_name}.deb
```

## Ask Ubuntu

```sh
#Ubuntu 14.04 hangs on boot after starting CUPS

# More details see http://askubuntu.com/questions/526115/ubuntu-14-04-hangs-on-boot-after-starting-cups

# Enter BIOS

> press F12

% cat /tmp/hbase-${USER}-1-master.pid |xargs kill -9
```


## Check network interface/card

```sh
sudo /sbin/ifconfig
```

## Check bandwidth

**iftop** listens to the network interface and gives you a list of hosts which is consuming data. Total incoming and outgoing data also shown. It can also show port numbers with hosts and able to convert the port numbers to services. Here are the complete options (�Chelp).

Install **iftop** :

- Centos

```sh
# install iftop
$ sudo wget http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el6/en/x86_64/rpmforge/RPMS/iftop-0.17-1.el6.rf.x86_64.rpm
    
$ rpm -ivh iftop-0.17-1.el6.rf.x86_64.rpm
```

- Ubuntu

```sh
$ sudo apt install iftop
```

Listening the network cart by name.
```sh
# listening the network card, for example `eth0`
$ sudo iftop -i eth0
```
