# [How to Install MySQL 5.7 on Ubuntu 20.04](https://www.vultr.com/docs/how-to-install-mysql-5-7-on-ubuntu-20-04/)

**Author:** Hisman Nata Saputra

Last Updated: Wed, Feb 9, 2022 

MySQL and MariaDBUbuntu

## Introduction

Ubuntu 20.04 comes with MySQL 8.0 as the default package. But, sometimes, you need MySQL 5.7 for your legacy apps that don't support MySQL 8.0 yet. This tutorial explains how to add MySQL 5.7 package and install it on Ubuntu 20.04.

## Prerequisites

Before you begin, you should :

- Deploy [a fully updated](https://www.vultr.com/docs/update-ubuntu-server-best-practices) Ubuntu 20.04 server.
- [Create a non-root user with sudo privileges](https://www.vultr.com/docs/create-a-sudo-user-on-ubuntu-best-practices).

## 1. Add MySQL 5.7 APT Repository

Because Ubuntu 20.04 only has MySQL 8.0 in the APT repository, you need to add MySQL 5.7 repository first before installing it. Download MySQL repository using the following commands :

```
$ wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
```

Once it's downloaded, install the repository :

```
$ sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
```

In the prompt, choose the **Ubuntu Bionic**. And then select the **MySQL Server & Cluster** option. After that, choose **mysql-5.7** and then select **ok**.

After it's finished, update the APT repository :

```
$ sudo apt update
```

If you encounter the **"signature couldn't be verified"** error like this :

```
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 467B942D3A79BD29
```

You need to import the missing gpg key with the following command :

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
```

After that, rerun the `apt update` :

```
$ sudo apt update
```

Check if MySQL 5.7 repository is successfully installed by using this command :

```
$ sudo apt-cache policy mysql-server
```

You should see MySQL 5.7 repository appearing at the bottom of the list.

```
mysql-server:
Installed: (none)
Candidate: 8.0.27-0ubuntu0.20.04.1
Version table:
  8.0.27-0ubuntu0.20.04.1 500
    500 http://us.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages
    500 http://us.archive.ubuntu.com/ubuntu focal-security/main amd64 Packages
  8.0.19-0ubuntu5 500
    500 http://us.archive.ubuntu.com/ubuntu focal/main amd64 Packages
  5.7.37-1ubuntu18.04 500
    500 http://repo.mysql.com/apt/ubuntu bionic/mysql-5.7 amd64 Packages
```

## 2. Install MySQL 5.7

After you have MySQL 5.7 repository in your system, you can install it using the `apt install` :

```
$ sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
```

Press the Y key to start the installation and set the root password when prompted.

```
Reading package lists... Done
Building dependency tree
Reading state information... Done
Selected version '5.7.37-1ubuntu18.04' (MySQL:repo.mysql.com [amd64]) for 'mysql-client'
Selected version '5.7.37-1ubuntu18.04' (MySQL:repo.mysql.com [amd64]) for 'mysql-community-server'
Selected version '5.7.37-1ubuntu18.04' (MySQL:repo.mysql.com [amd64]) for 'mysql-server'
The following additional packages will be installed:
  libmecab2 libtinfo5 mysql-common mysql-community-client
The following NEW packages will be installed:
  libmecab2 libtinfo5 mysql-client mysql-common mysql-community-client mysql-community-server mysql-server
0 upgraded, 7 newly installed, 0 to remove and 1 not upgraded.
Need to get 51.6 MB of archives.
After this operation, 315 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```

## 3. Secure MySQL 5.7 Installation

Before using MySQL 5.7 in production, you should secure it first. You can do that by running this command :

```
$ sudo mysql_secure_installation
```

Enter your MySQL root password and answer all of the security questions.

## 4. Check MySQL Version

To check whether or not you installed the correct MySQL version. First, connect to MySQL with the root password that you set earlier.

```
$ mysql -u root -p
```

And then run this command :

```
SELECT VERSION();
```

You should see your installed MySQL version.

```
+-----------+
| VERSION() |
+-----------+
| 5.7.37    |
+-----------+
1 row in set (0.00 sec)
```

Congratulation, you have successfully installed MySQL 5.7 on your Ubuntu 20.04 server.