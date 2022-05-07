#!/usr/bin/env bash
#
# Copy this file as pio-env.sh and edit it for your site's configuration.
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# PredictionIO Main Configuration
#
# This section controls core behavior of PredictionIO. It is very likely that
# you need to change these to fit your site.

# SPARK_HOME: Apache Spark is a hard dependency and must be configured.
# SPARK_HOME=$PIO_HOME/vendors/spark-2.0.2-bin-hadoop2.7
#SPARK_HOME=$PIO_HOME/vendors/spark-2.1.1-bin-hadoop2.6
SPARK_HOME=${SPARK_HOME:-/usr/local/cloud/spark-2.1.1-bin-hadoop2.7}

POSTGRES_JDBC_DRIVER=$PIO_HOME/lib/postgresql-42.0.0.jar
MYSQL_JDBC_DRIVER=$PIO_HOME/lib/mysql-connector-java-5.1.41.jar

# ES_CONF_DIR: You must configure this if you have advanced configuration for
#              your Elasticsearch setup.
# ES_CONF_DIR=/opt/elasticsearch

# HADOOP_CONF_DIR: You must configure this if you intend to run PredictionIO
#                  with Hadoop 2.
# HADOOP_CONF_DIR=/opt/hadoop

# HBASE_CONF_DIR: You must configure this if you intend to run PredictionIO
#                 with HBase on a remote cluster.
# HBASE_CONF_DIR=$PIO_HOME/vendors/hbase-1.0.0/conf
HBASE_CONF_DIR=${HBASE_HOME}/conf

# Filesystem paths where PredictionIO uses as block storage.
PIO_FS_BASEDIR=$HOME/.pio_store
PIO_FS_ENGINESDIR=$PIO_FS_BASEDIR/engines
PIO_FS_TMPDIR=$PIO_FS_BASEDIR/tmp

# PredictionIO Storage Configuration
#
# This section controls programs that make use of PredictionIO's built-in
# storage facilities. Default values are shown below.
#
# For more information on storage configuration please refer to
# http://predictionio.incubator.apache.org/system/anotherdatastore/

# Storage Repositories

# Default is to use PostgreSQL
PIO_STORAGE_REPOSITORIES_METADATA_NAME=pio_meta
#PIO_STORAGE_REPOSITORIES_METADATA_SOURCE=PGSQL
PIO_STORAGE_REPOSITORIES_METADATA_SOURCE=MYSQL

PIO_STORAGE_REPOSITORIES_EVENTDATA_NAME=pio_event
#PIO_STORAGE_REPOSITORIES_EVENTDATA_SOURCE=PGSQL
PIO_STORAGE_REPOSITORIES_EVENTDATA_SOURCE=MYSQL

PIO_STORAGE_REPOSITORIES_MODELDATA_NAME=pio_model
#PIO_STORAGE_REPOSITORIES_MODELDATA_SOURCE=PGSQL
PIO_STORAGE_REPOSITORIES_MODELDATA_SOURCE=MYSQL

# Storage Data Sources

# PostgreSQL Default Settings
# Please change "pio" to your database name in PIO_STORAGE_SOURCES_PGSQL_URL
# Please change PIO_STORAGE_SOURCES_PGSQL_USERNAME and
# PIO_STORAGE_SOURCES_PGSQL_PASSWORD accordingly
#PIO_STORAGE_SOURCES_PGSQL_TYPE=jdbc
#PIO_STORAGE_SOURCES_PGSQL_URL=jdbc:postgresql://localhost/pio
#PIO_STORAGE_SOURCES_PGSQL_USERNAME=pio
#PIO_STORAGE_SOURCES_PGSQL_PASSWORD=pio

# MySQL Example
# PIO_STORAGE_SOURCES_MYSQL_TYPE=jdbc
# PIO_STORAGE_SOURCES_MYSQL_URL=jdbc:mysql://localhost/pio
# PIO_STORAGE_SOURCES_MYSQL_USERNAME=pio
# PIO_STORAGE_SOURCES_MYSQL_PASSWORD=pio
PIO_STORAGE_SOURCES_MYSQL_TYPE=jdbc
PIO_STORAGE_SOURCES_MYSQL_URL=jdbc:mysql://master1.cloud.cn/pio
PIO_STORAGE_SOURCES_MYSQL_USERNAME=root
PIO_STORAGE_SOURCES_MYSQL_PASSWORD=Lhfei@01

# Elasticsearch Example
# PIO_STORAGE_SOURCES_ELASTICSEARCH_TYPE=elasticsearch
# PIO_STORAGE_SOURCES_ELASTICSEARCH_HOSTS=localhost
# PIO_STORAGE_SOURCES_ELASTICSEARCH_PORTS=9200
# PIO_STORAGE_SOURCES_ELASTICSEARCH_SCHEMES=http
# PIO_STORAGE_SOURCES_ELASTICSEARCH_HOME=$PIO_HOME/vendors/elasticsearch-5.5.2
# Optional basic HTTP auth
# PIO_STORAGE_SOURCES_ELASTICSEARCH_USERNAME=my-name
# PIO_STORAGE_SOURCES_ELASTICSEARCH_PASSWORD=my-secret
# Elasticsearch 1.x Example
# PIO_STORAGE_SOURCES_ELASTICSEARCH_TYPE=elasticsearch
# PIO_STORAGE_SOURCES_ELASTICSEARCH_CLUSTERNAME=<elasticsearch_cluster_name>
# PIO_STORAGE_SOURCES_ELASTICSEARCH_HOSTS=localhost
# PIO_STORAGE_SOURCES_ELASTICSEARCH_PORTS=9300
# PIO_STORAGE_SOURCES_ELASTICSEARCH_HOME=$PIO_HOME/vendors/elasticsearch-1.7.6

# Local File System Example
# PIO_STORAGE_SOURCES_LOCALFS_TYPE=localfs
# PIO_STORAGE_SOURCES_LOCALFS_PATH=$PIO_FS_BASEDIR/models

# HBase Example
# PIO_STORAGE_SOURCES_HBASE_TYPE=hbase
# PIO_STORAGE_SOURCES_HBASE_HOME=$PIO_HOME/vendors/hbase-1.0.0
PIO_STORAGE_SOURCES_HBASE_HOME=${HBASE_HOME:-/usr/local/cloud/hbase-1.2.6}

# AWS S3 Example
# PIO_STORAGE_SOURCES_S3_TYPE=s3
# PIO_STORAGE_SOURCES_S3_BUCKET_NAME=pio_bucket
# PIO_STORAGE_SOURCES_S3_BASE_PATH=pio_model
