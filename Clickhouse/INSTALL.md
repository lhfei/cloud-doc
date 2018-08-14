## Install CK on CentOS

### YUM Repo

https://packagecloud.io/Altinity/clickhouse?page=2



https://pkgs.org/

### Prepared

```
yum install binutils-devel
```



#### Zookeeper

Install zookeeper, you can see 



### Install

by public repo:

```sh
yum install -y yum-utils

yum-config-manager --add-repo http://repo.red-soft.biz/repos/clickhouse/repo/clickhouse-el7.repo

yum install -y clickhouse-server clickhouse-client clickhouse-server-common clickhouse-compressor
```

by manual:

```sh
rpm -ivh clickhouse-common-static-1.1.54390-1.el6.x86_64.rpm
rpm -ivh clickhouse-server-common-1.1.54390-1.el6.x86_64.rpm
rpm -ivh clickhouse-client-1.1.54390-1.el6.x86_64.rpm
rpm -ivh clickhouse-server-1.1.54390-1.el6.x86_64.rpm
```



### Configuration



- [x] /etc/rc.d/init.d/clickhouse-server 

```ini
CLICKHOUSE_LOGDIR=/export/var/log/clickhouse-server
CLICKHOUSE_DATADIR_OLD=/export/opt/clickhouse
CLICKHOUSE_CONFIG=$SYSCONFDIR/config.xml
```



- [x] config.xml 

