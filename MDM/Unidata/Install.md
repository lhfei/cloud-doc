



### DB

```sql
# add system user
groupadd mdmadmin
useradd mdmadmin -g postgres 

# change permisions
sudo chmod 755 /home/mdmadmin

# init
sudo cp -a /etc/skel/. /home/mdmadmin
```

```sql
CREATE USER mdmadmin; 
CREATE DATABASE cloud_mdm OWNER mdmadmin; 
ALTER USER mdmadmin WITH password 'Mdmuser_1473';

// grant all privileges of database cloud_mdm to user mdmadmin
GRANT ALL PRIVILEGES ON DATABASE cloud_mdm TO mdmadmin ;

ALTER USER mdmadmin WITH SUPERUSER;
```





1. Update **postgresql.conf**

   > For psql 11

   ```shell
   sudo vi /etc/postgresql/11/data/postgresql.conf
   ```

   Sample conf:

   ```ini
   # - Connection Settings -
   # what IP address(es) to listen on;
   # comma-separated list of addresses;
   # defaults to 'localhost'; use '*' for all
   listen_addresses = '*'
   ```

2. Configuring **pg_hba.conf**

   Add the following line in the pg_hba.conf file to allow access to all databases for all users with an encrypted password, also change addresses i.e. from IPv4 **127.0.0.1/32**to **0.0.0.0/0**, and IPv6 from **::1/128** to **::0/0**.

   ```shell
   sudo vi /etc/postgresql/11/data/pg_hba.conf
   ```

   The Conf:

   ```ini
   # TYPE  DATABASE        USER            ADDRESS                 METHOD
   # "local" is for Unix domain socket connections only
   local   all             all                                    md5
   # IPv4 local connections:
   host    all             all             0.0.0.0/0            md5

   ```

   If set `Method` to `ident`,  then means is no password.

3. Restart **PostgreSQL Server**

   ```shell
   systemctl restart postgresql-11.service
   ```
   
4. Adjusting FIrewall

   ```shell
   sudo ufw allow 5432/tcp
   ```





### Add Tomcat start with  specified via JVM flags

Set it in the `JAVA_OPTS` variable in `{path to tomcat}/bin/catalina.sh`

```shell
JAVA_OPTS="$JAVA_OPTS $JSSE_OPTS -Dunidata.conf=/etc/mdm/conf -Dlogback.configurationFile=/etc/mdm/conf/logback.xml"
```







postgis controlib

```shell
sudo yum install postgis postgresql-server postgresql-contrib
```

