
# export JAVA_HOME=/home/y/libexec/jdk1.6.0/

export HADOOP_JOB_HISTORYSERVER_HEAPSIZE=900

export HADOOP_MAPRED_ROOT_LOGGER=INFO,RFA


export HADOOP_JOB_HISTORYSERVER_OPTS="-Djava.security.auth.login.config=/usr/hdp/current/hadoop-client/conf/mapred_jaas.conf  -Djavax.security.auth.useSubjectCredsOnly=false"

#export HADOOP_MAPRED_LOG_DIR="" # Where log files are stored.  $HADOOP_MAPRED_HOME/logs by default.
#export HADOOP_JHS_LOGGER=INFO,RFA # Hadoop JobSummary logger.
#export HADOOP_MAPRED_PID_DIR= # The pid files are stored. /tmp by default.
#export HADOOP_MAPRED_IDENT_STRING= #A string representing this instance of hadoop. $USER by default
#export HADOOP_MAPRED_NICENESS= #The scheduling priority for daemons. Defaults to 0.
export HADOOP_OPTS="-Dhdp.version=$HDP_VERSION $HADOOP_OPTS"
export HADOOP_OPTS="-Djava.io.tmpdir=/var/lib/ambari-server/data/tmp/hadoop_java_io_tmpdir $HADOOP_OPTS"
export JAVA_LIBRARY_PATH="${JAVA_LIBRARY_PATH}:/var/lib/ambari-server/data/tmp/hadoop_java_io_tmpdir"