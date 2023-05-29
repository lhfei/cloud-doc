**\*Doesn’t putting an extra layer between my application and HBase just slow things down?***
Actually, no. Phoenix achieves as good or likely better [performance](https://phoenix.apache.org/performance.html) than if you hand-coded it yourself (not to mention with a heck of a lot less code) by:

- compiling your SQL queries to native HBase scans
- determining the optimal start and stop for your scan key
- orchestrating the parallel execution of your scans
- bringing the computation to the data by
- pushing the predicates in your where clause to a server-side filter
- executing aggregate queries through server-side hooks (called co-processors)

In addition to these items, we’ve got some interesting enhancements in the works to further optimize performance:

- secondary indexes to improve performance for queries on non row key columns
- stats gathering to improve parallelization and guide choices between optimizations
- skip scan filter to optimize IN, LIKE, and OR queries
- optional salting of row keys to evenly distribute write load

**\*Ok, so it’s fast. But why SQL? It’s so 1970s***
Well, that’s kind of the point: give folks something with which they’re already familiar. What better way to spur the adoption of HBase? On top of that, using JDBC and SQL:

- Reduces the amount of code users need to write
- Allows for performance optimizations transparent to the user
- Opens the door for leveraging and integrating lots of existing tooling

**\*But how can SQL support my favorite HBase technique of x,y,z***
Didn’t make it to the last HBase Meetup did you? SQL is just a way of expressing **\*what you want to get*** not **\*how you want to get it***. Check out my [presentation](http://files.meetup.com/1350427/IntelPhoenixHBaseMeetup.ppt) for various existing and to-be-done Phoenix features to support your favorite HBase trick. Have ideas of your own? We’d love to hear about them: file an [issue](https://phoenix.apache.org/issues.html) for us and/or join our [mailing list](https://phoenix.apache.org/mailing_list.html).

**\*Blah, blah, blah - I just want to get started!***
Ok, great! Just follow our [install instructions](https://phoenix.apache.org/download.html#Installation):

- [download](https://phoenix.apache.org/download.html) and expand our installation tar
- copy the phoenix server jar that is compatible with your HBase installation into the lib directory of every region server
- restart the region servers
- add the phoenix client jar to the classpath of your HBase client
- download and [setup SQuirrel](https://phoenix.apache.org/installation.html#SQL_Client) as your SQL client so you can issue adhoc SQL against your HBase cluster

**\*I don’t want to download and setup anything else!***
Ok, fair enough - you can create your own SQL scripts and execute them using our command line tool instead. Let’s walk through an example now. Begin by navigating to the `bin/`directory of your Phoenix install location.

- First, let’s create a `us_population.sql` file, containing a table definition:

```
CREATE TABLE IF NOT EXISTS us_population (
      state CHAR(2) NOT NULL,
      city VARCHAR NOT NULL,
      population BIGINT
      CONSTRAINT my_pk PRIMARY KEY (state, city));
```

- Now let’s create a `us_population.csv` file containing some data to put in that table:

```
NY,New York,8143197
CA,Los Angeles,3844829
IL,Chicago,2842518
TX,Houston,2016582
PA,Philadelphia,1463281
AZ,Phoenix,1461575
TX,San Antonio,1256509
CA,San Diego,1255540
TX,Dallas,1213825
CA,San Jose,912332
```

- And finally, let’s create a `us_population_queries.sql` file containing a query we’d like to run on that data.

```
SELECT state as "State",count(city) as "City Count",sum(population) as "Population Sum"
FROM us_population
GROUP BY state
ORDER BY sum(population) DESC;
```

- Execute the following command from a command terminal

```
./psql.py <your_zookeeper_quorum> us_population.sql us_population.csv us_population_queries.sql
```



```shell
/usr/hdp/3.0.1.0-187/phoenix/bin/psql.py a01-r03-i164-107-515wbkc.test.local,a01-r03-i164-101-515w96w.test.local,a01-r03-i164-108-515wble.test.local:2181:/hbase-unsecure us_population.csv
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/usr/hdp/3.0.1.0-187/phoenix/phoenix-5.0.0.3.0.1.0-187-client.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/hdp/3.0.1.0-187/hadoop/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
18/10/10 11:19:44 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
csv columns from database.
18/10/10 11:19:46 ERROR util.CSVCommonsLoader: Error upserting record [CA, San Jose, 912332`]
CSV Upsert complete. 9 rows upserted
Time: 0.365 sec(s)
```



```sql
/usr/hdp/3.0.1.0-187/phoenix/bin/psql.py a01-r03-i164-107-515wbkc.test.local,a01-r03-i164-101-515w96w.test.local,a01-r03-i164-108-515wble.test.local:2181:/hbase-unsecure us_population_queries.sql 
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/usr/hdp/3.0.1.0-187/phoenix/phoenix-5.0.0.3.0.1.0-187-client.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/hdp/3.0.1.0-187/hadoop/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
18/10/10 11:20:30 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
St                               City Count                           Population Sum 
-- ---------------------------------------- ---------------------------------------- 
NY                                        1                                  8143197 
CA                                        2                                  5100369 
TX                                        3                                  4486916 
IL                                        1                                  2842518 
PA                                        1                                  1463281 
AZ                                        1                                  1461575 
Time: 0.098 sec(s)

```



```shell
hbase(main):010:0> desc 'US_POPULATION'
Table US_POPULATION is ENABLED                                                  
US_POPULATION, {TABLE_ATTRIBUTES => {coprocessor$1 => '|org.apache.phoenix.copro
cessor.ScanRegionObserver|805306366|', coprocessor$2 => '|org.apache.phoenix.cop
rocessor.UngroupedAggregateRegionObserver|805306366|', coprocessor$3 => '|org.ap
ache.phoenix.coprocessor.GroupedAggregateRegionObserver|805306366|', coprocessor
$4 => '|org.apache.phoenix.coprocessor.ServerCachingEndpointImpl|805306366|', co
processor$5 => '|org.apache.phoenix.hbase.index.Indexer|805306366|index.builder=
org.apache.phoenix.index.PhoenixIndexBuilder,org.apache.hadoop.hbase.index.codec
.class=org.apache.phoenix.index.PhoenixIndexCodec'}                             
COLUMN FAMILIES DESCRIPTION                                                     
{NAME => '0', VERSIONS => '1', EVICT_BLOCKS_ON_CLOSE => 'false', NEW_VERSION_BEH
AVIOR => 'false', KEEP_DELETED_CELLS => 'FALSE', CACHE_DATA_ON_WRITE => 'false',
 DATA_BLOCK_ENCODING => 'FAST_DIFF', TTL => 'FOREVER', MIN_VERSIONS => '0', REPL
ICATION_SCOPE => '0', BLOOMFILTER => 'NONE', CACHE_INDEX_ON_WRITE => 'false', IN
_MEMORY => 'false', CACHE_BLOOMS_ON_WRITE => 'false', PREFETCH_BLOCKS_ON_OPEN =>
 'false', COMPRESSION => 'NONE', BLOCKCACHE => 'true', BLOCKSIZE => '65536'}    
1 row(s)
Took 0.2643 seconds                                                    
```





Congratulations! You’ve just created your first Phoenix table, inserted data into it, and executed an aggregate query with just a few lines of code in 15 minutes or less!

**\*Big deal - 10 rows! What else you got?***
Ok, ok - tough crowd. Check out our `bin/performance.py` script to create as many rows as you want, for any schema you come up with, and run timed queries against it.

**\*Why is it called Phoenix anyway? Did some other project crash and burn and this is the next generation?***
I’m sorry, but we’re out of time and space, so we’ll have to answer that next time!