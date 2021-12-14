## Initialize the Database Environment

You can initialize the database environment by typing:

```
service postgresql-9.3 initdb
```

```
/etc/init.d/postgresql initdb
```

We will then configure it to start at boot up and we will start the software:

```
chkconfig postgresql-9.3 on
service postgresql-9.3 start
```

We are now ready to start using postgres.



## How to Log Into the Postgres Database

By default, postgres creates a user and a database called `postgres`.

The default security scheme assumes that the postgres user will only be accessible to those who need access. This can be controlled by [setting up sudo rules](https://www.digitalocean.com/community/articles/how-to-edit-the-sudoers-file-on-ubuntu-and-centos).

We interact with the postgres database software through an interface called `psql`. It provides a prompt where we can manipulate and query for data.

For now, log into the postgres user like this:

```shell
su - postgres
```

Your prompt will change. You can now connect to the database that matches your username by typing:

```
psql
```

Your prompt will change again, this time to indicate that you are interacting with the postgres database.

If you need to exit this interface, you can type this at any time:

```
\q
```

Afterwards, to get back to the root user shell, you can type:

```
exit
```

### Some Helpful psql Commands

Here are a few commands that can help you get an idea of your current environment:

- **\?**: Get a full list of psql commands, including those not listed here.
- **\h**: Get help on SQL commands. You can follow this with a specific command to get help with the syntax.
- **\q**: Quit the psql program and exit to the Linux prompt.
- **\d**: List available tables, views, and sequences in current database.
- **\du**: List available roles
- **\dp**: List access privileges
- **\dt**: List tables
- **\l**: List databases
- **\c**: Connect to a different database. Follow this by the database name.
- **\password**: Change the password for the username that follows.
- **\conninfo**: Get information about the current database and connection.



## Create a Postgres Table

We can create tables in postgres by using the following syntax:

```sql
CREATE TABLE new_table_name (
    table_column_title TYPE_OF_DATA column_constraints,
    next_column_title TYPE_OF_DATA column_constraints,
    table_constraint
    table_constraint
) INHERITS existing_table_to_inherit_from;
```

We will make a table called "popsicles" to store our popsicle varieties and some information about them.

```sql
CREATE TABLE popsicles (
    pop_id serial PRIMARY KEY,
    flavor varchar (50) NOT NULL,
    amount int NOT NULL,
    size varchar (10) check (size in ('small', 'normal', 'large'))
);
```

Now we can use the `\dt` command to see the table:

```
\dt
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | popsicles | table | postgres
(1 row)
```

To see the columns and data structure we just defined, we can type this command:

```sql
\d popsicles
                                  Table "public.popsicles"
 Column |         Type          |                         Modifiers  

--------+-----------------------+------------------------------------
------------------------
 pop_id | integer               | not null default nextval('popsicles
_pop_id_seq'::regclass)
 flavor | character varying(50) | not null
 amount | integer               | not null
 size   | character varying(10) | 
 . . .
```



## Insert Data Into a Postgres Table

We now have a table in our database, but there's no data in it yet. We can populate it by using the `insert`command.

We type `INSERT INTO` followed by the table name. Then, we type a comma-separated list of column names inside a set of parentheses. We then type `VALUES`, followed by a second set of parentheses containing a comma-separated list of values that correspond to the column names.

Let's try it now. We will insert some grape popsicles into our table:

```sql
INSERT INTO popsicles (flavor, amount, size) VALUES ('grape', 10, 'normal');
INSERT 0 1
```

The `INSERT 0 1` indicates that our command was accepted successfully. Some things to notice about this command is that the words in our value list are inside of single quotes ('), and that the command ends with a semicolon (;). Both of these points are important to remember.

Another thing to notice is that we didn't set the `pop_id` column. That is because we defined it as a *primary key*. This column must have unique values for each entry, so postgres will automatically assign the next available value to each record we create.

Let's fill in some more data so that we have a more useful table:

```sql
INSERT INTO popsicles (flavor, amount, size) VALUES ('orange', 8, 'small');
INSERT INTO popsicles (flavor, amount, size) VALUES ('fudge', 20, 'large');
INSERT INTO popsicles (flavor, amount, size) VALUES ('eclair', 14, 'normal');
INSERT INTO popsicles (flavor, amount, size) VALUES ('rainbow', 4, 'small');
```

If you recall, when we created the table, we defined the acceptable values for the "size" column. Postgres checks that the value is either "small", "normal", or "large". What happens if we try to provide a different value?:

```sql
INSERT INTO popsicles (flavor, amount, size) VALUES ('lime', 6, 'huge');
ERROR:  new row for relation "popsicles" violates check constraint "popsicles_size_check"
DETAIL:  Failing row contains (6, lime, 6, huge).
```

As you can see, postgres has validated that we have entered the correct data. It has rejected our newest popsicle because it didn't have one of the values that we defined for size.



## Select Data From a Postgres Table

We can query our new table for data by using the `select` command. The select command returns data from a table that matches the criteria specified.

To return all of the info from our table, we can use the asterisk (*), which is a special symbol that means "match everything":

```
SELECT * FROM popsicles;
```

| pop_id | flavor  | amount | size   |
| ------ | ------- | ------ | ------ |
| 1      | grape   | 10     | normal |
| 2      | orange  | 8      | small  |
| 3      | fudge   | 20     | large  |
| 4      | eclair  | 14     | normal |
| 5      | rainbow | 4      | small  |

```
(5 rows)
```

We can select by column by replacing asterisk with the columns we want:

```
SELECT flavor, amount FROM popsicles;
```

| flavor  | amount |
| ------- | ------ |
| grape   | 10     |
| orange  | 8      |
| fudge   | 20     |
| eclair  | 14     |
| rainbow | 4      |

```
(5 rows)
```

If we want to filter to only show certain results, we can add a `where` filter on the end:

```
SELECT * FROM popsicles WHERE amount <= 10;
```

| pop_id | flavor  | amount | size   |
| ------ | ------- | ------ | ------ |
| 1      | grape   | 10     | normal |
| 2      | orange  | 8      | small  |
| 5      | rainbow | 4      | small  |

```
(3 rows)
```



## Conclusion

You should now have postgres installed on your system and have a good handle on its basic usage.

There are many other things to learn when dealing with postgres. You can explore our other articles to learn [how to manage tables](https://www.digitalocean.com/community/articles/how-to-create-remove-manage-tables-in-postgresql-on-a-cloud-server), [how to create queries](https://www.digitalocean.com/community/articles/how-to-create-data-queries-in-postgresql-by-using-the-select-command), [how to manage
permissions](https://www.digitalocean.com/community/articles/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps--2), [how to back up postgres](https://www.digitalocean.com/community/articles/how-to-backup-postgresql-databases-on-an-ubuntu-vps), and [how to secure postgres](https://www.digitalocean.com/community/articles/how-to-secure-postgresql-on-an-ubuntu-vps).