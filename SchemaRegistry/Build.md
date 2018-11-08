



> Checkout resource

```sh
git clone --progress https://github.com/hortonworks/registry.git
```



> Build and Dist

```sh
mvn clean install -e -DskipTests -Pdist
```



>Install

```sh
# copy the dist to $REGISTRY_HOME

tar xvzf registry-dist/target/hortonworks-registry-{version}.tar.gz  -C $REGISTRY_INSTALL_DIR

```



> Setup Database

Copy `conf/registry-mysql-example.yaml`  to  `conf/registry.yaml` , and edit the following section to add appropriate database and user settings

```yaml
storageProviderConfiguration:
 providerClass:"com.hortonworks.registries.storage.impl.jdbc.JdbcStorageManager"
   properties:
     db.type: "mysql"
     queryTimeoutInSecs: 30
     db.properties:
       dataSourceClassName: "com.mysql.jdbc.jdbc2.optional.MysqlDataSource"
       dataSource.url: "jdbc:mysql://localhost/schema_registry"
       dataSource.user:"registry_user"
       dataSource.password: "registry_password"
```



> Run bootstrap scripts

```sh
$REGISTRY_HOME/bootstrap/boostrap-storage.sh
```



> Start the Registry Server

```sh
./bin/registry start
```



