# Getting to Know Hadoop 3.0 -Features and Enhancements



[Hadoop](https://www.dezyre.com/article/hadoop-explained-how-does-hadoop-work-and-how-to-use-it-/237) was first made publicly available as an open source in 2011, since then it has undergone major changes in three different versions. Apache Hadoop 3 is round the corner with members of the Hadoop community at Apache Software Foundation still testing it. The major release of Hadoop 3.x is anticipated to be rolled out sometime mid of 2017. What else can be more exciting for the big data community than waiting for the release of a major new version of the tiny toy elephant? Considering the scope of the novel features and enhancements Apache Hadoop 3.0 will bring in with thousands of new bug fixes, features and enhancements over Hadoop 2.0; it’s time to get a sneak peek into the major new features poised to boost its enterprise adoption by making it more powerful, flexible and resource-aware. In this blog, we will see the novel features that make Hadoop 3.0 better than its predecessors Hadoop 2 and Hadoop 1.

![Hadoop 3.x](https://s3.amazonaws.com/files.dezyre.com/images/blog/Getting+to+Know+Hadoop+3.0+-Features+and+Enhancements+/Hadoop+3.0+.png)

## **Why Hadoop 3.0?**

- With Java 7 attaining end of life in 2015, there was a need to revise the minimum runtime version to Java 8 with a new Hadoop release so that the new release is supported by Oracle with security fixes and also  will allow hadoop to upgrade its dependencies to modern versions.
- With Hadoop 2.0 shell scripts were difficult to understand as hadoop developers had to read almost all the shell scripts to understand what is the correct environment variable to set an option and how to set it whether it is java.library.path or java classpath or GC options.
- With support for only 2 NameNodes, Hadoop 2 did not provide maximum level of fault tolerance but with the release of Hadoop 3.x there will be additional fault tolerance as it offers multiple NameNodes.
- Replication is a costly affair in Hadoop 2 as it follows a 3x replication scheme leading to 200% additional storage space and resource overhead. Hadoop 3.0 will incorporate Erasure Coding in place of replication consuming comparatively less storage space whilst providing same level of fault tolerance.

[![Hadoop Online Course](https://s3.amazonaws.com/files.dezyre.com/images/blog/Marketing+Banners+for+Blogs/Enrol+Now+for+hands-on+Hadoop+Training.png)](https://www.dezyre.com/Hadoop-Training-online/19?utm_source=DeZyre&utm_campaign=Blog_Hadoop3.0_354&utm_medium=Small_Banner)

*If you would like more information about Big Data and Hadoop Training, please click the orange "Request Info" button on top of this page.*

## **What’s New in Hadoop 3.0?**

### **i)**   **Minimum Runtime Version for Hadoop 3.0 is JDK 8**

With Oracle JDK 7 coming to its end of life in 2015, in Hadoop 3.0 JAR files are compiled to run on JDK 8 version. This gives Hadoop 3.0 a dependency upgrade to modern versions as most of the libraries only support Java 8 .As a hadoop user, if you are still working with lower version of JDK then it is time to upgrade to JDK 8 to make the most of the enhancements coming in Hadoop 3.0.

### **ii) Support for Erasure Coding in HDFS**

Considering the rapid growth trends in data and datacentre hardware, support for erasure coding in Hadoop 3.0 is an important feature in years to come. Erasure Coding is a 50 years old technique that lets any random piece of data to be recovered based on other piece of data i.e. metadata stored around it. Erasure Coding is more like an advanced RAID technique that recovers data automatically when hard disk fails.

In hadoop 2.0, HDFS inherits 3-way replication from GFS (Google File System). The default replication factor is 3 meaning every piece of data is replicated thrice to ensure reliability of 99.999%. Even with such a high precision of reliability, data reliability was still a matter of concern for many users. A major problem with this approach is that replicating the data blocks to 3 data nodes incurs 200% additional storage overhead and network bandwidth when writing data.

With support for erasure coding in Hadoop 3.0, the physical disk usage will be cut by half (i.e. 3x disk space consumption will reduce to 1.5x) and the fault tolerance level will increase by 50%. This new Hadoop 3.0 feature will save hadoop customers big bucks on hardware infrastructure as they can reduce the size of their hadoop cluster to half and store the same amount of data or continue to use the current hadoop cluster hardware infrastructure and store double the amount of data with HDFS EC.

### **iii) Hadoop Shell Script Rewrite**

To address several long standing bugs, provide unifying behaviours and enhance the documentation and functionality- Hadoop shell scripts are rewritten in Hadoop 3.0. This new feature will mainly make a difference for hadoop users who interact through shell commands and make use of hadoop environment variables. Some of the new features incorporated are –

- There will be a new option referred as buildpaths that will allow hadoop developers to add build directories to the classpath to enable in source tree testing.
- ‘hadoop jnipath’ command will be included to print java.library.path.
- The command to change ownership and permissions on many files ‘hadoop distch’ will now be executed through hadoop MapReduce jobs.
- To enable external log rotation,  .out files will be appended in the new release unlike being overwritten in previous hadoop releases.
- In the earlier version of Hadoop, any unprotected shell errors would be displayed to the user, however after the shell scripts are rewritten in Hadoop 3.0 they would report error messages in a better way highlighting various states of the log and PID directories on daemon startup. With a new support/ debug option , shell scripts in hadoop 3.0 would report all the basic information on the construction of different environment variables, classpath, java options, etc. that will help in configuration debugging.

### **iv)  MapReduce Task Level Native Optimization**

A new native implementation of the map output collector to perform sort, spill and IFile serialization in the native code as this will improve the performance of shuffle intensive jobs by 30%.

### **v) Support for Multiple NameNodes to maximize Fault Tolerance**

This new feature is just perfect for business critical deployments the need to run with high fault tolerance levels. Hadoop 3.0 supports 2 or more Standby nodes to provide additional fault tolerance unlike Hadoop 2.0 that supports only two NameNodes. Fault tolerance was limited in Hadoop 2.0 with as HDFS could run only a single standby and a single active NameNode. This limitation has been addressed in Hadoop 3.0 to enhance the fault tolerance in HDFS.

### **vi)  Introducing a More Powerful YARN in Hadoop 3.0**

A major improvement in Hadoop 3.0 is related to the way YARN works and what it can support. Hadoop’s resource manager YARN was introduced in Hadoop 2.0 to make hadoop clusters run efficiently. In hadoop 3.0, YARN is coming off with multiple enhancements in the following areas –

- Support for long running services with the need to consolidate infrastructure.
- Better resource isolation for disk and network, resource utilization, user experiences, docker opportunities and elasticity.
- YARN Timeline Service Rearchitecture to ATS v2

YARN in Hadoop 3.0 would be able to manage resources and services that run beyond the scope of a Hadoop cluster.

### **vii) Change in Default Ports for Various Services and Addition of New Default Ports**

The default ports for NameNode, DataNode, Secondary NameNode and KMS have been moved out of the Linux *ephemeral port range* (32768-61000) to avoid any bind errors on startup because of conflict with other application. This feature has been introduced to enhance the reliability of rolling restarts on large hadoop clusters.

[![Big Data Hadoop Projects](https://s3.amazonaws.com/files.dezyre.com/images/blog/Big+Data+Hadoop+and+Data+Science+Projects/Big+Data+Hadoop+Projects_Banner.jpg)](https://www.dezyre.com/big-data-hadoop-projects?utm_source=DeZyre&utm_medium=Banner&utm_campaign=Blog_Hadoop3.0_354)

## **Difference between Hadoop 2.x vs. Hadoop 3.x**

**![Hadoop 2 vs Hadoop 3](https://s3.amazonaws.com/files.dezyre.com/images/blog/Getting+to+Know+Hadoop+3.0+-Features+and+Enhancements+/Hadoop+2+vs+Hadoop+3.png)**

With the introduction of several new features in Hadoop 3.x and many old ones from Hadoop 2.x being migrated to Hadoop 3.x, it is extremely important to understand the differences between the two major Hadoop releases – Hadoop 2.x vs. Hadoop 3.x.

[Hadoop 1 vs Hadoop 2](https://www.dezyre.com/article/hadoop-2-0-yarn-framework-the-gateway-to-easier-programming-for-hadoop-users/84)

 

| **Features**                      | **Hadoop 2.x**                                               | **Hadoop 3.x**                                               |
| --------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Minimum Required Java Version** | JDK 6 and above.                                             | JDK 8 is the minimum runtime version of JAVA required to run Hadoop 3.x as many dependency library files have been used from JDK 8. |
| **Fault Tolerance**               | Fault Tolerance is handled through replication leading to storage and network bandwidth overhead. | Support for Erasure Coding in HDFS improves fault tolerance  |
| **Storage Scheme**                | Follows a 3x Replication Scheme for data recovery leading to 200% storage overhead. For instance, if there are 8 data blocks then a total of 24 blocks will occupy the storage space because of the 3x replication scheme. | Storage overhead in Hadoop 3.0 is reduced to 50% with support for Erasure Coding. In this case, if here are 8 data blocks then a total of only 12 blocks will occupy the storage space. |
| **Change in Port Numbers**        | Hadoop HDFS NameNode -8020Hadoop HDFS DataNode -50010Secondary NameNode HTTP -50091 | Hadoop HDFS NameNode -9820Hadoop HDFS DataNode -9866Secondary NameNode HTTP -9869 |
| **YARN Timeline Service**         | YARN timeline service introduced in Hadoop 2.0 has some scalability issues. | YARN Timeline service has been enhanced with ATS v2 which improves the scalability and reliability. |
| **Intra DataNode Balancing**      | HDFS Balancer in Hadoop 2.0 caused skew within a DataNode because of addition or replacement of disks. | Intra DataNode Balancing has been introduced in Hadoop 3.0 to address the intra-DataNode skews which occur when disks are added or replaced. |
| **Number of NameNodes**           | Hadoop 2.0 introduced a secondary namenode as standby.       | Hadoop 3.0 supports 2 or more NameNodes.                     |
| **Heap Size**                     | In Hadoop 2.0 , for Java and Hadoop tasks, the heap size needs to be set through  two similar properties mapreduce.{map,reduce}.java. Opts and mapreduce.{map,reduce}.memory.mb | In Hadoop 3.0, heap size or mapreduce.*.memory.mb is derived automatically. |

 

Hadoop 3.0 is a major development milestone in the big data space with the above features and enhancements listed above likely to incorporated in [commercial hadoop distributions](https://www.dezyre.com/article/cloudera-vs-hortonworks-vs-mapr-hadoop-distribution-comparison-/190) after thorough testing and integration. There are still several new features and enhancements likely to be announced as part of Hadoop 3.0 beta release.