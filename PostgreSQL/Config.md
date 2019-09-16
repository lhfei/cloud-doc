

### Enable Remote Access

1. Update **postgresql.conf**

   > For psql 10

   ```shell
   sudo vi /etc/postgresql/10/main/postgresql.conf
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
   sudo vi /etc/postgresql/10/main/pg_hba.conf
   ```

   The Conf:

   ```ini
   # TYPE  DATABASE        USER            ADDRESS                 METHOD
   # "local" is for Unix domain socket connections only
   local   all             all                                    md5
   # IPv4 local connections:
   host    all             all             0.0.0.0/0            md5
   # IPv6 local connections:
   host    all             all             ::0/0                 md5
   # All IPs
   host    all             all              all                 md5
   ```

   If set `Method` to `ident`,  then means is no password.

3. Restart **PostgreSQL Server**

   ```shell
   systemctl restart postgresql
   ```

4. Adjusting FIrewall

   ```shell
   sudo ufw allow 5432/tcp
   ```






### Create User

```sql
CREATE USER kong WITH PASSWORD 'kong';

CREATE DATABASE kong OWNER kong;

// grant all privileges of database kong to user kong
GRANT ALL PRIVILEGES ON DATABASE kong TO kong ;
```



### Reset Password

```sql
ALTER USER kong WITH PASSWORD 'kong';
```

