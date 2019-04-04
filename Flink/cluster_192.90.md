

# Install Apache Flink on Multi-node Cluster

Follow the steps given below to install Apache Flink on multi-node cluster-



### Host

```ini
192.168.58.90	host-192-168-58-90 
192.168.58.91	host-192-168-58-91 
192.168.58.92	host-192-168-58-92 
192.168.58.93	host-192-168-58-93 
192.168.58.94	host-192-168-58-94 
192.168.58.95	host-192-168-58-95 
192.168.58.96	host-192-168-58-96 
192.168.58.97	host-192-168-58-97 
192.168.58.98	host-192-168-58-98 
192.168.58.99	host-192-168-58-99 
```



### 2.1. Platform

#### I. Platform Requirements

- Operating system: Ubuntu 14.04 or later, we can also use other[ Linux](http://data-flair.training/blogs/frequent-linux-commands-beginners-tutorial/) flavors like: CentOS, Redhat, etc.
- Java 7.x or higher

#### II. Configure & Setup Platform

If you are using Windows / Mac OS you can [create virtual machine and install Ubuntu using VMWare Player](http://data-flair.training/blogs/install-ubuntu-vmware-player/), alternatively you can [create virtual machine and install Ubuntu using Oracle Virtual Box](http://data-flair.training/blogs/step-by-step-installation-of-ubuntu-on-virtual-box/)

### 2.2. Prerequisites

#### I. Install Java 7

*NOTE: Install Java on all the nodes of the cluster*

##### a. Install python-software properties

[Apache Flink](http://data-flair.training/blogs/introduction-apache-flink-quickstart-tutorial/) requires Java to be installed as it runs on JVM. Firstly We need to install python-software-properties to add java repositories. To download and install python-software-properties use the following command.
dataflair@ubuntu:~$ Sudo apt-get install python-software-properties 

##### b. Add Repository

To add repository run the below command in terminal:
dataflair@ubuntu:~$ sudo add-apt-repository ppa:webupd8team/java 

##### c. Update the source list

dataflair@ubuntu:~$ sudo apt-get update 

##### d. Install java

Now we will download and install the Java. To download and install Java run the below command in terminal:
dataflair@ubuntu:~$ sudo apt-get install oracle-java7-installer
On executing this command Java gets automatically start downloading and gets installed.
To check whether installation procedure gets successfully completed and a completely working Java is installed or not, we have to use the below command:
dataflair@ubuntu:~$ java -version

#### II. Configure SSH

SSH means secured shell which is used for the remote login. We can login to a remote machine using SSH. Now we need to configure passwordless SSH. Passwordless SSH means without a password we can login to a remote machine. Password less SSH setup is required for remote script invocation. Automatically remotely master will start the demons on slaves.

##### a. Install Open SSH Server-Client

$ sudo apt-get install openssh-server openssh-client

##### b. Generate Key Pairs

$ ssh-keygen -t rsa -P ""
It will ask “Enter the name of file in which to save the key (/home/dataflair/.ssh/id_rsa):” let it be default, don’t specify any path just press “Enter”. Now it will be available in the default path i.e. “.ssh”. To check the default path use command “$ls .ssh/” and you will see that two files are created “id_rsa” which is a private key and “id_rsa.pub” which is a public key.

##### c. Configure password-less SSH

Copy the contents of “id_rsa.pub” of master into the “authorized_keys” files of all the slaves and master
$ cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

##### d. Check by SSH to all the hosts

$ ssh localhost
$ ssh <SLAVE-IP> 
It should not ask for any password and you can easily get logged into remote machine since we have configured passwordless SSH

### 2.3. Install Apache Flink in Cluster Mode

#### I. Install Flink on Master

##### a. Download the Flink Setup

Download the Flink Setup from its official website <http://flink.apache.org/downloads.html>

##### b. Untar the file

In order to extract all the contents of compressed Apache Flink file package, use the below command:
dataflair@ubuntu:~$ tar xzf flink-1.1.3-bin-hadoop26-scala_2.11.tgz

##### c. Rename the directory

dataflair@ubuntu:~$ mv flink-1.1.3/ flink 

##### d. Setup Configuration

###### I. GO TO FLINK CONF DIRECTORY

dataflair@ubuntu:~$ cd flink
dataflair@ubuntu:~/flink$ cd conf 

###### II. ADD THE ENTRY OF MASTER

Choose a master node (JobManager) and set the jobmanager.rpc.address in conf/flink-conf.yaml to its IP or hostname. Make sure that all nodes in your cluster have the same jobmanager.rpc.address configured.

1. dataflair@ubuntu:~/flink/conf$ nano flink-conf.yaml
2. Add this line: jobmanager.rpc.address: 192.168.1.3



###### III. ADD THE ENTRY OF ALL THE SLAVES

Add the IPs or hostnames (one per line) of all worker nodes (TaskManager) to the slaves files in conf/slaves. To configure file use the following command.
dataflair@ubuntu:~/flink/conf$ nano slaves 
Enter ip addresses like this –
192.168.1.4
192.168.1.5

#### II. Install Flink on Slaves

##### a. Copy configured setup from master to all the slaves

We will create a tar of configured Flink setup and copy it on all the slaves.

###### I. CREATE TAR-BALL OF CONFIGURED SETUP:

 $ tar czf flink.tar.gz flink 
*NOTE: Run this command on Master*

###### II. COPY THE CONFIGURED TAR-BALL ON ALL THE SLAVES



1.  $ scp flink.tar.gz 192.168.1.4:~
2. $ scp flink.tar.gz 192.168.1.5:~

NOTE: Run this command on Master



###### III. UN-TAR CONFIGURED HADOOP SETUP ON ALL THE SLAVES

 $ tar xzf flink.tar.gz 
*NOTE: Run this command on all the slaves*

### 2.4. Start that Flink Cluster

#### I. Start the cluster

To start the cluster run below script, it will start all the daemons running on master as well as slaves.
dataflair@ubuntu:~/flink/$ bin/start-cluster.sh
*NOTE: Run this command on Master*

#### II. Check whether services have been started

##### a. Check daemons on Master



1.  $ jps
2. JobManager 



##### b. Check daemons on Slaves



1.  $ jps
2. TaskManager 

Now the cluster has been setup successfully, you can play with the cluster..!!



#### III. Stop the cluster

To stop the cluster run below script, it will stop all the daemons running on master as well as slaves
dataflair@ubuntu:~/flink/$ bin/stop-cluster.sh
[Follow this tutorial for real life use-case of Apache Flink](http://data-flair.training/blogs/apache-flink-real-world-use-case-crime-data-analysis-2/).
Spark or Flink which will be the successor of Hadoop-MapReduce, [Refer Spark vs Flink comparison Guide](http://data-flair.training/blogs/comparison-apache-flink-vs-apache-spark/)