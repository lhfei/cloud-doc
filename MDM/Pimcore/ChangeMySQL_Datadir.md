# How To relocate a MySQL Data Directory on Ubuntu 18.04

[![davidmalcom30](https://hostadvice.com/wp-content/uploads/avatars-cache/gravatar-04ca342af5d042b2a5de80b14610a69e.jpg)](https://hostadvice.com/author/davidmalcom30/)[davidmalcom30](https://hostadvice.com/author/davidmalcom30/)

Hosting Expert

Updated on October 29, 2019 9:26 AM

### Introduction

With time databases grow and may become too large for the space in your filesystem.

To prevent them from outgrowing the available space, you can safely relocate the root data directory of your MySQL to a different location. This will help you create more space, leverage the full power of the storage facilities, and optimize the performance of these features. This a common task for [MySQL hosting.](https://hostadvice.com/hosting-services/mysql/)

This guide will help you move the root data directory of your MySQL database to a different location.

Ready? Let's go!

### Before You Start

For this process to run successfully, you require the following:

- MySQL, installed and configured on your Ubuntu 18.04 server
- In addition, we’ll utilize **/mnt/volume- can3-01** as the new location for the root data directory.

## Step 1 - Relocating the root data directory

The first thing when relocating your MySQL’s root data directory is to ascertain its current location. We’ll use the admin credentials to start MySQL’s interactive session: First, run the command below to access your MySQL prompt.

$ mysql -u root -p

Enter your root password for MySQL and click **ENTER**. Once you access MySQL prompt, choose the root data directory of interest:

msql>

select @@datadir;

This will give you an output similar to the one below:

+-----------------+

| @@datadir       |

+-----------------+

| /var/lib/mysql/ |

+-----------------+

1 row **in** set (0.00 sec)

The output above indicates that the MySQL database is set up to utilize **/var/lib/mysql/** as its default directory. This is our directory of interest. We’ve confirmed that this is the data directory we are required to move to another location. Now, use the **exit** command to exit the monitor.

To preserve your data’s integrity, run the command below to shut down your MySQL service before making any change to your data directory.

$ sudo systemctl stop mysql

The command above has one shortcoming; it doesn't show the status of the service command. To see whether you successfully shut down your MySQL service, run the command below:

$ sudo systemctl status mysql

If you get an output with the following line, then MySQL stopped successfully:

. . .

Sep 27 11:24:20 ubuntu-512mb-can3-01systemd[1]: StoppedMySQLCommunityServer.

The MySQL database server is not running and its now safe to move the root data directory to another location. We’ll use the rsync command to accomplish this:

$ sudo rsync -av /var/lib/mysql /mnt/volume-can3-*01*

The command above includes an **-a flag** to maintain the directory’s privileges and other properties. Besides, it features the **-v flag** which delivers a verbose output to enable you to seamlessly track the progress.

When the rsync process is done, use **.bak** extension to rename your current folder.

$ sudo mv /var/lib/mysql /var/lib/mysql.bak

Renaming this folder eliminates the confusion that occurs from the old and new file location. Maintain the current folder until the relocation is confirmed to be successful.

We can now focus on the configuration.

## Step 2 - Configuring Your New Data Directory

MySQL database server can override the configuration rules via a number of ways. By default, MySQL’s datadir is found in the file **/etc/mysql/mysql.conf.d/mysqld.cnf** which is a component of the **/var/lib/mysql** directory. First, run the command below to open the file:

$ sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

Once the file opens, pinpoint the line with the value **datadir=**. Edit the path that follows this line to reflect /mnt/volume-can3-01/mysql, that is:

. . .

datadir=/mnt/volume-can3-*01*/mysql

. . .

You are almost done with the configuration, but there is one more aspect to be configured. You will need to set up **AppArmor** to allow MySQL database server to write to your newly created directory. We’ll create an alias between our  new location and the old directory.

First, run the command below to open the AppArmor’s alias file:

```shell
sudo vi /etc/apparmor.d/tunables/alias
```



Next, add the alias rule below to the bottom of this file:



```ini
alias /var/lib/mysql/ -> /mnt/volume-can3-*01*/mysql/,
```



Now, restart AppArmor to implement these changes:

```shell
sudo systemctl restart apparmor
```



**Remember:** If the AppArmor is not correctly configured you will get the error below:

Job **for** mysql.service failed because the control process 

exited with error code. See "systemctl status mysql.service" 

and"journalctl -xe"**for** details.

In addition, both the **journalctl** and **systemctl** will deliver outputs concluding with:

Jul 1912:*04*:23 ubuntu-512mb-nyc1-*01* systemd[1]: 

mysql.service: Main process exited, code=exited, status=1/FAILURE

## Step 3 - Restarting The MySQL Service

Restarting the MySQL should not be difficult! But at this point, if you restart the service you will get an error message. The error is not a result of a poorly configured AppArmor, but because of the absence of a directory and symbolic link. The occurs when **mysql-systemd-start** fails to find either a symbolic link (**-L**) or a directory (**-d**).

`/usr/share/mysql/mysql-systemd-start`

. . .

**if** [ ! -d /var/lib/mysql ] && [ ! -L /var/lib/mysql ]; **then**

 echo"MySQL data dir not found at /var/lib/mysql. Please create one."

 exit 1

fi

**if** [ ! -d /var/lib/mysql/mysql ] && [ ! -L /var/lib/mysql/mysql ]; **then**

 echo"MySQL system database not found. Please run mysql_install_db tool."

 exit 1

fi

. . .

To pass the mysql-systemd-start script environment test, we’ll create a basic directory model to easily enable the MySQL server to start.

$ sudo mkdir /var/lib/mysql/mysql -p

You can now restart your MySQL service

$ sudo systemctl start mysql

$ sudo systemctl status mysql

Now, log in to your MySQL prompt:

$ mysql -u root -p

Check the root data directory

msql>

select @@datadir;

If the new directory is in use, you will get the output:

+----------------------------+

| @@datadir                  |

+----------------------------+

| /mnt/volume-can3-*01*/mysql/ |

+----------------------------+

1 row **in** set (0.01 sec)

Next, confirm that the new database is working correctly and verify the authenticity of the existing data. If everything is okay, execute the command below to delete the backup file ending with the **.bak** extension.

$ sudo rm -Rf /var/lib/mysql.bak

Restart your MySQL service once again to implement all the changes:

$ sudo systemctl restart mysql

$ sudo systemctl status mysql

That is all!

## Conclusion

Congratulations! You have successfully relocated the root data directory of your MySQL database server to another location and configured the AppArmor to hold the new changes.