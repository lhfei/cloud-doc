


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



### Reg

- [ ] `$args` ： #这个变量等于请求行中的参数，同`$query_string`
- [ ] `$content_length` ： 请求头中的Content-length字段。
- [ ] `$content_type` ： 请求头中的Content-Type字段。
- [ ] `$document_root` ： 当前请求在root指令中指定的值。
- [ ] `$host` ： 请求主机头字段，否则为服务器名称。
- [ ] `$http_user_agent` ： 客户端agent信息
- [ ] `$http_cookie` ： 客户端cookie信息
- [ ] `$limit_rate` ： 这个变量可以限制连接速率。
- [ ] `$request_method` ： 客户端请求的动作，通常为GET或POST。
- [ ] `$remote_addr` ： 客户端的IP地址。
- [ ] `$remote_port` ： 客户端的端口。
- [ ] `$remote_user` ： 已经经过Auth Basic Module验证的用户名。
- [ ] `$request_filename` ： 当前请求的文件路径，由root或alias指令与URI请求生成。
- [ ] `$scheme` ： HTTP方法（如http，https）。
- [ ] `$server_protocol` ： 请求使用的协议，通常是HTTP/1.0或HTTP/1.1。
- [ ] `$server_addr` ： 服务器地址，在完成一次系统调用后可以确定这个值。
- [ ] `$server_name` ： 服务器名称。
- [ ] `$server_port` ： 请求到达服务器的端口号。
- [ ] `$request_uri` ： 包含请求参数的原始URI，不包含主机名，如：”/foo/bar.php?arg=baz”。
- [ ] `$uri` ： 不带请求参数的当前URI，$uri不包含主机名，如”/foo/bar.html”。
- [ ] `$document_uri` ： 与$uri相同。





> ## NGINX as a WebSocket Proxy 

@see [nginx-websocket](https://www.nginx.com/blog/websocket-nginx/ "Nginx Websocket")

#### create the following configuration:

### For websocket

```ini
map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}
upstream websocket {
    server localhost:8080;
}
server {
  listen         8091;
  server_name  localhost;

  location / {
    proxy_buffer_size 64k;
    proxy_buffers   32 32k;
    proxy_busy_buffers_size 128k;
    proxy_pass http://websocket;
    proxy_set_header Host $host;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
  }
}
```



```ini
server {
    listen 443;
    ssl on;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_certificate /etc/nginx/ssl/bundle.crt;
    ssl_certificate_key /etc/nginx/ssl/private.key;

    server_name www.example.com;
    access_log /path/to/nginx/accces/log/file;
    error_log /path/to/nginx/error/log/file;

    location / {
        root  /var/www/html/yoursite/;
        index  index.html;
    }
}
```





Example: 


```
http {
    # Enabled WebSocket support
    map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
    }

    upstream websocket {
        server 192.168.100.10:8010;
    }
    # // WebSocket support

    server {
        listen 8020;
        
        # Zeppelin Application
        location /zeppelin {
            proxy_pass http://websocket;
            proxy_http_version 1.1;
            proxy_set_header Uphgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
        }
    }
}
```







# replaced 'domain.com/change/this/that/other ' to 'domain.com/changed/this/that/other '

location ~* ^/change/(.*)$ {rewrite ^/change/(.*)$ http://domain.com/changed/$1 permanent; break;}
```


```




#### remove  X-Frame-Options

```ini
server {
    listen       80;
    
    ....
    
    proxy_hide_header X-Frame-Options;
    
    ....
} 

```

