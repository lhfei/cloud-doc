### Get Instance 

```shell
$accumulo org.apache.accumulo.server.util.ListInstances

INFO : Using ZooKeepers host-10-182-93-201:2181,host-10-182-93-183:2181,host-10-182-93-187:2181,host-10-182-93-191:2181,host-10-182-93-193:2181,host-10-182-93-194:2181,host-10-182-93-199:2181,host-10-182-93-200:2181,host-10-182-93-206:2181,host-10-182-93-202:2181,host-10-182-93-203:2181,host-10-182-93-205:2181,host-10-182-93-182:2181,host-10-182-93-207:2181,host-10-182-93-210:2181,host-10-182-93-211:2181,host-10-182-93-214:2181,host-10-182-93-215:2181,host-10-182-93-216:2181

 Instance Name       | Instance ID                          | Master                        
---------------------+--------------------------------------+-------------------------------
"hdp-accumulo-instance" | d651e3c6-e1d3-4cf3-b0fa-23fd9131e850 |       host-10-182-93-202:9999

```





### batch

This tutorial uses the following Java classes, which can be found in org.apache.accumulo.examples.simple.client in the examples-simple module:

- SequentialBatchWriter.java - writes mutations with sequential rows and random values
- RandomBatchWriter.java - used by SequentialBatchWriter to generate random values
- RandomBatchScanner.java - reads random rows and verifies their values

This is an example of how to use the batch writer and batch scanner. To compile the example, run maven and copy the produced jar into the accumulo lib dir. This is already done in the tar distribution.

Below are commands that add 10000 entries to accumulo and then do 100 random queries. The write command generates random 50 byte values.

Be sure to use the name of your instance (given as instance here) and the appropriate list of zookeeper nodes (given as zookeepers here).

Before you run this, you must ensure that the user you are running has the “exampleVis” authorization. (you can set this in the shell with “setauths -u username -s exampleVis”)

```
$ ./bin/accumulo shell -u root -e "setauths -u username -s exampleVis"
```

You must also create the table, batchtest1, ahead of time. (In the shell, use “createtable batchtest1”)

```
$ ./bin/accumulo shell -u root -e "createtable mytable"
$ ./bin/accumulo org.apache.accumulo.examples.simple.client.SequentialBatchWriter -i hdp-accumulo-instance -z host-10-182-93-202 -u root -p AccumuloRoot01 -t mytable --start 0 --num 10000 --size 50 --batchMemory 20M --batchLatency 500 --batchThreads 20 --vis exampleVis

# Setting authorizations for a user
$ ./bin/accumulo shell -u root -p AccumuloRoot01 -e "setauths -s A"

$ ./bin/accumulo org.apache.accumulo.examples.simple.client.RandomBatchScanner -i hdp-accumulo-instance -z host-10-182-93-202 -u root -p AccumuloRoot01 -t mytable --num 100 --min 0 --max 10000 --size 50 --scanThreads 20 --auths exampleVis
07 11:33:11,103 [client.CountingVerifyingReceiver] INFO : Generating 100 random queries...
07 11:33:11,112 [client.CountingVerifyingReceiver] INFO : finished
07 11:33:11,260 [client.CountingVerifyingReceiver] INFO : 694.44 lookups/sec   0.14 secs

07 11:33:11,260 [client.CountingVerifyingReceiver] INFO : num results : 100

07 11:33:11,364 [client.CountingVerifyingReceiver] INFO : Generating 100 random queries...
07 11:33:11,370 [client.CountingVerifyingReceiver] INFO : finished
07 11:33:11,416 [client.CountingVerifyingReceiver] INFO : 2173.91 lookups/sec   0.05 secs

07 11:33:11,416 [client.CountingVerifyingReceiver] INFO : num results : 100
```



### batch

This example archives file data into an Accumulo table. Files with duplicate data are only stored once. The example has the following classes:

- CharacterHistogram - A MapReduce that computes a histogram of byte frequency for each file and stores the histogram alongside the file data. An example use of the ChunkInputFormat.

