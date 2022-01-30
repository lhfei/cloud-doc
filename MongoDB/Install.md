# Install MongoDB Community Edition on Red Hat or CentOS[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition-on-red-hat-or-centos)

NOTE

MongoDB Atlas

[MongoDB Atlas](https://www.mongodb.com/cloud/atlas?tck=docs_server) is a hosted MongoDB service option in the cloud which requires no installation overhead and offers a free tier to get started.

## Overview[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#overview)

Use this tutorial to install MongoDB 5.0 Community Edition on Red Hat Enterprise Linux, CentOS Linux, or Oracle Linux [[1\]](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#footnote-oracle-linux) using the `yum` package manager.

### MongoDB Version[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#mongodb-version)

This tutorial installs MongoDB 5.0 Community Edition. To install a different version of MongoDB Community, use the version drop-down menu in the upper-left corner of this page to select the documentation for that version.

## Considerations[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#considerations)

### Platform Support[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#platform-support)

NOTE

EOL Notice

- MongoDB 5.0 Community Edition removes support for RHEL / CentOS / Oracle 6 on [x86_64](https://docs.mongodb.com/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-x86_64)
- MongoDB 5.0 Community Edition removes support for RHEL / CentOS / Oracle 7 on [s390x](https://docs.mongodb.com/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-s390x)

MongoDB 5.0 Community Edition supports the following **64-bit** versions of Red Hat Enterprise Linux (RHEL), CentOS Linux, and Oracle Linux [[1\]](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#footnote-oracle-linux) on [x86_64](https://docs.mongodb.com/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-x86_64) architecture:

- RHEL / CentOS / Oracle 8
- RHEL / CentOS / Oracle 7
- RHEL / CentOS / Oracle 6

MongoDB only supports the 64-bit versions of these platforms.

MongoDB 5.0 Community Edition on RHEL / CentOS / Oracle also supports the [ARM64](https://docs.mongodb.com/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-ARM64) architecture on select platforms.

See [Supported Platforms](https://docs.mongodb.com/manual/administration/production-notes/#std-label-prod-notes-supported-platforms) for more information.

| [1]  | *([1](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#ref-oracle-linux-id1), [2](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#ref-oracle-linux-id1))* MongoDB only supports Oracle Linux running the Red Hat Compatible Kernel (RHCK). MongoDB does **not** support the Unbreakable Enterprise Kernel (UEK). |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

NOTE

Windows Subsystem for Linux (WSL) Support

To run MongoDB in Windows Subsystem for Linux (WSL), refer to the [WSL documentation](https://docs.microsoft.com/windows/wsl/tutorials/wsl-database#install-mongodb).

### Production Notes[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#production-notes)

Before deploying MongoDB in a production environment, consider the [Production Notes](https://docs.mongodb.com/manual/administration/production-notes/) document which offers performance considerations and configuration recommendations for production MongoDB deployments.



## Install MongoDB Community Edition[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition)

Follow these steps to install MongoDB Community Edition using the `yum` package manager.

1

### Configure the package management system (`yum`).[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#configure-the-package-management-system-yum)

Create a `/etc/yum.repos.d/mongodb-org-5.0.repo` file so that you can install MongoDB directly using `yum`:

```
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc
```



You can also download the `.rpm` files directly from the [MongoDB repository](https://repo.mongodb.org/yum/redhat/). Downloads are organized by Red Hat / CentOS version (e.g. `7`), then MongoDB [release version](https://docs.mongodb.com/manual/reference/versioning/) (e.g. `5.0`), then architecture (e.g. `x86_64`).

Prior to MongoDB 5.0, odd-numbered MongoDB release versions, such as `4.3`, were development releases. Beginning with MongoDB 5.1, MongoDB has quarterly rapid releases. For more information on the differences between rapid and long-term support releases, see [MongoDB Versioning](https://docs.mongodb.com/manual/reference/versioning/#std-label-release-version-numbers).

2

### Install the MongoDB packages.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#install-the-mongodb-packages)

To install the latest stable version of MongoDB, issue the following command:

```
sudo yum install -y mongodb-org
```



Alternatively, to install a specific release of MongoDB, specify each component package individually and append the version number to the package name, as in the following example:

```
sudo yum install -y mongodb-org-5.0.5 mongodb-org-database-5.0.5 mongodb-org-server-5.0.5 mongodb-org-shell-5.0.5 mongodb-org-mongos-5.0.5 mongodb-org-tools-5.0.5
```



You can specify any available version of MongoDB. However `yum` upgrades the packages when a newer version becomes available. To prevent unintended upgrades, pin the package. To pin a package, add the following `exclude` directive to your `/etc/yum.conf` file:

```
exclude=mongodb-org,mongodb-org-database,mongodb-org-server,mongodb-org-shell,mongodb-org-mongos,mongodb-org-tools
```



## Run MongoDB Community Edition[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#run-mongodb-community-edition)

### Prerequisites[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#prerequisites)

#### ulimit[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#ulimit)

Most Unix-like operating systems limit the system resources that a process may use. These limits may negatively impact MongoDB operation, and should be adjusted. See [UNIX `ulimit` Settings](https://docs.mongodb.com/manual/reference/ulimit/) for the recommended settings for your platform.

NOTE

Starting in MongoDB 4.4, a startup error is generated if the `ulimit` value for number of open files is under `64000`.

#### Directory Paths[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#directory-paths)

##### To Use Default Directories[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#to-use-default-directories)

By default, MongoDB runs using the `mongod` user account and uses the following default directories:

- `/var/lib/mongo` (the data directory)
- `/var/log/mongodb` (the log directory)

The package manager creates the default directories during installation. The owner and group name are `mongod`.

##### To Use Non-Default Directories[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#to-use-non-default-directories)

To use a data directory and/or log directory other than the default directories:

1. Create the new directory or directories.

2. Edit the configuration file `/etc/mongod.conf` and modify the following fields accordingly:

   - [`storage.dbPath`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-storage.dbPath) to specify a new data directory path (e.g. `/some/data/directory`)
   - [`systemLog.path`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-systemLog.path) to specify a new log file path (e.g. `/some/log/directory/mongod.log`)

3. Ensure that the user running MongoDB has access to the directory or directories:

   ```
   sudo chown -R mongod:mongod <directory>
   ```

   

   If you change the user that runs the MongoDB process, you **must** give the new user access to these directories.

4. Configure SELinux if enforced. See [Configure SELinux](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#std-label-install-rhel-configure-selinux).



#### Configure SELinux[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#configure-selinux)

IMPORTANT

If SELinux is in `enforcing` mode, you must customize your SELinux policy for MongoDB by making the following two policy adjustments:

##### Permit Access to `cgroup`[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#permit-access-to-cgroup)

The current SELinux Policy does not allow the MongoDB process to access `/sys/fs/cgroup`, which is required to determine the available memory on your system. If you intend to run SELinux in `enforcing` mode, you will need to make the following adjustment to your SELinux policy:

1. Ensure your system has the `checkpolicy` package installed:

   ```
   sudo yum install checkpolicy
   ```

   

2. Create a custom policy file `mongodb_cgroup_memory.te`:

   ```
   cat > mongodb_cgroup_memory.te <<EOF
   module mongodb_cgroup_memory 1.0;
   
   require {
         type cgroup_t;
         type mongod_t;
         class dir search;
         class file { getattr open read };
   }
   
   #============= mongod_t ==============
   allow mongod_t cgroup_t:dir search;
   allow mongod_t cgroup_t:file { getattr open read };
   EOF
   ```

   

3. Once created, compile and load the custom policy module by running these three commands:

   ```
   checkmodule -M -m -o mongodb_cgroup_memory.mod mongodb_cgroup_memory.te
   semodule_package -o mongodb_cgroup_memory.pp -m mongodb_cgroup_memory.mod
   sudo semodule -i mongodb_cgroup_memory.pp
   ```

   

The MongoDB process is now able to access the correct files with SELinux set to `enforcing`.

##### Permit Access to `netstat` for FTDC[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#permit-access-to-netstat-for-ftdc)

The current SELinux Policy does not allow the MongoDB process to open and read `/proc/net/netstat`, which is required for [Full Time Diagnostic Data Capture (FTDC)](https://docs.mongodb.com/manual/administration/analyzing-mongodb-performance/#std-label-ftdc-stub). If you intend to run SELinux in `enforcing` mode, you will need to make the following adjustment to your SELinux policy:

1. Ensure your system has the `checkpolicy` package installed:

   ```
   sudo yum install checkpolicy
   ```

   

2. Create a custom policy file `mongodb_proc_net.te`:

   ```
   cat > mongodb_proc_net.te <<EOF
   module mongodb_proc_net 1.0;
   
   require {
           type sysctl_net_t;
           type mongod_t;
           class dir search;
           class file { getattr open read };
   }
   
   #============= mongod_t ==============
   
   #!!!! This avc is allowed in the current policy
   allow mongod_t sysctl_net_t:dir search;
   allow mongod_t sysctl_net_t:file open;
   
   #!!!! This avc is allowed in the current policy
   allow mongod_t sysctl_net_t:file { getattr read };
   EOF
   ```

   

3. Once created, compile and load the custom policy module by running these three commands:

   ```
   checkmodule -M -m -o mongodb_proc_net.mod mongodb_proc_net.te
   semodule_package -o mongodb_proc_net.pp -m mongodb_proc_net.mod
   sudo semodule -i mongodb_proc_net.pp
   ```

   

IMPORTANT

In addition to the above, you will also need to further customize your SELinux policy in the following two cases if SELinux is in `enforcing` mode:

- You are using a **custom directory path** instead of using the default [`dbPath`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-storage.dbPath), [`systemLog.path`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-systemLog.path), or [`pidFilePath`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-processManagement.pidFilePath) in RHEL 7.0 or later, and/or
- You are using a **custom port** instead of using the [default MongoDB ports](https://docs.mongodb.com/manual/reference/default-mongodb-port/).

##### Using a Custom MongoDB Directory Path[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#using-a-custom-mongodb-directory-path)

1. Update the SELinux policy to allow the `mongod` service to use the new directory:

   ```
   sudo semanage fcontext -a -t <type> </some/MongoDB/directory.*>
   ```

   

   where specify one of the following types as appropriate:

   - `mongod_var_lib_t` for data directory
   - `mongod_log_t` for log file directory
   - `mongod_var_run_t` for pid file directory

   NOTE

   Be sure to include the `.*` at the end of the directory.

2. Update the SELinux user policy for the new directory:

   ```
   sudo chcon -Rv -u system_u -t <type> </some/MongoDB/directory>
   ```

   

   where specify one of the following types as appropriate:

   - `mongod_var_lib_t` for data directory
   - `mongod_log_t` for log directory
   - `mongod_var_run_t` for pid file directory

3. Apply the updated SELinux policies to the directory:

   ```
   sudo restorecon -R -v </some/MongoDB/directory>
   ```

   

For example:

TIP

Be sure to include the `.*` at the end of the directory for the `semanage fcontext` operations.

- If using a non-default MongoDB data path of `/mongodb/data`:

  ```
  sudo semanage fcontext -a -t mongod_var_lib_t '/mongodb/data.*'
  sudo chcon -Rv -u system_u -t mongod_var_lib_t '/mongodb/data'
  sudo restorecon -R -v '/mongodb/data'
  ```

  

- If using a non-default MongoDB log directory of `/mongodb/log` (e.g. if the log file path is `/mongodb/log/mongod.log`):

  ```
  sudo semanage fcontext -a -t mongod_log_t '/mongodb/log.*'
  sudo chcon -Rv -u system_u -t mongod_log_t '/mongodb/log'
  sudo restorecon -R -v '/mongodb/log'
  ```

  

##### Using a Custom MongoDB Port[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#using-a-custom-mongodb-port)

```
sudo semanage port -a -t mongod_port_t -p tcp <portnumber>
```



NOTE

You might need to restart [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) for the custom port to be recognized.

### Procedure[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#procedure)

Follow these steps to run MongoDB Community Edition on your system. These instructions assume that you are using the default settings.

**Init System**

To run and manage your [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process, you will be using your operating system's built-in [init system](https://docs.mongodb.com/manual/reference/glossary/#std-term-init-system). Recent versions of Linux tend to use **systemd** (which uses the `systemctl` command), while older versions of Linux tend to use **System V init** (which uses the `service` command).

If you are unsure which init system your platform uses, run the following command:

```
ps --no-headers -o comm 1
```



Then select the appropriate tab below based on the result:

- `systemd` - select the **systemd (systemctl)** tab below.
- `init` - select the **System V Init (service)** tab below.

systemd (systemctl)System V Init (service)

1

#### Start MongoDB.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#start-mongodb)

You can start the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl start mongod
```



If you receive an error similar to the following when starting [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod):

```
Failed to start mongod.service: Unit mongod.service not found.
```

Run the following command first:

```
sudo systemctl daemon-reload
```



Then run the start command above again.

2

#### Verify that MongoDB has started successfully.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#verify-that-mongodb-has-started-successfully)

You can verify that the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process has started successfully by issuing the following command:

```
sudo systemctl status mongod
```



You can optionally ensure that MongoDB will start following a system reboot by issuing the following command:

```
sudo systemctl enable mongod
```



3

#### Stop MongoDB.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#stop-mongodb)

As needed, you can stop the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl stop mongod
```



4

#### Restart MongoDB.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#restart-mongodb)

You can restart the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl restart mongod
```



You can follow the state of the process for errors or important messages by watching the output in the `/var/log/mongodb/mongod.log` file.

5

#### Begin using MongoDB.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#begin-using-mongodb)

Start a [`mongosh`](https://docs.mongodb.com/mongodb-shell/#mongodb-binary-bin.mongosh) session on the same host machine as the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod). You can run [`mongosh`](https://docs.mongodb.com/mongodb-shell/#mongodb-binary-bin.mongosh) without any command-line options to connect to a [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) that is running on your localhost with default port 27017.

```
mongosh
```



For more information on connecting using [`mongosh`](https://docs.mongodb.com/mongodb-shell/#mongodb-binary-bin.mongosh), such as to connect to a [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) instance running on a different host and/or port, see the [mongosh documentation](https://docs.mongodb.com/mongodb-shell/).

To help you start using MongoDB, MongoDB provides [Getting Started Guides](https://docs.mongodb.com/manual/tutorial/getting-started/#std-label-getting-started) in various driver editions. For the driver documentation, see [Start Developing with MongoDB](https://api.mongodb.com/).

## Uninstall MongoDB Community Edition[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#uninstall-mongodb-community-edition)

To completely remove MongoDB from a system, you must remove the MongoDB applications themselves, the configuration files, and any directories containing data and logs. The following section guides you through the necessary steps.

WARNING

This process will *completely* remove MongoDB, its configuration, and *all* databases. This process is not reversible, so ensure that all of your configuration and data is backed up before proceeding.

1

### Stop MongoDB.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#stop-mongodb-2)

Stop the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo service mongod stop
```



2

### Remove Packages.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#remove-packages)

Remove any MongoDB packages that you had previously installed.

```
sudo yum erase $(rpm -qa | grep mongodb-org)
```



3

### Remove Data Directories.[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#remove-data-directories)

Remove MongoDB databases and log files.

```
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongo
```



## Additional Information[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#additional-information)

### Localhost Binding by Default[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#localhost-binding-by-default)

By default, MongoDB launches with [`bindIp`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-net.bindIp) set to `127.0.0.1`, which binds to the localhost network interface. This means that the `mongod` can only accept connections from clients that are running on the same machine. Remote clients will not be able to connect to the `mongod`, and the `mongod` will not be able to initialize a [replica set](https://docs.mongodb.com/manual/reference/glossary/#std-term-replica-set) unless this value is set to a valid network interface.

This value can be configured either:

- in the MongoDB configuration file with [`bindIp`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-net.bindIp), or
- via the command-line argument [`--bind_ip`](https://docs.mongodb.com/manual/reference/program/mongod/#std-option-mongod.--bind_ip)

WARNING

Before binding to a non-localhost (e.g. publicly accessible) IP address, ensure you have secured your cluster from unauthorized access. For a complete list of security recommendations, see [Security Checklist](https://docs.mongodb.com/manual/administration/security-checklist/). At minimum, consider [enabling authentication](https://docs.mongodb.com/manual/administration/security-checklist/#std-label-checklist-auth) and [hardening network infrastructure](https://docs.mongodb.com/manual/core/security-hardening/).

For more information on configuring [`bindIp`](https://docs.mongodb.com/manual/reference/configuration-options/#mongodb-setting-net.bindIp), see [IP Binding](https://docs.mongodb.com/manual/core/security-mongodb-configuration/).

### MongoDB Community Edition Packages[![icons/link.png](https://docs.mongodb.com/manual/assets/link.png)](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/#mongodb-community-edition-packages)

MongoDB Community Edition is available from its own dedicated repository, and contains the following officially-supported packages:

| Package Name           | Description                                                  |
| :--------------------- | :----------------------------------------------------------- |
| `mongodb-org`          | A `metapackage` that automatically installs the component packages listed below. |
| `mongodb-org-database` | A `metapackage` that automatically installs the component packages listed below.Package NameDescription`mongodb-org-server`Contains the [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) daemon, associated init script, and a [configuration file](https://docs.mongodb.com/manual/reference/configuration-options/#std-label-conf-file) (`/etc/mongod.conf`). You can use the initialization script to start [`mongod`](https://docs.mongodb.com/manual/reference/program/mongod/#mongodb-binary-bin.mongod) with the configuration file. For details, see the "Run MongoDB Community Edition" section, above.`mongodb-org-mongos`Contains the [`mongos`](https://docs.mongodb.com/manual/reference/program/mongos/#mongodb-binary-bin.mongos) daemon.`mongodb-org-shell`Contains the legacy [`mongo`](https://docs.mongodb.com/manual/reference/program/mongo/#mongodb-binary-bin.mongo) shell. |
| `mongodb-mongosh`      | Contains the MongoDB Shell ([`mongosh`](https://docs.mongodb.com/mongodb-shell/#mongodb-binary-bin.mongosh)). |
| `mongodb-org-tools`    | A `metapackage` that automatically installs the component packages listed below:Package NameDescription`mongodb-database-tools`Contains the following MongoDB database tools:[`mongodump`](https://docs.mongodb.com/database-tools/mongodump/#mongodb-binary-bin.mongodump)[`mongorestore`](https://docs.mongodb.com/database-tools/mongorestore/#mongodb-binary-bin.mongorestore)[`bsondump`](https://docs.mongodb.com/database-tools/bsondump/#mongodb-binary-bin.bsondump)[`mongoimport`](https://docs.mongodb.com/database-tools/mongoimport/#mongodb-binary-bin.mongoimport)[`mongoexport`](https://docs.mongodb.com/database-tools/mongoexport/#mongodb-binary-bin.mongoexport)[`mongostat`](https://docs.mongodb.com/database-tools/mongostat/#mongodb-binary-bin.mongostat)[`mongotop`](https://docs.mongodb.com/database-tools/mongotop/#mongodb-binary-bin.mongotop)[`mongofiles`](https://docs.mongodb.com/database-tools/mongofiles/#mongodb-binary-bin.mongofiles)`mongodb-org-database-tools-extra`Contains the [`install_compass`](https://docs.mongodb.com/manual/reference/program/install_compass/#std-label-install-compass) script |