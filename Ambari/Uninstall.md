# Uninstalling HDP

Use the following instructions to uninstall HDP:

1. Stop all of the installed HDP services. See [Stopping HDP Services](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.2/bk_HDP_Reference_Guide/content/stopping_hdp_services.html) in the HDP Reference Guide.

2. If Knox is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove knox*`

   - For SLES:

     `zypper remove knox\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove knox*`

3. If Ranger is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove ranger\*`

   - For SLES:

     `zypper remove ranger\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove ranger\*`

4. If Kafka is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove kafka\*`

   - For SLES:

     `zypper remove kafka\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove kafka\*`

5. If Storm is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove storm\*`

   - For SLES:

     `zypper remove storm\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove storm\*`

6. If Hive is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove hive\*`

   - For SLES:

     `zypper remove hive\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove hive\*`

7. If HBase is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove hbase\*`

   - For SLES:

     `zypper remove hbase\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove hbase\*`

8. If Phoenix is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove phoenix\*`

   - For SLES:

     `zypper remove phoenix\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove phoenix\*`

9. If Accumulo is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove accumulo\*`

   - For SLES:

     `zypper remove accumulo\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove accumulo\*`

10. If Tez is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove tez\*`

    - For SLES:

      `zypper remove tez\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove tez\*`

11. If ZooKeeper is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove zookeeper\*`

    - For SLES:

      `zypper remove zookeeper\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove zookeeper\*`

12. If Oozie is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove oozie\*`

    - For SLES:

      `zypper remove oozie\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove oozie\*`

13. If Pig is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove pig\*`

    - For SLES:

      `zypper remove pig\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove pig\*`

14. If compression libraries are installed, run the following command on all the cluster nodes:

    `yum remove snappy\* yum remove hadooplzo\*`

15. If Knox is installed, run the following command on all the gateway host:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove knox\*`

    - For SLES:

      `zypper remove knox\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove knox\*`

16. Uninstall Hadoop. run the following command on all the cluster nodes:

    `yum remove hadoop\*`

17. Uninstall ExtJS libraries and MySQL connector. Run the following command on all the cluster nodes:

    `yum remove extjs-2.2-1 mysql-connector-java-5.0.8-1\*`



```
python /usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py --silent --skip=users
```