```xml
<?xml version="1.0"?>
<yandex>
    <logger>
        <!-- Possible levels: https://github.com/pocoproject/poco/blob/develop/Foundation/include/Poco/Logger.h#L105 -->
        <level>trace</level>
        <log>/export/var/log/clickhouse-server/clickhouse-server.log</log>
        <errorlog>/export/var/log/clickhouse-server/clickhouse-server.err.log</errorlog>
        <size>1000M</size>
        <count>10</count>
        <!-- <console>1</console> --> <!-- Default behavior is autodetection (log to console if not daemon mode and is tty) -->
    </logger>
    <!--display_name>production</display_name--> <!-- It is the name that will be shown in the client -->
    <http_port>8123</http_port>
    <tcp_port>9000</tcp_port>

    <!-- For HTTPS and SSL over native protocol. -->
    <!--
    <https_port>8443</https_port>
    <tcp_port_secure>9440</tcp_port_secure>
    -->

    <!-- Used with https_port and tcp_port_secure. Full ssl options list: https://github.com/ClickHouse-Extras/poco/blob/master/NetSSL_OpenSSL/include/Poco/Net/SSLManager.h#L71 -->
    <openSSL>
        <server> <!-- Used for https server AND secure tcp port -->
            <!-- openssl req -subj "/CN=localhost" -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/clickhouse-server/server.key -out /etc/clickhouse-server/server.crt -->
            <certificateFile>/etc/clickhouse-server/server.crt</certificateFile>
            <privateKeyFile>/etc/clickhouse-server/server.key</privateKeyFile>
            <!-- openssl dhparam -out /etc/clickhouse-server/dhparam.pem 4096 -->
            <dhParamsFile>/etc/clickhouse-server/dhparam.pem</dhParamsFile>
            <verificationMode>none</verificationMode>
            <loadDefaultCAFile>true</loadDefaultCAFile>
            <cacheSessions>true</cacheSessions>
            <disableProtocols>sslv2,sslv3</disableProtocols>
            <preferServerCiphers>true</preferServerCiphers>
        </server>

        <client> <!-- Used for connecting to https dictionary source -->
            <loadDefaultCAFile>true</loadDefaultCAFile>
            <cacheSessions>true</cacheSessions>
            <disableProtocols>sslv2,sslv3</disableProtocols>
            <preferServerCiphers>true</preferServerCiphers>
            <!-- Use for self-signed: <verificationMode>none</verificationMode> -->
            <invalidCertificateHandler>
                <!-- Use for self-signed: <name>AcceptCertificateHandler</name> -->
                <name>RejectCertificateHandler</name>
            </invalidCertificateHandler>
        </client>
    </openSSL>

    <!-- Default root page on http[s] server. For example load UI from https://tabix.io/ when opening http://localhost:8123 -->
    <!--
    <http_server_default_response><![CDATA[<html ng-app="SMI2"><head><base href="http://ui.tabix.io/"></head><body><div ui-view="" class="content-ui"></div><script src="http://loader.tabix.io/master.js"></script></body></html>]]></http_server_default_response>
    -->

    <!-- Port for communication between replicas. Used for data exchange. -->
    <interserver_http_port>9009</interserver_http_port>

    <!-- Hostname that is used by other replicas to request this server.
         If not specified, than it is determined analoguous to 'hostname -f' command.
         This setting could be used to switch replication to another network interface.
      -->
    <!--
    <interserver_http_host>host-10-182-57-104</interserver_http_host>
    -->

    <!-- Listen specified host. use :: (wildcard IPv6 address), if you want to accept connections both with IPv4 and IPv6 from everywhere. -->
    <!-- <listen_host>::</listen_host> -->
    <!-- Same for hosts with disabled ipv6: -->
    <listen_host>0.0.0.0</listen_host>

    <!-- Default values - try listen localhost on ipv4 and ipv6: -->
    <!--
    <listen_host>::1</listen_host>
    <listen_host>127.0.0.1</listen_host>
    -->
    <!-- Don't exit if ipv6 or ipv4 unavailable, but listen_host with this protocol specified -->
    <!-- <listen_try>0</listen_try> -->

    <!-- Allow listen on same address:port -->
    <!-- <listen_reuse_port>0</listen_reuse_port> -->

    <!-- <listen_backlog>64</listen_backlog> -->

    <max_connections>4096</max_connections>
    <keep_alive_timeout>3</keep_alive_timeout>

    <!-- Maximum number of concurrent queries. -->
    <max_concurrent_queries>100</max_concurrent_queries>

    <!-- Set limit on number of open files (default: maximum). This setting makes sense on Mac OS X because getrlimit() fails to retrieve
         correct maximum value. -->
    <!-- <max_open_files>262144</max_open_files> -->

    <!-- Size of cache of uncompressed blocks of data, used in tables of MergeTree family.
         In bytes. Cache is single for server. Memory is allocated only on demand.
         Cache is used when 'use_uncompressed_cache' user setting turned on (off by default).
         Uncompressed cache is advantageous only for very short queries and in rare cases.
      -->
    <uncompressed_cache_size>8589934592</uncompressed_cache_size>

    <!-- Approximate size of mark cache, used in tables of MergeTree family.
         In bytes. Cache is single for server. Memory is allocated only on demand.
         You should not lower this value.
      -->
    <mark_cache_size>5368709120</mark_cache_size>


    <!-- Path to data directory, with trailing slash. -->
    <path>/export/data/clickhouse/</path>

    <!-- Path to temporary data for processing hard queries. -->
    <tmp_path>/export/data/tmp/clickhouse/</tmp_path>

    <!-- Directory with user provided files that are accessible by 'file' table function. -->
    <user_files_path>/var/lib/clickhouse/user_files/</user_files_path>

    <!-- Path to configuration file with users, access rights, profiles of settings, quotas. -->
    <users_config>users.xml</users_config>

    <!-- Default profile of settings. -->
    <default_profile>default</default_profile>

    <!-- System profile of settings. This settings are used by internal processes (Buffer storage, Distibuted DDL worker and so on). -->
    <!-- <system_profile>default</system_profile> -->

    <!-- Default database. -->
    <default_database>default</default_database>

    <!-- Server time zone could be set here.

         Time zone is used when converting between String and DateTime types,
          when printing DateTime in text formats and parsing DateTime from text,
          it is used in date and time related functions, if specific time zone was not passed as an argument.

         Time zone is specified as identifier from IANA time zone database, like UTC or Africa/Abidjan.
         If not specified, system time zone at server startup is used.

         Please note, that server could display time zone alias instead of specified name.
         Example: W-SU is an alias for Europe/Moscow and Zulu is an alias for UTC.
    -->
    <!-- <timezone>Europe/Moscow</timezone> -->

    <!-- You can specify umask here (see "man umask"). Server will apply it on startup.
         Number is always parsed as octal. Default umask is 027 (other users cannot read logs, data files, etc; group can only read).
    -->
    <!-- <umask>022</umask> -->

    <!-- Configuration of clusters that could be used in Distributed tables.
         https://clickhouse.yandex/docs/en/table_engines/distributed/
      -->
    <remote_servers incl="clickhouse_remote_servers" >
        <!-- Test only shard config for testing distributed storage -->
        <test_shard_localhost>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>9000</port>
                </replica>
            </shard>
        </test_shard_localhost>
        <test_shard_localhost_secure>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>9440</port>
                    <secure>1</secure>
                </replica>
            </shard>
        </test_shard_localhost_secure>
    </remote_servers>


    <!-- If element has 'incl' attribute, then for it's value will be used corresponding substitution from another file.
         By default, path to file with substitutions is /etc/metrika.xml. It could be changed in config in 'include_from' element.
         Values for substitutions are specified in /yandex/name_of_substitution elements in that file.
      -->

    <!-- ZooKeeper is used to store metadata about replicas, when using Replicated tables.
         Optional. If you don't use replicated tables, you could omit that.

         See https://clickhouse.yandex/docs/en/table_engines/replication/
      -->
    <zookeeper incl="zookeeper-servers" optional="true" />

    <!-- Substitutions for parameters of replicated tables.
          Optional. If you don't use replicated tables, you could omit that.

         See https://clickhouse.yandex/docs/en/table_engines/replication/#creating-replicated-tables
      -->
    <macros incl="macros" optional="true" />


    <!-- Reloading interval for embedded dictionaries, in seconds. Default: 3600. -->
    <builtin_dictionaries_reload_interval>3600</builtin_dictionaries_reload_interval>


    <!-- Maximum session timeout, in seconds. Default: 3600. -->
    <max_session_timeout>3600</max_session_timeout>

    <!-- Default session timeout, in seconds. Default: 60. -->
    <default_session_timeout>60</default_session_timeout>

    <!-- Sending data to Graphite for monitoring. Several sections can be defined. -->
    <!--
        interval - send every X second
        root_path - prefix for keys
        hostname_in_path - append hostname to root_path (default = true)
        metrics - send data from table system.metrics
        events - send data from table system.events
        asynchronous_metrics - send data from table system.asynchronous_metrics
    -->
    <!--
    <graphite>
        <host>localhost</host>
        <port>42000</port>
        <timeout>0.1</timeout>
        <interval>60</interval>
        <root_path>one_min</root_path>
        <hostname_in_path>true</hostname_in_path>

        <metrics>true</metrics>
        <events>true</events>
        <asynchronous_metrics>true</asynchronous_metrics>
    </graphite>
    <graphite>
        <host>localhost</host>
        <port>42000</port>
        <timeout>0.1</timeout>
        <interval>1</interval>
        <root_path>one_sec</root_path>

        <metrics>true</metrics>
        <events>true</events>
        <asynchronous_metrics>false</asynchronous_metrics>
    </graphite>
    -->


    <!-- Query log. Used only for queries with setting log_queries = 1. -->
    <query_log>
        <!-- What table to insert data. If table is not exist, it will be created.
             When query log structure is changed after system update,
              then old table will be renamed and new table will be created automatically.
        -->
        <database>system</database>
        <table>query_log</table>
        <!--
            PARTITION BY expr https://clickhouse.yandex/docs/en/table_engines/custom_partitioning_key/
            Example:
                event_date
                toMonday(event_date)
                toYYYYMM(event_date)
                toStartOfHour(event_time)
        -->
        <partition_by>toYYYYMM(event_date)</partition_by>
        <!-- Interval of flushing data. -->
        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
    </query_log>


    <!-- Uncomment if use part_log
    <part_log>
        <database>system</database>
        <table>part_log</table>

        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
    </part_log>
    -->


    <!-- Parameters for embedded dictionaries, used in Yandex.Metrica.
         See https://clickhouse.yandex/docs/en/dicts/internal_dicts/
    -->

    <!-- Path to file with region hierarchy. -->
    <!-- <path_to_regions_hierarchy_file>/opt/geo/regions_hierarchy.txt</path_to_regions_hierarchy_file> -->

    <!-- Path to directory with files containing names of regions -->
    <!-- <path_to_regions_names_files>/opt/geo/</path_to_regions_names_files> -->


    <!-- Configuration of external dictionaries. See:
         https://clickhouse.yandex/docs/en/dicts/external_dicts/
    -->
    <dictionaries_config>*_dictionary.xml</dictionaries_config>

    <!-- Uncomment if you want data to be compressed 30-100% better.
         Don't do that if you just started using ClickHouse.
      -->
    <compression incl="clickhouse_compression">
    <!--
        <!- - Set of variants. Checked in order. Last matching case wins. If nothing matches, lz4 will be used. - ->
        <case>

            <!- - Conditions. All must be satisfied. Some conditions may be omitted. - ->
            <min_part_size>10000000000</min_part_size>        <!- - Min part size in bytes. - ->
            <min_part_size_ratio>0.01</min_part_size_ratio>   <!- - Min size of part relative to whole table size. - ->

            <!- - What compression method to use. - ->
            <method>zstd</method>
        </case>
    -->
    </compression>

    <!-- Allow to execute distributed DDL queries (CREATE, DROP, ALTER, RENAME) on cluster.
         Works only if ZooKeeper is enabled. Comment it if such functionality isn't required. -->
    <distributed_ddl>
        <!-- Path in ZooKeeper to queue with DDL queries -->
        <path>/clickhouse/task_queue/ddl</path>

        <!-- Settings from this profile will be used to execute DDL queries -->
        <!-- <profile>default</profile> -->
    </distributed_ddl>

    <!-- Settings to fine tune MergeTree tables. See documentation in source code, in MergeTreeSettings.h -->
    <!--
    <merge_tree>
        <max_suspicious_broken_parts>5</max_suspicious_broken_parts>
    </merge_tree>
    -->

    <!-- Protection from accidental DROP.
         If size of a MergeTree table is greater than max_table_size_to_drop (in bytes) than table could not be dropped with any DROP query.
         If you want do delete one table and don't want to restart clickhouse-server, you could create special file <clickhouse-path>/flags/force_drop_table and make DROP once.
         By default max_table_size_to_drop is 50GB, max_table_size_to_drop=0 allows to DROP any tables.
         Uncomment to disable protection.
    -->
    <!-- <max_table_size_to_drop>0</max_table_size_to_drop> -->

    <!-- Example of parameters for GraphiteMergeTree table engine -->
    <graphite_rollup_example>
        <pattern>
            <regexp>click_cost</regexp>
            <function>any</function>
            <retention>
                <age>0</age>
                <precision>3600</precision>
            </retention>
            <retention>
                <age>86400</age>
                <precision>60</precision>
            </retention>
        </pattern>
        <default>
            <function>max</function>
            <retention>
                <age>0</age>
                <precision>60</precision>
            </retention>
            <retention>
                <age>3600</age>
                <precision>300</precision>
            </retention>
            <retention>
                <age>86400</age>
                <precision>3600</precision>
            </retention>
        </default>
    </graphite_rollup_example>

    <!-- Directory in <clickhouse-path> containing schema files for various input formats.
         The directory will be created if it doesn't exist.
      -->
    <format_schema_path>/var/lib/clickhouse/format_schemas/</format_schema_path>

    <!-- Uncomment to disable ClickHouse internal DNS caching. -->
    <!-- <disable_internal_dns_cache>1</disable_internal_dns_cache> -->

    <include_from>/etc/clickhouse-server/metrika.xml</include_from>
</yandex>
```



