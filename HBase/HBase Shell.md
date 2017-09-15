HBase
=====



># HBase Shell

&emsp;The Apache HBase Shell is (J)Ruby's IRB with some HBase particular commands added. Anything you can do in IRB, you should be able to do in the HBase Shell.

To run the HBase shell, do as follows:

```sh
$ ./bin/hbase shell
```

## General Commands

- **status** - Provides the status of HBase, for example, the number of servers.

- **version** - Provides the version of HBase being used.

- **table_help** - Provides help for table-reference commands.

- **whoami** - Provides information about the user.

## Data Definition Language

&emsp;These are the commands that operate on the tables in HBase.

- **create** - Creates a table.

- **list** - Lists all the tables in HBase.

- **disable** - Disables a table.

- **is_disabled** - Verifies whether a table is disabled.

- **enable** - Enables a table.

- **is_enabled** - Verifies whether a table is enabled.

- **describe** - Provides the description of a table.

- **alter** - Alters a table.

- **exists** - Verifies whether a table exists.

- **drop** - Drops a table from HBase.

- **drop_all** - Drops the tables matching the ¡®regex¡¯ given in the command.

- **Java Admin API** - Prior to all the above commands, Java provides an Admin API to achieve DDL functionalities through programming. Under org.apache.hadoop.hbase.client package, HBaseAdmin and HTableDescriptor are the two important classes in this package that provide DDL functionalities.

> ### create

&emsp;You can create a table using the create command, here you must specify the table name and the Column Family name. The syntax to create a table in HBase shell is shown below.

```sh
create ¡®<table name>¡¯,¡¯<column family>¡¯ 
```
*Example*

Given below is a sample schema of a table named emp. It has two column families: "**personal data**" and "**professional data**".

Row key    |personal data |professional data
-----------|--------------|------------------
           |              |

You can create this table in HBase shell as shown below.

```sh
hbase(main):002:0> create 'emp', 'personal data', 'professional data'
```

And it will give you the following output.

```
0 row(s) in 1.1300 seconds
=> Hbase::Table - emp
```
*Verification*

You can verify whether the table is created using the list command as shown below. Here you can observe the created emp table.

```sh
hbase(main):002:0> list
TABLE 
emp
2 row(s) in 0.0340 seconds 
```


> ### Describe & Alter

### describe

&emsp;This command returns the description of the table. Its syntax is as follows:

```sh
hbase> describe 'table name'
```

Given below is the output of the describe command on the emp table.

```sh
hbase(main):006:0> describe 'emp'
   DESCRIPTION
      ENABLED
      
'emp', {NAME ? 'READONLY', DATA_BLOCK_ENCODING ? 'NONE', BLOOMFILTER
? 'ROW', REPLICATION_SCOPE ? '0', COMPRESSION ? 'NONE', VERSIONS ?
'1', TTL true

? 'FOREVER', MIN_VERSIONS ? '0', KEEP_DELETED_CELLS ? 'false',
BLOCKSIZE ? '65536', IN_MEMORY ? 'false', BLOCKCACHE ? 'true'}, {NAME
? 'personal

data', DATA_BLOCK_ENCODING ? 'NONE', BLOOMFILTER ? 'ROW',
REPLICATION_SCOPE ? '0', VERSIONS ? '5', COMPRESSION ? 'NONE',
MIN_VERSIONS ? '0', TTL

? 'FOREVER', KEEP_DELETED_CELLS ? 'false', BLOCKSIZE ? '65536',
IN_MEMORY ? 'false', BLOCKCACHE ? 'true'}, {NAME ? 'professional
data', DATA_BLO

CK_ENCODING ? 'NONE', BLOOMFILTER ? 'ROW', REPLICATION_SCOPE ? '0',
VERSIONS ? '1', COMPRESSION ? 'NONE', MIN_VERSIONS ? '0', TTL ?
'FOREVER', K

EEP_DELETED_CELLS ? 'false', BLOCKSIZE ? '65536', IN_MEMORY ?
'false', BLOCKCACHE ? 'true'}, {NAME ? 'table_att_unset',
DATA_BLOCK_ENCODING ? 'NO 

NE', BLOOMFILTER ? 'ROW', REPLICATION_SCOPE ? '0', COMPRESSION ?
'NONE', VERSIONS ? '1', TTL ? 'FOREVER', MIN_VERSIONS ? '0',
KEEP_DELETED_CELLS

? 'false', BLOCKSIZE ? '6
```


### alter
Alter is the command used to make changes to an existing table. Using this command, you can change the maximum number of cells of a column family, set and delete table scope operators, and delete a column family from a table.

Changing the Maximum Number of Cells of a Column Family
Given below is the syntax to change the maximum number of cells of a column family.

hbase> alter 't1', NAME ? 'f1', VERSIONS ? 5
In the following example, the maximum number of cells is set to 5.

hbase(main):003:0> alter 'emp', NAME ? 'personal data', VERSIONS ? 5
Updating all regions with the new schema...
0/1 regions updated.
1/1 regions updated.
Done.
0 row(s) in 2.3050 seconds
Table Scope Operators
Using alter, you can set and remove table scope operators such as MAX_FILESIZE, READONLY, MEMSTORE_FLUSHSIZE, DEFERRED_LOG_FLUSH, etc.

Setting Read Only
Below given is the syntax to make a table read only.

