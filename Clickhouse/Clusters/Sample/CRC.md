## Circular Replication Cluster Topology in ClickHouse



### Hosts

```ini
## GDruid		--Dev
10.182.1.25		host-10-182-1-25  
10.182.63.223	host-10-182-63-223
10.182.63.226	host-10-182-63-226
10.182.63.228	host-10-182-63-228
10.182.63.235	host-10-182-63-235
```



### Configuration

#### metrika.xml

```xml
<?xml version="1.0"?>
<yandex>
  <clickhouse_remote_servers>
    <bip_ck_cluster>
      <shard>
        <internal_replication>true</internal_replication>
        <replica>
          <host>host-10-182-63-223</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
        <replica>
          <host>host-10-182-63-226</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
      </shard>
      <shard>
        <internal_replication>true</internal_replication>
        <replica>
          <host>host-10-182-63-226</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
        <replica>
          <host>host-10-182-63-228</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
      </shard>
      <shard>
        <internal_replication>true</internal_replication>
        <replica>
          <host>host-10-182-63-228</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
        <replica>
          <host>host-10-182-63-223</host>
          <port>9000</port>
          <user>lhfei</user>
          <password>Lhfei</password>
        </replica>
      </shard>
    </bip_ck_cluster>
  </clickhouse_remote_servers>
  <macros>
    <layer>cluster_223</layer>
    <shard>shard_223_226</shard>
    <replica>host-10-182-63-223</replica>
  </macros>
  <networks>
    <ip>::/0</ip>
  </networks>
  <!-- Zookeeper Cluster -->
  <zookeeper-servers>
    <node index="1">
      <host>host-10-182-63-223</host>
      <port>2181</port>
    </node>
    <node index="2">
      <host>host-10-182-63-226</host>
      <port>2181</port>
    </node>
    <node index="3">
      <host>host-10-182-63-228</host>
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



> Compare Macros Setting

|          Host          | Macros configuration                                         |
| :--------------------: | :----------------------------------------------------------- |
| **host-10-182-63-223** | <macros><br/>    <layer>cluster_223</layer><br/>    <shard>shard_223_226</shard><br/>    <replica>host-10-182-63-223</replica><br/>  </macros> |
|                        |                                                              |
| **host-10-182-63-226** | <macros><br/>    <layer>cluster_226</layer><br/>    <shard>shard_226_228</shard><br/>    <replica>host-10-182-63-226</replica><br/>  </macros> |
|                        |                                                              |
| **host-10-182-63-228** | <macros><br/>    <layer>cluster_228</layer><br/>    <shard>shard_228_223</shard><br/>    <replica>host-10-182-63-228</replica><br/>  </macros> |





#### config.xml

```xml
<?xml version="1.0"?>
<!--
  NOTE: User and query level settings are set up in "users.xml" file.
-->
<yandex>
    <logger>
        <!-- Possible levels: https://github.com/pocoproject/poco/blob/develop/Foundation/include/Poco/Logger.h#L105 -->
        <level>trace</level>
        <log>/var/log/clickhouse-server/clickhouse-server.log</log>
        <errorlog>/var/log/clickhouse-server/clickhouse-server.err.log</errorlog>
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
    <interserver_http_host>example.yandex.ru</interserver_http_host>
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
    <path>/var/lib/clickhouse/</path>

    <!-- Path to temporary data for processing hard queries. -->
    <tmp_path>/var/lib/clickhouse/tmp/</tmp_path>

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

    <!-- Perform mlockall after startup to lower first queries latency
          and to prevent clickhouse executable from being paged out under high IO load.
         Enabling this option is recommended but will lead to increased startup time for up to a few seconds.
    -->
    <mlock_executable>false</mlock_executable>

    <!-- Configuration of clusters that could be used in Distributed tables.
         https://clickhouse.yandex/docs/en/table_engines/distributed/
      -->
    <remote_servers incl="clickhouse_remote_servers" >
        <!--<test_shard_localhost>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>9000</port>
                </replica>
            </shard>
        </test_shard_localhost>
        <test_cluster_two_shards_localhost>
             <shard>
                 <replica>
                     <host>localhost</host>
                     <port>9000</port>
                 </replica>
             </shard>
             <shard>
                 <replica>
                     <host>localhost</host>
                     <port>9000</port>
                 </replica>
             </shard>
         </test_cluster_two_shards_localhost>
        <test_shard_localhost_secure>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>9440</port>
                    <secure>1</secure>
                </replica>
            </shard>
        </test_shard_localhost_secure>
        <test_unavailable_shard>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>9000</port>
                </replica>
            </shard>
            <shard>
                <replica>
                    <host>localhost</host>
                    <port>1</port>
                </replica>
            </shard>
        </test_unavailable_shard>-->
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

    <!-- Query thread log. Has information about all threads participated in query execution.
         Used only for queries with setting log_query_threads = 1. -->
    <query_thread_log>
        <database>system</database>
        <table>query_thread_log</table>
        <partition_by>toYYYYMM(event_date)</partition_by>
        <flush_interval_milliseconds>7500</flush_interval_milliseconds>
    </query_thread_log>

    <!-- Uncomment if use part log.
         Part log contains information about all actions with parts in MergeTree tables (creation, deletion, merges, downloads).
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
         By default max_table_size_to_drop is 50GB; max_table_size_to_drop=0 allows to DROP any tables.
         The same for max_partition_size_to_drop.
         Uncomment to disable protection.
    -->
    <!-- <max_table_size_to_drop>0</max_table_size_to_drop> -->
    <!-- <max_partition_size_to_drop>0</max_partition_size_to_drop> -->

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



