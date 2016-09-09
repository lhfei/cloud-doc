# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

# The default umask is now handled by pam_umask.
# See pam_umask(8) and /etc/login.defs.

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

#####################################################
#
#####################################################

umask 0022

JAVA_HOME=/usr/local/cloud/java/jdk1.8.0_92
JRE_HOME=$JAVA_HOME/jre

SCALA_HOME=/usr/local/cloud/scala-2.11.8
#SCALA_HOME=/usr/local/cloud/scala-2.10.6
#######################
# HDP Suites
######################
HDP_ROOT=/usr/hdp/2.4.0.0-169

HADOOP_HOME=/usr/local/cloud/hadoop-2.7.2
HADOOP_conF_DIR=$HADOOP_HOME/etc/hadoop
#SPARK_HOME=/usr/local/cloud/spark-1.6.2
#SPARK_HOME=/usr/local/cloud/spark-2.0.0-bin-hadoop2.7
SPARK_HOME=/home/lhfei/app_workspaces/spark
HIVE_HOME=/usr/local/cloud/apache-hive-2.1.0-bin
HBASE_HOME=$HDP_ROOT/hbase
ZOOKEEPER_HOME=/usr/local/cloud/zookeeper-3.4.8
SQOOP_HOME=$HDP_ROOT/sqoop
STORM_HOME=$HDP_ROOT/storm
KAFKA_HOME=$HDP_ROOT/kafka
OOZIE_HOME=$HDP_ROOT/oozie
FLUME_HOME=$HDP_ROOT/flume

CASSANDRA_HOME=/usr/local/cloud/nosql/apache-cassandra-3.7

HDP_SUITES_HOME=$HADOOP_HOME/bin:$SPARK_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$ZOOKEEPER_HOME/bin:$SQOOP_HOME/bin:$STORM_HOME/bin:$KAFKA_HOME/bin:$OOZIE_HOME/bin:$FLUME_HOME/bin:$CASSANDRA_HOME/bin:$HADOOP_CONF_DIR

#### HDP_SUITES_HOME End ####


# Builts Home 
MAVEN_HOME=/usr/local/cloud/apache-maven-3.3.9 
ANT_HOME="/usr/local/cloud/ant" 
GRADLE_HOME=/usr/local/cloud/gradle-2.11
SBT_HOME=/usr/local/cloud/sbt-0.13.11
ZINC_HOME=/usr/local/cloud/zinc-0.3.11
LIVY_HOME=/usr/local/cloud/livy-server-0.2.0

BUILTS_HOME=$MAVEN_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin:$SBT_HOME/bin:$ZINC_HOME/bin:$LIVY_HOME/bin

#### BUILTS_HOME END ####

NUTCH_HOME=/usr/local/cloud/nutch/apache-nutch-1.11
SOLR_HOME=/usr/local/cloud/solr-6.0.0/
#ZEPPELIN_HOME=/usr/local/cloud/zeppelin-0.5.6-incubating
#ZEPPELIN_HOME=/home/lhfei/app_workspaces/zeppelin
ZEPPELIN_HOME=/home/lhfei/app_workspaces/zeppelin-spark2

PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$HDP_SUITES_HOME:$BUILTS_HOME:$NUTCH_HOME/bin:$SCALA_HOME/bin:$SOLR_HOME/bin:$ZEPPELIN_HOME/bin


export MAVEN_HOME
export ANT_HOME
export GRADLE_HOME
export SBT_HOME
export SCALA_HOME
export ZINC_HOME

export JAVA_HOME
export JRE_HOME

export HADOOP_HOME
export SPARK_HOME
export HIVE_HOME
export HBASE_HOME
export ZOOKEEPER_HOME
export SQOOP_HOME
export STORM_HOME
export KAFKA_HOME
export OOZIE_HOME
export FLUME_HOME
export HADOOP_CONF_DIR

export NUTCH_HOME
export SOLR_HOME
export ZEPPELIN_HOME

export LIVY_HOME

export PATH
