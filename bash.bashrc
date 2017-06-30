# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#####################################################
#
#####################################################

umask 0022

JAVA_HOME=/usr/local/cloud/java/jdk1.8.0_131
JRE_HOME=$JAVA_HOME/jre

IDEA_JDK=$JAVA_HOME

SCALA_HOME=/usr/local/cloud/scala-2.11.8

GOROOT=/usr/local/cloud/go
#SCALA_HOME=/usr/local/cloud/scala-2.10.6
#######################
# HDP Suites
######################
HDP_ROOT=/usr/local/cloud

HADOOP_HOME=$HDP_ROOT/hadoop-2.7.3
HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#SPARK_HOME=/usr/local/cloud/spark-1.6.2
#SPARK_HOME=/usr/local/cloud/spark-2.0.1-bin-hadoop2.7
SPARK_HOME=/usr/local/cloud/spark-2.1.0-bin-hadoop2.7
#SPARK_HOME=/home/lhfei/app_workspaces/spark
#SPARK_HOME=/usr/local/cloud/spark-2.0.2-bin-hadoop2.7
HIVE_HOME=$HDP_ROOT/apache-hive-2.1.1-bin
HBASE_HOME=$HDP_ROOT/hbase-1.2.5
ZOOKEEPER_HOME=$HDP_ROOT/zookeeper-3.4.10
SQOOP_HOME=$HDP_ROOT/sqoop
STORM_HOME=$HDP_ROOT/storm
KAFKA_HOME=$HDP_ROOT/kafka_2.11-0.10.1.1
OOZIE_HOME=$HDP_ROOT/oozie-4.3.0
FLUME_HOME=$HDP_ROOT/flume
PIG_HOME=$HDP_ROOT/pig-0.16.0

CASSANDRA_HOME=/usr/local/cloud/nosql/apache-cassandra-3.7

#KYLIN_HOME=$HDP_ROOT/apache-kylin-1.6.0-hbase1.x-bin
KYLIN_HOME=/home/lhfei/app_workspaces/kylin/kylin

HDP_SUITES_HOME=$HADOOP_HOME/bin:$SPARK_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$ZOOKEEPER_HOME/bin:$SQOOP_HOME/bin:$STORM_HOME/bin:$KAFKA_HOME/bin:$OOZIE_HOME/bin:$FLUME_HOME/bin:$CASSANDRA_HOME/bin:$HADOOP_CONF_DIR:$KYLIN_HOME/bin:$PIG_HOME/bin

#### HDP_SUITES_HOME End ####

# Builts Home 
MAVEN_HOME=/usr/local/cloud/apache-maven-3.5.0
ANT_HOME="/usr/local/cloud/ant"
GRADLE_HOME=/usr/local/cloud/gradle-3.5
SBT_HOME=/usr/local/cloud/sbt-0.13.11
ZINC_HOME=/usr/local/cloud/zinc-0.3.11
LIVY_HOME=/usr/local/cloud/livy-server-0.2.0
THRIFT_HOME=/usr/local/cloud/thrift

ACTIVE_HOME=/usr/local/cloud/apache-activemq-5.14.1
REDIS_HOME=/usr/local/cloud/redis-3.2.5

DUBBO_HOME=/home/lhfei/app_workspaces/dubbo

BUILTS_HOME=$MAVEN_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin:$SBT_HOME/bin:$ZINC_HOME/bin:$LIVY_HOME/bin:$REDIS_HOME/bin

#### BUILTS_HOME END ####

NUTCH_HOME=/usr/local/cloud/nutch/apache-nutch-1.11
SOLR_HOME=/usr/local/cloud/solr-6.0.0/
#ZEPPELIN_HOME=/usr/local/cloud/zeppelin-0.5.6-incubating
#ZEPPELIN_HOME=/usr/local/cloud/zeppelin-0.6.1
#ZEPPELIN_HOME=/home/lhfei/app_workspaces/zeppelin/zeppelin-dev
ZEPPELIN_HOME=/home/lhfei/app_workspaces/zeppelin/zeppelin
#SERVICEMIX_HOME=/usr/local/cloud/apache-servicemix-6.1.2
SERVICEMIX_HOME=/usr/local/cloud/apache-servicemix-7.0.0.M2
#KARAF_HOME=/usr/local/cloud/apache-karaf-4.0.7
FLINK_HOME=/usr/local/cloud/flink-1.2.1

H2O_HOME=/usr/local/cloud/h2o-3.10.4.8

#### THIRD ENV END ####
THIRD_ENV=$THIRD_ENV:$NUTCH_HOME/bin:$SOLR_HOME/bin:$SERVICEMIX_HOME/bin:$KARAF_HOME/bin:$H2O_HOME:$FLINK_HOME/bin

#### Zeppelin Develop Model ####
HOSTNAME=$(hostname)
ZEPPELIN_NAME="Zeppelin"
ZEPPELIN_LOGFILE="${ZEPPELIN_LOG_DIR}/zeppelin-${ZEPPELIN_IDENT_STRING}-${HOSTNAME}.log"
ZEPPELIN_OUTFILE="${ZEPPELIN_LOG_DIR}/zeppelin-${ZEPPELIN_IDENT_STRING}-${HOSTNAME}.out"
ZEPPELIN_PID="${ZEPPELIN_PID_DIR}/zeppelin-${ZEPPELIN_IDENT_STRING}-${HOSTNAME}.pid"
ZEPPELIN_MAIN=org.apache.zeppelin.server.ZeppelinServer
JAVA_OPTS+=" -Dzeppelin.log.file=${ZEPPELIN_LOGFILE}"
#### Zeppelin Develop Model end ####

PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$HDP_SUITES_HOME:$BUILTS_HOME:$THIRD_ENV:$SOLR_HOME/bin:$ZEPPELIN_HOME/bin:$THIRD_ENV:$SCALA_HOME/bin:$GOROOT/bin:


export MAVEN_HOME
export ANT_HOME
export GRADLE_HOME
export SBT_HOME
export SCALA_HOME
export ZINC_HOME

export JAVA_HOME
export JRE_HOME

export GOROOT

export HADOOP_HOME
export SPARK_HOME
# To launch a local Spark cluster with 3 worker nodes with 2 cores and 1g per node.
export MASTER="local[*]"

export HIVE_HOME
export HBASE_HOME
export ZOOKEEPER_HOME
export SQOOP_HOME
export STORM_HOME
export KAFKA_HOME
export OOZIE_HOME
export FLUME_HOME
export HADOOP_CONF_DIR
export KYLIN_HOME
export FLINK_HOME

export NUTCH_HOME
export SOLR_HOME
export ZEPPELIN_HOME
export SERVICEMIX_HOME
export KARAF_HOME
export H2O_HOME

export DUBBO_HOME


export LIVY_HOME
export THRIFT_HOME
export ACTIVE_HOME
export REDIS_HOME


export IDEA_JDK
export PATH