#### user.xml

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
                  with minimum number of different symbols between replica's hostname and local hostname
                  (Hamming distance).
                 in_order - first live replica is chosen in specified order.
                 first_or_random - if first replica one has higher number of errors, pick a random one from replicas with minimum number of errors.
            -->
            <load_balancing>random</load_balancing>
        </default>

        <!-- Profile that allows only read queries. -->
        <readonly>
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
            <password_sha256_hex>765fabaa5032162a1fc80edb87439dc2de5fe451e23b66ad5817c7a2668ce61c</password_sha256_hex>

            <!-- List of networks with open access.

                 To open access from everywhere, specify:
                    <ip>::/0</ip>

                 To open access only from localhost, specify:
                    <ip>::1</ip>
                    <ip>127.0.0.1</ip>

                 Each element of list has one of the following forms:
                 <ip> IP-address or network mask. Examples: 213.180.204.3 or 10.0.0.1/8 or 10.0.0.1/255.255.255.0
                     2a02:6b8::3 or 2a02:6b8::3/64 or 2a02:6b8::3/ffff:ffff:ffff:ffff::.
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

            <!-- For testing the table filters -->
            <databases>
                <test>
                    <!-- Simple expression filter -->
                    <filtered_table1>
                        <filter>a = 1</filter>
                    </filtered_table1>

                    <!-- Complex expression filter -->
                    <filtered_table2>
                        <filter>a + b &lt; 1 or c - d &gt; 5</filter>
                    </filtered_table2>

                    <!-- Filter with ALIAS column -->
                    <filtered_table3>
                        <filter>c = 1</filter>
                    </filtered_table3>
                </test>
            </databases>
        </default>

        <lhfei>         <password_sha256_hex>765fabaa5032162a1fc80edb87439dc2de5fe451e23b66ad5817c7a2668ce61c</password_sha256_hex>
            <networks incl="networks" replace="replace">
                <ip>::/0</ip>
            </networks>

            <!-- Settings profile for user. -->
            <profile>default</profile>

            <!-- Quota for user. -->
            <quota>default</quota>

            <!-- For testing the table filters -->
            <databases>
                <test>
                    <!-- Simple expression filter -->
                    <filtered_table1>
                        <filter>a = 1</filter>
                    </filtered_table1>

                    <!-- Complex expression filter -->
                    <filtered_table2>
                        <filter>a + b &lt; 1 or c - d &gt; 5</filter>
                    </filtered_table2>

                    <!-- Filter with ALIAS column -->
                    <filtered_table3>
                        <filter>c = 1</filter>
                    </filtered_table3>
                </test>
            </databases>
        </lhfei>

        <!-- Example of user with readonly access. -->
        <!-- <readonly>
            <password></password>
            <networks incl="networks" replace="replace">
                <ip>::1</ip>
                <ip>127.0.0.1</ip>
            </networks>
            <profile>readonly</profile>
            <quota>default</quota>
        </readonly> -->
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



> Check Cluster Info

```sql
SELECT 
    cluster, 
    shard_num, 
    shard_weight, 
    replica_num, 
    host_name, 
    is_local
FROM system.clusters 

┌─cluster────────┬─shard_num─┬─shard_weight─┬─replica_num─┬─host_name──────────┬─is_local─┐
│ bip_ck_cluster │         1 │            1 │           1 │ host-10-182-63-223 │        1 │
│ bip_ck_cluster │         1 │            1 │           2 │ host-10-182-63-226 │        1 │
│ bip_ck_cluster │         2 │            1 │           1 │ host-10-182-63-226 │        0 │
│ bip_ck_cluster │         2 │            1 │           2 │ host-10-182-63-228 │        0 │
│ bip_ck_cluster │         3 │            1 │           1 │ host-10-182-63-228 │        1 │
│ bip_ck_cluster │         3 │            1 │           2 │ host-10-182-63-223 │        1 │
└────────────────┴───────────┴──────────────┴─────────────┴────────────────────┴──────────┘
```



