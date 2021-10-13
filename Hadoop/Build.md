



### Prepared

> Install CMake (3.19 or later)

```shell
yum install -y gcc gcc-c++ make automake 

wget https://cmake.org/files/v3.20/cmake-3.20.6.tar.gz
```

```shell
tar -zxvf cmake-3.20.6.tar.gz

cd cmake-3.20.6

./bootstrap && make -j4 && sudo make install
```



> Set Maven version

Reset maven version: `hadoop-project/pom.xml`

```xml
<enforced.java.version>[${javac.version},)</enforced.java.version>
<enforced.maven.version>[3.3.0,)</enforced.maven.version>
```





> Build from source

```shell
mvn package -Pdist,native -DskipTests -Dtar -Dmaven.javadoc.skip=true -T5
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Apache Hadoop Main ................................. SUCCESS [  2.363 s]
[INFO] Apache Hadoop Build Tools .......................... SUCCESS [  1.511 s]
[INFO] Apache Hadoop Project POM .......................... SUCCESS [  2.065 s]
[INFO] Apache Hadoop Annotations .......................... SUCCESS [  2.161 s]
[INFO] Apache Hadoop Assemblies ........................... SUCCESS [  0.171 s]
[INFO] Apache Hadoop Project Dist POM ..................... SUCCESS [  2.036 s]
[INFO] Apache Hadoop Maven Plugins ........................ SUCCESS [  3.703 s]
[INFO] Apache Hadoop MiniKDC .............................. SUCCESS [  0.841 s]
[INFO] Apache Hadoop Auth ................................. SUCCESS [  4.825 s]
[INFO] Apache Hadoop Auth Examples ........................ SUCCESS [  1.152 s]
[INFO] Apache Hadoop Common ............................... SUCCESS [ 57.020 s]
[INFO] Apache Hadoop NFS .................................. SUCCESS [  1.867 s]
[INFO] Apache Hadoop KMS .................................. SUCCESS [  3.304 s]
[INFO] Apache Hadoop Registry ............................. SUCCESS [  2.619 s]
[INFO] Apache Hadoop Common Project ....................... SUCCESS [  0.038 s]
[INFO] Apache Hadoop HDFS Client .......................... SUCCESS [ 18.891 s]
[INFO] Apache Hadoop HDFS ................................. SUCCESS [ 40.817 s]
[INFO] Apache Hadoop HDFS Native Client ................... SUCCESS [  5.504 s]
[INFO] Apache Hadoop HttpFS ............................... SUCCESS [  3.649 s]
[INFO] Apache Hadoop HDFS-NFS ............................. SUCCESS [  1.321 s]
[INFO] Apache Hadoop HDFS-RBF ............................. SUCCESS [  5.080 s]
[INFO] Apache Hadoop HDFS Project ......................... SUCCESS [  0.053 s]
[INFO] Apache Hadoop YARN ................................. SUCCESS [  0.079 s]
[INFO] Apache Hadoop YARN API ............................. SUCCESS [ 16.813 s]
[INFO] Apache Hadoop YARN Common .......................... SUCCESS [ 23.080 s]
[INFO] Apache Hadoop YARN Server .......................... SUCCESS [  0.152 s]
[INFO] Apache Hadoop YARN Server Common ................... SUCCESS [ 11.918 s]
[INFO] Apache Hadoop YARN NodeManager ..................... SUCCESS [ 31.725 s]
[INFO] Apache Hadoop YARN Web Proxy ....................... SUCCESS [  1.350 s]
[INFO] Apache Hadoop YARN ApplicationHistoryService ....... SUCCESS [  1.923 s]
[INFO] Apache Hadoop YARN Timeline Service ................ SUCCESS [  1.182 s]
[INFO] Apache Hadoop YARN ResourceManager ................. SUCCESS [ 11.562 s]
[INFO] Apache Hadoop YARN Server Tests .................... SUCCESS [  1.742 s]
[INFO] Apache Hadoop YARN Client .......................... SUCCESS [  8.974 s]
[INFO] Apache Hadoop YARN SharedCacheManager .............. SUCCESS [  1.114 s]
[INFO] Apache Hadoop YARN Timeline Plugin Storage ......... SUCCESS [  1.273 s]
[INFO] Apache Hadoop YARN TimelineService HBase Backend ... SUCCESS [  0.124 s]
[INFO] Apache Hadoop YARN TimelineService HBase Common .... SUCCESS [  1.867 s]
[INFO] Apache Hadoop YARN TimelineService HBase Client .... SUCCESS [  1.586 s]
[INFO] Apache Hadoop YARN TimelineService HBase Servers ... SUCCESS [  0.059 s]
[INFO] Apache Hadoop YARN TimelineService HBase Server 1.2  SUCCESS [  2.060 s]
[INFO] Apache Hadoop YARN TimelineService HBase tests ..... SUCCESS [  3.693 s]
[INFO] Apache Hadoop YARN Router .......................... SUCCESS [  1.343 s]
[INFO] Apache Hadoop YARN TimelineService DocumentStore ... SUCCESS [  0.820 s]
[INFO] Apache Hadoop YARN Applications .................... SUCCESS [  0.054 s]
[INFO] Apache Hadoop YARN DistributedShell ................ SUCCESS [  1.125 s]
[INFO] Apache Hadoop YARN Unmanaged Am Launcher ........... SUCCESS [  1.107 s]
[INFO] Apache Hadoop MapReduce Client ..................... SUCCESS [  0.164 s]
[INFO] Apache Hadoop MapReduce Core ....................... SUCCESS [ 15.269 s]
[INFO] Apache Hadoop MapReduce Common ..................... SUCCESS [  8.672 s]
[INFO] Apache Hadoop MapReduce Shuffle .................... SUCCESS [  1.456 s]
[INFO] Apache Hadoop MapReduce App ........................ SUCCESS [  3.409 s]
[INFO] Apache Hadoop MapReduce HistoryServer .............. SUCCESS [  2.110 s]
[INFO] Apache Hadoop MapReduce JobClient .................. SUCCESS [  7.521 s]
[INFO] Apache Hadoop Mini-Cluster ......................... SUCCESS [  1.055 s]
[INFO] Apache Hadoop YARN Services ........................ SUCCESS [  0.053 s]
[INFO] Apache Hadoop YARN Services Core ................... SUCCESS [  2.299 s]
[INFO] Apache Hadoop YARN Services API .................... SUCCESS [  1.189 s]
[INFO] Apache Hadoop YARN Application Catalog ............. SUCCESS [  0.073 s]
[INFO] Apache Hadoop YARN Application Catalog Webapp ...... SUCCESS [ 14.782 s]
[INFO] Apache Hadoop YARN Application Catalog Docker Image  SUCCESS [  0.352 s]
[INFO] Apache Hadoop YARN Application MaWo ................ SUCCESS [  0.107 s]
[INFO] Apache Hadoop YARN Application MaWo Core ........... SUCCESS [  1.341 s]
[INFO] Apache Hadoop YARN Site ............................ SUCCESS [  0.137 s]
[INFO] Apache Hadoop YARN Registry ........................ SUCCESS [  0.901 s]
[INFO] Apache Hadoop YARN UI .............................. SUCCESS [  0.061 s]
[INFO] Apache Hadoop YARN CSI ............................. SUCCESS [  5.964 s]
[INFO] Apache Hadoop YARN Project ......................... SUCCESS [ 12.201 s]
[INFO] Apache Hadoop MapReduce HistoryServer Plugins ...... SUCCESS [  0.762 s]
[INFO] Apache Hadoop MapReduce NativeTask ................. SUCCESS [ 32.322 s]
[INFO] Apache Hadoop MapReduce Uploader ................... SUCCESS [  0.828 s]
[INFO] Apache Hadoop MapReduce Examples ................... SUCCESS [  1.146 s]
[INFO] Apache Hadoop MapReduce ............................ SUCCESS [  3.699 s]
[INFO] Apache Hadoop MapReduce Streaming .................. SUCCESS [  0.968 s]
[INFO] Apache Hadoop Distributed Copy ..................... SUCCESS [  1.146 s]
[INFO] Apache Hadoop Client Aggregator .................... SUCCESS [  2.885 s]
[INFO] Apache Hadoop Dynamometer Workload Simulator ....... SUCCESS [  0.852 s]
[INFO] Apache Hadoop Dynamometer Cluster Simulator ........ SUCCESS [  1.515 s]
[INFO] Apache Hadoop Dynamometer Block Listing Generator .. SUCCESS [  0.839 s]
[INFO] Apache Hadoop Dynamometer Dist ..................... SUCCESS [  7.131 s]
[INFO] Apache Hadoop Dynamometer .......................... SUCCESS [  0.027 s]
[INFO] Apache Hadoop Archives ............................. SUCCESS [  0.303 s]
[INFO] Apache Hadoop Archive Logs ......................... SUCCESS [  0.528 s]
[INFO] Apache Hadoop Rumen ................................ SUCCESS [  1.305 s]
[INFO] Apache Hadoop Gridmix .............................. SUCCESS [  0.765 s]
[INFO] Apache Hadoop Data Join ............................ SUCCESS [  0.504 s]
[INFO] Apache Hadoop Extras ............................... SUCCESS [  0.468 s]
[INFO] Apache Hadoop Pipes ................................ SUCCESS [  4.069 s]
[INFO] Apache Hadoop OpenStack support .................... SUCCESS [  0.611 s]
[INFO] Apache Hadoop Amazon Web Services support .......... SUCCESS [  5.241 s]
[INFO] Apache Hadoop Kafka Library support ................ SUCCESS [  0.528 s]
[INFO] Apache Hadoop Azure support ........................ SUCCESS [  2.506 s]
[INFO] Apache Hadoop Aliyun OSS support ................... SUCCESS [  0.245 s]
[INFO] Apache Hadoop Scheduler Load Simulator ............. SUCCESS [  1.587 s]
[INFO] Apache Hadoop Resource Estimator Service ........... SUCCESS [  1.002 s]
[INFO] Apache Hadoop Azure Data Lake support .............. SUCCESS [  0.328 s]
[INFO] Apache Hadoop Image Generation Tool ................ SUCCESS [  0.547 s]
[INFO] Apache Hadoop Tools Dist ........................... SUCCESS [ 14.103 s]
[INFO] Apache Hadoop Tools ................................ SUCCESS [  0.035 s]
[INFO] Apache Hadoop Client API ........................... SUCCESS [01:36 min]
[INFO] Apache Hadoop Client Runtime ....................... SUCCESS [01:45 min]
[INFO] Apache Hadoop Client Packaging Invariants .......... SUCCESS [  0.295 s]
[INFO] Apache Hadoop Client Test Minicluster .............. SUCCESS [02:51 min]
[INFO] Apache Hadoop Client Packaging Integration Tests ... SUCCESS [  0.109 s]
[INFO] Apache Hadoop Distribution ......................... SUCCESS [ 41.505 s]
[INFO] Apache Hadoop Client Modules ....................... SUCCESS [  0.065 s]
[INFO] Apache Hadoop Tencent COS Support .................. SUCCESS [  0.582 s]
[INFO] Apache Hadoop Cloud Storage ........................ SUCCESS [  0.741 s]
[INFO] Apache Hadoop Cloud Storage Project ................ SUCCESS [  0.039 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 14:37 min
[INFO] Finished at: 2021-10-11T13:16:54+08:00
[INFO] Final Memory: 521M/2016M
[INFO] ------------------------------------------------------------------------
```







### Issues

>  Some Enforcer rules have failed. Look above for specific messages explaining why the rule failed.

```ini
 [INFO] Apache Hadoop Client Runtime ....................... SUCCESS [01:56 min]
[INFO] Apache Hadoop Client Packaging Invariants .......... SUCCESS [  0.239 s]
[INFO] Apache Hadoop Client Test Minicluster .............. SUCCESS [03:08 min]
[INFO] Apache Hadoop Client Packaging Invariants for Test . FAILURE [  0.104 s]
[INFO] Apache Hadoop Client Packaging Integration Tests ... SKIPPED
[INFO] Apache Hadoop Distribution ......................... SKIPPED
[INFO] Apache Hadoop Client Modules ....................... SKIPPED
[INFO] Apache Hadoop Tencent COS Support .................. SKIPPED
[INFO] Apache Hadoop Cloud Storage ........................ SKIPPED
[INFO] Apache Hadoop Cloud Storage Project ................ SKIPPED
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  14:41 min
[INFO] Finished at: 2021-10-11T10:59:05+08:00
[INFO] ------------------------------------------------------------------------

......
 Some Enforcer rules have failed. Look above for specific messages explaining why the rule failed.
```

