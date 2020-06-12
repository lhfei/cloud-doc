
# Set Slider-specific environment variables here.

# The only required environment variable is JAVA_HOME.  All others are
# optional.  When running a distributed configuration it is best to
# set JAVA_HOME in this file, so that it is correctly defined on
# remote nodes.

# The java implementation to use.  Required.
export JAVA_HOME=/export/cloud/jdk1.8.0_151
# The hadoop conf directory.  Optional as slider-client.xml can be edited to add properties.
export HADOOP_CONF_DIR=/usr/hdp/current/hadoop-client/conf