### Download Datasets

```sh
for s in `seq 1987 2018`
do
for m in `seq 1 12`
do
wget https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_${s}_${m}.zip
done
done
```





### DDL

```sql
CREATE TABLE `ontime` (
  `Year` UInt16,
  `Quarter` UInt8,
  `Month` UInt8,
  `DayofMonth` UInt8,
  `DayOfWeek` UInt8,
  `FlightDate` Date,
  `UniqueCarrier` FixedString(7),
  `AirlineID` Int32,
  `Carrier` FixedString(2),
  `TailNum` String,
  `FlightNum` String,
  `OriginAirportID` Int32,
  `OriginAirportSeqID` Int32,
  `OriginCityMarketID` Int32,
  `Origin` FixedString(5),
  `OriginCityName` String,
  `OriginState` FixedString(2),
  `OriginStateFips` String,
  `OriginStateName` String,
  `OriginWac` Int32,
  `DestAirportID` Int32,
  `DestAirportSeqID` Int32,
  `DestCityMarketID` Int32,
  `Dest` FixedString(5),
  `DestCityName` String,
  `DestState` FixedString(2),
  `DestStateFips` String,
  `DestStateName` String,
  `DestWac` Int32,
  `CRSDepTime` Int32,
  `DepTime` Int32,
  `DepDelay` Int32,
  `DepDelayMinutes` Int32,
  `DepDel15` Int32,
  `DepartureDelayGroups` String,
  `DepTimeBlk` String,
  `TaxiOut` Int32,
  `WheelsOff` Int32,
  `WheelsOn` Int32,
  `TaxiIn` Int32,
  `CRSArrTime` Int32,
  `ArrTime` Int32,
  `ArrDelay` Int32,
  `ArrDelayMinutes` Int32,
  `ArrDel15` Int32,
  `ArrivalDelayGroups` Int32,
  `ArrTimeBlk` String,
  `Cancelled` UInt8,
  `CancellationCode` FixedString(1),
  `Diverted` UInt8,
  `CRSElapsedTime` Int32,
  `ActualElapsedTime` Int32,
  `AirTime` Int32,
  `Flights` Int32,
  `Distance` Int32,
  `DistanceGroup` UInt8,
  `CarrierDelay` Int32,
  `WeatherDelay` Int32,
  `NASDelay` Int32,
  `SecurityDelay` Int32,
  `LateAircraftDelay` Int32,
  `FirstDepTime` String,
  `TotalAddGTime` String,
  `LongestAddGTime` String,
  `DivAirportLandings` String,
  `DivReachedDest` String,
  `DivActualElapsedTime` String,
  `DivArrDelay` String,
  `DivDistance` String,
  `Div1Airport` String,
  `Div1AirportID` Int32,
  `Div1AirportSeqID` Int32,
  `Div1WheelsOn` String,
  `Div1TotalGTime` String,
  `Div1LongestGTime` String,
  `Div1WheelsOff` String,
  `Div1TailNum` String,
  `Div2Airport` String,
  `Div2AirportID` Int32,
  `Div2AirportSeqID` Int32,
  `Div2WheelsOn` String,
  `Div2TotalGTime` String,
  `Div2LongestGTime` String,
  `Div2WheelsOff` String,
  `Div2TailNum` String,
  `Div3Airport` String,
  `Div3AirportID` Int32,
  `Div3AirportSeqID` Int32,
  `Div3WheelsOn` String,
  `Div3TotalGTime` String,
  `Div3LongestGTime` String,
  `Div3WheelsOff` String,
  `Div3TailNum` String,
  `Div4Airport` String,
  `Div4AirportID` Int32,
  `Div4AirportSeqID` Int32,
  `Div4WheelsOn` String,
  `Div4TotalGTime` String,
  `Div4LongestGTime` String,
  `Div4WheelsOff` String,
  `Div4TailNum` String,
  `Div5Airport` String,
  `Div5AirportID` Int32,
  `Div5AirportSeqID` Int32,
  `Div5WheelsOn` String,
  `Div5TotalGTime` String,
  `Div5LongestGTime` String,
  `Div5WheelsOff` String,
  `Div5TailNum` String
) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192)
```

```sql
CREATE TABLE ontime_all AS ontime
    ENGINE = Distributed(bip_ck_cluster, benchmark, ontime, rand());
```



### Loading Data

```shell
for i in *.zip; do echo $i; unzip -cq $i '*.csv' | sed 's/\.00//g' | clickhouse-client -m -u lhfei --password Lhfei --host=`hostname` --query="INSERT INTO benchmark.ontime FORMAT CSVWithNames"; done
```

