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



```properties
###Eureka Client configuration for Sample Service that register with Eureka

# see the README in eureka-examples to see an overview of the example set up

## configurations related to self identification for registration.
## There are other properties that can be defined, see eureka-client/../CloudInstanceConfig for full details.
# where am I deployed?
eureka.region=default

# what is my application name? (clients can query on this appName)
eureka.name=sampleRegisteringService

# what is my application virtual ip address? (clients can query on this vipAddress)
eureka.vipAddress=BDS-TEST-004.LOCAL

# what is the port that I serve on? (Change this if port 8001 is already in use in your environment)
eureka.port=8001

## configuration related to reaching the eureka servers
eureka.preferSameZone=true
eureka.shouldUseDns=false
eureka.serviceUrl.default=http://192.168.177.80:8080/eureka/v2/
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


