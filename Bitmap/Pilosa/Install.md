



## Pilosa Server

### Host

```ini
10.182.96.188    host-10-182-96-188
```



### Nginx Proxy

```ini
location / {
    proxy_pass http://localhost:10101 ;
    proxy_set_header Host $host;
    index /;
}
```



### Start Server

```sh
pilosa server --handler.allowed-origins="http://10.182.96.187"
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



### Reset Server URL

```shell
vi assets/index.html  
```

Replace `Pilosa Server` url from `http://localhost:10101` to `http://${PILOSA_SERVER}/`. Form example:

```html
<form id="url-form">
	<label id="url-label" for="url">Pilosa URL</label>
	<input id="url" type="text" name="url" value="http://10.182.96.188/"></input>
	<input id="connect" type="submit" value="Connect"></input>
</form>
```



### Start Console

```sh
make server
```











