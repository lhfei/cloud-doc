# Ubuntu Installation

1. **Install Kong**

   If you are downloading the [package](https://getkong.org/install/ubuntu/?_ga=2.69038098.283227297.1511332409-1638295637.1511332409#packages), execute:

   ```shell
   $ sudo apt-get update
   $ sudo apt-get install openssl libpcre3 procps perl
   $ sudo dpkg -i kong-community-edition-0.11.1.*.deb

   ```

2. **Prepare your database**

   [Configure](https://getkong.org/docs/0.11.x/configuration#database) Kong so it can connect to your database. Kong supports both [PostgreSQL 9.4+](http://www.postgresql.org/) and [Cassandra 3.x.x](http://cassandra.apache.org/) as its datastore.

   If you are using Postgres, please provision a database and a user before starting Kong, ie:

   ```shell
   CREATE USER kong; CREATE DATABASE kong OWNER kong;

   ```

   Now, run the Kong migrations:

   ```shell
   $ kong migrations up [-c /path/to/kong.conf]

   ```

   **Note**: migrations should never be run concurrently; only one Kong nodes should be performing migrations at a time.

   ```kong.conf.default``` file default location in ```/etc/kong/kong.conf.default```.

   Change password with user kong

   ```sql
   ALTER USER kong
   	PASSWORD 'kong';
   ```

   ```ini
   #------------------------------------------------------------------------------
   # DATASTORE
   #------------------------------------------------------------------------------

   # Kong will store all of its data (such as APIs, consumers and plugins) in
   # either Cassandra or PostgreSQL.
   #
   # All Kong nodes belonging to the same cluster must connect themselves to the
   # same database.

   #database = postgres             # Determines which of PostgreSQL or Cassandra
                                    # this node will use as its datastore.
                                    # Accepted values are `postgres` and
                                    # `cassandra`.

   pg_host = 127.0.0.1              # The PostgreSQL host to connect to.
   pg_port = 5432                   # The port to connect to.
   pg_user = kong                   # The username to authenticate if required.
   pg_password = kong               # The password to authenticate if required.
   pg_database = kong               # The database name to connect to.

   #pg_ssl = off                    # Toggles client-server TLS connections
                                    # between Kong and PostgreSQL.

   #pg_ssl_verify = off             # Toggles server certificate verification if
                                    # `pg_ssl` is enabled.
                                    # See the `lua_ssl_trusted_certificate`
                                    # setting to specify a certificate authority.

   ```

   ​

3. **Start Kong**

   ```
   $ kong start [-c /path/to/kong.conf]

   ```

4. **Use Kong**

   Kong is running:

   ```shell
   $ curl -i http://localhost:8001/

   ```

   Quickly learn how to use Kong with the [5-minute Quickstart](https://getkong.org/docs/latest/getting-started/quickstart).