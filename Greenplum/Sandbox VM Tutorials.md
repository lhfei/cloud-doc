
# Lesson 1: Create Users and Roles


1. login as root user by: root/pivotal
    
2. switch gpadmin user, then start all GPDB services, and all scripts in /home/gpadmin

```sh
su gpadmin
/home/gpadmin/start_all.sh
```


# create user as 'lhfei1'

```sh
[gpadmin@gpdb-sandbox ~]$ createuser -P lhfei1
	Enter password for new role: *[Lhfei]*
	Enter it again: 
	Shall the new role be a superuser? (y/n) n
	Shall the new role be allowed to create databases? (y/n) y
	Shall the new role be allowed to create more new roles? (y/n) n
	NOTICE:  resource queue required -- using default resource queue "pg_default"

```

# connect to the 'template1' database as gpadmin:
```sh
[gpadmin@gpdb-sandbox ~]$ psql template1
	psql (8.2.15)
	Type "help" for help.

	template1=# show tables;
	ERROR:  unrecognized configuration parameter "tables"
	template1=# 
```


# create the user with the name 'lhfei2'
```sh
template1=# CREATE USER lhfei2 WITH PASSWORD 'pivotal' NOSUPERUSER;
	NOTICE:  resource queue required -- using default resource queue "pg_default"
	CREATE ROLE
```

# display a list of roles
```sh
template1=# \du
						   List of roles
	 Role name |            Attributes             | Member of 
	-----------+-----------------------------------+-----------
	 gpadmin   | Superuser, Create role, Create DB | 
	 gpmon     | Superuser, Create DB              | 
	 lhfei1    |                                   | 
	 lhfei2    |                                   | 
```

# create a users group and add the users to it
```sh
template1=# create role lhfei;
	NOTICE:  resource queue required -- using default resource queue "pg_default"
	CREATE ROLE
template1=# grant lhfei to lhfei1,lhfei2;
	GRANT ROLE
template1=# \du
						   List of roles
	 Role name |            Attributes             | Member of 
	-----------+-----------------------------------+-----------
	 gpadmin   | Superuser, Create role, Create DB | 
	 gpmon     | Superuser, Create DB              | 
	 lhfei     | Cannot login                      | 
	 lhfei1    |                                   | {lhfei}
	 lhfei2    |                                   | {lhfei}
```

3. Exit out of the psql shell:
```sh
template1-#  \q
```

################################################################################################
# Lesson 2: Create and Prepare Database

1. Enter these commands to drop the tutorial database if it exists:
```sh
dropdb tutorial
```

2. Enter the createdb command to create the tutorial database, with the defaults:
```sh
[gpadmin@gpdb-sandbox ~]$ createdb tutorial
```

3. Verify that the database was created using the psql -l command:
```sh
[gpadmin@gpdb-sandbox ~]$ psql -l
					  List of databases
	   Name    |  Owner  | Encoding |  Access privileges  
	-----------+---------+----------+---------------------
	 gpadmin   | gpadmin | UTF8     | 
	 gpperfmon | gpadmin | UTF8     | gpadmin=CTc/gpadmin 
									: =c/gpadmin
	 postgres  | gpadmin | UTF8     | 
	 template0 | gpadmin | UTF8     | =c/gpadmin          
									: gpadmin=CTc/gpadmin
	 template1 | gpadmin | UTF8     | =c/gpadmin          
									: gpadmin=CTc/gpadmin
	 tutorial  | gpadmin | UTF8     | 
	(6 rows)
```

4. Connect to the tutorial database as lhfei1, entering the password you created for 'lhfei1' when prompted:
```sh
psql -U lhfei1 tutorial
```

## Grant database privileges to users

In a production database, you should grant users the minimum permissions required to do their work. For example, a user may need SELECT permissions on a table to view data, but not UPDATE, INSERT, or DELETE to modify the data. To complete the exercises in this guide, the database users will require permissions to create and manipulate objects in the tutorial database.


1.Connect to the tutorial database as gpadmin.
```sh
$ psql -U gpadmin tutorial
```

