

Nginx



```ini
location / {
    proxy_pass http://127.0.0.1:8081/ ;
    index /;
    proxy_set_header Host $host;
}

location ~ ^/(druid\/coordinator) {
    proxy_pass http://127.0.0.1:8081 ;
    index /;
    proxy_set_header Host $host;
}

location ~ ^/(druid\/indexer|console.html|js) {
    proxy_pass http://127.0.0.1:8090 ;
    index /;
    proxy_set_header Host $host;
}

location ~ ^/(druid/v2) {
    proxy_pass http://127.0.0.1:8082 ;
    index /;
    proxy_set_header Host $host;
}
```

