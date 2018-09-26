## Before You Install

### Hosts

```ini
10.182.63.239    host-10-182-63-239
10.182.63.241    host-10-182-63-241
10.182.63.242    host-10-182-63-242
10.182.63.245    host-10-182-63-245
10.182.63.250    host-10-182-63-250
```



### Repositories

| Type                  | Location (baseurl)                                       | Repo File                                                    |
| --------------------- | -------------------------------------------------------- | ------------------------------------------------------------ |
| RHEL 7 Compatible     | <https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/>    | [cloudera-manager.repo](https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/cloudera-manager.repo) |
| RHEL6 Compatible      | <https://archive.cloudera.com/cm6/6.0.0/redhat6/yum/>    | [cloudera-manager.repo](https://archive.cloudera.com/cm6/6.0.0/redhat6/yum/cloudera-manager.repo) |
| SLES 12               | <https://archive.cloudera.com/cm6/6.0.0/sles12/yum/>     | [cloudera-manager.repo](https://archive.cloudera.com/cm6/6.0.0/sles12/yum/cloudera-manager.repo) |
| Ubuntu Xenial (16.04) | <https://archive.cloudera.com/cm6/6.0.0/ubuntu1604/apt/> | [cloudera-manager.list](https://archive.cloudera.com/cm6/6.0.0/ubuntu1604/apt/cloudera-manager.list) |



- [x] Centos 7

  ```sh
  wget https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/cloudera-manager.repo
  ```

- [x] Centos 6

  ```sh
  wget https://archive.cloudera.com/cm6/6.0.0/redhat6/yum/cloudera-manager.repo
  ```


## Install Cloudera Manager Packages

1. On the Cloudera Manager Server host, type the following commands to install the Cloudera Manager packages.

   | OS                             | Command                                                      |
   | ------------------------------ | ------------------------------------------------------------ |
   | **RHEL, CentOS, Oracle Linux** | `sudo yum install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server` |
   | **SLES**                       | `sudo zypper install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server` |
   | **Ubuntu**                     | `sudo apt-get install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server` |

2. If you are using an Oracle database for Cloudera Manager Server, edit the /etc/default/cloudera-scm-server file on the Cloudera Manager server host. Locate the line that begins with export CM_JAVA_OPTSand change the -Xmx2G option to -Xmx4G.


  Step 4: Install and Configure Databases

![img](https://www.cloudera.com/documentation/enterprise/6/6.0/images/step_4_of_7.svg)

Cloudera Manager uses various databases and datastores to store information about the Cloudera Manager configuration, as well as information such as the health of the system, or task progress.

Although you can deploy different types of databases in a single environment, doing so can create unexpected complications. Cloudera recommends choosing one supported database provider for all of the Cloudera databases.

Cloudera recommends installing the databases on different hosts than the services. Separating databases from services can help isolate the potential impact from failure or resource contention in one or the other. It can also simplify management in organizations that have dedicated database administrators.

You can use your own PostgreSQL, MariaDB, MySQL, or Oracle database for the Cloudera Manager Server and other services that use databases. For information about planning, managing, and backing up Cloudera Manager data stores, see [Storage Space Planning for Cloudera Manager](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_reqs_space.html#concept_tjd_4yc_gr) and [Backing Up Databases](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ag_backup_dbs.html#xd_583c10bfdbd326ba--6eed2fb8-14349d04bee--7e98).

Continue reading:

- [Required Databases](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_installing_configuring_dbs.html#cmig_topic_5_1)
- [Installing and Configuring Databases](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_installing_configuring_dbs.html#concept_r5p_brw_vcb)





## Required Databases

The following components all require databases: Cloudera Manager Server, Oozie Server, Sqoop Server, Activity Monitor, Reports Manager, Hive Metastore Server, Hue Server, Sentry Server, Cloudera Navigator Audit Server, and Cloudera Navigator Metadata Server. The type of data contained in the databases and their relative sizes are as follows:

- Cloudera Manager Server - Contains all the information about services you have configured and their role assignments, all configuration history, commands, users, and running processes. This relatively small database (< 100 MB) is the most important to back up.Important: When you restart processes, the configuration for each of the services is redeployed using information saved in the Cloudera Manager database. If this information is not available, your cluster cannot start or function correctly. You must schedule and maintain regular backups of the Cloudera Manager database to recover the cluster in the event of the loss of this database. For more information, see [Backing Up Databases](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ag_backup_dbs.html#xd_583c10bfdbd326ba--6eed2fb8-14349d04bee--7e98).
- Oozie Server - Contains Oozie workflow, coordinator, and bundle data. Can grow very large.
- Sqoop Server - Contains entities such as the connector, driver, links and jobs. Relatively small.
- Activity Monitor - Contains information about past activities. In large clusters, this database can grow large. Configuring an Activity Monitor database is only necessary if a MapReduce service is deployed.
- Reports Manager - Tracks disk utilization and processing activities over time. Medium-sized.
- Hive Metastore Server - Contains Hive metadata. Relatively small.
- Hue Server - Contains user account information, job submissions, and Hive queries. Relatively small.
- Sentry Server - Contains authorization metadata. Relatively small.
- Cloudera Navigator Audit Server - Contains auditing information. In large clusters, this database can grow large.
- Cloudera Navigator Metadata Server - Contains authorization, policies, and audit report metadata. Relatively small.

The Host Monitor and Service Monitor services use local disk-based datastores. For more information, see [Data Storage for Monitoring Data](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_storage.html).

The JDBC connector for your database *must* be installed on the hosts where you assign the Activity Monitor and Reports Manager roles.



## Installing and Configuring Databases

For instructions on installing and configuring databases for Cloudera Manager, CDH, and other managed services, see the instructions for the type of database you want to use:

- [Install and Configure MariaDB](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/install_cm_mariadb.html#install_cm_mariadb)
- [Install and Configure MySQL](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_mysql.html#cmig_topic_5_5)
- [Install and Configure PostgreSQL](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_extrnl_pstgrs.html#cmig_topic_5_6)
- [Install and Configure Oracle Database](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/cm_ig_oracle.html#cmig_topic_5_8)
- [Configuring an External Database for Sqoop 2](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/install_sqoop_ext_db.html#concept_y53_jyf_4r)





**[CDH 6 Documention](https://www.cloudera.com/documentation/enterprise/6/6.0/topics/configure_cm_repo.html)** 