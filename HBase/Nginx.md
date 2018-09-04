

```ini
# For Hbase Master Application
location / {
    proxy_pass http://localhost:16010 ;
    proxy_set_header Host $host;
    index /;
}

location ~ ^/(master-status|logs|zk\.jsp|static|tablesDetailed\.jsp|procedures\.jsp|processMaster\.jsp|logLevel|dump|jmx|conf) {
    proxy_pass http://localhost:16010 ;
    proxy_set_header Host $host;
    index /;
}
```

