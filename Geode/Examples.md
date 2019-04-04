





### Start 







### Build source

```sh
cd geode-app
mvn clean package -e -DskipTests
```





### Deploy Jar 

```sh
gfsh>deploy --jars=/export/geode_flyedw/geode-app-0.1.0.jar

Deploying files: geode-app-0.1.0.jar
Total file size is: 42.05MB

Continue?  (Y/n): y
  Member   |    Deployed JAR     | Deployed JAR Location
---------- | ------------------- | ------------------------------------------------------
server_247 | geode-app-0.1.0.jar | /export/geode_flyedw/server_247/geode-app-0.1.0.v1.jar
server_249 | geode-app-0.1.0.jar | /export/geode_flyedw/server_249/geode-app-0.1.0.v1.jar
server_253 | geode-app-0.1.0.jar | /export/geode_flyedw/server_253/geode-app-0.1.0.v1.jar
```



Now you can verified by following command:

```sh
gfsh>list deployed
  Member   |         JAR         | JAR Location
---------- | ------------------- | ------------------------------------------------------
server_247 | geode-app-0.1.0.jar | /export/geode_flyedw/server_247/geode-app-0.1.0.v1.jar
server_249 | geode-app-0.1.0.jar | /export/geode_flyedw/server_249/geode-app-0.1.0.v1.jar
server_253 | geode-app-0.1.0.jar | /export/geode_flyedw/server_253/geode-app-0.1.0.v1.jar
```

If you want to undeploy, for example:

```sh
gfsh>undeploy --jar=geode-app-0.1.0.jar
  Member   |   Un-Deployed JAR   | Un-Deployed From JAR Location
---------- | ------------------- | ------------------------------------------------------
server_247 | geode-app-0.1.0.jar | /export/geode_flyedw/server_247/geode-app-0.1.0.v1.jar
server_249 | geode-app-0.1.0.jar | /export/geode_flyedw/server_249/geode-app-0.1.0.v1.jar
server_253 | geode-app-0.1.0.jar | /export/geode_flyedw/server_253/geode-app-0.1.0.v1.jar
```



### Create Region

> ListenerApp

```sh
# for cn.lhfei.geode.example.listener.ListenerApp
gfsh>create region --name=simple_listener --type=REPLICATE_PERSISTENT --cache-listener=cn.lhfei.geode.example.listener.SimpleListener
  Member   | Status
---------- | -------------------------------------------------
server_247 | Region "/simple_listener" created on "server_247"
server_249 | Region "/simple_listener" created on "server_249"
server_253 | Region "/simple_listener" created on "server_253"
```



> QuoteLoaderApp

```sh
# for cn.lhfei.geode.example.loader.QuoteLoader
gfsh>create region --name=simple_loader --type=REPLICATE --cache-loader=cn.lhfei.geode.example.loader.QuoteLoader
  Member   | Status
---------- | -----------------------------------------------
server_247 | Region "/simple_loader" created on "server_247"
server_249 | Region "/simple_loader" created on "server_249"
server_253 | Region "/simple_loader" created on "server_253"
```

