

### gfsh

```ini
gfsh>help 
alter async-event-queue (Not Available)
    alter attributes of async-event-queue, needs rolling restart for new attributes to take effect. 
alter disk-store (Available)
    Alter some options for a region or remove a region in an offline disk store.
alter region (Not Available)
    Alter a region with the given path and configuration.
alter runtime (Not Available)
    Alter a subset of member or members configuration properties while running.
backup disk-store (Not Available)
    Perform a backup on all members with persistent data. The target directory must exist on all members, but can be either local or shared. This command can
    safely be executed on active members and is strongly recommended over copying files via operating system commands.
change loglevel (Not Available)
    This command changes log-level run time on specified servers.
clear defined indexes (Not Available)
    Clears all the defined indexes.
close durable-client (Not Available)
    Attempts to close the durable client, the client must be disconnected.
close durable-cq (Not Available)
    Closes the durable cq registered by the durable client and drains events held for the durable cq from the subscription queue.
compact disk-store (Not Available)
    Compact a disk store on all members with that disk store. This command uses the compaction threshold that each member has configured for its disk stores. The
    disk store must have "allow-force-compaction" set to true.
compact offline-disk-store (Available)
    Compact an offline disk store. If the disk store is large, additional memory may need to be allocated to the process using the --J=-Xmx??? parameter.
configure pdx (Not Available)
    Configures Geode's Portable Data eXchange for all the cache(s) in the cluster. This command would not take effect on the running members in the system.
     This command persists the pdx configuration in the locator with cluster configuration service. 
     This command should be issued before starting any data members.
connect (Available)
    Connect to a jmx-manager either directly or via a Locator. If connecting via a Locator, and a jmx-manager doesn't already exist, the Locator will start one.
create async-event-queue (Not Available)
    Create Async Event Queue.
create data-source (Not Available)
    (Experimental) Create a JDBC data source.
create defined indexes (Not Available)
    Creates all the defined indexes.
create disk-store (Not Available)
    Create a disk store.
create gateway-receiver (Not Available)
    Create the Gateway Receiver on a member or members.
create gateway-sender (Not Available)
    Create the Gateway Sender on a member or members.
create index (Not Available)
    Create an index that can be used when executing queries.
create jdbc-mapping (Available)
    (Experimental) Create a mapping for a region for use with a JDBC database connection.
create jndi-binding (Not Available)
    Create a jndi binding that holds the configuration for the XA datasource.
create lucene index (Not Available)
    Create a lucene index that can be used to execute queries.
create region (Not Available)
    Create a region with the given path and configuration. Specifying a --key-constraint and --value-constraint makes object type information available during
    querying and indexing.
debug (Available)
    Enable/Disable debugging output in GFSH.
define index (Not Available)
    Define an index that can be used when executing queries.
deploy (Not Available)
    Deploy JARs to a member or members.  Only one of either --jar or --dir may be specified.
describe client (Not Available)
    Display details of specified client
describe config (Not Available)
    Display configuration details of a member or members.
describe connection (Available)
    Display information about the current connection.
describe disk-store (Not Available)
    Display information about a member's disk store.
describe jdbc-mapping (Available)
    (Experimental) Describe the specified jdbc mapping
describe jndi-binding (Not Available)
    Describe the configuration of the given jndi binding.
describe lucene index (Not Available)
    Display the description of lucene indexes created for all members.
describe member (Not Available)
    Display information about a member, including name, id, groups, regions, etc.
describe offline-disk-store (Available)
    Display information about an offline disk store.
describe region (Not Available)
    Display the attributes and key information of a region.
destroy async-event-queue (Not Available)
    destroy an Async Event Queue
destroy disk-store (Not Available)
    Destroy a disk store, including deleting all files on disk used by the disk store. Data for closed regions previously using the disk store will be lost.
destroy function (Not Available)
    Destroy/Unregister a function. The default is for the function to be unregistered from all members.
destroy gateway-receiver (Not Available)
    Destroy the Gateway Receiver on a member or members.
destroy gateway-sender (Not Available)
    Destroy the Gateway Sender on a member or members.
destroy index (Not Available)
    Destroy/Remove the specified index.
destroy jdbc-mapping (Available)
    (Experimental) Destroy the specified mapping.
destroy jndi-binding (Not Available)
    Destroy a JNDI binding that holds the configuration for an XA datasource.
destroy lucene index (Not Available)
    Destroy the lucene index.
destroy region (Not Available)
    Destroy/Remove a region.
disconnect (Available)
    Close the current connection, if one is open.
echo (Available)
    Echo the given text which may include system and user variables.
execute function (Not Available)
    Execute the function with the specified ID. By default will execute on all members.
exit (Available)
    Exit GFSH and return control back to the calling process.
export cluster-configuration (Not Available)
    Exports the cluster configuration artifacts as a zip file.
export config (Not Available)
    Export configuration properties for a member or members.
export data (Not Available)
    Export user data from a region to a file.
export logs (Not Available)
    Export the log files for a member or members.
export offline-disk-store (Available)
    Export region data from an offline disk store into Geode snapshot files.
export stack-traces (Not Available)
    Export the stack trace for a member or members.
gc (Not Available)
    Force GC (Garbage Collection) on a member or members. The default is for garbage collection to occur on all caching members.
get (Not Available)
    Display an entry in a region. If using a region whose key and value classes have been set, then specifying --key-class and --value-class is unnecessary.
help (Available)
    Display syntax and usage information for all commands or list all available commands if <command> isn't specified.
hint (Available)
    Provide hints for a topic or list all available topics if "topic" isn't specified.
history (Available)
    Display or export previously executed GFSH commands.
import cluster-configuration (Not Available)
    Imports configuration into cluster configuration hosted at the locators
import data (Not Available)
    Import user data from a file to a region.
list async-event-queues (Not Available)
    Display the Async Event Queues for all members.
list clients (Not Available)
    Display list of connected clients
list deployed (Not Available)
    Display a list of JARs that were deployed to members using the "deploy" command.
list disk-stores (Not Available)
    Display disk stores for all members.
list durable-cqs (Not Available)
    List durable client cqs associated with the specified durable client id.
list functions (Not Available)
    Display a list of registered functions. The default is to display functions for all members.
list gateways (Not Available)
    Display the Gateway Senders and Receivers for a member or members.
list indexes (Not Available)
    Display the list of indexes created for all members.
list jdbc-mappings (Available)
    (Experimental) Display jdbc mappings for all members.
list jndi-binding (Not Available)
    List all jndi bindings, active and configured. An active binding is one that is bound to the server's jndi context (and also listed in the cluster config). A
    configured binding is one that is listed in the cluster config, but may not be active on the servers.
list lucene indexes (Not Available)
    Display the list of lucene indexes created for all members.
list members (Not Available)
    Display all or a subset of members.
list regions (Not Available)
    Display regions of a member or members.
load-balance gateway-sender (Not Available)
    Cause the Gateway Sender to close its current connections so that it reconnects to its remote receivers in a more balanced fashion.
locate entry (Not Available)
    Identifies the location, including host, member and region, of entries that have the specified key.
netstat (Not Available)
    Report network information and statistics via the "netstat" operating system command.
pause gateway-sender (Not Available)
    Pause the Gateway Sender on a member or members.
pdx rename (Available)
    Renames PDX types in an offline disk store. 
     Any pdx types that are renamed will be listed in the output. 
     If no renames are done or the disk-store is online then this command will fail.
put (Not Available)
    Add/Update an entry in a region. If using a region whose key and value classes have been set, then specifying --key-class and --value-class is unnecessary.
query (Not Available)
    Run the specified OQL query as a single quoted string and display the results in one or more pages. Limit will default to the value stored in the
    "APP_FETCH_SIZE" variable. Page size will default to the value stored in the "APP_COLLECTION_LIMIT" variable.
exit (Available)
    Exit GFSH and return control back to the calling process.
rebalance (Not Available)
    Rebalance partitioned regions. The default is for all partitioned regions to be rebalanced.
remove (Not Available)
    Remove an entry from a region. If using a region whose key class has been set, then specifying --key-class is unnecessary.
resume gateway-sender (Not Available)
    Resume the Gateway Sender on a member or members.
revoke missing-disk-store (Not Available)
    Instructs the member(s) of a distributed system to stop waiting for a disk store to be available. Only revoke a disk store if its files are lost as it will no
    longer be recoverable once revoking is initiated. Use the "show missing-disk-store" command to get descriptions of missing disk stores.
run (Available)
    Execute a set of GFSH commands. Commands that normally prompt for additional input will instead use default values.
search lucene (Not Available)
    Search lucene index
set variable (Available)
    Set GFSH variables that can be used by commands. For example: if variable "CACHE_SERVERS_GROUP" is set then to use it with "list members", use "list members
    --group=${CACHE_SERVERS_GROUP}". The "echo" command can be used to know the value of a variable.
sh (Available)
    Allows execution of operating system (OS) commands. Use '&' to return to gfsh prompt immediately. NOTE: Commands which pass output to another shell command are
    not currently supported.
show dead-locks (Not Available)
    Display any deadlocks in the Geode distributed system.
show log (Not Available)
    Display the log for a member.
show metrics (Not Available)
    Display or export metrics for the entire distributed system, a member or a region.
show missing-disk-stores (Not Available)
    Display a summary of the disk stores that are currently missing from a distributed system.
show subscription-queue-size (Not Available)
    Shows the number of events in the subscription queue.  If a cq name is provided, counts the number of events in the subscription queue for the specified cq.
shutdown (Not Available)
    Stop all members.
sleep (Available)
    Delay for a specified amount of time in seconds - floating point values are allowed.
start gateway-receiver (Not Available)
    Start the Gateway Receiver on a member or members.
start gateway-sender (Not Available)
    Start the Gateway Sender on a member or members.
start jconsole (Available)
    Start the JDK's JConsole tool in a separate process. JConsole will be launched, but connecting to Geode must be done manually.
start jvisualvm (Available)
    Start the JDK's Java VisualVM (jvisualvm) tool in a separate process. Java VisualVM will be launched, but connecting to Geode must be done manually.
start locator (Available)
    Start a Locator.
start pulse (Available)
    Open a new window in the default Web browser with the URL for the Pulse application.
start server (Available)
    Start a Geode Cache Server.
start vsd (Available)
    Start VSD in a separate process.
status cluster-config-service (Not Available)
    Displays the status of cluster configuration service on all the locators with enable-cluster-configuration set to true.
status gateway-receiver (Not Available)
    Display the status of a Gateway Receiver.
status gateway-sender (Not Available)
    Display the status of a Gateway Sender.
status locator (Available)
    Display the status of a Locator. Possible statuses are: started, online, offline or not responding.
status server (Available)
    Display the status of a Geode Cache Server.
stop gateway-receiver (Not Available)
    Stop the Gateway Receiver on a member or members.
stop gateway-sender (Not Available)
    Stop the Gateway Sender on a member or members.
stop locator (Available)
    Stop a Locator.
stop server (Available)
    Stop a Geode Cache Server.
undeploy (Not Available)
    Undeploy JARs from a member or members.
upgrade offline-disk-store (Available)
    Upgrade an offline disk store. If the disk store is large, additional memory may need to be allocated to the process using the --J=-Xmx??? parameter.
validate offline-disk-store (Available)
    Scan the contents of a disk store to verify that it has no errors.
version (Available)
    Display product version information.
```





