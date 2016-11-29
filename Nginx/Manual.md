


![Nginx](http://nginx.org//nginx.png "")

```
```

> ## NGINX as a WebSocket Proxy 

@see [nginx-websocket](https://www.nginx.com/blog/websocket-nginx/ "Nginx Websocket")

#### create the following configuration:
```
## For websocket
map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}
upstream websocket {
    server localhost:8080;
}
server {
	listen	     8091;
	server_name  localhost;
    
	location / {
	    proxy_buffers 16 4k;
	    proxy_buffer_size 2k;
	    proxy_pass http://websocket;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
	}
}

```

