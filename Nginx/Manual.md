


![Nginx](http://nginx.org//nginx.png "")

```
```

# Reg

```ini
(exp) 匹配exp,并捕获文本到自动命名的组里
(?exp) 匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
(?:exp) 匹配exp,不捕获匹配的文本，也不给此分组分配组号
(?=exp) 匹配exp前面的位置
(?<=exp) 匹配exp后面的位置
(?!exp) 匹配后面跟的不是exp的位置
(?<!exp) 匹配前面不是exp的位置
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


> ## Replace

```
# replaced 'domain.com/change/this/that/other ' to 'domain.com/changed/this/that/other '
location ~* ^/change/(.*)$ {rewrite ^/change/(.*)$ http://domain.com/changed/$1 permanent; break;}
```

