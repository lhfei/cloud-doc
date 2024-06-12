# [Install Guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#std-label-install-mdb-community-redhat-centos)





## Install MongoDB Community Edition[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition)

Follow these steps to install MongoDB Community Edition using the `yum` package manager.

1

### Configure the package management system (`yum`).[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#configure-the-package-management-system-yum)

Create a `/etc/yum.repos.d/mongodb-org-7.0.repo` file so that you can install MongoDB directly using `yum`:

987

```
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
```



You can also download the `.rpm` files directly from the [MongoDB repository](https://repo.mongodb.org/yum/redhat/). Downloads are organized by Red Hat / CentOS version (e.g. `9`), then MongoDB [release version](https://www.mongodb.com/docs/manual/reference/versioning/#std-label-release-version-numbers) (e.g. `7.0`), then architecture (e.g. `x86_64`).

Prior to MongoDB 5.0, odd-numbered MongoDB release versions, such as `4.3`, were development releases. Beginning with MongoDB 5.1, MongoDB has quarterly rapid releases. For more information on the differences between rapid and long-term support releases, see [MongoDB Versioning.](https://www.mongodb.com/docs/manual/reference/versioning/#std-label-release-version-numbers)

2

### Install the MongoDB packages.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-the-mongodb-packages)

To install the latest stable version of MongoDB, issue the following command:

```
sudo yum install -y mongodb-org
```



Alternatively, to install a specific release of MongoDB, specify each component package individually and append the version number to the package name, as in the following example:

```
sudo yum install -y mongodb-org-7.0.3 mongodb-org-database-7.0.3 mongodb-org-server-7.0.3 mongodb-mongosh-7.0.3 mongodb-org-mongos-7.0.3 mongodb-org-tools-7.0.3
```





## NOTE

`yum` automatically upgrades packages when newer versions become available. If you want to prevent MongoDB upgrades, pin the package by adding the following `exclude` directive to your `/etc/yum.conf` file:

```
exclude=mongodb-org,mongodb-org-database,mongodb-org-server,mongodb-mongosh,mongodb-org-mongos,mongodb-org-tools
```



## Run MongoDB Community Edition[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#run-mongodb-community-edition)

### ulimit[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#ulimit)

Most Unix-like operating systems limit the system resources that a process may use. These limits may negatively impact MongoDB operation, and should be adjusted. See [UNIX `ulimit` Settings](https://www.mongodb.com/docs/manual/reference/ulimit/) for the recommended settings for your platform.



## NOTE

Starting in MongoDB 4.4, a startup error is generated if the `ulimit` value for number of open files is under `64000`.

### Directory Paths[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#directory-paths)

#### To Use Default Directories[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#to-use-default-directories)

By default, MongoDB runs using the `mongod` user account and uses the following default directories:

- `/var/lib/mongo` (the data directory)
- `/var/log/mongodb` (the log directory)

The package manager creates the default directories during installation. The owner and group name are `mongod`.

#### To Use Non-Default Directories[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#to-use-non-default-directories)

To use a data directory and/or log directory other than the default directories:

1. Create the new directory or directories.

2. Edit the configuration file `/etc/mongod.conf` and modify the following fields accordingly:

   - [`storage.dbPath`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-storage.dbPath) to specify a new data directory path (e.g. `/some/data/directory`)
   - [`systemLog.path`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-systemLog.path) to specify a new log file path (e.g. `/some/log/directory/mongod.log`)

3. Ensure that the user running MongoDB has access to the directory or directories:

   ```
   sudo chown -R mongod:mongod <directory>
   ```

   

   If you change the user that runs the MongoDB process, you **must** give the new user access to these directories.

4. Configure SELinux if enforced. See [Configure SELinux.](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#std-label-install-rhel-configure-selinux)



### Configure SELinux[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#configure-selinux)

Starting in MongoDB 5.0, a new SELinux policy is available for MongoDB installations that:

- Use an `.rpm` installer.
- Use default configuration settings.
- Run on RHEL7 or later.

For MongoDB Enterprise installations that use LDAP authentication, the following additional SELinux policies must be in place:

- For deployments that use [LDAP authentication via OS libraries](https://www.mongodb.com/docs/manual/core/security-ldap/#std-label-security-ldap-connect-native), MongoDB must have access to the `tcontext=system_u:object_r:ldap_port_t:s0` LDAP ports. You can enable access by running `setsebool -P authlogin_nsswitch_use_ldap 1`.
- For deployments that use [LDAP authentication via saslauthd](https://www.mongodb.com/docs/manual/core/security-ldap/#std-label-security-ldap-connect-saslauthd), you must enable cluster mode by running `sudo setsebool -P daemons_enable_cluster_mode 1`.

If your installation does not meet these requirements, refer to the [SELinux Instructions](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-enterprise-on-red-hat-tarball/#std-label-install-enterprise-tarball-rhel-configure-selinux) for `.tgz` packages.



## NOTE

If your MongoDB deployment uses custom settings for any of the following:

- [MongoDB connection ports](https://www.mongodb.com/docs/manual/reference/default-mongodb-port/#std-label-default-mongodb-port)
- [`dbPath`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-storage.dbPath)
- [`systemLog.path`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-systemLog.path)
- [`pidFilePath`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-processManagement.pidFilePath)

You cannot use the MongoDB supplied SELinux policy. An alternative is to create a [custom SELinux policy](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-enterprise-on-red-hat-tarball/#std-label-install-enterprise-tarball-rhel-configure-selinux), however an improperly written custom policy may be less secure or may stop your [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) instance from working.

#### Install the SELinux Policy[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-the-selinux-policy)

1. Ensure you have the following packages installed:

   - `git`
   - `make`
   - `checkpolicy`
   - `policycoreutils`
   - `selinux-policy-devel`

   ```
   sudo yum install git make checkpolicy policycoreutils selinux-policy-devel
   ```

   

2. Download the policy repository.

   ```
   git clone https://github.com/mongodb/mongodb-selinux
   ```

   

3. Build the policy.

   ```
   cd mongodb-selinux
   make
   ```

   

4. Apply the policy.

   ```
   sudo make install
   ```

   



## IMPORTANT

### Backward-Incompatible Feature

Starting in MongoDB 5.1, you must run the following command from the directory into which the SELinux policy was previously cloned before you can downgrade to an earlier MongoDB version:

```
sudo make uninstall
```



#### SELinux Policy Considerations[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#selinux-policy-considerations)

- The SELinux policy is designed to work with the configuration that results from a standard MongoDB `.rpm` package installation. See [standard installation assumptions](https://github.com/mongodb/mongodb-selinux/blob/master/README.md#standard-installation) for more details.

- The SELinux policy is designed for [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) servers. It does not apply to other MongoDB daemons or tools such as:

  - [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos)
  - [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh)
  - [Install and Configure mongocryptd for CSFLE](https://www.mongodb.com/docs/manual/core/csfle/reference/mongocryptd/#std-label-mongocryptd)

- The [reference policy](https://github.com/SELinuxProject/refpolicy/blob/master/policy/modules/services/mongodb.if) supplied by the SELinux Project includes a `mongodb_admin` macro. This macro is not included in the MongoDB SELinux policy. An administrator in the `unconfined_t` domain can manage [`mongod`.](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod)

- To uninstall the policy, go to the directory where you downloaded the policy repository and run:

  ```
  sudo make uninstall
  ```

  

### Procedure[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#procedure)

Follow these steps to run MongoDB Community Edition on your system. These instructions assume that you are using the default settings.

**Init System**

To run and manage your [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process, you will be using your operating system's built-in [init system](https://www.mongodb.com/docs/manual/reference/glossary/#std-term-init-system). Recent versions of Linux tend to use **systemd** (which uses the `systemctl` command), while older versions of Linux tend to use **System V init** (which uses the `service` command).

If you are unsure which init system your platform uses, run the following command:

```
ps --no-headers -o comm 1
```



Then select the appropriate tab below based on the result:

- `systemd` - select the **systemd (systemctl)** tab below.
- `init` - select the **System V Init (service)** tab below.

systemd (systemctl)System V Init (service)

1

#### Start MongoDB.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#start-mongodb)

You can start the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl start mongod
```



If you receive an error similar to the following when starting [`mongod`:](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod)

```
Failed to start mongod.service: Unit mongod.service not found.
```

Run the following command first:

```
sudo systemctl daemon-reload
```



Then run the start command above again.

2

#### Verify that MongoDB has started successfully.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#verify-that-mongodb-has-started-successfully)

You can verify that the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process has started successfully by issuing the following command:

```
sudo systemctl status mongod
```



You can optionally ensure that MongoDB will start following a system reboot by issuing the following command:

```
sudo systemctl enable mongod
```



3

#### Stop MongoDB.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#stop-mongodb)

As needed, you can stop the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl stop mongod
```



4

#### Restart MongoDB.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#restart-mongodb)

You can restart the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl restart mongod
```



You can follow the state of the process for errors or important messages by watching the output in the `/var/log/mongodb/mongod.log` file.

5

#### Begin using MongoDB.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#begin-using-mongodb)

Start a [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) session on the same host machine as the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod). You can run [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) without any command-line options to connect to a [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) that is running on your localhost with default port 27017.

```
mongosh
```



For more information on connecting using [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh), such as to connect to a [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) instance running on a different host and/or port, see the [mongosh documentation.](https://www.mongodb.com/docs/mongodb-shell/)

To help you start using MongoDB, MongoDB provides [Getting Started Guides](https://www.mongodb.com/docs/manual/tutorial/getting-started/#std-label-getting-started) in various driver editions. For the driver documentation, see [Start Developing with MongoDB.](https://api.mongodb.com/)

## Uninstall MongoDB Community Edition[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#uninstall-mongodb-community-edition)

To completely remove MongoDB from a system, you must remove the MongoDB applications themselves, the configuration files, and any directories containing data and logs. The following section guides you through the necessary steps.



## WARNING

This process will *completely* remove MongoDB, its configuration, and *all* databases. This process is not reversible, so ensure that all of your configuration and data is backed up before proceeding.

1

### Stop MongoDB.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#stop-mongodb-2)

Stop the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo service mongod stop
```



2

### Remove Packages.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#remove-packages)

Remove any MongoDB packages that you had previously installed.

```
sudo yum erase $(rpm -qa | grep mongodb-org)
```



3

### Remove Data Directories.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#remove-data-directories)

Remove MongoDB databases and log files.

```
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongo
```

https://api.mongodb.com/)





### Security

# Change Your Password and Custom Data[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#change-your-password-and-custom-data)

## Overview[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#overview)

Users with appropriate privileges can change their own passwords and custom data. [`Custom data`](https://www.mongodb.com/docs/manual/reference/system-users-collection/#mongodb-data-admin.system.users.customData) stores optional user information.

## Considerations[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#considerations)

To generate a strong password for use in this procedure, you can use the `openssl` utility's `rand` command. For example, issue `openssl rand` with the following options to create a base64-encoded string of 48 pseudo-random bytes:

```
openssl rand -base64 48
```





## Prerequisites[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#prerequisites)

To modify your own password and custom data, you must have privileges that grant [`changeOwnPassword`](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnPassword) and [`changeOwnCustomData`](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnCustomData) [actions](https://www.mongodb.com/docs/manual/reference/privilege-actions/#std-label-security-user-actions) respectively on the user's database.

1

### Connect as a user with privileges to manage users and roles.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#connect-as-a-user-with-privileges-to-manage-users-and-roles)

Connect to the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) or [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos) with privileges to manage users and roles, such as a user with [`userAdminAnyDatabase`](https://www.mongodb.com/docs/manual/reference/built-in-roles/#mongodb-authrole-userAdminAnyDatabase) role. The following procedure uses the `myUserAdmin` created in [Enable Access Control.](https://www.mongodb.com/docs/manual/tutorial/enable-authentication/)

```
mongosh --port 27017 -u secrawler -p  --authenticationDatabase 'admin'
```

```ini
secrawler
```



If you do not specify the password to the [`-p`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--password) command-line option, [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) prompts for the password.

2

### Create a role with appropriate privileges.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#create-a-role-with-appropriate-privileges)

In the `admin` database, [`create`](https://www.mongodb.com/docs/manual/reference/method/db.createRole/#mongodb-method-db.createRole) a new role with [`changeOwnPassword`](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnPassword) and [`changeOwnCustomData`.](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnCustomData)

```
use admin
db.createRole(
   { role: "changeOwnPasswordCustomDataRole",
     privileges: [
        { 
          resource: { db: "", collection: ""},
          actions: [ "changeOwnPassword", "changeOwnCustomData" ]
        }
     ],
     roles: []
   }
)
```



3

### Add a user with this role.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#add-a-user-with-this-role)

In the `test` database, [`create`](https://www.mongodb.com/docs/manual/reference/method/db.createUser/#mongodb-method-db.createUser) a new user with the created `"changeOwnPasswordCustomDataRole"` role. For example, the following operation creates a user with both the built-in role [`readWrite`](https://www.mongodb.com/docs/manual/reference/built-in-roles/#mongodb-authrole-readWrite) and the user-created `"changeOwnPasswordCustomDataRole"`.



## TIP

Starting in version 4.2 of the `mongo` shell, you can use the [`passwordPrompt()`](https://www.mongodb.com/docs/manual/reference/method/passwordPrompt/#mongodb-method-passwordPrompt) method in conjunction with various user authentication/management methods/commands to prompt for the password instead of specifying the password directly in the method/command call. However, you can still specify the password directly as you would with earlier versions of the `mongo` shell.

```
use test
db.createUser(
   {
     user:"user123",
     pwd: passwordPrompt(),  // or cleartext password
     roles:[ "readWrite", { role:"changeOwnPasswordCustomDataRole", db:"admin" } ] 
   }
)
```



To grant an existing user the new role, use [`db.grantRolesToUser()`.](https://www.mongodb.com/docs/manual/reference/method/db.grantRolesToUser/#mongodb-method-db.grantRolesToUser)

## Procedure[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#procedure)

1

### Connect with the appropriate privileges.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#connect-with-the-appropriate-privileges)

Connect to the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) or [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos) as a user with appropriate privileges.

For example, the following operation connects to MongoDB as `user123` created in the [Prerequisites](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#std-label-change-own-password-prereq) section.

```
mongosh --port 27017 -u user123 --authenticationDatabase 'test' -p
```



If you do not specify the password to the [`-p`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--password) command-line option, [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) prompts for the password.

To check that you have the privileges specified in the [Prerequisites](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#std-label-change-own-password-prereq) section as well as to see user information, use the [`usersInfo`](https://www.mongodb.com/docs/manual/reference/command/usersInfo/#mongodb-dbcommand-dbcmd.usersInfo) command with the `showPrivileges` option.

2

### Change your password and custom data.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#change-your-password-and-custom-data-1)

Use the [`db.updateUser()`](https://www.mongodb.com/docs/manual/reference/method/db.updateUser/#mongodb-method-db.updateUser) method to update the password and custom data.

For example, the following operation changes the user's password to `KNlZmiaNUp0B` and custom data to `{ title: "Senior Manager" }`:



## TIP

Starting in version 4.2 of the `mongo` shell, you can use the [`passwordPrompt()`](https://www.mongodb.com/docs/manual/reference/method/passwordPrompt/#mongodb-method-passwordPrompt) method in conjunction with various user authentication/management methods/commands to prompt for the password instead of specifying the password directly in the method/command call. However, you can still specify the password directly as you would with earlier versions of the `mongo` shell.

```
use test
db.updateUser(
   "user123",
   {
      pwd: passwordPrompt(),  // or cleartext password
      customData: { title: "Senior Manager" }
   }
)
```



Enter the password when prompted.





# Connect to a Deployment[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-deployment)

This page shows how to use the MongoDB Shell to connect to a MongoDB deployment. You can connect to a [MongoDB Atlas cloud-hosted deployment](https://www.mongodb.com/docs/atlas), connect to a local deployment, or connect to another remote host with MongoDB Shell.

## Prerequisites[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#prerequisites)

To use the MongoDB Shell, you must have a MongoDB deployment to connect to.

- For a free cloud-hosted deployment, you can use [MongoDB Atlas.](https://www.mongodb.com/cloud/atlas?tck=docs_mongosh)
- To learn how to run a local MongoDB deployment, see [Install MongoDB.](https://www.mongodb.com/docs/manual/installation/)

### Supported MongoDB Versions[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#supported-mongodb-versions)

You can use the MongoDB Shell to connect to MongoDB version 4.2 or greater.

### Install `mongosh`[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#install-mongosh)

These procedures assume you have already installed `mongosh`. For more information about installing `mongosh`, refer to [Install `mongosh`.](https://www.mongodb.com/docs/mongodb-shell/install/#std-label-mdb-shell-install)

## Connect to a MongoDB Atlas Deployment[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-mongodb-atlas-deployment)

You can connect to your MongoDB Atlas deployment directly from your shell.

1

### Get your Atlas Connection String[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#get-your-atlas-connection-string)

You need an Atlas connection string to connect from MongoDB Shell. You can get the Atlas connection string in the Atlas UI.

Refer to the [Find Your MongoDB Atlas Connection String](https://www.mongodb.com/docs/manual/reference/connection-string/#find-your-mongodb-atlas-connection-string) guide for details.

2

### Set Your Database Credentials[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#set-your-database-credentials)

If you haven't already [created a database user](https://www.mongodb.com/docs/atlas/tutorial/create-mongodb-user-for-cluster/), you must set a username and password. To connect to Atlas, pass your username with the connection string. the connection string to connect to Atlas. After you issue the connect command, the shell prompts for your password.

3

### Connect to MongoDB Atlas with `mongosh`[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-mongodb-atlas-with-mongosh)

To establish your connection, run the `mongosh` command with your connection string and options to establish the connection.

The connection string includes the following elements:

- Your cluster name
- A hash
- A flag for the API version
- A flag for the username you want to use to connect

It resembles the following string:

```
mongosh "mongodb+srv://YOUR_CLUSTER_NAME.YOUR_HASH.mongodb.net/" --apiVersion YOUR_API_VERSION --username YOUR_USERNAME
```





## NOTE

### Learn More

You can use other connection security options to connect to Atlas via `mongosh`. For information on connecting with a private IP for peering or a Private Endpoint connection, refer to the [Atlas Connect via mongosh](https://www.mongodb.com/docs/atlas/mongo-shell-connection/#choose-your-connection-security) documentation.

## Connect to a Local Deployment on the Default Port[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-local-deployment-on-the-default-port)

To connect to a MongoDB deployment running on **localhost** with **default port** 27017, run `mongosh` without any options:

```
mongosh
```



This is equivalent to the following command:

```
mongosh "mongodb://localhost:27017"
```



## Connect to a Local Deployment on a Non-Default Port[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-local-deployment-on-a-non-default-port)

To specify a port to connect to on localhost, you can use either:

- A [connection string](https://www.mongodb.com/docs/manual/reference/connection-string/) with the chosen port
- The `--port` command-line option

For example, the following commands connect to a deployment running on localhost port 28015:

```
mongosh "mongodb://localhost:28015"
```



```
mongosh --port 28015
```



## Connect to a Deployment on a Remote Host[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-deployment-on-a-remote-host)

To specify a remote host and port, you can use either:

- A [connection string](https://www.mongodb.com/docs/manual/reference/connection-string/) with the chosen host and port.
- The `--host` and `--port` command-line options. If you omit the `--port` option, `mongosh` uses the default port 27017.

For example, the following commands connect to a MongoDB deployment running on host `mongodb0.example.com` and port 28015:

```
mongosh "mongodb://mongodb0.example.com:28015"
```



```
mongosh --host mongodb0.example.com --port 28015
```





## NOTE

### Connect to MongoDB Atlas

If your remote host is an Atlas cluster, you can copy your connection string from the Atlas UI. To learn more, see [Connect to a Cluster](https://www.mongodb.com/docs/atlas/connect-to-cluster/#use-the-connect-dialog-to-connect-to-your-cluster) in the Atlas documentation.

## Specify Connection Options[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#specify-connection-options)

Specify different connection options to connect to different types of deployments.

### Connect With Authentication[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-with-authentication)

To connect to a MongoDB deployment that requires authentication, use the [`--username`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--username) and [`--authenticationDatabase`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--authenticationDatabase) options. `mongosh` prompts you for a password, which it hides as you type.

For example, to authenticate as user `alice` on the `admin` database, run the following command:

```
mongosh "mongodb://mongodb0.example.com:28015" --username alice --authenticationDatabase admin
```



To provide a password as part of the connection command instead of using the prompt, use the [`--password`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--password) option. Use this option for programmatic usage of `mongosh`, like a [driver.](https://www.mongodb.com/docs/drivers/)



## TIP

### See also:

- To enforce authentication on a deployment, see [Enable Access Control.](https://www.mongodb.com/docs/manual/tutorial/enable-authentication/)
- To provision access to a MongoDB deployment, see [Database Users.](https://www.mongodb.com/docs/manual/core/security-users/)

### Connect with OpenID Connect[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-with-openid-connect)

To connect to a deployment using [OpenID Connect](https://www.mongodb.com/docs/manual/core/security-oidc/), use the [`--authenticationMechanism`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--authenticationMechanism) option and set it to `MONGODB-OIDC`. `mongosh` redirects you to a browser where you enter your identity provider's log-in information.

For example, the following connects to a local deployment using `MONGODB-OIDC`:

```
mongosh "mongodb://localhost/" --authenticationMechanism MONGODB-OIDC
```



### Connect with LDAP[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-with-ldap)

To connect to a deployment using [LDAP:](https://www.mongodb.com/docs/manual/core/security-ldap/#std-label-security-ldap)

- Set [`--username`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--username) to a username that respects the [`security.ldap.authz.queryTemplate`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-security.ldap.authz.queryTemplate), or any configured [`security.ldap.userToDNMapping`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-security.ldap.userToDNMapping) template.
- Set [`--password`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--password) to the appropriate password. If you do not specify the password to the `--password` command-line option, `mongosh` prompts you for the password.
- Set [`--authenticationDatabase`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--authenticationDatabase) to `$external`. The `$external` argument must be placed in single quotes, not double quotes, to prevent the shell from interpreting `$external` as a variable.
- Set [`--authenticationMechanism`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--authenticationMechanism) to `PLAIN`.



## WARNING

When you use one-time passwords with LDAP authentication, adding the [connection string options](https://www.mongodb.com/docs/manual/reference/connection-string/#std-label-connections-connection-options) `maxPoolSize=1&srvMaxHosts=1` to your connection string is recommended to reduce the potential for connection failures.

Include the [`--host`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--host) and [`--port`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--port) of the MongoDB deployment, along with any other options relevant to your deployment.

For example, the following operation authenticates to a MongoDB deployment running with LDAP authentication and authorization:

```
mongosh --username alice@dba.example.com --password  --authenticationDatabase '$external' --authenticationMechanism "PLAIN"  --host "mongodb.example.com" --port 27017
```



### Connect to a Replica Set[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-replica-set)

To connect to a replica set, you can either:

- Use the [DNS Seedlist Connection Format.](https://www.mongodb.com/docs/manual/reference/connection-string/#dns-seedlist-connection-format)
- Explicitly specify the replica set name and members in the connection string.

#### Option 1: DNS Seedlist Format[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#option-1--dns-seedlist-format)

To use the DNS seedlist connection format, include the `+srv` modifier in your connection string.

For example, to connect to a replica set on `server.example.com`, run the following command:

```
mongosh "mongodb+srv://server.example.com/"
```





## NOTE

### +srv TLS Behavior

When you use the `+srv` connection string modifier, MongoDB automatically sets the [`--tls`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--tls) connection option to `true`. To override this behavior, set `--tls` to `false`.

#### Option 2: Specify Members in Connection String[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#option-2--specify-members-in-connection-string)

You can specify individual replica set members in the [connection string.](https://www.mongodb.com/docs/manual/reference/connection-string/)

For example, to connect to a three-member replica set named `replA`, run the following command:

```
mongosh "mongodb://mongodb0.example.com.local:27017,mongodb1.example.com.local:27017,mongodb2.example.com.local:27017/?replicaSet=replA"
```





## NOTE

### directConnection Parameter Added Automatically

When you specify individual replica set members in the connection string, `mongosh` automatically adds the `directConnection=true` parameter, unless at least one of the following is true:

- The `replicaSet` query parameter is present in the connection string.
- The connection string uses the `mongodb+srv://` connection string format.
- The connection string contains a seed list with multiple hosts.
- The connection string already contains a `directConnection` parameter.

When `directConnection=true`, all operations are run on the host specified in the connection URI.

### Connect Using TLS[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-using-tls)

To connect to a deployment using TLS, you can either:

- Use the [DNS Seedlist Connection Format](https://www.mongodb.com/docs/manual/reference/connection-string/#dns-seedlist-connection-format). The `+srv` connection string modifier automatically sets the `tls` option to `true` for the connection.

  For example, to connect to a DNS seedlist-defined replica set with `tls` enabled, run the following command:

  ```
  mongosh "mongodb+srv://server.example.com/"
  ```

  

- Set the [`--tls`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--tls) option to `true` in the connection string.

  For example, to enable `tls` with a connection string option, run the following command:

  ```
  mongosh "mongodb://mongodb0.example.com:28015/?tls=true"
  ```

  

- Specify the `--tls` command-line option.

  For example, to connect to a remote host with `tls` enabled, run the following command:

  ```
  mongosh "mongodb://mongodb0.example.com:28015" --tls
  ```

  

### Connect to a Specific Database[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-specific-database)

To connect to a specific database, specify a database in your [connection string URI path](https://www.mongodb.com/docs/manual/reference/connection-string/). If you do not specify a database in your URI path, you connect to the `test` database.

For example, to connect to a database called `qa` on localhost, run the following command:

```
mongosh "mongodb://localhost:27017/qa"
```



## Connect to a Different Deployment[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#connect-to-a-different-deployment)

If you are already connected to a deployment in the MongoDB Shell, you can use the [`Mongo()`](https://www.mongodb.com/docs/manual/reference/method/Mongo/#mongodb-method-Mongo) or [connect()](https://www.mongodb.com/docs/manual/reference/method/connect/) method to connect to a different deployment from within the MongoDB Shell.

To learn how to connect to a different deployment using these methods, see [Open a New Connection.](https://www.mongodb.com/docs/mongodb-shell/write-scripts/#std-label-mdb-shell-open-new-connections-in-shell)

## Verify Current Connection[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#verify-current-connection)

To verify your current database connection, use the [`db.getMongo()`](https://www.mongodb.com/docs/manual/reference/method/db.getMongo/#mongodb-method-db.getMongo) method.

The method returns the [connection string URI](https://www.mongodb.com/docs/manual/reference/connection-string/) for your current connection.

## Disconnect from a Deployment[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#disconnect-from-a-deployment)

To disconnect from a deployment and exit `mongosh`, perform one of the following actions:

- Type `.exit`, `exit`, or `exit()`.
- Type `quit` or `quit()`.
- Press `Ctrl` + `D`.
- Press `Ctrl` + `C` twice.



## Non-genuine Deployments[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#non-genuine-deployments)

The shell displays a warning message when you connect to non-genuine MongoDB instances. Non-genuine instances may behave differently from the official MongoDB instances due to missing, inconsistent, or incomplete features.

## Limitations[![img](https://www.mongodb.com/docs/mongodb-shell/assets/link.svg)](https://www.mongodb.com/docs/mongodb-shell/connect/#limitations)

- [Kerberos authentication](https://www.mongodb.com/docs/manual/core/kerberos/) does not allow `authMechanismProperties=CANONICALIZE_HOST_NAME:true|false` in the connection string. Instead, use either:

  - `authMechanismProperties=CANONICALIZE_HOST_NAME:forward`
  - `authMechanismProperties=CANONICALIZE_HOST_NAME:forwardAndReverse`
  - `authMechanismProperties=CANONICALIZE_HOST_NAME:none`

- `mongosh` currently only supports the `zlib` [compressor](https://www.mongodb.com/docs/manual/core/wiredtiger/#compression). The following compressors are not supported:

  - `zstd`
  - `snappy`

- Starting in `mongosh` 2.0.0:

  For boolean values in [connection strings](https://www.mongodb.com/docs/manual/reference/connection-string/), you:

  - must use `true` or `false`.
  - cannot use `1`, `y`, `yes`, or `t` instead of `true`.
  - cannot use `-1`, `0`, `n`, `no`, or `f` instead of `false`.