- ChunkCombiner - An Iterator that dedupes file data and sets their visibilities to a combined visibility based on current references to the file data.

- ChunkInputFormat - An Accumulo InputFormat that provides keys containing file info (List<Entry<Key,Value») and values with an InputStream over the file (ChunkInputStream).

- ChunkInputStream - An input stream over file data stored in Accumulo.

- FileDataIngest - Takes a list of files and archives them into Accumulo keyed on hashes of the files.

- FileDataQuery - Retrieves file data based on the hash of the file. (Used by the dirlist.Viewer.)

- KeyUtil - A utility for creating and parsing null-byte separated strings into/from Text objects.

- | VisibilityCombiner - A utility for merging visibilities into the form (VIS1) | (VIS2) | …    |
  | ------------------------------------------------------------ | ------ | ---- |
  |                                                              |        |      |

This example is coupled with the dirlist example. See README.dirlist for instructions.

If you haven’t already run the README.dirlist example, ingest a file with FileDataIngest.

```
$ ./bin/accumulo org.apache.accumulo.examples.simple.filedata.FileDataIngest -i instance -z zookeepers -u username -p password -t dataTable --auths exampleVis --chunk 1000 $ACCUMULO_HOME/README
```

Open the accumulo shell and look at the data. The row is the MD5 hash of the file, which you can verify by running a command such as ‘md5sum’ on the file.

```
> scan -t dataTable
```

Run the CharacterHistogram MapReduce to add some information about the file.

```
$ bin/tool.sh lib/accumulo-examples-simple.jar org.apache.accumulo.examples.simple.filedata.CharacterHistogram -i instance -z zookeepers -u username -p password -t dataTable --auths exampleVis --vis exampleVis
```

Scan again to see the histogram stored in the ‘info’ column family.

```
> scan -t dataTable
```



### MapReduce Example

This example uses mapreduce and accumulo to compute word counts for a set of documents. This is accomplished using a map-only mapreduce job and a accumulo table with combiners.

To run this example you will need a directory in HDFS containing text files. The accumulo readme will be used to show how to run this example.

```
$ hadoop fs -copyFromLocal $ACCUMULO_HOME/README /user/username/wc/Accumulo.README
$ hadoop fs -ls /user/username/wc
Found 1 items
-rw-r--r--   2 username supergroup       9359 2009-07-15 17:54 /user/username/wc/Accumulo.README
```

The first part of running this example is to create a table with a combiner for the column family count.

```
$ ./bin/accumulo shell -u username -p password
Shell - Apache Accumulo Interactive Shell
- version: 1.7.4
- instance name: instance
- instance id: 00000000-0000-0000-0000-000000000000
-
- type 'help' for a list of available commands
-
username@instance> createtable wordCount
username@instance wordCount> setiter -class org.apache.accumulo.core.iterators.user.SummingCombiner -p 10 -t wordCount -majc -minc -scan
SummingCombiner interprets Values as Longs and adds them together.  A variety of encodings (variable length, fixed length, or string) are available
----------> set SummingCombiner parameter all, set to true to apply Combiner to every column, otherwise leave blank. if true, columns option will be ignored.: false 
----------> set SummingCombiner parameter columns, <col fam>[:<col qual>]{,<col fam>[:<col qual>]} escape non-alphanum chars using %<hex>.: count
----------> set SummingCombiner parameter lossy, if true, failed decodes are ignored. Otherwise combiner will error on failed decodes (default false): <TRUE|FALSE>: false
----------> set SummingCombiner parameter type, <VARLEN|FIXEDLEN|STRING|fullClassName>: STRING
username@instance wordCount> quit
```

After creating the table, run the word count map reduce job.

