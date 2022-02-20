### Entity for MySQL 8

#### DEFAULT

```sql
CREATE DATABASE ba_biz
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'bizadmin'@"localhost" IDENTIFIED BY 'Bizuser_1473';
create user 'bizadmin'@"%"         IDENTIFIED BY 'Bizuser_1473';

grant all on ba_biz.* to "bizadmin"@"localhost" with grant option;
grant all on ba_biz.* to "bizadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```



#### OLAP

```sql
CREATE DATABASE ba_bizolap
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'bizolap'@"localhost" IDENTIFIED BY 'Bizuser_1473';
create user 'bizolap'@"%"         IDENTIFIED BY 'Bizuser_1473';

grant all on ba_bizolap.* to "bizolap"@"localhost" with grant option;
grant all on ba_bizolap.* to "bizolap"@"%" with grant option;

FLUSH PRIVILEGES;
```





#### TENANT

```sql
CREATE DATABASE ba_biztenant
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'biztenant'@"localhost" IDENTIFIED BY 'Bizuser_1473';
create user 'biztenant'@"%"         IDENTIFIED BY 'Bizuser_1473';

grant all on ba_biztenant.* to "biztenant"@"localhost" with grant option;
grant all on ba_biztenant.* to "biztenant"@"%" with grant option;

FLUSH PRIVILEGES;
```









### Entity for MySQL 5.7



#### DEFAULT

```sql
CREATE DATABASE ba_biz
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'bizadmin'@'localhost' IDENTIFIED BY 'Bizuser_1473';

GRANT ALL ON ba_biz.* TO 'bizadmin'@'%' IDENTIFIED BY 'Bizuser_1473';

FLUSH PRIVILEGES;
```





#### OLAP

```sql
CREATE DATABASE ba_bizolap
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'bizolap'@'localhost' IDENTIFIED BY 'Bizuser_1473';

GRANT ALL ON ba_bizolap.* TO 'bizolap'@'%' IDENTIFIED BY 'Bizuser_1473';

FLUSH PRIVILEGES;
```





#### TENANT

```sql
CREATE DATABASE ba_biztenant
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'biztenant'@'localhost' IDENTIFIED BY 'Bizuser_1473';

GRANT ALL ON ba_biztenant.* TO 'biztenant'@'%' IDENTIFIED BY 'Bizuser_1473';

FLUSH PRIVILEGES;
```





### Add MySQL Driver

Append `mysql-jdbc-java` to `dependencies` section in `build.gradle` file as below:

```ini
    compile  'mysql:mysql-connector-java:8.0.16'	
    // compile  'mysql:mysql-connector-java:5.1.48'
```



Change the driver class name in `framework/entity/config/entitymanager.xml` file:

```xml
    <delegator name="default" entity-model-reader="main" entity-group-reader="main" entity-eca-reader="main" distributed-cache-clear-enabled="false">
        <group-map group-name="org.apache.ofbiz" datasource-name="localmysql"/>
        <group-map group-name="org.apache.ofbiz.olap" datasource-name="localmysqlolap"/>
        <group-map group-name="org.apache.ofbiz.tenant" datasource-name="localmysqltenant"/>
    </delegator>
```



```xml
<datasource name="localmysql"
 ... ...
        <inline-jdbc
                jdbc-driver="com.mysql.jdbc.Driver"
                jdbc-uri="jdbc:mysql://10.170.234.141/ba_biz?autoReconnect=true&amp;characterEncoding=UTF-8"
                jdbc-username="bizadmin"
                jdbc-password="Bizuser_1473"
                isolation-level="ReadCommitted"
                pool-minsize="2"
                pool-maxsize="250"
                time-between-eviction-runs-millis="600000"/>
    </datasource>
```