- [x] metrika.xml

```xml
<?xml version="1.0"?>
<yandex>
  <clickhouse_remote_servers>
    <bip_ck_cluster>
      <shard>
        <internal_replication>false</internal_replication>
        <replica>
          <host>host-10-182-57-104</host>
          <port>9000</port>
          <user>default</user>
          <password></password>
        </replica>
      </shard>
      <shard>
        <internal_replication>false</internal_replication>
        <replica>
          <host>host-10-182-57-106</host>
          <port>9000</port>
          <user>default</user>
          <password></password>
        </replica>
      </shard>
      <shard>
        <internal_replication>false</internal_replication>
        <replica>
          <host>host-10-182-57-111</host>
          <port>9000</port>
          <user>default</user>
          <password></password>
        </replica>
      </shard>
    </bip_ck_cluster>
  </clickhouse_remote_servers>
  <macros>
    <replica>host-10-182-57-104</replica>
  </macros>
  <networks>
    <ip>::/0</ip>
  </networks>
  <!-- Zookeeper Cluster -->
  <zookeeper-servers>
    <node index="1">
      <host>10.182.57.104</host>
      <port>2181</port>
    </node>
    <node index="2">
      <host>10.182.57.106</host>
      <port>2181</port>
    </node>
    <node index="3">
      <host>10.182.57.111</host>
      <port>2181</port>
    </node>
  </zookeeper-servers>
  <clickhouse_compression>
    <case>
      <min_part_size>10000000000</min_part_size>
      <min_part_size_ratio>0.01</min_part_size_ratio>
      <method>lz4</method>
    </case>
  </clickhouse_compression>
</yandex>
```