2.Grant user1 and user2 all privileges on the tutorial database.
```sh
tutorial=# GRANT ALL PRIVILEGES ON DATABASE tutorial TO lhfei1, lhfei2;
```

3.Log out of psql and perform the next steps as the lhfei1 role.
```sh
tutorial=# \q
```

#Create a schema and set a search path

A database schema is a named container for a set of database objects, including tables, data types, and functions. A database can have multiple schemas. Objects within the schema are referenced by prefixing the object name with the schema name, separated with a period. For example, the person table in the employee schema is written employee.person.

The schema provides a namespace for the objects it contains. If the database is used for multiple applications, each with its own schema, the same table name can be used in each schema employee.person is a different table than customer.person. Both tables could be accessed in the same query as long as they are qualified with the schema name.

The database contains a schema search path, which is a list of schemas to search for objects names that are not qualified with a schema name. The first schema in the search path is also the schema where new objects are created when no schema is specified. The default search path is user,public, so by default, each object you create belongs to a schema associated with your login name. In this exercise, you create an faa schema and set the search path so that it is the default schema.

1.Change to the directory containing the FAA data and scripts:
```sh
$ cd ~/gpdb-sandbox-tutorials/faa
```

2.Connect to the tutorial database with psql:
```sh
$ psql -U lhfei1 tutorial
```

3.Create the faa schema:
```sh
tutorial=# DROP SCHEMA IF EXISTS faa CASCADE;
tutorial=# CREATE SCHEMA faa;
```

4.Add the faa schema to the search path:
```sh
tutorial=# SET SEARCH_PATH TO faa, public, pg_catalog, gp_toolkit;
```

5.View the search path:
```sh
tutorial=# SHOW search_path;
             search_path
-------------------------------------
 faa, public, pg_catalog, gp_toolkit
(1 row)
```

6.The search path you set above is not persistent; you have to set it each time you connect to the database. You can associate a search path with the user role by using the ALTER ROLE command, so that each time you connect to the database with that role, the search path is restored:
```sh
tutorial=# ALTER ROLE lhfei1 SET search_path TO faa, public, pg_catalog, gp_toolkit;

7.Exit out of the psql shell:
```sh
tutorial=# \q
```

# Lesson 3: Create Tables

The CREATE TABLE SQL statement creates a table in the database.

**About the distribution policy**

The definition of a table includes the distribution policy for the data, which has great bearing on system performance. The goals for the distribution policy are to:

- distribute the volume of data and query execution work evenly among the segments, and to

- enable segments to accomplish the most expensive query processing steps locally.

The distribution policy determines how data is distributed among the segments. Defining an effective distribution policy requires an understanding of the data’s characteristics, the kinds of queries that will be run once the data is loaded into the database, and what distribution strategies best utilize the parallel execution capacity of the segments.

Use the DISTRIBUTED clause of the CREATE TABLE statement to define the distribution policy for a table. Ideally, each segment will store an equal volume of data and perform an equal share of work when processing queries. There are two kinds of distribution policies:

- DISTRIBUTED BY (column, ...) defines a distribution key from one or more columns. A hash function applied to the distribution key determines which segment stores the row. Rows that have the same distribution key are stored on the same segment. If the distribution keys are unique, the hash function ensures the data is distributed evenly. The default distribution policy is a hash on the primary key of the table, or the first column if no primary key is specified.
- DISTRIBUTED RANDOMLY distributes rows in round-robin fashion among the segments.

When different tables are joined on the same columns that comprise the distribution key, the join can be accomplished at the segments, which is much faster than joining rows across segments. The random distribution policy makes this impossible, so it is best practice to define a distribution key that will optimize joins.


## Exercises

**Execute the CREATE TABLE script in psql**

The CREATE TABLE statements for the faa database are in the faa create_dim_tables.sql script.


1.Change to the directory containing the FAA data and scripts:
```sh
$ cd ~/gpdb-sandbox-tutorials/faa
```

2.Open the script in a text editor to see the text of the commands that will be executed when you run the script.
```sh
gpadmin@gpdb-sandbox faa]$ more create_dim_tables.sql
create table faa.d_airports (airport_code text, airport_desc text) distributed  by (airport_code);
create table faa.d_wac (wac smallint, area_desc text) distributed by (wac);
create table faa.d_airlines (airlineid integer, airline_desc text) distributed   by (airlineid);
create table faa.d_cancellation_codes (cancel_code text, cancel_desc text)   distributed by (cancel_code);
create table faa.d_delay_groups (delay_group_code text, delay_group_desc text)   distributed by (delay_group_code);
create table faa.d_distance_groups (distance_group_code text,   distance_group_desc text) distributed by (distance_group_code)
```

3.Execute the create_dim_tables.sql script. The psql \i command executes a script:
```sh
$ psql -U lhfei1 tutorial

