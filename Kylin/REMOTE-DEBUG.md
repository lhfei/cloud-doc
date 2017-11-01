# Kylin Remote Debugging

Enable [**Kylin**](https://kylin.apache.org) remote debugging in IDEA step by step.
```
```

>## Step 1: Enable JVM remote debugging

First, you need to enable the JVM remote debugging, and set the port number, just like this:

```ini
## enable JVM remote debugging,and set the port is 8777
-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8777
```

In **Kylin**, this information can be specified in the ```kylin.sh``` file.

And now you can add it into the ```{KYLIN_HOME}/bin/kylin.sh file```.

```sh
hbase ${KYLIN_EXTRA_START_OPTS} \
-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
-Dlog4j.configuration=file:${KYLIN_HOME}/conf/kylin-server-log4j.properties \
-Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true \
-Dorg.apache.catalina.connector.CoyoteAdapter.ALLOW_BACKSLASH=true \
-Djava.endorsed.dirs=${tomcat_root}/endorsed  \
-Dcatalina.base=${tomcat_root} \
-Dcatalina.home=${tomcat_root} \
-Djava.io.tmpdir=${tomcat_root}/temp  \
-Dkylin.hive.dependency=${hive_dependency} \
-Dkylin.hbase.dependency=${hbase_dependency} \
-Dkylin.kafka.dependency=${kafka_dependency} \
-Dkylin.spark.dependency=${spark_dependency} \
-Dkylin.hadoop.conf.dir=${kylin_hadoop_conf_dir} \
-Dspring.profiles.active=${spring_profile} \
-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8777 \
org.apache.hadoop.util.RunJar ${tomcat_root}/bin/bootstrap.jar  org.apache.catalina.startup.Bootstrap start >> ${KYLIN_HOME}/logs/kylin.out 2>&1 & echo $! > ${KYLIN_HOME}/pid &

```
<img src="images/step1-enable-jvm remote debug.png" width="1024" />


>## Step 2: Create a remote run configuration

Create a remote run configuration:

1. Run -> Edit Configurations...
2. Click the "+" in the upper left
3. Select the "Remote" option in the left-most pane
4. Choose a name (I named mine "remote-debugging")
5. Set the port as above seted (*8777*)
5. Click "OK" to save:

<img src="images/step2-create a remote run configuration.png" width="1024" />

<img src="images/step3-set remote debugging port.png" width="1024" />


>## Step 3: Start Kylin Server

Open a terminal, and start **Kylin** server by command line. 

```sh
$ ${KYLIN_HOME}/bin/kylin.sh -v start
```

After successful start, you can start debug in IDEA IDE.


<img src="images/step4_1-start debug.png" width="1024" />

<img src="images/step4_2-check debug.png" width="1024" />


>## Step 4: Query in Debug model

Open your browser, and login to Kylin web console. Select the **Insight** model, and submit a query.

<img src="images/Step5_1-startt a query.png" width="1024" />

<img src="images/Step5_2-debug in idea.png" width="1024" />

