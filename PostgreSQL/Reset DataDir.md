# **Why need to change default data directory**

By default, PostgreSQL 15 community version has data directory as ***/var/lib/pgsql\***, and the home directory of user postgres is the same. It might be acceptable to leave these default directory in test/dev environment. But in the production environment, it’s a bad idea because we usually want to put data directory and home directory in different disks with different RAID levels for data protection and performance. This article shows you how to change these default directory.

# Change data directory

Let’s first check the current location of data directory.

```
sudo -u postgres psql -c "SHOW data_directory;"

     data_directory
------------------------
 /var/lib/pgsql/15/data
(1 row)
```

This output shows that the system use the default data directory ***/var/lib/pgsql/15/data\***

Next, stop the database to ensure the integrity of the data:

```
systemctl stop postgresql-15
```

Verify the status of the database to make sure it is stopped:

```
systemctl status postgresql-15
```

Now, the database is shut down. Let’s move the data directory to another location by using rsync. The ***-a\*** option is for preserving the permissions and ***-v\*** option is for output so that we can monitor the process.

```
rsync -av /var/lib/pgsql [new_location]
```

For example, move data directory to new location /u01:

```
NONPROD [root@dev1212:~] # rsync -av /var/lib/pgsql /u01
```

After moving the data directory, configure the database to use new location by editing the database config file in new location /u01/pgsql/15/data/postgresql.conf

```
vi /u01/pgsql/15/data/postgresql.conf
```

Find the line with “data_directory” and change the line as below:

```
data_directory = '/u01/pgsql/15/data'
```

Next, modify the systemd startup file

```
vi /usr/lib/systemd/system/postgresql-15.service
```

Find the line with “Environment=PGDATA=” and change the line as below:

```
Environment=PGDATA=/u01/pgsql/15/data
```

Reload the configuration:

```
systemctl daemon-reload
```

Modify the .bash_profile in posgres home:

```
sudo -u postgres vi ~postgres/.bash_profile
```

Find the line with “PGDATA” and change the line as below:

```
PGDATA=/u01/pgsql/15/data
```

Now, the system is ready to start:

```
systemctl start postgresql-15
```

Check the status to confirm the moving is successful:

```
systemctl status postgresql-15
```

# Change home directory of user postgres

Check the current home directory of user postgres:

```
echo ~postgres
```

The default home directory is /var/lib/pgsql

We will change the home directory to /home/postgres. Let’s create the folder first:

```
mkdir -p /home/postgres
```

Change directory owner to postgres:

```
chown postgres:postgres /home/postgres
```

Stop all postgres process by stopping the database

```
systemctl stop postgresql-15
```

Then, use the usermod command to change the home directory:

```
usermod -m -d /home/postgres postgres
```

Let’s check home directory of postgres again:

```
NONPROD [root@dev1212:~] # echo ~postgres
/home/postgres
```

Move .bash_profile, .psql_history, .bash_history to new home directory:

```
NONPROD [root@dev1212:~] # mv /var/lib/pgsql/.bash_profile /home/postgres
NONPROD [root@dev1212:~] # mv /var/lib/pgsql/.psql_history /home/postgres
NONPROD [root@dev1212:~] # mv /var/lib/pgsql/.bash_history /home/postgres
```

Start database:

```
systemctl start postgresql-15
```