tutorial=# \i create_dim_tables.sql

psql:create_dim_tables.sql:1: NOTICE:  table "d_airports" does not exist, skipping
DROP TABLE
CREATE TABLE
psql:create_dim_tables.sql:18: NOTICE:  table "d_wac" does not exist, skipping
DROP TABLE
CREATE TABLE
psql:create_dim_tables.sql:22: NOTICE:  table "d_airlines" does not exist, skipping
DROP TABLE
CREATE TABLE
psql:create_dim_tables.sql:26: NOTICE:  table "d_cancellation_codes" does not exist, skipping
DROP TABLE
CREATE TABLE
psql:create_dim_tables.sql:30: NOTICE:  table "d_delay_groups" does not exist, skipping
DROP TABLE
CREATE TABLE
psql:create_dim_tables.sql:34: NOTICE:  table "d_distance_groups" does not exist, skipping
DROP TABLE
CREATE TABLE
```

4.List the tables that were created, using the psql \dt command.
```sh
tutorial=# \dt

                     List of relations
 Schema |         Name         | Type  |  Owner  | Storage 
--------+----------------------+-------+---------+---------
 faa    | d_airlines           | table | lhfei1  | heap
 faa    | d_airports           | table | lhfei1  | heap
 faa    | d_cancellation_codes | table | lhfei1  | heap
 faa    | d_delay_groups       | table | lhfei1  | heap
 faa    | d_distance_groups    | table | lhfei1  | heap
 faa    | d_wac                | table | lhfei1  | heap
 public | spatial_ref_sys      | table | gpadmin | heap
(7 rows)
```

5.Exit the psql shell:
```sh
tutorial=# \q
```

# Lesson 4: Data Loading

Loading external data into Greenplum Database tables can be accomplished in different ways. We will use three methods to load the FAA data:

- The simplest data loading method is the SQL INSERT statement. You can execute INSERT statements directly with psql or another interactive client, run a script containing INSERT statements, or run a client application with a database connection. This is the least efficient method for loading large volumes of data and should be used only for small amounts of data.
- You can use the COPY command to load the data into a table when the data is in external text files. The COPY command syntax allows you to define the format of the text file so the data can be parsed into rows and columns. This is faster than INSERT statements but, like INSERT statements, it is not a parallel process.
The SQL COPY command requires that external files be accessible to the host where the master process is running. On a multi-node Greenplum Database system, the data files may be on a file system that is not accessible to the master process. In this case, you can use the psql \copy meta-command, which streams the data to the server over the psql connection. The scripts in this tutorial use the \copy meta-command.
- You can use a pair of Greenplum utilities, gpfdist and gpload, to load external data into tables at high data transfer rates. In a large scale, multi-terabyte data warehouse, large amounts of data must be loaded within a relatively small maintenance window. Greenplum supports fast, parallel data loading with its external tables feature. Administrators can also load external tables in single row error isolation mode to filter bad rows into a separate error table while continuing to load properly formatted rows. Administrators can specify an error threshold for a load operation to control how many improperly formatted rows cause Greenplum to abort the load operation.
By using external tables in conjunction with Greenplum Database's parallel file server (gpfdist), administrators can achieve maximum parallelism and load bandwidth from their Greenplum Database system.

Figure 1. External Tables Using Greenplum Parallel File Server (gpfdist)

![ext_tables.jpg](C:/Users/lihefei/Desktop/cloud-doc/Greenplum/images/ext_tables.jpg "")


Another Greenplum utility, gpload, runs a load task that you specify in a YAML-formatted control file. You describe the source data locations, format, transformations required, participating hosts, database destinations, and other particulars in the control file and gpload executes the load. This allows you to describe a complex task and execute it in a controlled, repeatable fashion.

In the following exercises, you load data into the tutorial database using each of these methods.

## Exercises

**Load data with the INSERT statement**

The faa.d_cancellation_codes table is a simple two-column look-up table, easily loaded with an INSERT statement.

1.Change to the directory containing the FAA data and scripts:
```sh
$ cd ~/gpdb-sandbox-tutorials/faa
$ psql -U lhfei1 tutorial
```

2.Use the \d psql meta-command to describe the faa.d_cancellation_codes table:
```sh
tutorial=# \d d_cancellation_codes
Table "faa.d_cancellation_codes"
   Column    | Type | Modifiers
