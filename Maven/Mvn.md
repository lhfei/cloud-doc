### deploy jar 
```shell
mvn install:install-file -Dfile=<path-to-file> -DgroupId=<group-id> \
    -DartifactId=<artifact-id> -Dversion=<version> -Dpackaging=<packaging>
```

### install jar into local repository
```shell
mvn install:install-file -Dfile=/root/temp/pentaho/pentaho-aggdesigner-algorithm/5.1.5-jhyde/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar \
	-DgroupId=org.pentaho \
	-DartifactId=pentaho-aggdesigner-algorithm \
	-Dversion=5.1.5-jhyde \
	-Dpackaging=jar 
```

### install jar into remote repository	
```shell
mvn deploy:deploy-file \
	-Dfile=/root/temp/pentaho/pentaho-aggdesigner-algorithm/5.1.5-jhyde/pentaho-aggdesigner-algorithm-5.1.5-jhyde.jar \
	-DgroupId=org.pentaho \
	-DartifactId=pentaho-aggdesigner-algorithm \
	-Dversion=5.1.5-jhyde \
	-Dpackaging=jar \
	-DrepositoryId=libs-releases-local \
	-Durl=http://artifactory.360buy-develop.com/libs-releases/
```

### deploy pom
```shell
mvn deploy:deploy-file -DgroupId=<group-id> \
	-DartifactId=<artifact-id> \
	-Dversion=<version> \
	-Dpackaging=<type-of-packaging> \
	-Dfile=<path-to-file> \
	-DrepositoryId=<id-to-map-on-server-section-of-settings.xml> \

	-Durl=<url-of-the-repository-to-deploy>
```

### sepecial customer setting.xml file	

```shell
mvn -B -f /export/jenkins/workspace/JCLOUD-datafun/datafun-parent/pom.xml -s /root/.m2/settings.xml -gs /root/.m2/settings.xml clean install -e findbugs:findbugs cobertura:cobertura -DskipTests
```



### Resolving conflicts using the dependency tree
```shell
mvn dependency:tree -Dverbose -Dincludes=commons-collections
```
