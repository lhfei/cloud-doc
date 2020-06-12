
# Set environment variables here.

# The java implementation to use. Java 1.6 required.
export JAVA_HOME=/home/admin/cloud/jdk1.8.0_251

# HBase Configuration directory
export HBASE_CONF_DIR=${HBASE_CONF_DIR:-/home/admin/cloud/hbase-2.2.4/conf}

# Extra Java CLASSPATH elements. Optional.
export HBASE_CLASSPATH=${HBASE_CLASSPATH}:/home/admin/cloud/hbase-2.2.4/lib*


# The maximum amount of heap to use, in MB. Default is 1000.
# export HBASE_HEAPSIZE=1000

# Extra Java runtime options.
# Below are what we set by default. May only work with SUN JVM.
# For more on why as well as other possible settings,
# see http://wiki.apache.org/hadoop/PerformanceTuning
export SERVER_GC_OPTS="-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/export/var/log/hbase/gc.log-`date +'%Y%m%d%H%M'`"
# Uncomment below to enable java garbage collection logging.
# export HBASE_OPTS="$HBASE_OPTS -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:$HBASE_HOME/logs/gc-hbase.log"

# Uncomment and adjust to enable JMX exporting
# See jmxremote.password and jmxremote.access in $JRE_HOME/lib/management to configure remote password access.
# More details at: http://java.sun.com/javase/6/docs/technotes/guides/management/agent.html
#
# export HBASE_JMX_BASE="-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
# If you want to configure BucketCache, specify '-XX: MaxDirectMemorySize=' with proper direct memory size
# export HBASE_THRIFT_OPTS="$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10103"
# export HBASE_ZOOKEEPER_OPTS="$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10104"

# File naming hosts on which HRegionServers will run. $HBASE_HOME/conf/regionservers by default.
export HBASE_REGIONSERVERS=${HBASE_CONF_DIR}/regionservers

# Extra ssh options. Empty by default.
# export HBASE_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HBASE_CONF_DIR"

# Where log files are stored. $HBASE_HOME/logs by default.
export HBASE_LOG_DIR=/export/var/log/hbase

# A string representing this instance of hbase. $USER by default.
# export HBASE_IDENT_STRING=$USER

# The scheduling priority for daemon processes. See 'man nice'.
# export HBASE_NICENESS=10

# The directory where pid files are stored. /tmp by default.
export HBASE_PID_DIR=/var/run/hbase

# Seconds to sleep between slave commands. Unset by default. This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HBASE_SLAVE_SLEEP=0.1

# Tell HBase whether it should manage it's own instance of Zookeeper or not.
export HBASE_MANAGES_ZK=false

export HBASE_OPTS="$HBASE_OPTS -XX:+UseConcMarkSweepGC -XX:ErrorFile=/export/var/log/hbase/hs_err_pid%p.log -Djava.security.auth.login.config=${HBASE_CONF_DIR}/hbase_client_jaas.conf -Djava.io.tmpdir=/tmp"
export HBASE_MASTER_OPTS="$HBASE_MASTER_OPTS -Xmx1024m -Djava.security.auth.login.config=${HBASE_CONF_DIR}/hbase_master_jaas.conf -Djavax.security.auth.useSubjectCredsOnly=false $JDK_DEPENDED_OPTS"
export HBASE_REGIONSERVER_OPTS="$HBASE_REGIONSERVER_OPTS -Xmn4096m -XX:CMSInitiatingOccupancyFraction=50 -XX:+UseCMSInitiatingOccupancyOnly -Xms20480m -Xmx20480m -Djava.security.auth.login.config=${HBASE_CONF_DIR}/hbase_regionserver_jaas.conf -Djavax.security.auth.useSubjectCredsOnly=false $JDK_DEPENDED_OPTS"
export PHOENIX_QUERYSERVER_OPTS="$PHOENIX_QUERYSERVER_OPTS -Djava.security.auth.login.config=${HBASE_CONF_DIR}/hbase_queryserver_jaas.conf"


# HBase off-heap MaxDirectMemorySize
export HBASE_REGIONSERVER_OPTS="$HBASE_REGIONSERVER_OPTS  -XX:MaxDirectMemorySize=4096m "
export HBASE_MASTER_OPTS="$HBASE_MASTER_OPTS  -XX:MaxDirectMemorySize=4096m "