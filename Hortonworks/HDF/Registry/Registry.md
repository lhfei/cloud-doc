# Registry

## Installation

### CentOS/RedHat

1. Install Java

   ```shell
   # wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz"
   #  tar xzf jdk-8u111-linux-i586.tar.gz
   # cd /opt/jdk1.8.0_111/
   # alternatives --install /usr/bin/java java /opt/jdk1.8.0_111/bin/java 2
   # alternatives --config java

   ```

2. Download latest Schema Registry binaries from here<https://github.com/hortonworks/registry/releases>

3. edit $REGISTRY_HOME/conf/registry-env.sh, add the following

   ```shell
   export JAVA_HOME=/opt/jdk1.8.0_111/
   ```

4. Setup Database

   4.1 Mysql

   Install Mysql

   ```shell
   sudo yum install mysql-server
   sudo mysql-server start
   ```

   Configure Mysql

   ```
    # set root password
   sudo mysql_secure_installation

   ```

   Setup Database

   ```
   mysql -u root -p
   create database schema_registry;
   CREATE USER 'registry_user'@'localhost' IDENTIFIED BY 'registry_password';
   GRANT ALL PRIVILEGES ON schema_registry.* TO 'registry_user'@'localhost' WITH GRANT OPTION;
   commit;

   ```

5. Configure registry.yaml

```shell
cp conf/registry.yaml.mysql.example conf/registry.yaml
```

Edit the folllowing section to add appropriate database and user settings

```yaml
storageProviderConfiguration:
 providerClass:"com.hortonworks.registries.storage.impl.jdbc.JdbcStorageManager"
   properties:
     db.type: "mysql"
     queryTimeoutInSecs: 30
     db.properties:
       dataSourceClassName: "com.mysql.jdbc.jdbc2.optional.MysqlDataSource"
       dataSource.url: "jdbc:mysql://192.168.149.91/schema_registry"
       dataSource.user:"registry_user"
       dataSource.password: "Lhfei"

```

- Run bootstrap scripts

```shell
$REGISTRY_HOME/bootstrap/boostrap-storage.sh migrate
```

- Start the registry server

`sudo ./bin/registry start`

Access the UI at [http://host.name:9090](http://host.name:9090/)





${KAFKA_HOME}/bin/kafka-topics.sh --create  –-zookeeper master1.cloud.cn:2181 –-topic truck_events_stream -–partitions 1 -–replication-factor 1

