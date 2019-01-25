



## Pilosa Server

### Host

```ini
10.182.96.188    host-10-182-96-188
```



### Nginx Proxy

```ini
location / {
    proxy_pass http://localhost:10111 ;
    proxy_set_header Host $host;
    index /;
}
```



### Start Server

```sh
pilosa server --handler.allowed-origins="http://10.182.96.187" --bind="localhost:10111"
```







## Pilosa Console

### Host

```ini
10.182.96.187    host-10-182-96-187
```



### Nginx Proxy

```
location / {
    proxy_pass http://localhost:8000 ;
    proxy_set_header Host $host;
    index /;
}
```

### Start Console

```sh
make server
```