### start locator

```ini

gfsh>help start locator
NAME
    start locator
IS AVAILABLE
    true
SYNOPSIS
    Start a Locator.
SYNTAX
    start locator [--name=value] [--bind-address=value] [--classpath=value] [--force(=value)?] [--group=value] [--hostname-for-clients=value]
    [--jmx-manager-hostname-for-clients=value] [--include-system-classpath(=value)?] [--locators=value] [--log-level=value] [--mcast-address=value]
    [--mcast-port=value] [--port=value] [--dir=value] [--properties-file=value] [--security-properties-file=value] [--initial-heap=value] [--max-heap=value]
    [--J=value(,value)*] [--connect(=value)?] [--enable-cluster-configuration(=value)?] [--load-cluster-configuration-from-dir=value] [--cluster-config-dir=value]
    [--http-service-port=value] [--http-service-bind-address=value] [--redirect-output(=value)?]
PARAMETERS
    name
        The member name to give this Locator in the Geode cluster.
        Required: false
    bind-address
        IP address on which the Locator will be bound.  By default, the Locator is bound to all local addresses.
        Required: false
    classpath
        Location of user application classes required by the Locator. The user classpath is prepended to the Locator's classpath.
        Required: false
    force
        Whether to allow the PID file from a previous Locator run to be overwritten.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    group
        Group(s) the Locator will be a part of.
        Synonyms: groups
        Required: false
    hostname-for-clients
        Hostname or IP address that will be sent to clients so they can connect to this Locator. The default is the bind-address of the Locator.
        Required: false
    jmx-manager-hostname-for-clients
        Hostname provided to clients by the locator for the location of a JMX Manager.
        Required: false
    include-system-classpath
        Includes the System CLASSPATH on the Locator's CLASSPATH. The System CLASSPATH is not included by default.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    locators
        Sets the list of Locators used by this Locator to join the appropriate Geode cluster.
        Required: false
    log-level
        Sets the level of output logged to the Locator log file.  Possible values for log-level include: ALL, TRACE, DEBUG, INFO, WARN, ERROR, FATAL, OFF.
        Required: false
    mcast-address
        The IP address or hostname used to bind the UPD socket for multi-cast networking so the Locator can communicate with other members in the Geode cluster
        using a common multicast address and port.  If mcast-port is zero, then mcast-address is ignored.
        Required: false
    mcast-port
        Sets the port used for multi-cast networking so the Locator can communicate with other members of the Geode cluster.  A zero value disables mcast.
        Required: false
    port
        Port the Locator will listen on.
        Required: false
    dir
        Directory in which the Locator will be started and ran. The default is ./<locator-member-name>
        Required: false
    properties-file
        The gemfire.properties file for configuring the Locator's distributed system. The file's path can be absolute or relative to the gfsh working directory
        (--dir=).
        Required: false
    security-properties-file
        The gfsecurity.properties file for configuring the Locator's security configuration in the distributed system. The file's path can be absolute or relative
        to gfsh directory (--dir=).
        Required: false
    initial-heap
        Initial size of the heap in the same format as the JVM -Xms parameter.
        Required: false
    max-heap
        Maximum size of the heap in the same format as the JVM -Xmx parameter.
        Required: false
    J
        Argument passed to the JVM on which the Locator will run. For example, --J=-Dfoo.bar=true will set the property "foo.bar" to "true".
        Required: false
    connect
        When connect is set to false or when locator is started with a security manager using --J=-Dgemfire.security-manager option, Gfsh does not automatically
        connect to the locator which is started using this command.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): true
    enable-cluster-configuration
        When enable-cluster-configuration is set to true, locator hosts and serves cluster configuration.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): true
    load-cluster-configuration-from-dir
        Deprecated: Since Geode 1.6, use import cluster-configuration command instead. When " load-cluster-configuration-from-dir " is set to true, the locator
        loads the cluster configuration from the "cluster_config" directory.
        Required: false
        Default (if the parameter is not specified): false
    cluster-config-dir
        Directory used by the cluster configuration service to store the cluster configuration on the filesystem
        Required: false
    http-service-port
        Port on which HTTP Service will listen on
        Required: false
    http-service-bind-address
        The IP address on which the HTTP Service will be bound.  By default, the Server is bound to all local addresses.
        Required: false
    redirect-output
        Causes the member to redirect standard out and standard error to its own log file
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
```



