
export HADOOP_YARN_HOME=/home/admin/cloud/hadoop-3.2.1
export HADOOP_LOG_DIR=/export/var/log/hadoop-yarn/yarn
export HADOOP_SECURE_LOG_DIR=/export/var/log/hadoop-yarn/yarn
export HADOOP_PID_DIR=/var/run/hadoop-yarn/yarn
export HADOOP_SECURE_PID_DIR=/var/run/hadoop-yarn/yarn
export HADOOP_LIBEXEC_DIR=${HADOOP_YARN_HOME}/libexec
export JAVA_HOME=/home/admin/cloud/jdk1.8.0_251

# We need to add the EWMA and RFA appender for the yarn daemons only;
# however, HADOOP_ROOT_LOGGER is shared by the yarn client and the
# daemons. This is restrict the EWMA appender to daemons only.
export HADOOP_LOGLEVEL=${HADOOP_LOGLEVEL:-INFO}
export HADOOP_ROOT_LOGGER=${HADOOP_ROOT_LOGGER:-INFO,console}
export HADOOP_DAEMON_ROOT_LOGGER=${HADOOP_DAEMON_ROOT_LOGGER:-${HADOOP_LOGLEVEL},EWMA,RFA}

# User for YARN daemons
export HADOOP_YARN_USER=${HADOOP_YARN_USER:-yarn}

# some Java parameters
# export JAVA_HOME=/home/y/libexec/jdk1.6.0/
if [ "$JAVA_HOME" != "" ]; then
#echo "run java in $JAVA_HOME"
JAVA_HOME=$JAVA_HOME
fi

if [ "$JAVA_HOME" = "" ]; then
echo "Error: JAVA_HOME is not set."
exit 1
fi

JAVA=$JAVA_HOME/bin/java
JAVA_HEAP_MAX=-Xmx1000m

# For setting YARN specific HEAP sizes please use this
# Parameter and set appropriately
YARN_HEAPSIZE=1024

# check envvars which might override default args
if [ "$YARN_HEAPSIZE" != "" ]; then
JAVA_HEAP_MAX="-Xmx""$YARN_HEAPSIZE""m"
fi

# Resource Manager specific parameters

# Specify the max Heapsize for the ResourceManager using a numerical value
# in the scale of MB. For example, to specify an jvm option of -Xmx1000m, set
# the value to 1000.
# This value will be overridden by an Xmx setting specified in either HADOOP_OPTS
# and/or YARN_RESOURCEMANAGER_OPTS.
# If not specified, the default value will be picked from either YARN_HEAPMAX
# or JAVA_HEAP_MAX with YARN_HEAPMAX as the preferred option of the two.
export YARN_RESOURCEMANAGER_HEAPSIZE=1024

# Specify the JVM options to be used when starting the ResourceManager.
# These options will be appended to the options specified as HADOOP_OPTS
# and therefore may override any similar flags set in HADOOP_OPTS


# Node Manager specific parameters

# Specify the max Heapsize for the NodeManager using a numerical value
# in the scale of MB. For example, to specify an jvm option of -Xmx1000m, set
# the value to 1000.
# This value will be overridden by an Xmx setting specified in either HADOOP_OPTS
# and/or YARN_NODEMANAGER_OPTS.
# If not specified, the default value will be picked from either YARN_HEAPMAX
# or JAVA_HEAP_MAX with YARN_HEAPMAX as the preferred option of the two.
export YARN_NODEMANAGER_HEAPSIZE=1024

# Specify the max Heapsize for the timeline server using a numerical value
# in the scale of MB. For example, to specify an jvm option of -Xmx1000m, set
# the value to 1024.
# This value will be overridden by an Xmx setting specified in either HADOOP_OPTS
# and/or YARN_TIMELINESERVER_OPTS.
# If not specified, the default value will be picked from either YARN_HEAPMAX
# or JAVA_HEAP_MAX with YARN_HEAPMAX as the preferred option of the two.
export YARN_TIMELINESERVER_HEAPSIZE=8072


# Specify the JVM options to be used when starting the NodeManager.
# These options will be appended to the options specified as HADOOP_OPTS
# and therefore may override any similar flags set in HADOOP_OPTS


# so that filenames w/ spaces are handled correctly in loops below
IFS=


# default log directory and file
if [ "$HADOOP_LOG_DIR" = "" ]; then
HADOOP_LOG_DIR="$HADOOP_YARN_HOME/logs"
fi
if [ "$HADOOP_LOGFILE" = "" ]; then
HADOOP_LOGFILE='yarn.log'
fi

# default policy file for service-level authorization
if [ "$YARN_POLICYFILE" = "" ]; then
YARN_POLICYFILE="hadoop-policy.xml"
fi

# restore ordinary behaviour
unset IFS

# YARN now uses specific subcommand options of the pattern (command)_(subcommand)_OPTS for every
# component. Because of this, HADDOP_OPTS is now used as a simple way to specify common properties
# between all YARN components.
HADOOP_OPTS="$HADOOP_OPTS -Dyarn.id.str=$YARN_IDENT_STRING"
HADOOP_OPTS="$HADOOP_OPTS -Dyarn.policy.file=$YARN_POLICYFILE"


export YARN_NODEMANAGER_OPTS="$YARN_NODEMANAGER_OPTS -Dnm.audit.logger=INFO,NMAUDIT"
export YARN_RESOURCEMANAGER_OPTS="$YARN_RESOURCEMANAGER_OPTS -Dyarn.server.resourcemanager.appsummary.logger=INFO,RMSUMMARY -Drm.audit.logger=INFO,RMAUDIT"


# If the DNS server is configured to use the standard privileged port 53,
# the environment variables YARN_REGISTRYDNS_SECURE_USER and
# YARN_REGISTRYDNS_SECURE_EXTRA_OPTS must be set.
export YARN_REGISTRYDNS_SECURE_USER=yarn
export YARN_REGISTRYDNS_SECURE_EXTRA_OPTS="-jvm server"
