### [Install](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)

# Install MongoDB Community Edition on Ubuntu

## Overview

Use this tutorial to install MongoDB 8.0 Community Edition on LTS (long-term support) releases of Ubuntu Linux using the `apt` package manager.

### MongoDB Version

This tutorial installs MongoDB 8.0 Community Edition. To install a different version of MongoDB Community, use the version drop-down menu in the upper-left corner of this page to select the documentation for that version.

## Considerations

### Platform Support

MongoDB 8.0 Community Edition supports the following **64-bit** Ubuntu LTS (long-term support) releases on [x86_64](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-x86_64) architecture:

- 24.04 LTS ("Noble")
- 22.04 LTS ("Jammy")
- 20.04 LTS ("Focal")

MongoDB only supports the 64-bit versions of these platforms. To determine which Ubuntu release your host is running, run the following command on the host's terminal:

```
cat /etc/lsb-release
```

MongoDB 8.0 Community Edition on Ubuntu also supports the [ARM64](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms-ARM64) architecture on select platforms.

See [Platform Support](https://www.mongodb.com/docs/manual/administration/production-notes/#std-label-prod-notes-supported-platforms) for more information.

### Production Notes

Before deploying MongoDB in a production environment, consider the [Production Notes for Self-Managed Deployments](https://www.mongodb.com/docs/manual/administration/production-notes/) document which offers performance considerations and configuration recommendations for production MongoDB deployments.

### Official MongoDB Packages

To install MongoDB Community on your Ubuntu system, these instructions will use the official `mongodb-org` package, which is maintained and supported by MongoDB Inc. The official `mongodb-org` package always contains the latest version of MongoDB, and is available from its own dedicated repo.

## Important

The `mongodb` package provided by Ubuntu is **not** maintained by MongoDB Inc. and conflicts with the official `mongodb-org` package. If you have already installed the `mongodb` package on your Ubuntu system, you **must** first uninstall the `mongodb` package before proceeding with these instructions.

See [MongoDB Community Edition Packages](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/#std-label-ubuntu-package-content) for the complete list of official packages.



## Install MongoDB Community Edition

Follow these steps to install MongoDB Community Edition using the `apt` package manager.

1

### Import the Public Key

From a terminal, install `gnupg` and `curl` if they are not already available:

```
sudo apt-get install gnupg curl
```

To import the MongoDB public GPG key, run the following command:

```
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor
```

2

### Create the List File

Create the list file `/etc/apt/sources.list.d/mongodb-org-8.0.list` for your version of Ubuntu.

Create the list file for Ubuntu 24.04 (Noble):

```
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
```

3

### Reload the Package Database

Issue the following command to reload the local package database:

```
sudo apt-get update
```

4

### Install MongoDB Community Server

You can install either the latest stable version of MongoDB or a specific version of MongoDB.

To install the latest stable version, issue the following

```
sudo apt-get install -y mongodb-org
```

For help with troubleshooting errors encountered while installing MongoDB on Ubuntu, see our [troubleshooting](https://www.mongodb.com/docs/manual/reference/installation-ubuntu-community-troubleshooting/#std-label-install-ubuntu-troubleshooting) guide.

## Run MongoDB Community Edition

### ulimit Considerations

Most Unix-like operating systems limit the system resources that a process may use. These limits may negatively impact MongoDB operation, and should be adjusted. See [UNIX `ulimit` Settings for Self-Managed Deployments](https://www.mongodb.com/docs/manual/reference/ulimit/) for the recommended settings for your platform.

## Note

If the `ulimit` value for number of open files is under `64000`, MongoDB generates a startup warning.

### Directories

If you installed through the package manager, the data directory `/var/lib/mongodb` and the log directory `/var/log/mongodb` are created during the installation.

By default, MongoDB runs using the `mongodb` user account. If you change the user that runs the MongoDB process, you **must** also modify the permission to the data and log directories to give this user access to these directories.

### Configuration File

The official MongoDB package includes a [configuration file](https://www.mongodb.com/docs/manual/reference/configuration-options/#std-label-conf-file) (`/etc/mongod.conf`). These settings (such as the data directory and log directory specifications) take effect upon startup. That is, if you change the configuration file while the MongoDB instance is running, you must restart the instance for the changes to take effect.

### Procedure

Follow these steps to run MongoDB Community Edition on your system. These instructions assume that you are using the official `mongodb-org` package -- not the unofficial `mongodb` package provided by Ubuntu -- and are using the default settings.

**Init System**

To run and manage your [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process, you will be using your operating system's built-in [init system](https://www.mongodb.com/docs/manual/reference/glossary/#std-term-init-system). Recent versions of Linux tend to use **systemd** (which uses the `systemctl` command), while older versions of Linux tend to use **System V init** (which uses the `service` command).

If you are unsure which init system your platform uses, run the following command:

```
ps --no-headers -o comm 1
```

Then select the appropriate tab below based on the result:

- `systemd` - select the **systemd (systemctl)** tab below.
- `init` - select the **System V Init (service)** tab below.

1

#### Start MongoDB.

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

#### Verify that MongoDB has started successfully.

```
sudo systemctl status mongod
```

You can optionally ensure that MongoDB will start following a system reboot by issuing the following command:

```
sudo systemctl enable mongod
```

3

#### Stop MongoDB.

As needed, you can stop the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl stop mongod
```

4

#### Restart MongoDB.

You can restart the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo systemctl restart mongod
```

You can follow the state of the process for errors or important messages by watching the output in the `/var/log/mongodb/mongod.log` file.

5

#### Begin using MongoDB.

Start a [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) session on the same host machine as the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod). You can run [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) without any command-line options to connect to a [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) that is running on your localhost with default port 27017.

```
mongosh
```

For more information on connecting using [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh), such as to connect to a [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) instance running on a different host and/or port, see the [mongosh documentation.](https://www.mongodb.com/docs/mongodb-shell/)

To help you start using MongoDB, MongoDB provides [Getting Started Guides](https://www.mongodb.com/docs/manual/tutorial/getting-started/#std-label-getting-started) in various driver editions. For the driver documentation, see [Start Developing with MongoDB.](https://api.mongodb.com/)

## Uninstall MongoDB Community Edition

To completely remove MongoDB from a system, you must remove the MongoDB applications themselves, the configuration files, and any directories containing data and logs. The following section guides you through the necessary steps.

## Warning

This process will *completely* remove MongoDB, its configuration, and *all* databases. This process is not reversible, so ensure that all of your configuration and data is backed up before proceeding.

1

### Stop MongoDB.

Stop the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) process by issuing the following command:

```
sudo service mongod stop
```

2

### Remove Packages.

Remove any MongoDB packages that you had previously installed.

```
sudo apt-get purge mongodb-org*
```

3

### Remove Data Directories.

Remove MongoDB databases and log files.

```
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
```

## Additional Information

### Localhost Binding by Default

By default, MongoDB launches with [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp) set to `127.0.0.1`, which binds to the localhost network interface. This means that the `mongod` can only accept connections from clients that are running on the same machine. Remote clients will not be able to connect to the `mongod`, and the `mongod` will not be able to initialize a [replica set](https://www.mongodb.com/docs/manual/reference/glossary/#std-term-replica-set) unless this value is set to a valid network interface.

This value can be configured either:

- in the MongoDB configuration file with [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp), or
- via the command-line argument [`--bind_ip`](https://www.mongodb.com/docs/manual/reference/program/mongod/#std-option-mongod.--bind_ip)

## Warning

Before you bind your instance to a publicly-accessible IP address, you must secure your cluster from unauthorized access. For a complete list of security recommendations, see [Security Checklist for Self-Managed Deployments](https://www.mongodb.com/docs/manual/administration/security-checklist/#std-label-security-checklist). At minimum, consider [enabling authentication](https://www.mongodb.com/docs/manual/administration/security-checklist/#std-label-checklist-auth) and [hardening network infrastructure.](https://www.mongodb.com/docs/manual/core/security-hardening/#std-label-network-config-hardening)

For more information on configuring [`bindIp`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-net.bindIp), see [IP Binding in Self-Managed Deployments.](https://www.mongodb.com/docs/manual/core/security-mongodb-configuration/)



### MongoDB Community Edition Packages

MongoDB Community Edition is available from its own dedicated repository, and contains the following officially-supported packages:

| Package Name           | Description                                                  |
| :--------------------- | :----------------------------------------------------------- |
| `mongodb-org`          | A `metapackage` that automatically installs the component packages listed below. |
| `mongodb-org-database` | A `metapackage` that automatically installs the component packages listed below.Package NameDescription`mongodb-org-server`Contains the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) daemon, associated init script, and a [configuration file](https://www.mongodb.com/docs/manual/reference/configuration-options/#std-label-conf-file) (`/etc/mongod.conf`). You can use the initialization script to start [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) with the configuration file. For details, see the "Run MongoDB Community Edition" section, above.`mongodb-org-mongos`Contains the [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos) daemon. |
| `mongodb-mongosh`      | Contains the MongoDB Shell ([`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh)). |
| `mongodb-org-tools`    | A `metapackage` that automatically installs the component packages listed below:Package NameDescription`mongodb-database-tools`Contains the following MongoDB database tools:[`mongodump`](https://www.mongodb.com/docs/database-tools/mongodump/#mongodb-binary-bin.mongodump)[`mongorestore`](https://www.mongodb.com/docs/database-tools/mongorestore/#mongodb-binary-bin.mongorestore)[`bsondump`](https://www.mongodb.com/docs/database-tools/bsondump/#mongodb-binary-bin.bsondump)[`mongoimport`](https://www.mongodb.com/docs/database-tools/mongoimport/#mongodb-binary-bin.mongoimport)[`mongoexport`](https://www.mongodb.com/docs/database-tools/mongoexport/#mongodb-binary-bin.mongoexport)[`mongostat`](https://www.mongodb.com/docs/database-tools/mongostat/#mongodb-binary-bin.mongostat)[`mongotop`](https://www.mongodb.com/docs/database-tools/mongotop/#mongodb-binary-bin.mongotop)[`mongofiles`](https://www.mongodb.com/docs/database-tools/mongofiles/#mongodb-binary-bin.mongofiles)`mongodb-org-database-tools-extra`Contains the [`install_compass`](https://www.mongodb.com/docs/manual/reference/program/install_compass/#std-label-install-compass) script |