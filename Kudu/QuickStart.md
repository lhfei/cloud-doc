# Apache Kudu Quickstart

Follow these instructions to set up and run the Kudu VM, and start with Kudu, Kudu_Impala, and CDH in minutes.

## [Get The Kudu Quickstart VM](http://kudu.apache.org/docs/quickstart.html#quickstart_vm)

### [Prerequisites](http://kudu.apache.org/docs/quickstart.html#_prerequisites)

1. Install [Oracle Virtualbox](https://www.virtualbox.org/). The VM has been tested to work with VirtualBox version 4.3 on Ubuntu 14.04 and VirtualBox version 5 on OSX 10.9. VirtualBox is also included in most package managers: apt-get, brew, etc.
2. After the installation, make sure that `VBoxManage` is in your `PATH` by using the `which VBoxManage` command.

### [Installation](http://kudu.apache.org/docs/quickstart.html#_installation)

To download and start the VM, execute the following command in a terminal window.

```bash
$ curl -s https://raw.githubusercontent.com/cloudera/kudu-examples/master/demo-vm-setup/bootstrap.sh | bash
```

This command downloads a shell script which clones the `kudu-examples` Git repository and then downloads a VM image of about 1.2GB size into the current working directory.[[1](http://kudu.apache.org/docs/quickstart.html#_footnote_1)] You can examine the script after downloading it by removing the `| bash` component of the command above. Once the setup is complete, you can verify that everything works by connecting to the guest via SSH:

```bash
$ ssh demo@quickstart.cloudera
```

The username and password for the demo account are both `demo`. In addition, the `demo` user has password-less `sudo` privileges so that you can install additional software or manage the guest OS. You can also access the `kudu-examples` as a shared folder in`/home/demo/kudu-examples/` on the guest or from your VirtualBox shared folder location on the host. This is a quick way to make scripts or data visible to the guest.

You can quickly verify if Kudu and Impala are running by executing the following commands:

```bash
$ ps aux | grep kudu
$ ps aux | grep impalad
```

If you have issues connecting to the VM or one of the processes is not running, make sure to consult the [Troubleshooting](http://kudu.apache.org/docs/quickstart.html#trouble) section.

## [Load Data](http://kudu.apache.org/docs/quickstart.html#_load_data)

To practice some typical operations with Kudu and Impala, we’ll use the [San Francisco MTA GPS dataset](https://data.sfgov.org/Transportation/Raw-AVL-GPS-data/5fk7-ivit/data). This dataset contains raw location data transmitted periodically from sensors installed on the buses in the SF MTA’s fleet.

1. Download the sample data and load it into HDFS

   First we’ll download the sample dataset, prepare it, and upload it into the HDFS cluster.

   The SF MTA’s site is often a bit slow, so we’ve mirrored a sample CSV file from the dataset at <http://kudu-sample-data.s3.amazonaws.com/sfmtaAVLRawData01012013.csv.gz>

   The original dataset uses DOS-style line endings, so we’ll convert it to UNIX-style during the upload process using `tr`.

   ```bash
   $ wget http://kudu-sample-data.s3.amazonaws.com/sfmtaAVLRawData01012013.csv.gz
   $ hdfs dfs -mkdir /sfmta
   $ zcat sfmtaAVLRawData01012013.csv.gz | tr -d '\r' | hadoop fs -put - /sfmta/data.csv
   ```

2. Create a new external Impala table to access the plain text data. To connect to Impala in the virtual machine issue the following command:

   ```bash
   ssh demo@quickstart.cloudera -t impala-shell
   ```

   Now, you can execute the following commands:

   ```sql
   CREATE EXTERNAL TABLE sfmta_raw (
     revision int,
     report_time string,
     vehicle_tag int,
     longitude float,
     latitude float,
     speed float,
     heading float
   )
   ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ','
   LOCATION '/sfmta/'
   TBLPROPERTIES ('skip.header.line.count'='1');
   ```

3. Validate if the data was actually loaded run the following command:

   ```sql
   SELECT count(*) FROM sfmta_raw;
   
   +----------+
   | count(*) |
   +----------+
   | 859086   |
   +----------+
   ```

4. Next we’ll create a Kudu table and load the data. Note that we convert the string `report_time` field into a unix-style timestamp for more efficient storage.

   ```sql
   CREATE TABLE sfmta
   PRIMARY KEY (report_time, vehicle_tag)
   PARTITION BY HASH(report_time) PARTITIONS 8
   STORED AS KUDU
   AS SELECT
     UNIX_TIMESTAMP(report_time,  'MM/dd/yyyy HH:mm:ss') AS report_time,
     vehicle_tag,
     longitude,
     latitude,
     speed,
     heading
   FROM sfmta_raw;
   
   +------------------------+
   | summary                |
   +------------------------+
   | Inserted 859086 row(s) |
   +------------------------+
   Fetched 1 row(s) in 5.75s
   ```

   The created table uses a composite primary key. See [Kudu Impala Integration](http://kudu.apache.org/docs/kudu_impala_integration.html#kudu_impala) for a more detailed introduction to the extended SQL syntax for Impala.

## [Read and Modify Data](http://kudu.apache.org/docs/quickstart.html#_read_and_modify_data)

Now that the data is stored in Kudu, you can run queries against it. The following query finds the data point containing the highest recorded vehicle speed.

```sql
SELECT * FROM sfmta ORDER BY speed DESC LIMIT 1;

+-------------+-------------+--------------------+-------------------+-------------------+---------+
| report_time | vehicle_tag | longitude          | latitude          | speed             | heading |
+-------------+-------------+--------------------+-------------------+-------------------+---------+
| 1357022342  | 5411        | -122.3968811035156 | 37.76665878295898 | 68.33300018310547 | 82      |
+-------------+-------------+--------------------+-------------------+-------------------+---------+
```

With a quick [Google search](https://www.google.com/search?q=122.3968811035156W+37.76665878295898N) we can see that this bus was traveling east on 16th street at 68MPH. At first glance, this seems unlikely to be true. Perhaps we do some research and find that this bus’s sensor equipment was broken and we decide to remove the data. With Kudu this is very easy to correct using standard SQL:

```sql
DELETE FROM sfmta WHERE vehicle_tag = '5411';

-- Modified 1169 row(s), 0 row error(s) in 0.25s
```

## [Next steps](http://kudu.apache.org/docs/quickstart.html#_next_steps)

The above example showed how to load, query, and mutate a static dataset with Impala and Kudu. The real power of Kudu, however, is the ability to ingest and mutate data in a streaming fashion.

As an exercise to learn the Kudu programmatic APIs, try implementing a program that uses the [SFMTA XML data feed](http://www.nextbus.com/xmlFeedDocs/NextBusXMLFeed.pdf) to ingest this same dataset in real time into the Kudu table.

### [Troubleshooting](http://kudu.apache.org/docs/quickstart.html#trouble)

#### [Problems accessing the VM via SSH](http://kudu.apache.org/docs/quickstart.html#_problems_accessing_the_vm_via_ssh)

- Make sure the host has a SSH client installed.

- Make sure the VM is running, by running the following command and checking for a VM called `kudu-demo`:

  ```bash
  $ VBoxManage list runningvms
  ```

- Verify that the VM’s IP address is included in the host’s `/etc/hosts` file. You should see a line that includes an IP address followed by the hostname `quickstart.cloudera`. To check the running VM’s IP address, use the `VBoxManage` command below.

  ```bash
  $ VBoxManage guestproperty get kudu-demo /VirtualBox/GuestInfo/Net/0/V4/IP
  Value: 192.168.56.100
  ```

- If you’ve used a Cloudera Quickstart VM before, your `.ssh/known_hosts` file may contain references to the previous VM’s SSH credentials. Remove any references to `quickstart.cloudera` from this file.

#### [Failing with lack of SSE4.2 support when running inside VirtualBox](http://kudu.apache.org/docs/quickstart.html#_failing_with_lack_of_sse4_2_support_when_running_inside_virtualbox)

- Running Kudu currently requires a CPU that supports SSE4.2 (Nehalem or later for Intel). To pass through SSE4.2 support into the guest VM, refer to the [VirtualBox documentation](https://www.virtualbox.org/manual/ch09.html#sse412passthrough)

## [Next Steps](http://kudu.apache.org/docs/quickstart.html#_next_steps_2)

- [Installing Kudu](http://kudu.apache.org/docs/installation.html)
- [Configuring Kudu](http://kudu.apache.org/docs/configuration.html)

- [Introducing Kudu](http://kudu.apache.org/docs/index.html)
- [Kudu Release Notes](http://kudu.apache.org/docs/release_notes.html)
- Getting Started with Kudu
  - Get The Kudu Quickstart VM
    - [Prerequisites](http://kudu.apache.org/docs/quickstart.html#_prerequisites)
    - [Installation](http://kudu.apache.org/docs/quickstart.html#_installation)
  - [Load Data](http://kudu.apache.org/docs/quickstart.html#_load_data)
  - [Read and Modify Data](http://kudu.apache.org/docs/quickstart.html#_read_and_modify_data)
  - Next steps
    - [Troubleshooting](http://kudu.apache.org/docs/quickstart.html#trouble)
  - [Next Steps](http://kudu.apache.org/docs/quickstart.html#_next_steps_2)
- [Installation Guide](http://kudu.apache.org/docs/installation.html)
- [Configuring Kudu](http://kudu.apache.org/docs/configuration.html)
- [Using Impala with Kudu](http://kudu.apache.org/docs/kudu_impala_integration.html)
- [Administering Kudu](http://kudu.apache.org/docs/administration.html)
- [Troubleshooting Kudu](http://kudu.apache.org/docs/troubleshooting.html)
- [Developing Applications with Kudu](http://kudu.apache.org/docs/developing.html)
- [Kudu Schema Design](http://kudu.apache.org/docs/schema_design.html)
- [Kudu Security](http://kudu.apache.org/docs/security.html)
- [Kudu Transaction Semantics](http://kudu.apache.org/docs/transaction_semantics.html)
- [Background Maintenance Tasks](http://kudu.apache.org/docs/background_tasks.html)
- [Kudu Configuration Reference](http://kudu.apache.org/docs/configuration_reference.html)
- [Kudu Command Line Tools Reference](http://kudu.apache.org/docs/command_line_tools_reference.html)
- [Known Issues and Limitations](http://kudu.apache.org/docs/known_issues.html)
- [Contributing to Kudu](http://kudu.apache.org/docs/contributing.html)
- [Export Control Notice](http://kudu.apache.org/docs/export_control.html)

------

[1](http://kudu.apache.org/docs/quickstart.html#_footnoteref_1). In addition, the script will create a host-only network between host and guest and setup an entry in the `/etc/hosts` file with the name `quickstart.cloudera` and the guest’s IP address.