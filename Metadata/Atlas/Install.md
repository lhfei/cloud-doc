### Prepared

```shell
mvn install:install-file -Dfile=/export/app_sdk/org.restlet-2.4.0.jar \
	-DgroupId=org.restlet.jee \
	-DartifactId=org.restlet \
	-Dversion=2.4.0 \
	-Dpackaging=jar 
	
	
mvn install:install-file -Dfile=/export/app_sdk/org.restlet.ext.servlet-2.4.0.jar \
	-DgroupId=org.restlet.jee \
	-DartifactId=org.restlet.ext.servlet \
	-Dversion=2.4.0 \
	-Dpackaging=jar 
```



#### POM.xml

```xml
<repositories>
  <repository>
    <id>maven-restlet</id>
    <name>Restlet repository</name>
    <url>https://maven.restlet.talend.com</url>
  </repository>
</repositories>

<properties>
  <restlet-version>2.4.3</restlet-version>
</properties>

<dependencies>
  <dependency>
    <groupId>org.restlet.jse</groupId>
    <artifactId>org.restlet</artifactId>
    <version>${restlet-version}</version>
  </dependency>
  <dependency>
    <groupId>org.restlet.jse</groupId>
    <artifactId>org.restlet.ext.jackson</artifactId>
    <version>${restlet-version}</version>
  </dependency>
</dependencies>
```



### Build

```shell
export MAVEN_OPTS="-Xms2g -Xmx2g"

mvn clean package -e -DskipTests -Drat.skip=true -Pdist

# embedded HBase and Solr
mvn clean package -e -DskipTests -Pdist,embedded-hbase-solr
```



### Hive

```shell
cd $ATLAS_HOME/hook-bin

# switch hive account
su hive
./import-hive.sh

----------------------------------
Enter username for atlas :- admin
Enter password for atlas :- 
```



### HBase

```shell
cd $ATLAS_HOME/hook-bin

# switch hbase account
su hbase

./import-hbase.sh

----------------------------------
Enter username for atlas :- admin
Enter password for atlas :- 
```



