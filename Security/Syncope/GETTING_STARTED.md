

### Install

Getting ready in a few easy steps:

1. [download](https://syncope.apache.org/downloads) the standalone distribution

2. unzip the distribution archive

3. go into the created Apache Tomcat directory

4. start Apache Tomcat

   - GNU / Linux, Mac OS X

     ```
     $ chmod 755 ./bin/*.sh
     $ ./bin/startup.sh
     ```

   - Windows

     ```
     > bin/startup.bat
     ```



### Configuration

All configuration files in `{syncope_home}/apache-tomcat-{version}/webapps/syncope/WEB-INF/classes`.

#### DBMS

| Caution | The changes reported below to support different DBMSes are not complete files, but only show the lines that need to be updated. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

##### PostgreSQL

In `provisioning.properties`:

```
quartz.jobstore=org.quartz.impl.jdbcjobstore.PostgreSQLDelegate
quartz.sql=tables_postgres.sql
```

In `domains/Master.properties` (for the `Master` domain):

```
Master.driverClassName=org.postgresql.Driver
Master.url=jdbc:postgresql://localhost:5432/syncope
Master.schema=
Master.username=syncope
Master.password=syncope
Master.databasePlatform=org.apache.openjpa.jdbc.sql.PostgresDictionary
Master.orm=META-INF/spring-orm.xml
```

| Warning | This assumes that you have a PostgreSQL instance running on localhost, listening on its default port 5432 with a database `syncope` fully accessible by user `syncope` with password `syncope`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

Download and save it under `core/src/main/resources/`.

##### MySQL

In `provisioning.properties`:

```
quartz.jobstore=org.quartz.impl.jdbcjobstore.StdJDBCDelegate
quartz.sql=tables_mysql_innodb.sql
```

| Warning | This assumes that the InnoDB engine is enabled in your MySQL instance - if this is not the case, then change the value for `quartz.sql` to `tables_mysql.sql`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

In `domains/Master.properties` (for the `Master` domain):

```ini
Master.driverClassName=com.mysql.jdbc.Driver
Master.url=jdbc:mysql://localhost:3306/auth_syncope?characterEncoding=UTF-8&relaxAutoCommit=true
Master.schema=
Master.username=syncope_root
Master.password=Syncopeuser_1473
Master.databasePlatform=org.apache.openjpa.jdbc.sql.MySQLDictionary(blobTypeName=LONGBLOB,timestampTypeName=DATETIME(3))
Master.orm=META-INF/spring-orm.xml
Master.audit.sql=audit_mysql_innodb.sql
```

In `domains/Two.properties`

```ini
Two.driverClassName=com.mysql.jdbc.Driver
Two.url=jdbc:mysql://localhost:3306/auth_syncope?characterEncoding=UTF-8&relaxAutoCommit=true
Two.schema=
Two.username=syncope_root
Two.password=Syncopeuser_1473
Two.databasePlatform=org.apache.openjpa.jdbc.sql.MySQLDictionary(blobTypeName=LONGBLOB,timestampTypeName=DATETIME(3))
Two.orm=META-INF/spring-orm.xml

Two.pool.maxActive=50
Two.pool.minIdle=2

Two.audit.sql=audit_mysql_innodb.sql
```



| Caution | It is important to set the collation to `utf8_general_ci` after creation of `syncope` database. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

| Warning | This assumes that the InnoDB engine is enabled in your MySQL instance - if this is not the case, then change the value for `Master.audit` to `audit.sql`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

| Warning | This assumes that you have a MySQL instance running on localhost, listening on its default port 3306 with a database `syncope` fully accessible by user `syncope` with password `syncope`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

##### MariaDB

In `provisioning.properties`:

```
quartz.jobstore=org.quartz.impl.jdbcjobstore.StdJDBCDelegate
quartz.sql=tables_mariadb.sql
```

| Warning | This assumes that the InnoDB engine is enabled in your MariaDB instance - if this is not the case, then change the value for `quartz.sql` to `tables_mariadb.sql`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

In `domains/Master.properties` (for the `Master` domain):

```
Master.driverClassName=org.mariadb.jdbc.Driver
Master.url=jdbc:mariadb://localhost:3306/syncope?characterEncoding=UTF-8
Master.schema=
Master.username=syncope
Master.password=syncope
Master.databasePlatform=org.apache.openjpa.jdbc.sql.MariaDBDictionary(blobTypeName=LONGBLOB,timestampTypeName=DATETIME(3))
Master.orm=META-INF/spring-orm.xml
```

| Caution | It is important to set the collation to `utf8_general_ci` after creation of `syncope` database. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

| Warning | This assumes that you have a MariaDB instance running on localhost, listening on its default port 3306 with a database `syncope` fully accessible by user `syncope` with password `syncope`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

##### Oracle Database

In `provisioning.properties`:

```
quartz.jobstore=org.quartz.impl.jdbcjobstore.oracle.OracleDelegate
quartz.sql=tables_oracle.sql
```

In `domains/Master.properties` (for the `Master` domain):

```
Master.driverClassName=oracle.jdbc.OracleDriver
Master.url=jdbc:oracle:thin:@localhost:1521:orcl
Master.schema=SYNCOPE
Master.username=syncope
Master.password=syncope
Master.databasePlatform=org.apache.openjpa.jdbc.sql.OracleDictionary
Master.orm=META-INF/spring-orm-oracle.xml
Master.audit.sql=audit_oracle.sql
```

| Warning | This assumes that you have an Oracle instance running on localhost, listening on its default port 1521 with a database `syncope` under tablespace `SYNCOPE`, fully accessible by user `syncope` with password `syncope`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

##### MS SQL Server

In `provisioning.properties`:

```
quartz.jobstore=org.quartz.impl.jdbcjobstore.MSSQLDelegate
quartz.sql=tables_sqlServer.sql
```

In `domains/Master.properties` (for the `Master` domain):

```ini
Master.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
Master.url=jdbc:sqlserver://localhost:1344;database=syncope;selectMethod=cursor;sendStringParametersAsUnicode=false
Master.schema=dbo
Master.username=syncope
Master.password=syncope
Master.databasePlatform=org.apache.openjpa.jdbc.sql.SQLServerDictionary
Master.orm=META-INF/spring-orm-sqlserver.xml
Master.audit.sql=audit_sqlserver.sql
```

| Warning | This assumes that you have a MS SQL Server instance running on localhost, listening on its default port 1344 with a database `syncope` fully accessible by user `syncope` with password `syncope`. |
| ------- | ------------------------------------------------------------ |
|         |                                                              |

Download and save it under `core/src/main/resources/`.

### Components

The following assumes that `protocol`, `host` and `port` reflect your Apache Tomcat installation. 

| Log files                        | Available under `/var/log/apache-syncope`         |
| -------------------------------- | ------------------------------------------------- |
| ConnId bundles                   | Available under `/var/lib/apache-syncope/bundles` |
| Complete REST API reference      | protocol://host:port/syncope/index.html           |
| [Swagger](http://swagger.io/) UI | protocol://host:port/syncope/swagger/             |
| Administration console           | protocol://host:port/syncope-console/             |
| End-user UI                      | protocol://host:port/syncope-enduser/             |

**Tips**:

​	Make sure the server port is **9080**, If not,  the `syncope-console` and `syncope-enduser` can not work.

​	

If you use the  `Nginx`  server to proxy the **syncope server**, the `conf` like this below:

```ini
location ~ ^/(syncope|syncope-console|syncope-enduser) {
    proxy_pass http://127.0.0.1:9080;
    index /;
    proxy_set_header Host $host;
}
```