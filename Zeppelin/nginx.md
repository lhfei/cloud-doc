



```ini
location / {
	proxy_pass http://127.0.0.1:9000/ ;
	index /;
	proxy_set_header Host $host;
}

location /zeppelin {
	proxy_pass http://172.19.164.159/zeppelin;
	index /;
	proxy_set_header Host $host;
}

location /ws {
	proxy_pass http://172.19.164.159/zeppelin/ws;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
}

location /api {
	proxy_pass http://172.19.164.159/zeppelin/api;
	index /;
	proxy_set_header Host $host;
}

location /extensions {
	proxy_pass http://172.19.164.159/zeppelin/extensions;
	index /;
	proxy_set_header Host $host;
}

location /jax {
	proxy_pass http://172.19.164.159/zeppelin/jax;
	index /;
	proxy_set_header Host $host;
}

location /components {
	proxy_pass http://172.19.164.159/zeppelin/components;
	index /;
	proxy_set_header Host $host;
}

#location /notebook {
#	proxy_pass http://172.19.164.159/zeppelin/notebook/;
#	index /;
#	proxy_set_header Host $host;
#}


```

