### HDFS

```ini
location /hdfs {
    proxy_pass http://172.19.164.156:50070/;
    index /;
    proxy_set_header Host $host;
}


location ~ ^/(dfshealth.html|explorer.html) {
    proxy_pass http://172.19.164.156:50070;
    index /;
    proxy_set_header Host $host;
}

location ~ ^/(static|startupProgress|logs) {
    proxy_pass http://172.19.164.156:50070;
    index /;
    proxy_set_header Host $host;
}


location ~ (\.js$|\.css$|\.svg$) {
    proxy_pass http://172.19.164.156:50070;
    index /;
    proxy_set_header Host $host;
}

location ~ ^/(conf|jmx|webhdfs)  {
    proxy_pass http://172.19.164.156:50070;
    index /;
    proxy_set_header Host $host;
}
```



### YARN

```ini
location /proxy {
    proxy_pass http://172.19.164.157:8088/proxy;
    index /;
    proxy_set_header Host $host;
}

location /jobhistory {
    proxy_pass http://172.19.164.157:19888/jobhistory;
    index /;
    proxy_set_header Host $host;
}

location /history {
    proxy_pass http://172.19.164.156:18081/history;
    index /;
    proxy_set_header Host $host;
}
```

