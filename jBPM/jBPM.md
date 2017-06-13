



##### db/jbpm-persistence-JPA2.xml
```


```



```xml
<datasource jndi-name="java:jboss/datasources/ExampleDS" pool-name="ExampleDS" enabled="true" use-java-context="true">
    <connection-url>jdbc:mysql://192.168.177.80:3306/scp-ai</connection-url>
    <driver>mysql</driver>
    <security>
        <user-name>root</user-name>
        <password>Lhfei</password>
    </security>
</datasource>
<datasource jta="true" jndi-name="java:jboss/datasources/jbpmDS" pool-name="MySQLDS" enabled="true" use-java-context="true" use-ccm="true">
    <connection-url>jdbc:mysql://192.168.177.80:3306/scp-ai</connection-url>
    <driver>mysql</driver>
    <security>
        <user-name>root</user-name>
    </security>
</datasource>
<drivers>
    <driver name="mysql" module="com.mysql">
        <xa-datasource-class>com.mysql.jdbc.jdbc2.optional.MysqlXADataSource</xa-datasource-class>
    </driver>
</drivers>
```




```sh
ant install.demo.noeclipse
ant start.demo.noeclipse
```

#### Log output

```
wildfly-10.0.0.Final\standalone\log\
```


```sh
# Find process PID by port
netstat -a -n -o | find "8080"

# kill process by PID
taskkill /pid 10672 /f

```
















----
----

#FAQs

####

> ##### Errors

    ```md
    2017-04-25 18:36:21,954 INFO  [org.wildfly.extension.messaging-activemq] (MSC service thread 1-4) WFLYMSGAMQ0001: AIO wasn't located on this platform, it will fall back to using pure Java NIO.
    2017-04-25 18:36:22,032 ERROR [org.jboss.msc.service.fail] (MSC service thread 1-6) MSC000001: Failed to start service jboss.serverManagement.controller.management.http: org.jboss.msc.service.StartException in service jboss.serverManagement.controller.management.http: WFLYSRV0083: Failed to start the http-interface service
    	at org.jboss.as.server.mgmt.UndertowHttpManagementService.start(UndertowHttpManagementService.java:271)
    	at org.jboss.msc.service.ServiceControllerImpl$StartTask.startService(ServiceControllerImpl.java:1948)
    	at org.jboss.msc.service.ServiceControllerImpl$StartTask.run(ServiceControllerImpl.java:1881)
    	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
    	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
    	at java.lang.Thread.run(Thread.java:745)
    Caused by: java.lang.RuntimeException: java.net.BindException: Address already in use: bind
    	at org.jboss.as.domain.http.server.ManagementHttpServer.start(ManagementHttpServer.java:157)
    	at org.jboss.as.server.mgmt.UndertowHttpManagementService.start(UndertowHttpManagementService.java:237)
    	... 5 more
    Caused by: java.net.BindException: Address already in use: bind
    	at sun.nio.ch.Net.bind0(Native Method)
    	at sun.nio.ch.Net.bind(Net.java:433)
    	at sun.nio.ch.Net.bind(Net.java:425)
    	at sun.nio.ch.ServerSocketChannelImpl.bind(ServerSocketChannelImpl.java:223)
    	at sun.nio.ch.ServerSocketAdaptor.bind(ServerSocketAdaptor.java:74)
    	at sun.nio.ch.ServerSocketAdaptor.bind(ServerSocketAdaptor.java:67)
    	at org.xnio.nio.NioXnioWorker.createTcpConnectionServer(NioXnioWorker.java:192)
    	at org.xnio.XnioWorker.createStreamConnectionServer(XnioWorker.java:243)
    	at org.jboss.as.domain.http.server.ManagementHttpServer.start(ManagementHttpServer.java:144)
    	... 6 more
    ```
##### Resoled

    Port 9990 has bean used, now find the process and kill it.    

    ```
    netstat -ano | find "9990"
    taskkill /pid {pid} /f
    ```
    

> ##### Error


    ```
    address: ([ ("subsystem" => "datasources"), ("jdbc-driver" => "mysql") ]) - failure description: "WFLYJCA0041: Failed to load module for driver [com.mysql]"
    ```
    

###### Resolved




 wildfly-10.0.0.Final\modules\com\mysql\main\module.xml

```xml
<module xmlns="urn:jboss:module:1.0" name="com.mysql">
   <resources>
     <resource-root path="mysql-connector-java-5.1.41.jar"/>
   </resources>

   <dependencies>
      <module name="javax.api"/>
      <module name="javax.transaction.api"/>
    </dependencies>
</module>

```