# Scylla on CentOS 7

Use these steps to install Scylla using Yum repositories on CentOS.

### Prerequisites

- CentOS 7.2 or later, for the 64-bit x86_64 architecture.
- Yum package management application installed.
- ABRT conflict with Scylla coredump configuration. Remove it before installing Scylla: sudo yum remove -y abrt
- Root or sudo access to the system.

Make sure that all the relevant [ports](http://docs.scylladb.com/admin/#networking) are open.

For server configuration, see documentation on [recommendations for high performance](http://docs.scylladb.com/admin/#admin-system-configuration).

Scylla is supported on CentOS versions 7.2 [or later](http://docs.scylladb.com/admin/#admin-platform-support). There is no support for CentOS version 6.x and earlier.

### Procedure

```
COPY$ sudo yum install epel-release
```

#### Install a repo file: Add the Scylla RPM repo to your system, check the [RPM](http://docs.scylladb.com/getting-started/install_scylla/rpm_info/) content



**Scylla 2.3 (recommended)**
Repository for RHEL/CentOS 7 and above

```
COPYsudo curl -o /etc/yum.repos.d/scylla.repo -L http://repositories.scylladb.com/scylla/repo/77a5cfe2-5979-455a-8942-5a2a5a49a0a0/centos/scylladb-2.3.repo
```

**More Versions**



#### install packages

```
COPY$ sudo yum install scylla
```

For a specific patch version, for example 1.7.1

```
COPY$ sudo yum install scylla-1.7.1
```





### Configure and run Scylla on CentOS

#### Configure Scylla

Configure the /etc/scylla/scylla.yaml file with the following parameters:

| **Item**       | **Content**                                                  |
| -------------- | ------------------------------------------------------------ |
| cluster_name   | Name of the cluster, all the nodes in the cluster must have the same name |
| seeds          | Seed nodes are used during startup to bootstrap the gossip process and join the cluster |
| listen_address | IP address that the Scylla use to connect to other Scylla nodes in the cluster |
| rpc_address    | IP address of interface for client connections (Thrift, CQL) |

More information regarding the [scylla.yaml](http://docs.scylladb.com/admin/#scylla-yaml) file.

#### Scylla setup

Run the scylla_setup script to tune the system settings

```
COPYsudo scylla_setup
```

This script invokes a set of [scripts](http://docs.scylladb.com/system-configuration/#setup-scripts) to configure several operating system settings, like setting RAID0 and XFS filesystem. It also runs a short (up to a few minutes) benchmark on your storage and generates the `/etc/scylla.d/io.conf` configuration file. When the file is ready, you can start Scylla (see below). Scylla will not run without XFS or `io.conf` file. To bypass this check, set Scylla to [developer mode](http://docs.scylladb.com/getting-started/install_scylla/dev_mod/).

#### Run Scylla as a service (if not already running)

```
COPYsudo systemctl start scylla-server
```

#### run nodetool

```
COPYnodetool status
```

#### run cqlsh

```
COPYcqlsh
```

#### Run cassandra-stress

```
COPYcassandra-stress write -mode cql3 native 
```

### Monitoring

It is highly recommended to have a Scylla monitoring stack in place. For more on how to setup Scylla monitoring with Grafana [here](https://github.com/scylladb/scylla-grafana-monitoring)

### Reference

Scylla servers set up using this method have the system configuration covered on [System Configuration Guide](http://docs.scylladb.com/system-configuration/) already applied, by scripts included with the RPM packages. See the guide for a complete reference on settings used