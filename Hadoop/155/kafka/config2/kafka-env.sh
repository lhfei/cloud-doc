
#!/bin/bash

# Set KAFKA specific environment variables here.

# The java implementation to use.
export JAVA_HOME=/export/cloud/jdk1.8.0_351
export PATH=$PATH:$JAVA_HOME/bin
export PID_DIR=/export/var/run/kafka
export LOG_DIR=/export/var/log/kafka

export KAFKA_KERBEROS_PARAMS=

# Add kafka sink to classpath and related depenencies
if [ -e "/usr/lib/ambari-metrics-kafka-sink/ambari-metrics-kafka-sink.jar" ]; then
  export CLASSPATH=$CLASSPATH:/usr/lib/ambari-metrics-kafka-sink/ambari-metrics-kafka-sink.jar
  export CLASSPATH=$CLASSPATH:/usr/lib/ambari-metrics-kafka-sink/lib/*
fi

      export CLASSPATH=$CLASSPATH:/usr/hdp/current/kafka-broker/config
