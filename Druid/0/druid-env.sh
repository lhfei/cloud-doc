
      #!/bin/bash

      # Set DRUID specific environment variables here.

      # The java implementation to use.
      export JAVA_HOME=/export/cloud/jdk1.8.0_191
      export PATH=$JAVA_HOME/bin:$PATH
      export DRUID_PID_DIR=/var/run/druid
      export DRUID_LOG_DIR=/export/var/log/druid
      export DRUID_CONF_DIR=/usr/hdp/current/druid-overlord/conf
      export DRUID_LIB_DIR=/usr/hdp/current/druid-overlord/lib
      export HADOOP_CONF_DIR=/usr/hdp/3.1.0.0-78/hadoop/conf