- [x] user.xml

  How to generate decent password, just execute below line in cmd.

  ```sh
  PASSWORD="Lhfei"
  echo "$PASSWORD"; echo -n "$PASSWORD" | sha256sum | tr -d '-'
  
  ------------------------------------------------------------------
  Lhfei
  765fabaa5032162a1fc80edb87439dc2de5fe451e23b66ad5817c7a2668ce61c  
  ------------------------------------------------------------------
  ```

  In first line will be password and in second - corresponding SHA256.

  

```xml
<?xml version="1.0"?>
<yandex>
  <!-- Profiles of settings. -->
  <profiles>
    <!-- Default settings. -->
    <default>
      <!-- Maximum memory usage for processing single query, in bytes. -->
      <max_memory_usage>10000000000</max_memory_usage>
      <!-- Use cache of uncompressed blocks of data. Meaningful only for processing many of very short queries. -->
      <use_uncompressed_cache>0</use_uncompressed_cache>
      <!-- How to choose between replicas during distributed query processing.
                 random - choose random replica from set of replicas with minimum number of errors
                 nearest_hostname - from set of replicas with minimum number of errors, choose replica
                  with minumum number of different symbols between replica's hostname and local hostname
                  (Hamming distance).
                 in_order - first live replica is choosen in specified order.
            -->
      <load_balancing>random</load_balancing>
    </default>
    <!-- Profile that allows only read queries. -->
    <readonly>
      <max_memory_usage>10000000000</max_memory_usage>
      <use_uncompressed_cache>0</use_uncompressed_cache>
      <load_balancing>random</load_balancing>
      <readonly>1</readonly>
    </readonly>
  </profiles>
  <!-- Users and ACL. -->
  <users>
    <!-- If user name was not specified, 'default' user is used. -->
    <default>
      <!-- Password could be specified in plaintext or in SHA256 (in hex format).

                 If you want to specify password in plaintext (not recommended), place it in 'password' element.
                 Example: <password>qwerty</password>.
                 Password could be empty.

                 If you want to specify SHA256, place it in 'password_sha256_hex' element.
                 Example: <password_sha256_hex>65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5</password_sha256_hex>

                 How to generate decent password:
                 Execute: PASSWORD=$(base64 < /dev/urandom | head -c8); echo "$PASSWORD"; echo -n "$PASSWORD" | sha256sum | tr -d '-'
                 In first line will be password and in second - corresponding SHA256.
            -->
      <password/>
      <!-- List of networks with open access.

                 To open access from everywhere, specify:
                    <ip>::/0</ip>

                 To open access only from localhost, specify:
                    <ip>::1</ip>
                    <ip>127.0.0.1</ip>

                 Each element of list has one of the following forms:
                 <ip> IP-address or network mask. Examples: 213.180.204.3 or 10.0.0.1/8 or 2a02:6b8::3 or 2a02:6b8::3/64.
                 <host> Hostname. Example: server01.yandex.ru.
                     To check access, DNS query is performed, and all received addresses compared to peer address.
                 <host_regexp> Regular expression for host names. Example, ^server\d\d-\d\d-\d\.yandex\.ru$
                     To check access, DNS PTR query is performed for peer address and then regexp is applied.
                     Then, for result of PTR query, another DNS query is performed and all received addresses compared to peer address.
                     Strongly recommended that regexp is ends with $
                 All results of DNS requests are cached till server restart.
            -->
      <networks incl="networks" replace="replace">
        <ip>::/0</ip>
      </networks>
      <!-- Settings profile for user. -->
      <profile>default</profile>
      <!-- Quota for user. -->
      <quota>default</quota>
    </default>
    <!-- Example of user with readonly access. -->
    <readonly>
      <password/>
      <networks incl="networks" replace="replace">
        <ip>::1</ip>
        <ip>127.0.0.1</ip>
      </networks>
      <profile>readonly</profile>
      <quota>default</quota>
    </readonly>
  </users>
  <!-- Quotas. -->
  <quotas>
    <!-- Name of quota. -->
    <default>
      <!-- Limits for time interval. You could specify many intervals with different limits. -->
      <interval>
        <!-- Length of interval. -->
        <duration>3600</duration>
        <!-- No limits. Just calculate resource usage for time interval. -->
        <queries>0</queries>
        <errors>0</errors>
        <result_rows>0</result_rows>
        <read_rows>0</read_rows>
        <execution_time>0</execution_time>
      </interval>
    </default>
  </quotas>
</yandex>
```



