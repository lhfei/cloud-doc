https://www.febhost.com/help/detail/375



### dataos-01



> /etc/default/solr.in.sh 

```shell
SOLR_HOST="dataos-01"
SOLR_JETTY_HOST="dataos-01"
```



```shell
SOLR_PID_DIR="/export/var/solr"
SOLR_HOME="/export/var/solr/data"
LOG4J_PROPS="/export/var/solr/log4j2.xml"
SOLR_LOGS_DIR="/export/var/solr/logs"
SOLR_PORT="8983"

```





```shell
cd ${SOLR_HOME}

sudo service solr start
```





```shell
sudo -u solr ./bin/solr create -c ckan
```

