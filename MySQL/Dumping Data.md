### Dumping Data in SQL Format with mysqldump

This section describes how to use [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html) to create SQL-format dump files. For information about reloading such dump files, see[Section 7.4.2, “Reloading SQL-Format Backups”](https://dev.mysql.com/doc/refman/5.7/en/reloading-sql-format-dumps.html).

By default, [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html) writes information as SQL statements to the standard output. You can save the output in a file:

```terminal
shell> mysqldump [arguments] > file_name
```

To dump all databases, invoke [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html) with the [`--all-databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_all-databases) option:

```terminal
shell> mysqldump --all-databases > dump.sql
```

To dump only specific databases, name them on the command line and use the [`--databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_databases) option:

```terminal
shell> mysqldump --databases db1 db2 db3 > dump.sql
```

The [`--databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_databases) option causes all names on the command line to be treated as database names. Without this option, [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)treats the first name as a database name and those following as table names.

With [`--all-databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_all-databases) or [`--databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_databases), [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html) writes [`CREATE DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/create-database.html) and [`USE`](https://dev.mysql.com/doc/refman/5.7/en/use.html) statements prior to the dump output for each database. This ensures that when the dump file is reloaded, it creates each database if it does not exist and makes it the default database so database contents are loaded into the same database from which they came. If you want to cause the dump file to force a drop of each database before recreating it, use the [`--add-drop-database`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_add-drop-database) option as well. In this case, [**mysqldump**](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html) writes a [`DROP DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/drop-database.html) statement preceding each [`CREATE DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/create-database.html) statement.

To dump a single database, name it on the command line:

```terminal
shell> mysqldump --databases test > dump.sql
```

In the single-database case, it is permissible to omit the [`--databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_databases) option:

```terminal
shell> mysqldump test > dump.sql
```

The difference between the two preceding commands is that without [`--databases`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_databases), the dump output contains no [`CREATE DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/create-database.html)or [`USE`](https://dev.mysql.com/doc/refman/5.7/en/use.html) statements. This has several implications:

- When you reload the dump file, you must specify a default database name so that the server knows which database to reload.
- For reloading, you can specify a database name different from the original name, which enables you to reload the data into a different database.
- If the database to be reloaded does not exist, you must create it first.
- Because the output will contain no [`CREATE DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/create-database.html) statement, the [`--add-drop-database`](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html#option_mysqldump_add-drop-database) option has no effect. If you use it, it produces no [`DROP DATABASE`](https://dev.mysql.com/doc/refman/5.7/en/drop-database.html) statement.

To dump only specific tables from a database, name them on the command line following the database name:

```terminal
shell> mysqldump test t1 t3 t7 > dump.sql
```

[ PREV](https://dev.mysql.com/doc/refman/5.7/en/using-mysqldump.html)   [HOME](https://dev.mysql.com/doc/refman/5.7/en/index.html)   [UP](https://dev.mysql.com/doc/refman/5.7/en/using-mysqldump.html)   [NEXT ](https://dev.mysql.com/doc/refman/5.7/en/reloading-sql-format-dumps.html)



User Comments

User comments in this section are, as the name implies, provided by MySQL users. The MySQL documentation team is not responsible for, nor do they endorse, any of the information provided here.

`Posted by Shaun Henderson on February 7, 2018`

```tex
I found it useful to add the following to my crontab file: 0 0 * * * mysqldump --user=root --password=password --host=localhost --protocol=tcp --port=3306 --default-character-set=utf8 "database_name" > ~/backup/database_name.sql (change the parameters to suit your individual configuration). This will make a backup every 24 hours at midnight.
```