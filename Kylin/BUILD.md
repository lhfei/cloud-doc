How to Build Binary Package
Generate Binary Package

This document talks about how to build binary package from source code.

Download source code

You can download Apache Kylin source code from github repository.

git clone https://github.com/apache/kylin kylin
Build Binary Package

In order to generate binary package, maven and npm are pre-requisites.

(Optional) If you��re behind a proxy server, both npm and bower need be told with the proxy info before running ./script/package.sh:

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

git clone https://github.com/apache/kylin.git
Install Kylin artifacts to the maven repo

mvn clean install -DskipTests
Modify local configuration

Local configuration must be modified to point to your hadoop sandbox (or CLI) machine.

In examples/test_case_data/sandbox/kylin.properties
Find sandbox and replace with your hadoop hosts (if you��re using HDP sandbox, this can be skipped)
Find kylin.job.run.as.remote.cmd and change it to ��true�� (in code repository the default is false, which assume running it on hadoop CLI)
Find kylin.job.remote.cli.username and kylin.job.remote.cli.password, fill in the user name and password used to login hadoop cluster for hadoop command execution; If you��re using HDP sandbox, the default username is root and password is hadoop.
In examples/test_case_data/sandbox
For each configuration xml file, find all occurrences of sandbox and sandbox.hortonworks.com, replace with your hadoop hosts; (if you��re using HDP sandbox, this can be skipped)
An alternative to the host replacement is updating your hosts file to resolve sandbox and sandbox.hortonworks.com to the IP of your sandbox machine.

Run unit tests

Run unit tests to validate basic function of each classes.

mvn test -fae -Dhdp.version=<hdp-version> -P sandbox
Run integration tests

Before actually running integration tests, need to run some end-to-end cube building jobs for test data population, in the meantime validating cubing process. Then comes with the integration tests.

It might take a while (maybe one hour), please keep patient.

mvn verify -fae -Dhdp.version=<hdp-version> -P sandbox
To learn more about test, please refer to How to test.

Launch Kylin Web Server locally

Copy server/src/main/webapp/WEB-INF to webapp/app/WEB-INF

cp -r server/src/main/webapp/WEB-INF webapp/app/WEB-INF
Download JS for Kylin web GUI. npm is part of Node.js, please search about how to install it on your OS.

cd webapp
npm install -g bower
bower --allow-root install
In IDE, launch org.apache.kylin.rest.DebugTomcat with working directory set to the /server folder. (By default Kylin server will listen on 7070 port; If you want to use another port, please specify it as a parameter when run `DebugTomcat)

Check Kylin Web at http://localhost:7070/kylin (user:ADMIN, password:KYLIN)

For IntelliJ IDEA users, need modify ��server/kylin-server.iml�� file, replace all ��PROVIDED�� to ��COMPILE��, otherwise an ��java.lang.NoClassDefFoundError: org/apache/catalina/LifecycleListener�� error may be thrown.