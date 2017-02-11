# **Netflix  Eureka**

> Edit *eureka-server/src/main/resources/eureka-server.properties* and uncomment the two settings that makes the demo server start up faster (via disabling safeguards)

```ini
## Set this only for this sample service without which starting the instance will by default wait for the default of 5 mins
eureka.waitTimeInMsWhenSyncEmpty=0

## for the example, set this to zero as we will not have peers to sync up with.
## Do not set in a real environment with multi-node eureka clusters.
eureka.numberRegistrySyncRetries=0

## for cascade loading of property files for different deployment environments and/or regions etc,
## see archaius cascade loading: https://github.com/Netflix/archaius/wiki/Deployment-context
```

> Build the application

```sh
cd {eureka_home}
./gradlew clean build -Dskip.tests --info
```

> Deploy eureka server

```sh
cp ./eureka-server/build/libs/eureka-server-XXX-SNAPSHOT.war $TOMCAT_HOME/webapps/eureka.war 
```

> Running the examples directly


