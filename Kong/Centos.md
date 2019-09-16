## Installation

1. **Install Kong**

   If you are downloading the [package](https://docs.konghq.com/install/centos/?_ga=2.120377611.245052136.1564724763-1460038820.1562432425#packages), execute:

   ```shell
    $ sudo yum install epel-release
    $ sudo yum install kong-1.2.1.*.noarch.rpm --nogpgcheck
   ```

   If you are using the repository, execute:

   ```shell
    $ sudo yum update -y
    $ sudo yum install -y wget
    $ wget https://bintray.com/kong/kong-rpm/rpm -O bintray-kong-kong-rpm.repo
    $ export major_version=`grep -oE '[0-9]+\.[0-9]+' /etc/redhat-release | cut -d "." -f1`
    $ sed -i -e 's/baseurl.*/&\/centos\/'$major_version''/ bintray-kong-kong-rpm.repo
    $ sudo mv bintray-kong-kong-rpm.repo /etc/yum.repos.d/
    $ sudo yum update -y
    $ sudo yum install -y kong
   ```

2. **Prepare your database or declarative configuration file**

   Kong can run either with or without a database.

   When using a database, you will use the `kong.conf` configuration file for setting Kong’s configuration properties at start-up and the database as storage of all configured entities, such as the Routes and Services to which Kong proxies.

   When not using a database, you will use `kong.conf` its configuration properties and a `kong.yml` file for specifying the entities as a declarative configuration.

   **Using a database**

   [Configure](https://docs.konghq.com/1.2.x/configuration#database) Kong so it can connect to your database. Kong supports both [PostgreSQL 9.5+](http://www.postgresql.org/) and [Cassandra 3.x.x](http://cassandra.apache.org/) as its datastore.

   If you are using PostgreSQL, please provision a database and a user, ie:

   ```sql
    CREATE USER kong; CREATE DATABASE kong OWNER kong;
   ```

   Now, run the Kong migrations:

   ```sql
    $ kong migrations bootstrap [-c /path/to/kong.conf]
   ```

   **Note for Kong < 0.15**: with Kong versions below 0.15 (up to 0.14), use the `up` sub-command instead of `bootstrap`. Also note that with Kong < 0.15, migrations should never be run concurrently; only one Kong node should be performing migrations at a time. This limitation is lifted for Kong 0.15, 1.0, and above.

   **Without a database**

   If you are going to run Kong in [DB-less mode](https://docs.konghq.com/1.2.x/db-less-and-declarative-config/), you should start by generating declarative config file. The following command will generate a `kong.yml` file in your current folder. It contains instructions about how to fill it up.

   ```sql
    $ kong config init
   ```

   After filling up the `kong.yml` file, edit your `kong.conf` file. Set the `database` option to `off` and the `declarative_config` option to the path of your `kong.yml` file:

   ```ini
    database = off
    declarative_config = /path/to/kong.yml
   ```

3. **Start Kong**

   ```shell
    $ kong start [-c /path/to/kong.conf]
   ```

4. **Use Kong**

   Kong is running:

   ```shell
    $ curl -i http://localhost:8001/
   ```

   Quickly learn how to use Kong with the [5-minute Quickstart](https://docs.konghq.com/latest/getting-started/quickstart).