```sh
hbase>alter 't1', READONLY(option)
```

In the following example, we have made the emp table read only.

```sh
hbase(main):006:0> alter 'emp', READONLY
Updating all regions with the new schema...
0/1 regions updated.
1/1 regions updated.
Done.
0 row(s) in 2.2140 seconds
```

**Removing Table Scope Operators**

We can also remove the table scope operators. Given below is the syntax to remove ¡®**MAX_FILESIZE**¡¯ from emp table.

```sh
hbase> alter 't1', METHOD ? 'table_att_unset', NAME ? 'MAX_FILESIZE'
```

**Deleting a Column Family**

Using alter, you can also delete a column family. Given below is the syntax to delete a column family using alter.

```sh
hbase> alter ¡® table name ¡¯, ¡®delete¡¯ ? ¡® column family ¡¯
```

Given below is an example to delete a column family from the ¡®emp¡¯ table.

Assume there is a table named employee in HBase. It contains the following data:

```sh
hbase(main):006:0> scan 'employee'

   ROW                   COLUMN+CELL

row1 column = personal:city, timestamp = 1418193767, value = hyderabad

row1 column = personal:name, timestamp = 1418193806767, value = raju

row1 column = professional:designation, timestamp = 1418193767, value = manager

row1 column = professional:salary, timestamp = 1418193806767, value = 50000

1 row(s) in 0.0160 seconds 
```

Now let us delete the column family named professional using the alter command.

```sh
hbase(main):007:0> alter 'employee','delete'?'professional'
Updating all regions with the new schema...
0/1 regions updated.
1/1 regions updated.
Done.
0 row(s) in 2.2380 seconds 
```

Now verify the data in the table after alteration. Observe the column family ¡®professional¡¯ is no more, since we have deleted it.

```sh
hbase(main):003:0> scan 'employee'
   ROW             COLUMN + CELL
row1 column = personal:city, timestamp = 14181936767, value = hyderabad

row1 column = personal:name, timestamp = 1418193806767, value = raju

1 row(s) in 0.0830 seconds
```


> ### Listing Table

Listing a Table using HBase Shell
list is the command that is used to list all the tables in HBase. Given below is the syntax of the list command.

```sh
hbase(main):001:0 > list
When you type this command and execute in HBase prompt, it will display the list of all the tables in HBase as shown below.
```

```sh
hbase(main):001:0> list
TABLE
emp
```

Here you can observe a table named emp.


> ### Read Data

Reading Data using HBase Shell
The get command and the get() method of HTable class are used to read data from a table in HBase. Using get command, you can get a single row of data at a time. Its syntax is as follows:

```sh
get ¡¯<table name>¡¯,¡¯row1¡¯
Example
```

The following example shows how to use the get command. Let us scan the first row of the emp table.

```sh
hbase(main):012:0> get 'emp', '1'

   COLUMN                     CELL
   
personal : city timestamp = 1417521848375, value = hyderabad

personal : name timestamp = 1417521785385, value = ramu

professional: designation timestamp = 1417521885277, value = manager

professional: salary timestamp = 1417521903862, value = 50000

4 row(s) in 0.0270 seconds
```


#### Reading a Specific Column

Given below is the syntax to read a specific column using the get method.

```sh
hbase> get 'table name', ¡®rowid¡¯, {COLUMN ? ¡®column family:column name ¡¯}
```

#### Example

Given below is the example to read a specific column in HBase table.

```sh
hbase(main):015:0> get 'emp', 'row1', {COLUMN ? 'personal:name'}
  COLUMN                CELL  
personal:name timestamp = 1418035791555, value = raju
1 row(s) in 0.0080 seconds
```


> ### Count & Truncate

#### count

You can count the number of rows of a table using the count command. Its syntax is as follows:

```sh
count ¡®<table name>¡¯ 
```

After deleting the first row, emp table will have two rows. Verify it as shown below.

```sh
hbase(main):023:0> count 'emp'
2 row(s) in 0.090 seconds
? 2 
```

#### truncate

This command disables drops and recreates a table. The syntax of truncate is as follows:

```sh
hbase> truncate 'table name'
Example
```

Given below is the example of truncate command. Here we have truncated the emp table.

```sh
hbase(main):011:0> truncate 'emp'
Truncating 'one' table (it may take a while):
   - Disabling table...
   - Truncating table...
   0 row(s) in 1.5950 seconds
```

After truncating the table, use the scan command to verify. You will get a table with zero rows.

```sh
hbase(main):017:0> scan ¡®emp¡¯
ROW                  COLUMN + CELL
0 row(s) in 0.3110 seconds
```

> ### Scan

#### Scaning using HBase Shell

The scan command is used to view the data in HTable. Using the scan command, you can get the table data. Its syntax is as follows:

```sh
scan ¡®<table name>¡¯ 
```

#### Example

The following example shows how to read data from a table using the scan command. Here we are reading the emp table.

```sh
hbase(main):010:0> scan 'emp'

ROW                           COLUMN + CELL

1 column = personal data:city, timestamp = 1417521848375, value = hyderabad
 
1 column = personal data:name, timestamp = 1417521785385, value = ramu

1 column = professional data:designation, timestamp = 1417585277,value = manager

1 column = professional data:salary, timestamp = 1417521903862, value = 50000

1 row(s) in 0.0370 seconds
```