```
$ bin/tool.sh lib/accumulo-examples-simple.jar org.apache.accumulo.examples.simple.mapreduce.WordCount -i hdp-accumulo-instance -z host-10-182-93-202  --input /user/accumulo/wc -t wordCount -u root -p AccumuloRoot01

11/02/07 18:20:11 INFO input.FileInputFormat: Total input paths to process : 1
11/02/07 18:20:12 INFO mapred.JobClient: Running job: job_201102071740_0003
11/02/07 18:20:13 INFO mapred.JobClient:  map 0% reduce 0%
11/02/07 18:20:20 INFO mapred.JobClient:  map 100% reduce 0%
11/02/07 18:20:22 INFO mapred.JobClient: Job complete: job_201102071740_0003
11/02/07 18:20:22 INFO mapred.JobClient: Counters: 6
11/02/07 18:20:22 INFO mapred.JobClient:   Job Counters
11/02/07 18:20:22 INFO mapred.JobClient:     Launched map tasks=1
11/02/07 18:20:22 INFO mapred.JobClient:     Data-local map tasks=1
11/02/07 18:20:22 INFO mapred.JobClient:   FileSystemCounters
11/02/07 18:20:22 INFO mapred.JobClient:     HDFS_BYTES_READ=10487
11/02/07 18:20:22 INFO mapred.JobClient:   Map-Reduce Framework
11/02/07 18:20:22 INFO mapred.JobClient:     Map input records=255
11/02/07 18:20:22 INFO mapred.JobClient:     Spilled Records=0
11/02/07 18:20:22 INFO mapred.JobClient:     Map output records=1452
```

After the map reduce job completes, query the accumulo table to see word counts.

```
$ ./bin/accumulo shell -u username -p password
username@instance> table wordCount
username@instance wordCount> scan -b the
the count:20080906 []    75
their count:20080906 []    2
them count:20080906 []    1
then count:20080906 []    1
there count:20080906 []    1
these count:20080906 []    3
this count:20080906 []    6
through count:20080906 []    1
time count:20080906 []    3
time. count:20080906 []    1
to count:20080906 []    27
total count:20080906 []    1
tserver, count:20080906 []    1
tserver.compaction.major.concurrent.max count:20080906 []    1
...
```

Another example to look at is org.apache.accumulo.examples.simple.mapreduce.UniqueColumns. This example computes the unique set of columns in a table and shows how a map reduce job can directly read a tables files from HDFS.

One more example available is org.apache.accumulo.examples.simple.mapreduce.TokenFileWordCount. The TokenFileWordCount example works exactly the same as the WordCount example explained above except that it uses a token file rather than giving the password directly to the map-reduce job (this avoids having the password displayed in the job’s configuration which is world-readable).

To create a token file, use the create-token utility

```
$ ./bin/accumulo create-token
```

It defaults to creating a PasswordToken, but you can specify the token class with -tc (requires the fully qualified class name). Based on the token class, it will prompt you for each property required to create the token.

The last value it prompts for is a local filename to save to. If this file exists, it will append the new token to the end. Multiple tokens can exist in a file, but only the first one for each user will be recognized.

Rather than waiting for the prompts, you can specify some options when calling create-token, for example

```
$ ./bin/accumulo create-token -u root -p secret -f root.pw
```

would create a token file containing a PasswordToken for user ‘root’ with password ‘secret’ and saved to ‘root.pw’

This local file needs to be uploaded to hdfs to be used with the map-reduce job. For example, if the file were ‘root.pw’ in the local directory:

```
$ hadoop fs -put root.pw root.pw
```

This would put ‘root.pw’ in the user’s home directory in hdfs.

Because the basic WordCount example uses Opts to parse its arguments (which extends ClientOnRequiredTable), you can use a token file with the basic WordCount example by calling the same command as explained above except replacing the password with the token file (rather than -p, use -tf).

```
$ ./bin/tool.sh lib/accumulo-examples-simple.jar org.apache.accumulo.examples.simple.mapreduce.WordCount -i instance -z zookeepers  --input /user/username/wc -t wordCount -u username -tf tokenfile
```

In the above examples, username was ‘root’ and tokenfile was ‘root.pw’

However, if you don’t want to use the Opts class to parse arguments, the TokenFileWordCount is an example of using the token file manually.

```
$ bin/tool.sh lib/accumulo-examples-simple.jar org.apache.accumulo.examples.simple.mapreduce.TokenFileWordCount instance zookeepers username tokenfile /user/username/wc wordCount
```

