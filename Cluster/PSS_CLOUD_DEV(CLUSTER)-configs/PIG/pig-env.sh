
JAVA_HOME=/export/cloud/jdk1.8.0_151
HADOOP_HOME=${HADOOP_HOME:-/usr/hdp/current/hadoop-client}

if [ -d "/usr/lib/tez" ]; then
  PIG_OPTS="$PIG_OPTS -Dmapreduce.framework.name=yarn"
fi