# [Linux downloads (Ubuntu)](https://www.postgresql.org/download/linux/ubuntu/)



PostgreSQL is available in all Ubuntu versions by default. However, Ubuntu "snapshots" a specific version of PostgreSQL that is then supported throughout the lifetime of that Ubuntu version. Other versions of PostgreSQL are available through the PostgreSQL apt repository.

### PostgreSQL Apt Repository

If the version included in your version of Ubuntu is not the one you want, you can use the PostgreSQL Apt Repository. This repository will integrate with your normal systems and patch management, and provide automatic updates for all supported versions of PostgreSQL throughout the support [lifetime](https://www.postgresql.org/support/versioning/) of PostgreSQL.

The PostgreSQL apt repository supports LTS versions of Ubuntu (14.04 and 16.04) on amd64, i386 and ppc64el architectures as well as select non-LTS versions(17.04). While not fully supported, the packages often work on other non-LTS versions as well, by using the closest LTS version available.

To use the apt repository, follow these steps:

- ​    Choose your Ubuntu version    Zesty (17.04)    Xenial (16.04)    Trusty (14.04)   
- Create the file */etc/apt/sources.list.d/pgdg.list*, and add a line for the repository`deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main`
- Import the repository signing key, and update the package lists`wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \  sudo apt-key add -sudo apt-get update`

For more information about the apt repository, including answers to frequent questions, please see the apt page on [the wiki](https://wiki.postgresql.org/wiki/Apt).

### Included in distribution

Ubuntu includes PostgreSQL by default. To install PostgreSQL on Ubuntu, use the *apt-get* (or other apt-driving) command:

```
apt-get install postgresql-9.6
```

The repository contains many different packages including third party addons. The most common and important packages are (substitute the version number as required):

- postgresql-client-9.6 - client libraries and client binaries
- postgresql-9.6 - core database server
- postgresql-contrib-9.6 - additional supplied modules
- libpq-dev - libraries and headers for C language frontend development
- postgresql-server-dev-9.6 - libraries and headers for C language backend development
- pgadmin3 - pgAdmin III graphical administration utility

### Configuration

PostgreSQL supports multiple client authentication methods. IDENT authentication method is used for postgres and local users, unless otherwise configured. Please refer to the [PostgreSQL Administrator's Guide](http://www.postgresql.org/docs/current/static/admin.html) if you would like to configure alternatives like Kerberos.

The following discussion assumes that you wish to enable TCP/IP connections and use the MD5 method for client authentication. PostgreSQLconfiguration files are stored in the /etc/postgresql/<version>/main directory. For example, if you install PostgreSQL 9.5, the configuration files are stored in the /etc/postgresql/9.5/main directory.

To configure ident authentication, add entries to the /etc/postgresql/9.5/main/pg_ident.conf file. There are detailed comments in the file to guide you.

To enable other computers to connect to your PostgreSQL server, edit the file /etc/postgresql/9.5/main/postgresql.conf

Locate the line #listen_addresses = 'localhost' and change it to:

```
listen_addresses = '*'
```

To allow both IPv4 and IPv6 connections replace 'localhost' with '::'

You may also edit all other parameters, if you know what you are doing! For details, refer to the configuration file or to the PostgreSQLdocumentation.

Now that we can connect to our PostgreSQL server, the next step is to set a password for the postgres user. Run the following command at a terminal prompt to connect to the default PostgreSQL template database:

```
sudo -u postgres psql template1
```

The above command connects to PostgreSQL database template1 as user postgres. Once you connect to the PostgreSQL server, you will be at a SQL prompt. You can run the following SQL command at the psql prompt to configure the password for the user postgres.

```
ALTER USER postgres with encrypted password 'Lhfei';
```

After configuring the password, edit the file /etc/postgresql/9.5/main/pg_hba.conf to use MD5 authentication with the postgres user:

```
local   all         postgres                          md5
```

Finally, you should restart the PostgreSQL service to initialize the new configuration. From a terminal prompt enter the following to restart PostgreSQL:

```
/etc/init.d/postgresql restart
```

or 

```
sudo systemctl restart postgresql.service
```

The above configuration is not complete by any means. Please refer to the [PostgreSQL Administrator's Guide](http://www.postgresql.org/docs/current/static/admin.html) to configure more parameters.

You can test server connections from other machines by using the PostgreSQL client.

```shell
sudo apt install postgresql-client
psql -h postgres.example.com -U postgres -W 
```