### Start

```sh
mkdir -p /export/data/clickhouse
mkdir -p /export/data/tmp/clickhouse
mkdir -p /export/var/log/clickhouse-server

chmod 777 /export/var/log/clickhouse-server
```



```sh
/etc/init.d/clickhouse-server start
```



check status:

```
lsof -i :8123

COMMAND      PID       USER   FD   TYPE     DEVICE SIZE/OFF NODE NAME
clickhous 280589 clickhouse   10u  IPv4 3930653181      0t0  TCP *:8123 (LISTEN)
```



```
/etc/init.d/clickhouse-server stop
```



```
clickhouse-client -h 127.0.0.1 -d default -m -u default
```



```sql
use system;

select * from clusters;

┌─cluster─────────────────────┬─shard_num─┬─shard_weight─┬─replica_num─┬─host_name──────────┬─host_address──┬─port─┬─is_local─┬─user────┬─default_database─┐
│ bip_ck_cluster              │         1 │            1 │           1 │ host-10-182-57-104 │ 10.182.57.104 │ 9000 │        0 │ default │                  │
│ bip_ck_cluster              │         2 │            1 │           1 │ host-10-182-57-106 │ 10.182.57.106 │ 9000 │        1 │ default │                  │
│ bip_ck_cluster              │         3 │            1 │           1 │ host-10-182-57-111 │ 10.182.57.111 │ 9000 │        0 │ default │                  │
│ test_shard_localhost        │         1 │            1 │           1 │ localhost          │ ::1           │ 9000 │        1 │ default │                  │
│ test_shard_localhost_secure │         1 │            1 │           1 │ localhost          │ ::1           │ 9440 │        0 │ default │                  │
└─────────────────────────────┴───────────┴──────────────┴─────────────┴────────────────────┴───────────────┴──────┴──────────┴─────────┴──────────────────┘

```



### Nginx

```ini
# application: CK
location / {
    proxy_pass http://127.0.0.1:8123;
    index /;
    proxy_set_header Host $host;
}
```



### Issues

> libicudata.so.42()(64bit) is needed by clickhouse-common-static-1.1.54390-1.el6.x86_64

```
yum install libicu
```



> libodbc.so.2()(64bit) is needed by clickhouse-common-static-1.1.54390-1.el6.x86_64

```
yum install unixODBC
```



## Getting Started

### DDL

```sql
CREATE DATABASE  lhfei;
USE lhfei;

CREATE TABLE ontime_local (FlightDate Date,Year UInt16) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);

CREATE TABLE ontime_all AS ontime_local ENGINE = Distributed(bip_ck_cluster, lhfei, ontime_local, rand());

-- for local
insert into ontime_local (FlightDate,Year) values('2001-10-12',2001);
insert into ontime_local (FlightDate,Year) values('2002-10-12',2002);
insert into ontime_local (FlightDate,Year) values('2003-10-12',2003);

-- for distributed
insert into ontime_all   (FlightDate,Year) values('2003-10-12',2008);

select count(*) from system.ontime_all;
```