-------------+------+-----------
 cancel_code | text |
 cancel_desc | text |
Distributed by: (cancel_code)
```

3.Load the data into the table with a multirow INSERT statement (alternatively issue \i insert_into_cancellation_codes.sql):
```sh
tutorial=# INSERT INTO faa.d_cancellation_codes
tutorial-# VALUES ('A', 'Carrier'),
tutorial-# ('B', 'Weather'),
tutorial-# ('C', 'NAS'),
tutorial-# ('D', 'Security'),
tutorial-# ('', 'none');
INSERT 0 5
```


**Load data with the COPY statement**

The COPY statement moves data between the file system and database tables. Data for five of the FAA tables is in the following CSV-formatted text files:

1.In a text editor, review the .csv data files.

- L_AIRLINE_ID.csv
- L_AIRPORTS.csv
- L_DISTANCE_GROUP_250.csv
- L_ONTIME_DELAY_GROUPS.csv
- L_WORLD_AREA_CODES.csv

    Notice that the first line of each file contains the column names and that the last line of the file contains the characters “.”, which signals the end of the input data.


2.In a text editor, review the following scripts:

- copy_into_airlines.sql
- copy_into_airports.sql
- copy_into_delay_groups.sql
- copy_into_distance_groups.sql
- copy_into_wac.sql
    
    The HEADER keyword prevents the \copy command from interpreting the column names as data.

3.Run the following scripts to load the data:
```sh
tutorial-# =# \i copy_into_airlines.sql
tutorial-# =# \i copy_into_airports.sql
tutorial-# =# \i copy_into_delay_groups.sql
tutorial-# =# \i copy_into_distance_groups.sql
tutorial-# =# \i copy_into_wac.sql
```

**Load data with gpdist**

For the FAA fact table, we will use an ETL (Extract, Transform, Load) process to load data from the source gzip files into a loading table, and then insert the data into a query and reporting table. For the best load speed, use the gpfdist Greenplum utility to distribute the rows to the segments. In a production system, gpfdist runs on the servers where the data is located. With a single-node Greenplum Database instance, there is only one host, and you run gpdist on it. Starting gpfdist is like starting a file server; there is no data movement until a request is made on the process.

Note: This exercise loads data using the Greenplum Database external table feature to move data from external data files into the database. Moving data between the database and external tables is a security consideration, so only superusers are permitted to use the feature. Therefore, you will run this exercise as the gpadmin database user.

1.Execute gpfdist. Use the –d switch to set the “home” directory used to search for files in the faa directory. Use the –p switch to set the port and background the process.
```sh
$ gpfdist -d ~/gpdb-sandbox-tutorials/faa -p 8081 > /tmp/gpfdist.log 2>&1 &

[1] 31206
```

2.Check that gpfdist is running with the ps command:
```sh
$ ps -A | grep gpfdist

31206 pts/0    00:00:00 gpfdist
```

3.View the contents of the gpfdist log.
```sh
more /tmp/gpfdist.log