### start server

```ini
gfsh>help start server
NAME
    start server
IS AVAILABLE
    true
SYNOPSIS
    Start a Geode Cache Server.
SYNTAX
    start server [--name=value] [--assign-buckets(=value)?] [--bind-address=value] [--cache-xml-file=value] [--classpath=value] [--critical-heap-percentage=value]
    [--critical-off-heap-percentage=value] [--dir=value] [--disable-default-server(=value)?] [--disable-exit-when-out-of-memory(=value)?]
    [--enable-time-statistics(=value)?] [--eviction-heap-percentage=value] [--eviction-off-heap-percentage=value] [--force(=value)?] [--group=value]
    [--hostname-for-clients=value] [--jmx-manager-hostname-for-clients=value] [--include-system-classpath(=value)?] [--initial-heap=value] [--J=value(,value)*]
    [--locators=value] [--locator-wait-time=value] [--lock-memory(=value)?] [--log-level=value] [--max-connections=value] [--max-heap=value]
    [--max-message-count=value] [--max-threads=value] [--mcast-address=value] [--mcast-port=value] [--memcached-port=value] [--memcached-protocol=value]
    [--memcached-bind-address=value] [--redis-port=value] [--redis-bind-address=value] [--redis-password=value] [--message-time-to-live=value]
    [--off-heap-memory-size=value] [--properties-file=value] [--rebalance(=value)?] [--security-properties-file=value] [--server-bind-address=value]
    [--server-port=value] [--socket-buffer-size=value] [--spring-xml-location=value] [--statistic-archive-file=value] [--use-cluster-configuration(=value)?]
    [--start-rest-api(=value)?] [--http-service-port=value] [--http-service-bind-address=value] [--user=value] [--password=value] [--redirect-output(=value)?]
PARAMETERS
    name
        The member name to give this Cache Server in the Geode cluster.
        Required: false
    assign-buckets
        Whether to assign buckets to the partitioned regions of the cache on server start.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    bind-address
        The IP address on which the Server will be bound.  By default, the Server is bound to all local addresses.
        Required: false
    cache-xml-file
        Specifies the name of the cache XML file or resource to initialize the cache with when it is created. NOTE: If cluster configuration is enabled, then it
        will take precedence over this option
        Required: false
    classpath
        Location of user application classes required by the Server. The user classpath is prepended to the Server's classpath.
        Required: false
    critical-heap-percentage
        Set the percentage of heap at or above which the cache is considered in danger of becoming inoperable due to garbage collection pauses or out of memory
        exceptions
        Required: false
    critical-off-heap-percentage
        Set the percentage of off-heap memory at or above which the cache is considered in danger of becoming inoperable due to out of memory exceptions
        Required: false
    dir
        Directory in which the Cache Server will be started and ran. The default is ./<server-member-name>
        Required: false
    disable-default-server
        Whether the Cache Server will be started by default.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    disable-exit-when-out-of-memory
        Prevents the JVM from exiting when an OutOfMemoryError occurs.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    enable-time-statistics
        Causes additional time-based statistics to be gathered for Geode operations.
        Required: false
        Default (if the parameter is specified without value): true
    eviction-heap-percentage
        Set the percentage of heap at or above which the eviction should begin on Regions configured for HeapLRU eviction. Changing this value may cause eviction
        to begin immediately. Only one change to this attribute or critical heap percentage will be allowed at any given time and its effect will be fully realized
        before the next change is allowed. This feature requires additional VM flags to perform properly. 
        Required: false
    eviction-off-heap-percentage
        Set the percentage of off-heap memory at or above which the eviction should begin on Regions configured for off-heap and HeapLRU eviction. Changing this
        value may cause eviction to begin immediately. Only one change to this attribute or critical off-heap percentage will be allowed at any given time and its
        effect will be fully realized before the next change is allowed.
        Required: false
    force
        Whether to allow the PID file from a previous Cache Server run to be overwritten.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    group
        Group(s) the Cache Server will be a part of.
        Synonyms: groups
        Required: false
    hostname-for-clients
        Sets the ip address or host name that this cache server is to listen on for client connections.Setting a specific hostname-for-clients will cause server
        locators to use this value when telling clients how to connect to this cache server. This is useful in the case where the cache server may refer to itself
        with one hostname, but the clients need to use a different hostname to find the cache server.The value "" causes the bind-address to be given to clients.A
        null value will be treated the same as the default "".
        Required: false
    jmx-manager-hostname-for-clients
        Hostname provided to clients by the server for the location of a JMX Manager.
        Required: false
    include-system-classpath
        Includes the System CLASSPATH on the Server's CLASSPATH. The System CLASSPATH is not included by default.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    initial-heap
        Initial size of the heap in the same format as the JVM -Xms parameter.
        Required: false
    J
        Argument passed to the JVM on which the server will run. For example, --J=-Dfoo.bar=true will set the system property "foo.bar" to "true".
        Required: false
    locators
        Sets the list of Locators used by the Cache Server to join the appropriate Geode cluster.
        Required: false
    locator-wait-time
        Sets the number of seconds the server will wait for a locator to become available during startup before giving up.
        Required: false
    lock-memory
        Causes Geode to lock heap and off-heap memory pages into RAM. This prevents the operating system from swapping the pages out to disk, which can cause
        severe performance degradation. When you use this option, also configure the operating system limits for locked memory.
        Required: false
        Default (if the parameter is specified without value): true
    log-level
        Sets the level of output logged to the Cache Server log file.  Possible values for log-level include: ALL, TRACE, DEBUG, INFO, WARN, ERROR, FATAL, OFF.
        Required: false
    max-connections
        Sets the maximum number of client connections allowed. When the maximum is reached the cache server will stop accepting connections
        Required: false
    max-heap
        Maximum size of the heap in the same format as the JVM -Xmx parameter.
        Required: false
    max-message-count
        Sets maximum number of messages that can be enqueued in a client-queue.
        Required: false
    max-threads
        Sets the maximum number of threads allowed in this cache server to service client requests. The default of 0 causes the cache server to dedicate a thread
        for every client connection
        Required: false
    mcast-address
        The IP address or hostname used to bind the UPD socket for multi-cast networking so the Cache Server can communicate with other members in the Geode
        cluster.  If mcast-port is zero, then mcast-address is ignored.
        Required: false
    mcast-port
        Sets the port used for multi-cast networking so the Cache Server can communicate with other members of the Geode cluster.  A zero value disables mcast.
        Required: false
    memcached-port
        Sets the port that the Geode memcached service listens on for memcached clients.
        Required: false
    memcached-protocol
        Sets the protocol that the Geode memcached service uses (ASCII or BINARY).
        Required: false
    memcached-bind-address
        Sets the IP address the Geode memcached service listens on for memcached clients. The default is to bind to the first non-loopback address for this
        machine.
        Required: false
    redis-port
        Sets the port that the Geode Redis service listens on for Redis clients.
        Required: false
    redis-bind-address
        Sets the IP address the Geode Redis service listens on for Redis clients. The default is to bind to the first non-loopback address for this machine.
        Required: false
    redis-password
        Sets the authentication password for GeodeRedisServer
        Required: false
    message-time-to-live
        Sets the time (in seconds ) after which a message in the client queue will expire
        Required: false
    off-heap-memory-size
        The total size of off-heap memory specified as off-heap-memory-size=<n>[g|m]. <n> is the size. [g|m] indicates whether the size should be interpreted as
        gigabytes or megabytes. A non-zero size causes that much memory to be allocated from the operating system and reserved for off-heap use.
        Required: false
    properties-file
        The gemfire.properties file for configuring the Cache Server's distributed system. The file's path can be absolute or relative to the gfsh working
        directory.
        Required: false
    rebalance
        Whether to initiate rebalancing across the Geode cluster.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    security-properties-file
        The gfsecurity.properties file for configuring the Server's security configuration in the distributed system. The file's path can be absolute or relative
        to gfsh directory.
        Required: false
    server-bind-address
        The IP address that this distributed system's server sockets in a client-server topology will be bound. If set to an empty string then all of the local
        machine's addresses will be listened on.
        Required: false
    server-port
        The port that the distributed system's server sockets in a client-server topology will listen on.  The default server-port is 40404.
        Required: false
        Default (if the parameter is not specified): 40404
    socket-buffer-size
        Sets the buffer size in bytes of the socket connection for this CacheServer. The default is 32768 bytes.
        Required: false
    spring-xml-location
        Specifies the location of a Spring XML configuration file(s) for bootstrapping and configuring a Geode Server.
        Required: false
    statistic-archive-file
        The file that statistic samples are written to.  An empty string (default) disables statistic archival.
        Required: false
    use-cluster-configuration
        When set to true, the server requests the configuration from locator's cluster configuration service.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): true
    start-rest-api
        When set to true, will start the REST API service.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
    http-service-port
        Port on which HTTP Service will listen on
        Required: false
    http-service-bind-address
        The IP address on which the HTTP Service will be bound.  By default, the Server is bound to all local addresses.
        Required: false
    user
        User name to securely connect to the cluster. If the --password parameter is not specified then it will be prompted for.
        Required: false
    password
        Password to securely connect to the cluster.
        Required: false
    redirect-output
        Causes the member to redirect standard out and standard error to its own log file.
        Required: false
        Default (if the parameter is specified without value): true
        Default (if the parameter is not specified): false
```

