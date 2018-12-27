```

```
# Quick Start
- [Installation](#Installation)
    - [Downloading Binary Package](#Downloading Binary Package)
- [Starting Apache Zeppelin](#Starting Apache Zeppelin)
- [Next Steps](#Next Steps)
- [Building Apache Zeppelin from Source](#Building Apache Zeppelin from Source)


Welcome to Apache Zeppelin! On this page are instructions to help you get started.


## Installation


### Downloading Binary Package

Two binary packages are available on the [Apache Zeppelin Download Page](http://zeppelin.apache.org/download.html ""). Only difference between these two binaries is interpreters are included in the package file.

- **Package with all interpreters**

&emsp;Just unpack it in a directory of your choice and you're ready to go.

- **Package with net-install interpreters**

&emsp;Unpack and follow install additional interpreters to install interpreters. If you're unsure, just run ./bin/install-interpreter.sh --all and install all interpreters.


## Starting Apache Zeppelin

>#### Starting Apache Zeppelin from the Command Line

On all unix like platforms:

```sh
bin/zeppelin-daemon.sh start
```

If you are on Windows:

```sh
bin\zeppelin.cmd
```

After Zeppelin has started successfully, go to [http://localhost:8080](http://localhost:8080) with your web browser.


>#### Stopping Zeppelin

```sh
bin/zeppelin-daemon.sh stop
```

>#### Start Apache Zeppelin with a service manager

*Note : The below description was written based on Ubuntu Linux.*

Apache Zeppelin can be auto-started as a service with an init script, using a service manager like upstart.

This is an example upstart script saved as /etc/init/zeppelin.conf This allows the service to be managed with commands such as

```sh
sudo service zeppelin start  
sudo service zeppelin stop  
sudo service zeppelin restart
```

Other service managers could use a similar approach with the upstart argument passed to the zeppelin-daemon.sh script.

```sh
bin/zeppelin-daemon.sh upstart
```

>###### zeppelin.conf

```sh
description "zeppelin"

start on (local-filesystems and net-device-up IFACE!=lo)
stop on shutdown

# Respawn the process on unexpected termination
respawn

# respawn the job up to 7 times within a 5 second period.
# If the job exceeds these values, it will be stopped and marked as failed.
respawn limit 7 5

# zeppelin was installed in /usr/share/zeppelin in this example
chdir /usr/share/zeppelin
exec bin/zeppelin-daemon.sh upstart

```


## Building from Source

- Building from Source
    - Build profiles
    - Build command examples
- Build requirements
    - Install requirements
    - Install maven
- Proxy setting (optional)
- Package
- Run end-to-end tests

>#### 1. Clone the Apache Zeppelin repository

```sh
git clone https://github.com/apache/zeppelin.git
```

>#### 2. Build source

You can build Zeppelin with following maven command:

```sh
mvn clean package -DskipTests [Option]
```

```sh
$ mvn clean install -e -DskipTests -Dspark.version=2.1.1 -Dhadoop.version=2.7.3 -Pscala-2.11 -Pr -Psparkr -Pvendor-repo  -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true
```



```sh
mvn clean install -e -DskipTests -Dspark.version=2.4.0 -Dhadoop.version=3.1.0 -Pscala-2.11 -Pr -Psparkr -Pvendor-repo  -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true
```



```sh
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Zeppelin ........................................... SUCCESS [ 10.810 s]
[INFO] Zeppelin: Interpreter .............................. SUCCESS [ 28.201 s]
[INFO] Zeppelin: Zengine .................................. SUCCESS [ 25.370 s]
[INFO] Zeppelin: Display system apis ...................... SUCCESS [ 32.425 s]
[INFO] Zeppelin: Spark dependencies ....................... SUCCESS [01:18 min]
[INFO] Zeppelin: Spark .................................... SUCCESS [ 53.753 s]
[INFO] Zeppelin: Markdown interpreter ..................... SUCCESS [  3.658 s]
[INFO] Zeppelin: Angular interpreter ...................... SUCCESS [  1.499 s]
[INFO] Zeppelin: Shell interpreter ........................ SUCCESS [  2.000 s]
[INFO] Zeppelin: Livy interpreter ......................... SUCCESS [ 25.862 s]
[INFO] Zeppelin: HBase interpreter ........................ SUCCESS [ 17.022 s]
[INFO] Zeppelin: Apache Pig Interpreter ................... SUCCESS [ 15.229 s]
[INFO] Zeppelin: PostgreSQL interpreter ................... SUCCESS [  2.259 s]
[INFO] Zeppelin: JDBC interpreter ......................... SUCCESS [  3.870 s]
[INFO] Zeppelin: File System Interpreters ................. SUCCESS [  4.187 s]
[INFO] Zeppelin: Flink .................................... SUCCESS [ 17.346 s]
[INFO] Zeppelin: Apache Ignite interpreter ................ SUCCESS [  3.155 s]
[INFO] Zeppelin: Kylin interpreter ........................ SUCCESS [  2.007 s]
[INFO] Zeppelin: Python interpreter ....................... SUCCESS [  2.201 s]
[INFO] Zeppelin: Lens interpreter ......................... SUCCESS [ 14.671 s]
[INFO] Zeppelin: Apache Cassandra interpreter ............. SUCCESS [01:49 min]
[INFO] Zeppelin: Elasticsearch interpreter ................ SUCCESS [ 13.975 s]
[INFO] Zeppelin: BigQuery interpreter ..................... SUCCESS [  3.167 s]
[INFO] Zeppelin: Alluxio interpreter ...................... SUCCESS [ 10.114 s]
[INFO] Zeppelin: Scio ..................................... SUCCESS [01:22 min]
[INFO] Zeppelin: web Application .......................... SUCCESS [06:09 min]
[INFO] Zeppelin: Server ................................... SUCCESS [ 47.996 s]
[INFO] Zeppelin: Packaging distribution ................... SUCCESS [ 13.776 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 16:36 min
[INFO] Finished at: 2017-03-21T19:56:18-07:00
[INFO] Final Memory: 245M/711M
[INFO] ------------------------------------------------------------------------



[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Zeppelin ........................................... SUCCESS [ 20.393 s]
[INFO] Zeppelin: Interpreter .............................. SUCCESS [ 29.429 s]
[INFO] Zeppelin: Zengine .................................. SUCCESS [ 27.048 s]
[INFO] Zeppelin: Display system apis ...................... SUCCESS [ 37.812 s]
[INFO] Zeppelin: Spark dependencies ....................... SUCCESS [01:56 min]
[INFO] Zeppelin: Spark .................................... SUCCESS [ 58.233 s]
[INFO] Zeppelin: Markdown interpreter ..................... SUCCESS [  2.972 s]
[INFO] Zeppelin: Angular interpreter ...................... SUCCESS [  2.164 s]
[INFO] Zeppelin: Shell interpreter ........................ SUCCESS [  2.044 s]
[INFO] Zeppelin: Livy interpreter ......................... SUCCESS [ 18.513 s]
[INFO] Zeppelin: HBase interpreter ........................ SUCCESS [ 16.111 s]
[INFO] Zeppelin: Apache Pig Interpreter ................... SUCCESS [ 16.541 s]
[INFO] Zeppelin: PostgreSQL interpreter ................... SUCCESS [  2.165 s]
[INFO] Zeppelin: JDBC interpreter ......................... SUCCESS [  3.365 s]
[INFO] Zeppelin: File System Interpreters ................. SUCCESS [  5.123 s]
[INFO] Zeppelin: Flink .................................... SUCCESS [ 22.826 s]
[INFO] Zeppelin: Apache Ignite interpreter ................ SUCCESS [  3.008 s]
[INFO] Zeppelin: Kylin interpreter ........................ SUCCESS [  2.349 s]
[INFO] Zeppelin: Python interpreter ....................... SUCCESS [ 10.614 s]
[INFO] Zeppelin: Lens interpreter ......................... SUCCESS [ 14.092 s]
[INFO] Zeppelin: Apache Cassandra interpreter ............. SUCCESS [02:06 min]
[INFO] Zeppelin: Elasticsearch interpreter ................ SUCCESS [  9.954 s]
[INFO] Zeppelin: BigQuery interpreter ..................... SUCCESS [  3.227 s]
[INFO] Zeppelin: Alluxio interpreter ...................... SUCCESS [  8.751 s]
[INFO] Zeppelin: Scio ..................................... SUCCESS [01:50 min]
[INFO] Zeppelin: web Application .......................... SUCCESS [07:52 min]
[INFO] Zeppelin: Server ................................... SUCCESS [ 44.715 s]
[INFO] Zeppelin: Packaging distribution ................... SUCCESS [ 18.907 s]
[INFO] Zeppelin: R Interpreter ............................ SUCCESS [01:02 min]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 21:10 min
[INFO] Finished at: 2017-11-20T17:36:54-08:00
[INFO] Final Memory: 256M/775M
[INFO] ------------------------------------------------------------------------
```

If you're unsure about the options, use the same commands that creates official binary package.

```sh
# update all pom.xml to use scala 2.11
./dev/change_scala_version.sh 2.11
# build zeppelin with all interpreters and include latest version of Apache spark support for local mode.
mvn clean package -DskipTests -Pspark-2.0 -Phadoop-2.4 -Pyarn -Ppyspark -Psparkr -Pr -Pscala-2.11
```

>#### 3. Done

You can directly start Zeppelin by running after successful build:

```sh
./bin/zeppelin-daemon.sh start
```

Check [build-profiles](#Build profiles) section for further build options. If you are behind proxy, follow instructions in Proxy setting section.

If you're interested in contribution, please check Contributing to Apache Zeppelin (Code) and Contributing to Apache Zeppelin (Website).

>#### Build profiles

##### Spark Interpreter

To build with a specific Spark version, Hadoop version or specific features, define one or more of the following profiles and options:

**-Pspark-[version]**

Set spark major version

Available profiles are

```ini
-Pspark-2.1
-Pspark-2.0
-Pspark-1.6
-Pspark-1.5
-Pspark-1.4
-Pcassandra-spark-1.5
-Pcassandra-spark-1.4
-Pcassandra-spark-1.3
-Pcassandra-spark-1.2
-Pcassandra-spark-1.1
```

minor version can be adjusted by -Dspark.version=x.x.x

**-Phadoop-[version]**

set hadoop major version

Available profiles are

```ini
-Phadoop-0.23
-Phadoop-1
-Phadoop-2.2
-Phadoop-2.3
-Phadoop-2.4
-Phadoop-2.6
-Phadoop-2.7
```

minor version can be adjusted by -Dhadoop.version=x.x.x

**-Pscala-[version] (optional)**

set scala version (default 2.10) Available profiles are

```ini
-Pscala-2.10
-Pscala-2.11
-Pyarn (optional)
```

enable YARN support for local mode

*YARN for local mode is not supported for Spark v1.5.0 or higher. Set SPARK_HOME instead.*

**-Ppyspark (optional)**

enable PySpark support for local mode.

**-Pr (optional)**

enable R support with SparkR integration.

**-Psparkr (optional)**

another R support with SparkR integration as well as local mode support.

**-Pvendor-repo (optional)**

enable 3rd party vendor repository (cloudera)

**-Pmapr[version] (optional)**

For the MapR Hadoop Distribution, these profiles will handle the Hadoop version. As MapR allows different versions of Spark to be installed, you should specify which version of Spark is installed on the cluster by adding a Spark profile (-Pspark-1.6, -Pspark-2.0, etc.) as needed. The correct Maven artifacts can be found for every version of MapR at http://doc.mapr.com

Available profiles are

```ini
-Pmapr3
-Pmapr40
-Pmapr41
-Pmapr50
-Pmapr51
```

**-Pexamples (optional)**

Bulid examples under zeppelin-examples directory

>#### Build command examples

Here are some examples with several options:

```sh
# build with spark-2.1, scala-2.11
./dev/change_scala_version.sh 2.11
mvn clean package -Pspark-2.1 -Phadoop-2.4 -Pyarn -Ppyspark -Psparkr -Pscala-2.11 -DskipTests

# build with spark-2.0, scala-2.11
./dev/change_scala_version.sh 2.11
mvn clean package -Pspark-2.0 -Phadoop-2.4 -Pyarn -Ppyspark -Psparkr -Pscala-2.11 -DskipTests

# build with spark-1.6, scala-2.10
mvn clean package -Pspark-1.6 -Phadoop-2.4 -Pyarn -Ppyspark -Psparkr -DskipTests

# spark-cassandra integration
mvn clean package -Pcassandra-spark-1.5 -Dhadoop.version=2.6.0 -Phadoop-2.6 -DskipTests -DskipTests

# with CDH
mvn clean package -Pspark-1.5 -Dhadoop.version=2.6.0-cdh5.5.0 -Phadoop-2.6 -Pvendor-repo -DskipTests

# with MapR
mvn clean package -Pspark-1.5 -Pmapr50 -DskipTests
```

Ignite Interpreter

```sh
mvn clean package -Dignite.version=1.8.0 -DskipTests
```

Scalding Interpreter

```sh
mvn clean package -Pscalding -DskipTests
```


```

```

## Build requirements

>#### Install requirements

If you don't have requirements prepared, install it. (The installation method may vary according to your environment, example is for Ubuntu.)

```sh
sudo apt-get update
sudo apt-get install git
sudo apt-get install openjdk-7-jdk
sudo apt-get install npm
sudo apt-get install libfontconfig
```

>#### Install maven

```sh
wget http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -zxf apache-maven-3.3.9-bin.tar.gz -C /usr/local/
sudo ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn
```

*Notes:* 
- Ensure node is installed by running *node --version*
- Ensure maven is running version 3.1.x or higher with mvn -version - Configure maven to use more memory than usual by *export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1024m"*

>#### Proxy setting (optional)

If you're behind the proxy, you'll need to configure maven and npm to pass through it.

First of all, configure maven in your *~/.m2/settings.xml*.

```xml
<settings>
  <proxies>
    <proxy>
      <id>proxy-http</id>
      <active>true</active>
      <protocol>http</protocol>
      <host>localhost</host>
      <port>3128</port>
      <!-- <username>usr</username>
      <password>pwd</password> -->
      <nonProxyHosts>localhost|127.0.0.1</nonProxyHosts>
    </proxy>
    <proxy>
      <id>proxy-https</id>
      <active>true</active>
      <protocol>https</protocol>
      <host>localhost</host>
      <port>3128</port>
      <!-- <username>usr</username>
      <password>pwd</password> -->
      <nonProxyHosts>localhost|127.0.0.1</nonProxyHosts>
    </proxy>
  </proxies>
</settings>
```

Then, next commands will configure npm.

```sh
npm config set proxy http://localhost:3128
npm config set https-proxy http://localhost:3128
npm config set registry "http://registry.npmjs.org/"
npm config set strict-ssl false
```

Configure git as well

```sh
git config --global http.proxy http://localhost:3128
git config --global https.proxy http://localhost:3128
git config --global url."http://".insteadOf git://
```

To clean up, set active false in Maven settings.xml and run these commands.

```
npm config rm proxy
npm config rm https-proxy
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."http://".insteadOf
```
*Notes:* 
- If you are behind NTLM proxy you can use Cntlm Authentication Proxy. - Replace *localhost:3128* with the standard pattern *http://user:pwd@host:port*.


## Package

To package the final distribution including the compressed archive, run:

```sh
mvn clean package -Pbuild-distr
```
To build a distribution with specific profiles, run:

```sh
mvn clean package -Pbuild-distr -Pspark-1.5 -Phadoop-2.4 -Pyarn -Ppyspark
```

The profiles -Pspark-1.5 -Phadoop-2.4 -Pyarn -Ppyspark can be adjusted if you wish to build to a specific spark versions, or omit support such as yarn.

The archive is generated under *zeppelin-distribution/target directory*

## Run end-to-end tests

Zeppelin comes with a set of end-to-end acceptance tests driving headless selenium browser

```sh
# assumes zeppelin-server running on localhost:8080 (use -Durl=.. to override)
mvn verify

# or take care of starting/stoping zeppelin-server from packaged zeppelin-distribuion/target
mvn verify -P using-packaged-distr

```


```

```
# Contributing to Apache Zeppelin ( Code )

- Setting up
- Getting the source code
    - git access
    - Build
    - Run Zeppelin server in development mode
    - Generating Thrift Code
- Where to Start
- Stay involved

*NOTE* : Apache Zeppelin is an Apache2 License Software. Any contributions to Zeppelin (Source code, Documents, Image, Website) means you agree with license all your contributions as Apache2 License.

## Setting up

Here are some tools you will need to build and test Zeppelin.

Software Configuration Management ( SCM )

Since Zeppelin uses Git for it's SCM system, you need git client installed in your development machine.

Integrated Development Environment ( IDE )

You are free to use whatever IDE you prefer, or your favorite command line editor.

Build Tools

To build the code, install

Oracle Java 7
Apache Maven


>## Getting the source code


First of all, you need Zeppelin source code. The official location of Zeppelin is http://git.apache.org/zeppelin.git.

#### git access

Get the source code on your development machine using git.

```sh
git clone git://git.apache.org/zeppelin.git zeppelin
```

You may also want to develop against a specific branch. For example, for branch-0.5.6

```sh
git clone -b branch-0.5.6 git://git.apache.org/zeppelin.git zeppelin
```

Apache Zeppelin follows Fork & Pull as a source control workflow. If you want to not only build Zeppelin but also make any changes, then you need to fork Zeppelin github mirror repository and make a pull request.

#### Build

```sh
mvn install
```

To skip test
```sh
mvn install -DskipTests
```

To build with specific spark / hadoop version
```sh
mvn install -Dspark.version=x.x.x -Dhadoop.version=x.x.x
```

For the further

>## Run Zeppelin server in development mode

```sh
cd zeppelin-server
HADOOP_HOME=YOUR_HADOOP_HOME JAVA_HOME=YOUR_JAVA_HOME mvn exec:java -Dexec.mainClass="org.apache.zeppelin.server.ZeppelinServer" -Dexec.args=""
```

*Note*: Make sure you first run mvn clean install -DskipTests on your zeppelin root directory, otherwise your server build will fail to find the required dependencies in the local repro.
or use daemon script

```sh
bin/zeppelin-daemon start
```

Server will be run on [http://localhost:8080](http://localhost:8080).

>## Generating Thrift Code

Some portions of the Zeppelin code are generated by Thrift. For most Zeppelin changes, you don't need to worry about this. But if you modify any of the Thrift IDL files (e.g. zeppelin-interpreter/src/main/thrift/*.thrift), then you also need to regenerate these files and submit their updated version as part of your patch.

To regenerate the code, install thrift-0.9.2 and then run the following command to generate thrift code.

cd <zeppelin_home>/zeppelin-interpreter/src/main/thrift
./genthrift.sh
Where to Start
You can find issues for beginner & newbie

Stay involved
Contributors should join the Zeppelin mailing lists.

dev@zeppelin.apache.org is for people who want to contribute code to Zeppelin. subscribe, unsubscribe, archives
If you have any issues, create a ticket in JIRA.



```
##################################################################################################################
# APACHE ZEPPELIN
##################################################################################################################
```


```sh
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1024m"
```


# Upgrade R

@see https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04

https://cloud.r-project.org/bin/linux/ubuntu/trusty/r-base-core_3.3.1-1trusty0_amd64.deb


# Install NOde.JS

@see https://nodejs.org/en/download/package-manager/

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

## Alternatively, for Node.js v6:

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

```

```
# Build
## spark 1.x

```sh
> mvn clean install -e -DskipTests -Dspark.version=1.6.2 -Dhadoop.version=2.7.2 -Pr -Psparkr -Pvendor-repo -Pexamples -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true
```

## spark 2.x 

```sh
>mvn clean install -e -DskipTests -Dspark.version=2.0.0 -Dhadoop.version=2.7.2 -Pscala-2.11 -Pr -Psparkr -Pvendor-repo -Pexamples -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true


[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Zeppelin ........................................... SUCCESS [  9.807 s]
[INFO] Zeppelin: Interpreter .............................. SUCCESS [ 16.197 s]
[INFO] Zeppelin: Zengine .................................. SUCCESS [ 10.435 s]
[INFO] Zeppelin: Display system apis ...................... SUCCESS [ 25.923 s]
[INFO] Zeppelin: Spark dependencies ....................... SUCCESS [  01:39 h]
[INFO] Zeppelin: Spark .................................... SUCCESS [ 41.457 s]
[INFO] Zeppelin: Markdown interpreter ..................... SUCCESS [  1.161 s]
[INFO] Zeppelin: Angular interpreter ...................... SUCCESS [  0.896 s]
[INFO] Zeppelin: Shell interpreter ........................ SUCCESS [  1.217 s]
[INFO] Zeppelin: Livy interpreter ......................... SUCCESS [  1.433 s]
[INFO] Zeppelin: HBase interpreter ........................ SUCCESS [  8.597 s]
[INFO] Zeppelin: PostgreSQL interpreter ................... SUCCESS [  2.218 s]
[INFO] Zeppelin: JDBC interpreter ......................... SUCCESS [  2.145 s]
[INFO] Zeppelin: File System Interpreters ................. SUCCESS [  2.453 s]
[INFO] Zeppelin: Flink .................................... SUCCESS [ 15.681 s]
[INFO] Zeppelin: Apache Ignite interpreter ................ SUCCESS [  3.087 s]
[INFO] Zeppelin: Kylin interpreter ........................ SUCCESS [  1.202 s]
[INFO] Zeppelin: Python interpreter ....................... SUCCESS [  1.088 s]
[INFO] Zeppelin: Lens interpreter ......................... SUCCESS [  7.952 s]
[INFO] Zeppelin: Apache Cassandra interpreter ............. SUCCESS [01:34 min]
[INFO] Zeppelin: Elasticsearch interpreter ................ SUCCESS [  7.035 s]
[INFO] Zeppelin: Alluxio interpreter ...................... SUCCESS [  5.505 s]
[INFO] Zeppelin: web Application .......................... SUCCESS [02:18 min]
[INFO] Zeppelin: Server ................................... SUCCESS [ 30.142 s]
[INFO] Zeppelin: Packaging distribution ................... SUCCESS [  4.715 s]
[INFO] Zeppelin: R Interpreter ............................ SUCCESS [ 49.150 s]
[INFO] Zeppelin: Examples ................................. SUCCESS [  0.497 s]
[INFO] Zeppelin: Example application - Clock .............. SUCCESS [  0.923 s]
[INFO] Zeppelin: Example application - Horizontal Bar chart SUCCESS [  0.764 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 01:47 h
[INFO] Finished at: 2016-07-31T10:04:48-07:00
[INFO] Final Memory: 202M/672M
[INFO] ------------------------------------------------------------------------

```

# Install R packages

```sh
install.packages('devtools', repos = 'http://cran.us.r-project.org')
install.packages('knitr', repos = 'http://cran.us.r-project.org')
install.packages('ggplot2', repos = 'http://cran.us.r-project.org')
install.packages(c('devtools','mplot', 'googleVis'), repos = 'http://cran.us.r-project.org'); require(devtools); install_github('ramnathv/rCharts')
install.packages("evaluate", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("base64enc", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("devtools", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("Cairo", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("dplyr", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("caret", dependencies = TRUE, repos='http://cran.us.r-project.org')
install.packages("repr", dependencies = TRUE, repos='http://irkernel.github.io/')

install.packages('glmnet', repos = 'http://cran.us.r-project.org')
install.packages('pROC', repos = 'http://cran.us.r-project.org')
install.packages('data.table', repos = 'http://cran.us.r-project.org')
install.packages('caret', repos = 'http://cran.us.r-project.org')
install.packages('sqldf', repos = 'http://cran.us.r-project.org')
install.packages('wordcloud', repos = 'http://cran.us.r-project.org')
```


# Install SparkR

```sh
>{SPARK_HOME}/R/install-dev.sh

#test Spark env
>./bin/spark-submit examples/src/main/r/dataframe.R

```



# Add SparkR to R .libPaths()

```R
if (!require('devtools')) install.packages('devtools')
devtools::install_github('apache/spark@v1.6.2', subdir='R/pkg')

Sys.setenv(SPARK_HOME='/usr/local/cloud/spark-1.6.2')
.libPaths(c(file.path(Sys.getenv('SPARK_HOME'), 'R', 'lib'), .libPaths()))
```



# conf/zeppelin-env.sh

```sh
export JAVA_HOME=/usr/local/cloud/java/jdk1.8.0_92

export SPARK_HOME=${SPARK_HOME:-/usr/local/cloud/spark-2.1.0-bin-hadoop2.7}
export HADOOP_HOME=${HADOOP_HOME:-/usr/local/cloud/hadoop-2.7.2}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/usr/local/cloud/hadoop-2.7.2/etc/hadoop}

export HBASE_HOME=${HBASE_HOME:-/usr/local/cloud/hbase-1.2.3}
export HBASE_CONF_DIR=${HADOOP_CONF_DIR:-/usr/local/cloud/hbase-1.2.3/conf}
```




# Enable Remote Debug with IDEA 

>## 1.Select the "run" menu, and choose "edit configuration".

<img src="images/remote-debug/1-edit configuration.jpg" width="1024"/>

>## 2.Select the Remote Tab, and click on the plus sign to add a new configuration.

<img src="images/remote-debug/2-add a new remote configuration.jpg" width="1024"/>

>## 3.Change the name of the configuration to something meaningful like "NotebookRestApi"

<img src="images/remote-debug/3-set the configuration name.jpg" width="1024"/>

>## 4.Copy the command line arguments in the middle of the screen.

Example: 

```
-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005
```

This command line is what is needed to start the Application Server in debug mode, see "To set the server to startup in debug mode."

<img src="images/remote-debug/3-set the configuration name.jpg" width="1024"/>

>## 5.Click OK, and your IDE configuration is now complete.

<img src="images/remote-debug/4-debug mode view.jpg" width="1024"/>

# Enable Development model

```sh
# add the following lines below to the end of ${ZEPPELIN_HOME}/conf/zeppelin-env.sh 
export ZEPPELIN_MEM="-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"

# start
>cd zeppelin-server
>HADOOP_HOME=/usr/local/cloud/hadoop-2.7.2 JAVA_HOME=/usr/local/cloud/java/jdk1.8.0_92 ZEPPELIN_PORT=9898 ZEPPELIN_WAR=../zeppelin-web/dist mvn exec:java -Dexec.mainClass="org.apache.zeppelin.server.ZeppelinServer" -Dexec.args=""

Downloading Node.js from http://nodejs.org/dist/v0.10.22/node-v0.10.22-linux-x64.tar.gz to /home/lhfei/app_workspaces/Zeppelin-With-R/zeppelin-web/node_tmp/node.tar.gz

```


# Add 3rd party Library in to an Interpreter

@see: https://zeppelin.apache.org/docs/0.7.0-SNAPSHOT/manual/dependencymanagement.html


>#### Livy

#Step 1: Install Livy server

```sh
mvn clean package -Pr -Ppyspark -Psparkr -DskipTests -X

mvn clean package install -e -Dhadoop.version=2.7.2 -Dspark.version=2.0.0 -Pspark-2.0 -Pscala-2.11 -Phadoop-2.7 -Ppyspark -Pr -Psparkr -Pvendor-repo -Pexamples -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true -DskipTests


SPARK_HOME=/usr/local/cloud/spark-2.0.0-bin-hadoop2.7 HADOOP_HOME=/usr/local/cloud/hadoop-2.7.2 JAVA_HOME=/usr/local/cloud/java/jdk1.8.0_92 ZEPPELIN_PORT=8989 mvn exec:java -Dexec.mainClass="org.apache.zeppelin.server.ZeppelinServer" -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000 -Dexec.args="" -e -Drat.skip=true -Dcheckstyle.skip=true -Dcobertura.skip=true -DskipTests

```

```

```
>## REST API


```html
# Get an existing notebook information
http://[zeppelin-server]:[zeppelin-port]/api/notebook/[notebookId]

# Run a paragraph
http://[zeppelin-server]:[zeppelin-port]/api/notebook/job/[notebookId]/[paragraphId]
http://master2.cloud.cn:8989/api/notebook/job/2BUP41KKC/20160825-011346_35090149

# Get a paragraph information
http://[zeppelin-server]:[zeppelin-port]/api/notebook/[notebookId]/paragraph/[paragraphId]

http://master2.cloud.cn:8989/api/notebook/2BUP41KKC/paragraph/20160825-011346_35090149

# Get the status of a single paragraph
http://[zeppelin-server]:[zeppelin-port]/api/notebook/job/[notebookId]/[paragraphId]

# Create a new paragraph
http://[zeppelin-server]:[zeppelin-port]/api/notebook/[notebookId]/paragraph# 

# Run a paragraph
http://[zeppelin-server]:[zeppelin-port]/api/notebook/job/[notebookId]/[paragraphId]

# Stop a paragraph
http://[zeppelin-server]:[zeppelin-port]/api/notebook/job/[notebookId]/[paragraphId]

```

====================================================================================


====================================================================================

# zeppelin-web error

```xml
	<!-- add arguments into grunt plugin: -->
	  <execution>
		<id>grunt build</id>
		<goals>
		  <goal>grunt</goal>
		</goals>
		<configuration>
		  <arguments>build  --allsow-root  --no-color --force</arguments>
		</configuration>
	  </execution>
```


# R Interpreter FAILURE
```sh
-rwxr-xr-x 1 lhfei lhfei 1344 May 26 19:43 install-dev.sh*
drwxr-xr-x 3 lhfei lhfei 4096 May 26 19:43 rzeppelin/
lhfei@master1:~/app_workspaces/zeppelin/zeppelin-dev/r/R$ ./install-dev.sh 
+++ dirname ./install-dev.sh
++ cd .
++ pwd
+ FWDIR=/home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R
+ LIB_DIR=/home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R/../../R/lib
+ mkdir -p /home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R/../../R/lib
+ pushd /home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R
+ R CMD INSTALL --library=/home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R/../../R/lib /home/lhfei/app_workspaces/zeppelin/zeppelin-dev/r/R/rzeppelin/
ERROR: dependency ‘evaluate’ is not available for package ‘rzeppelin’
* removing ‘/home/lhfei/app_workspaces/zeppelin/zeppelin-dev/R/lib/rzeppelin’

```

```sh
R -e 'install.packages("evaluatep
```

```sh
java.lang.RuntimeException: Error in library("knitr"): there is no package called 'knitr'

#
$ R -e 'install.packages("knitr")'
```






