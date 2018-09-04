

```
# For Kudu Master Application
location / {
    proxy_pass http://localhost:8051 ;
    proxy_set_header Host $host;
    index /;
}

# For Kudu TServer Application
location / {
    proxy_pass http://localhost:8050 ;
    proxy_set_header Host $host;
    index /;
}
```

