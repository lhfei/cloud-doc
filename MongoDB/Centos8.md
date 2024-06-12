# Install MongoDB Community Edition on Red Hat or CentOS[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition-on-red-hat-or-centos)



## NOTE

### MongoDB Atlas

[MongoDB Atlas](https://www.mongodb.com/atlas/database?tck=docs_server) is a hosted MongoDB service option in the cloud which requires no installation overhead and offers a free tier to get started.

## Overview[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#overview)

Use this tutorial to install MongoDB 7.0 Community Edition on Red Hat Enterprise Linux, CentOS Linux, or Oracle Linux [[1\]](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#footnote-oracle-linux) using the `yum` package manager.

### MongoDB Version[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#mongodb-version)

This tutorial installs MongoDB 7.0 Community Edition. To install a different version of MongoDB Community, use the version drop-down menu in the upper-left corner of this page to select the documentation for that version.

## Considerations[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#considerations)

### Platform Support[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#platform-support)

MongoDB 7.0 Community Edition supports the following **64-bit** versions of Red Hat Enterprise Linux (RHEL), CentOS Linux, Oracle Linux [[1\]](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#footnote-oracle-linux), Rocky Linux, and AlmaLinux [[2\]](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#footnote-rocky-almalinux-note) on [x86_64](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-x86_64) architecture:

- RHEL / CentOS Stream / Oracle / Rocky / AlmaLinux 9
- RHEL / CentOS Stream / Oracle / Rocky / AlmaLinux 8
- RHEL / CentOS / Oracle 7

MongoDB only supports the 64-bit versions of these platforms.

MongoDB 7.0 Community Edition on RHEL / CentOS / Oracle / Rocky / AlmaLinux also supports the [ARM64](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-ARM64) architecture on select platforms.

See [Platform Support](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms) for more information.

| [1]  | *([1](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#ref-oracle-linux-id1), [2](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#ref-oracle-linux-id1))* MongoDB only supports Oracle Linux running the Red Hat Compatible Kernel (RHCK). MongoDB does **not** support the Unbreakable Enterprise Kernel (UEK). |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

| [[2](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#ref-rocky-almalinux-note-id2)] | MongoDB on-premises products released for RHEL version 8.0+ are compatible with and supported on Rocky Linux version 8.0+ and AlmaLinux version 8.0+, contingent upon those distributions meeting their obligation to deliver full RHEL compatibility. |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |

### Production Notes[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#production-notes)

Before deploying MongoDB in a production environment, consider the [Production Notes](https://www.mongodb.com/docs/manual/administration/production-notes/) document which offers performance considerations and configuration recommendations for production MongoDB deployments.



## Install MongoDB Community Edition[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#install-mongodb-community-edition)

Follow these steps to install MongoDB Community Edition using the `yum` package manager.

1

### Configure the package management system (`yum`).[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#configure-the-package-management-system-yum)

Create a `/etc/yum.repos.d/mongodb-org-7.0.repo` file so that you can install MongoDB directly using `yum`:

987

```
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-7.0.asc
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
sudo yum install -y mongodb-org-7.0.7 mongodb-org-database-7.0.7 mongodb-org-server-7.0.7 mongodb-mongosh-7.0.7 mongodb-org-mongos-7.0.7 mongodb-org-tools-7.0.7
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

If the `ulimit` value for number of open files is under `64000`, MongoDB generates a startup warning.

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



## Additional Information[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#additional-information)

### Localhost Binding by Default[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#localhost-binding-by-default)

By default, MongoDB launches with [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp) set to `127.0.0.1`, which binds to the localhost network interface. This means that the `mongod` can only accept connections from clients that are running on the same machine. Remote clients will not be able to connect to the `mongod`, and the `mongod` will not be able to initialize a [replica set](https://www.mongodb.com/docs/manual/reference/glossary/#std-term-replica-set) unless this value is set to a valid network interface which is accessible from the remote clients.

This value can be configured either:

- in the MongoDB configuration file with [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp), or
- via the command-line argument [`--bind_ip`](https://www.mongodb.com/docs/manual/reference/program/mongod/#std-option-mongod.--bind_ip)



## WARNING

Before you bind your instance to a publicly-accessible IP address, you must secure your cluster from unauthorized access. For a complete list of security recommendations, see [Security Checklist](https://www.mongodb.com/docs/manual/administration/security-checklist/#std-label-security-checklist). At minimum, consider [enabling authentication](https://www.mongodb.com/docs/manual/administration/security-checklist/#std-label-checklist-auth) and [hardening network infrastructure.](https://www.mongodb.com/docs/manual/core/security-hardening/#std-label-network-config-hardening)

For more information on configuring [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp), see [IP Binding.](https://www.mongodb.com/docs/manual/core/security-mongodb-configuration/)

### MongoDB Community Edition Packages[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-red-hat/#mongodb-community-edition-packages)

MongoDB Community Edition is available from its own dedicated repository, and contains the following officially-supported packages:

| Package Name           | Description                                                  |
| :--------------------- | :----------------------------------------------------------- |
| `mongodb-org`          | A `metapackage` that automatically installs the component packages listed below. |
| `mongodb-org-database` | A `metapackage` that automatically installs the component packages listed below.Package NameDescription`mongodb-org-server`Contains the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) daemon, associated init script, and a [configuration file](https://www.mongodb.com/docs/manual/reference/configuration-options/#std-label-conf-file) (`/etc/mongod.conf`). You can use the initialization script to start [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) with the configuration file. For details, see the "Run MongoDB Community Edition" section, above.`mongodb-org-mongos`Contains the [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos) daemon. |
| `mongodb-mongosh`      | Contains the MongoDB Shell ([`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh)). |
| `mongodb-org-tools`    | A `metapackage` that automatically installs the component packages listed below:Package NameDescription`mongodb-database-tools`Contains the following MongoDB database tools:[`mongodump`](https://www.mongodb.com/docs/database-tools/mongodump/#mongodb-binary-bin.mongodump)[`mongorestore`](https://www.mongodb.com/docs/database-tools/mongorestore/#mongodb-binary-bin.mongorestore)[`bsondump`](https://www.mongodb.com/docs/database-tools/bsondump/#mongodb-binary-bin.bsondump)[`mongoimport`](https://www.mongodb.com/docs/database-tools/mongoimport/#mongodb-binary-bin.mongoimport)[`mongoexport`](https://www.mongodb.com/docs/database-tools/mongoexport/#mongodb-binary-bin.mongoexport)[`mongostat`](https://www.mongodb.com/docs/database-tools/mongostat/#mongodb-binary-bin.mongostat)[`mongotop`](https://www.mongodb.com/docs/database-tools/mongotop/#mongodb-binary-bin.mongotop)[`mongofiles`](https://www.mongodb.com/docs/database-tools/mongofiles/#mongodb-binary-bin.mongofiles)`mongodb-org-database-tools-extra`Contains the [`install_compass`](https://www.mongodb.com/docs/manual/reference/program/install_compass/#std-label-install-compass) script |