2017-01-12 17:06:36 31206 INFO Before opening listening sockets - following listening sockets are available:
2017-01-12 17:06:36 31206 INFO IPV6 socket: [::]:8081
2017-01-12 17:06:36 31206 INFO IPV4 socket: 0.0.0.0:8081
2017-01-12 17:06:36 31206 INFO Trying to open listening socket:
2017-01-12 17:06:36 31206 INFO IPV6 socket: [::]:8081
2017-01-12 17:06:36 31206 INFO Opening listening socket succeeded
2017-01-12 17:06:36 31206 INFO Trying to open listening socket:
2017-01-12 17:06:36 31206 INFO IPV4 socket: 0.0.0.0:8081
Serving HTTP on port 8081, directory /home/gpadmin/gpdb-sandbox-tutorials/faa
```

4.Start a psql session as gpadmin and execute the create_load_tables.sql script. This script creates two tables: the faa_otp_load table, into which gpdist will load the data, and the faa_load_errors table, where load errors will be logged. (The faa_load_errors table may already exist. Ignore the error message.) The faa_otp_load table is structured to match the format of the input data from the FAA Web site.
```sh
$ psql -U gpadmin tutorial

tutorial=# \i create_load_tables.sql
CREATE TABLE
CREATE TABLE
```

5.Create an external table definition with the same structure as the faa_otp_load table.
```sh
tutorial=# \i create_ext_table.sql
psql:create_ext_table.sql:5: NOTICE:  HEADER means that each one
of the data files has a header row.
CREATE EXTERNAL TABLE
This is a pure metadata operation. No data has moved from the data files on the host to the database yet. The external table definition references files in the faa directory that match the pattern otp*.gz. There are two matching files, one containing data for December 2009, the other for January 2010.
```

6.Move data from the external table to the faa_otp_load table.
```sh
tutorial=#  INSERT INTO faa.faa_otp_load SELECT * FROM faa.ext_load_otp;
NOTICE:  Found 26526 data formatting errors (26526 or more input rows).
Rejected related input data.
INSERT 0 1024552
Greenplum moves data from the gzip files into the load table in the database. In a production environment, you could have many gpfdist processes running, one on each host or several on one host, each on a separate port number.
```

7.Examine the errors briefly. (The \x on psql meta-command changes the display of the results to one line per column, which is easier to read for some result sets.)
```sh
tutorial=# \x
Expanded display is on.
tutorial=# SELECT DISTINCT relname, errmsg, count(*)
           FROM faa.faa_load_errors GROUP BY 1,2;
-[ RECORD 1 ]-------------------------------------------------
relname | ext_load_otp
errmsg  | invalid input syntax for integer: "", column deptime
count   | 26526
```

8.Exit the psql shell:
```sh
tutorial=# \q
```

**Load data with gpload**

Greenplum provides a wrapper program for gpfdist called gpload that does much of the work of setting up the external table and the data movement. In this exercise, you reload the faa_otp_load table using the gpload utility.

1.Since gpload executes gpfdist, you must first kill the gpfdist process you started in the previous exercise.
```sh
[gpadmin@gpdb-sandbox faa]$ ps -A | grep gpfdist
4035 pts/0    00:00:02 gpfdist
```
Your process id will not be the same, so kill the appropriate one with the kill command, or just use the simpler killall command:
```sh
  gpadmin@gpdb-sandbox faa]$ killall gpfdist
  [1]+  Exit 1    gpfdist -d $HOME/gpdb-sandbox-tutorials/faa -p   8081 > /tmp/  gpfdist.log 2>&1
