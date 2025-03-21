#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BIN_DIR=`dirname $0`
BIN_DIR=`cd "$BIN_DIR"; pwd`
DOLPHINSCHEDULER_HOME=$BIN_DIR/..

set -a
source "${DOLPHINSCHEDULER_HOME}/conf/env/dolphinscheduler_env.sh"
source "${DOLPHINSCHEDULER_HOME}/conf/config/install_config.conf"
set +a

export JAVA_HOME=$JAVA_HOME

export DATABASE_TYPE=${DATABASE_TYPE:-"mysql"}
export SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE:-"default"}
export SPRING_PROFILES_ACTIVE="${SPRING_PROFILES_ACTIVE},${DATABASE_TYPE}"

export DOLPHINSCHEDULER_CONF_DIR=$DOLPHINSCHEDULER_HOME/conf
export DOLPHINSCHEDULER_LIB_JARS=$DOLPHINSCHEDULER_HOME/lib/*
export DOLPHINSCHEDULER_SQL_DIR=$DOLPHINSCHEDULER_HOME/sql

export DOLPHINSCHEDULER_OPTS="-server -Xms64m -Xmx64m -Xss512k -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:LargePageSizeInBytes=64m -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70"
export STOP_TIMEOUT=5

CLASS=org.apache.dolphinscheduler.dao.upgrade.shell.CreateDolphinScheduler

exec_command="$DOLPHINSCHEDULER_OPTS -classpath $DOLPHINSCHEDULER_SQL_DIR:$DOLPHINSCHEDULER_CONF_DIR:$DOLPHINSCHEDULER_LIB_JARS $CLASS"

cd $DOLPHINSCHEDULER_HOME
$JAVA_HOME/bin/java $exec_command
