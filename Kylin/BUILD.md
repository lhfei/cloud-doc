## Environment on the dev machine

#### Install Maven

The latest maven can be found at http://maven.apache.org/download.cgi, we create a symbolic so that mvn can be run anywhere.

```sh
cd ~
wget http://xenia.sote.hu/ftp/mirrors/www.apache.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
tar -xzvf apache-maven-3.2.5-bin.tar.gz
ln -s /root/apache-maven-3.2.5/bin/mvn /usr/bin/mvn
```

#### Install Spark

Manually install spark-1.6.3-bin-hadoop2.6 in a local folder like /usr/local/spark

```sh
wget -O /tmp/spark-1.6.3-bin-hadoop2.6.tgz http://d3kbcqa49mib13.cloudfront.net/spark-1.6.3-bin-hadoop2.6.tgz
cd /usr/local
tar -zxvf /tmp/spark-1.6.3-bin-hadoop2.6.tgz
ln -s spark-1.6.3-bin-hadoop2.6 spark
```

Upload the spark-assembly jar to HDFS as /kylin/spark/spark-assembly-1.6.3-hadoop2.6.0.jar (avoid repeatedly uploading the jar to HDFS):

```sh
hadoop fs -mkdir /kylin/spark/
hadoop fs -put /usr/local/spark/lib/spark-assembly-1.6.3-hadoop2.6.0.jar /kylin/spark/
```

Create local temp folder for hbase client (if it doesn¡¯t exist):

```sh
mkdir -p /hadoop/hbase/local/jars
chmod 777 /hadoop/hbase/local/jars
```


## How to Build Binary Package

Generate Binary Package

This document talks about how to build binary package from source code.

Download source code

You can download Apache Kylin source code from github repository.

git clone https://github.com/apache/kylin kylin
Build Binary Package

In order to generate binary package, maven and npm are pre-requisites.

(Optional) If you¡¯re behind a proxy server, both npm and bower need be told with the proxy info before running ./script/package.sh:

export http_proxy=http://your-proxy-host:port
npm config set proxy http://your-proxy-host:port
Build Package for HBase 1.x

cd kylin
build/script/package.sh
Build Package for CDH 5.7

cd kylin
build/script/package.sh -P cdh5.7
Build Package for HBase 0.98.x

Source code for HBase 0.98.x is in another branch named master-hbase0.98, and you need to switch to this branch before build the package.

cd kylin
git checkout master-hbase0.98
build/script/package.sh


```
```

## Compile

```
```

First clone the Kylin project to your local:

```sh
git clone https://github.com/apache/kylin.git
```

Install Kylin artifacts to the maven repo

```sh
mvn clean install -DskipTests
```

Then, the build log as below:

```sh
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Apache Kylin ....................................... SUCCESS [ 19.460 s]
[INFO] Apache Kylin - Calcite Overrides ................... SUCCESS [03:49 min]
[INFO] Apache Kylin - Core Common ......................... SUCCESS [ 16.586 s]
[INFO] Apache Kylin - Core Metadata ....................... SUCCESS [ 19.114 s]
[INFO] Apache Kylin - Core Dictionary ..................... SUCCESS [ 13.601 s]
[INFO] Apache Kylin - Core Cube ........................... SUCCESS [ 16.068 s]
[INFO] Apache Kylin - Core Job ............................ SUCCESS [ 11.284 s]
[INFO] Apache Kylin - Core Storage ........................ SUCCESS [ 12.022 s]
[INFO] Apache Kylin - MapReduce Engine .................... SUCCESS [ 16.338 s]
[INFO] Apache Kylin - HBase Storage ....................... SUCCESS [ 22.409 s]
[INFO] Apache Kylin - Spark Engine ........................ SUCCESS [ 17.627 s]
[INFO] Apache Kylin - Hive Source ......................... SUCCESS [ 14.104 s]
[INFO] Apache Kylin - Kafka Source ........................ SUCCESS [01:08 min]
[INFO] Apache Kylin - Query ............................... SUCCESS [ 40.502 s]
[INFO] Apache Kylin - REST Server Base .................... SUCCESS [ 47.869 s]
[INFO] Apache Kylin - REST Server ......................... SUCCESS [ 20.877 s]
[INFO] Apache Kylin - JDBC Driver ......................... SUCCESS [ 13.736 s]
[INFO] Apache Kylin - Assembly ............................ SUCCESS [ 20.037 s]
[INFO] Apache Kylin - Tool ................................ SUCCESS [ 20.447 s]
[INFO] Apache Kylin - Tool Assembly ....................... SUCCESS [ 10.437 s]
[INFO] Apache Kylin - Integration Test .................... SUCCESS [ 19.562 s]
[INFO] Apache Kylin - Tomcat Extension .................... SUCCESS [  7.852 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 11:18 min
[INFO] Finished at: 2017-08-28T20:17:21-07:00
[INFO] Final Memory: 74M/234M
[INFO] ------------------------------------------------------------------------

```

#### Modify local configuration

Local configuration must be modified to point to your hadoop sandbox (or CLI) machine.

+ In examples/test_case_data/sandbox/kylin.properties

    - Find sandbox and replace with your hadoop hosts (if you¡¯re using HDP sandbox, this can be skipped)
    - Find kylin.job.run.as.remote.cmd and change it to ¡°true¡± (in code repository the default is false, which assume running it on hadoop CLI)
    - Find kylin.job.remote.cli.username and kylin.job.remote.cli.password, fill in the user name and password used to login hadoop cluster for hadoop command execution; If you¡¯re using HDP sandbox, the default username is root and password is hadoop.

+ In examples/test_case_data/sandbox
    _ For each configuration xml file, find all occurrences of sandbox and sandbox.hortonworks.com, replace with your hadoop hosts; (if you¡¯re using HDP sandbox, this can be skipped)

An alternative to the host replacement is updating your hosts file to resolve sandbox and sandbox.hortonworks.com to the IP of your sandbox machine.

#### Run unit tests

Run unit tests to validate basic function of each classes.

```sh
mvn test -fae -Dhdp.version=<hdp-version> -P sandbox
```
Run integration tests

Before actually running integration tests, need to run some end-to-end cube building jobs for test data population, in the meantime validating cubing process. Then comes with the integration tests.

It might take a while (maybe one hour), please keep patient.

```sh
mvn verify -fae -Dhdp.version=<hdp-version> -P sandbox
```

To learn more about test, please refer to How to test.

##### Launch Kylin Web Server locally

Copy server/src/main/webapp/WEB-INF to webapp/app/WEB-INF

```sh
cp -r server/src/main/webapp/WEB-INF webapp/app/WEB-INF
```
Download JS for Kylin web GUI. npm is part of Node.js, please search about how to install it on your OS.

```sh
cd webapp
npm install -g bower
bower --allow-root install
```

In IDE, launch org.apache.kylin.rest.DebugTomcat with working directory set to the /server folder. (By default Kylin server will listen on 7070 port; If you want to use another port, please specify it as a parameter when run `DebugTomcat)

Check Kylin Web at http://localhost:7070/kylin (user:ADMIN, password:KYLIN)

For IntelliJ IDEA users, need modify ¡°server/kylin-server.iml¡± file, replace all ¡°PROVIDED¡± to ¡°COMPILE¡±, otherwise an ¡°java.lang.NoClassDefFoundError: org/apache/catalina/LifecycleListener¡± error may be thrown.