```

2.Edit and customize the gpload.yaml input file. Be sure to set the correct path to the faa directory. Notice the TRUNCATE: true preload instruction ensures that the data loaded in the previous exercise will be removed before the load in this exercise starts.
```sh
vi gpload.yaml
```

```json
---
VERSION: 1.0.0.1
# describe the Greenplum database parameters
DATABASE: tutorial
USER: gpadmin
HOST: localhost
PORT: 5432
# describe the location of the source files
# in this example, the database master lives on the same host as the source files
GPLOAD:
   INPUT:
    - SOURCE:
         LOCAL_HOSTNAME:
           - gpdb-sandbox
         PORT: 8081
         FILE:
           - /Users/gpadmin/gpdb-sandbox-tutorials/faa/otp*.gz
    - FORMAT: csv
    - QUOTE: '"'
    - ERROR_LIMIT: 50000
    - ERROR_TABLE: faa.faa_load_errors
   OUTPUT:
    - TABLE: faa.faa_otp_load
    - MODE: INSERT
   PRELOAD:
    - TRUNCATE: true
```

3.Execute gpload with the gpload.yaml input file. (Include the -v flag if you want to see details of the loading process.)

```sh
$ gpload -f gpload.yaml -l gpload.log
```

```ini
2015-10-21 15:05:39|INFO|gpload session started 2015-10-21 15:05:39
2015-10-21 15:05:39|INFO|started gpfdist -p 8081 -P 8082 -f "/home/gpadmin/gpdb-sandbox-tutorials/faa/otp*.gz" -t 30
2015-10-21 15:05:58|WARN|26528 bad rows
2015-10-21 15:05:58|INFO|running time: 18.64 seconds
2015-10-21 15:05:58|INFO|rows Inserted          = 1024552
2015-10-21 15:05:58|INFO|rows Updated           = 0
2015-10-21 15:05:58|INFO|data formatting errors = 0
2015-10-21 15:05:58|INFO|gpload succeeded with warnings
```

## Create and Load fact tables

The final step of the ELT process is to move data from the load table to the fact table. For the FAA example, you create two fact tables. The faa.otp_r table is a row-oriented table, which will be loaded with data from the faa.faa_otp_load table. The faa.otp_c table has the same structure as the faa.otp_r table, but is column-oriented and partitioned. You will load it with data from the faa.otp_r table. The two tables will contain identical data and allow you to experiment with a column-oriented and partitioned table in addition to a traditional row-oriented table.

1.Create the faa.otp_r and faa.otp_c tables by executing the create_fact_tables.sql script.
```sh
$ psql -U gpadmin tutorial
tutorial=# \i create_fact_tables.sql 
```
2.Review the create_fact_tables.sql script and note that some columns are excluded from the fact table and the data types of some columns are cast to a different datatype. The MADlib routines usually require float8 values, so the numeric columns are cast to float8 as part of the transform step.

Load the data from the faa_otp_load table into the faa.otp_r table using the SQL INSERT FROM statement. Load the faa.otp_c table from the faa.otp_r table. Both of these loads can be accomplished by running the load_into_fact_table.sql script.
```sh
tutorial=# \i load_into_fact_table.sql
```

## Data loading summary

The ability to load billions of rows quickly into the Greenplum database is one of its key features. Using “Extract, Load and Transform” (ELT) allows load processes to make use of the massive parallelism of the Greenplum system by staging the data (perhaps just the use of external tables) and then applying data transformations within Greenplum Database. Set-based operations can be done in parallel, maximizing performance.

With other loading mechanisms such as COPY, data is loaded through the master in a single process. This does not take advantage of the parallel processing power of the Greenplum segments. External tables provide a means of leveraging the parallel processing power of the segments for data loading. Also, unlike other loading mechanisms, you can access multiple data sources with one SELECT of an external table.

External tables make static data available inside the database. External tables can be defined with file:// or gpfdist:// protocols. gpfdist is a file server program that loads files in parallel. Since the data is static, external tables can be rescanned during a query execution.

External Web tables allow http:// protocol or an EXECUTE clause to execute an operating system command or script. That data is assumed to be dynamic—query plans involving Web tables do not allow rescanning because the data could change during query execution. Execution plans may be slower, as data must be materialized (I/O) if it cannot fit in memory.

The script or process to populate a table with external Web tables may be executed on every segment host. It is possible, therefore, to have duplication of data. This is something to be aware of and check for when using Web tables, particularly with SQL extract calls to another database.



