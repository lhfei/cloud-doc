



## Hazelcast Management Center

#### Start

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="HZ MC"
OUT_LOG="mc.log"

export JAVA_HOME="/export/cloud/jdk-17.0.10"

export MC_HTTP_PORT=18880

function startJob() {
    export JAVA_HOME="/export/cloud/jdk-17.0.10"
    echo "prepare to start ..."
    cd ${JOB_HOME}
    ./bin/hz-mc start -Dhazelcast.mc.http.port=${MC_HTTP_PORT} > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/pid
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/pid" ]
then
    PID=`cat ${JOB_HOME}/pid`
    if ps -p $PID > /dev/null
    then
        echo "${SERV_NAME} is running as pid is $PID, stop it first"
        exit 1
    else
        startJob
        exit 0
    fi
else
    startJob
    exit 0
fi
```



#### Nginx

```in
location /imap/ {
  #auth_basic "dlink";
  #auth_basic_user_file /etc/nginx/passwd.db;
  proxy_pass http://gpt_imap/;
  proxy_set_header X-Real-IP  $remote_addr;
  proxy_set_header X-Forwarded-For $remote_addr;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header Host $host;
  proxy_connect_timeout       300;
  proxy_send_timeout          300;
  proxy_read_timeout          300;
  send_timeout                300;

  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection $connection_upgrade;

}

location ~ ^/(api|security|javascripts|stylesheets) {
  proxy_pass http://127.0.0.1:8080;
  index /;
  proxy_set_header Host $host;
}

location ~ ^/(branding-ui.json|login.html|images\/signup-logo.svg|images\/logo.svg) {
  proxy_pass http://127.0.0.1:8080;
  index /;
  proxy_set_header Host $host;
}
```

