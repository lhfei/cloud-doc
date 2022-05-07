## How to setup Nginx HTTPS server on CentOS 7 linux

### 1- Generate certificate

to run a Nginx https server, we need certificate.
you can buy a certificate or use let’s encrypt project to get free verified certificates or generate it with openssl library.
Here we have not a valid domain, so we use openssl library to generate an unverified certificate.
first we create a directory to hold certificate:

```shell
mkdir -p /etc/nginx/cert/ 
```

then issue the following command to generate certificate:

```shell
sudo openssl req -x509 -nodes -days 365 -newKey rsa:2048 -keyout /etc/nginx/cert/private.key -out /etc/nginx/cert/certificate.crt
```

the output would be:

```ini
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:New York
Locality Name (eg, city) []:New York City
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Bouncy Castles, Inc.
Organizational Unit Name (eg, section) []:Ministry of Water Slides
Common Name (e.g. server FQDN or YOUR name) []:server_IP_address
Email Address []:admin@your_domain.com
```

then we change owner:

```shell
chown -R nginx:nginx /etc/nginx/cert/ 
```

### 2- Configure Nginx

To set up an HTTPS server, we must include the ssl parameter to the listen directive in the server block in nginx.conf file , then specify the locations of the server certificate and private key files:

```ini
server {
  listen 443 ssl;
  server_name www.example.com;
  ssl_certificate /etc/nginx/cert/certificate.crt;
  ssl_certificate_key /etc/nginx/cert/private.key;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers HIGH:!aNULL:!MD5;
}
```

Note: we can combine private key and certificate into one file, but it is so important to restrict access to this file.
also it’s a good idea to save private key and ssl certificate in separate files.
due to some flaws in SSLv3 protocol as described in [CVE-2011-3389](https://nvd.nist.gov/vuln/detail/CVE-2011-3389), it’s highly recommended to avoid SSLv3.

### 3- HTTPS server optimization

because SSL operations consume extra CPU resources and most of them is SSL handshake, we must optimize our server.
generally there are two ways to optimize these operations per client:

### Enabling keepalive connections:

to send several requests via one connection.

### Reusing SSL session parameters:

to avoid SSL handshakes for parallel and subsequent connections.
So we implement below configuration as our final Nginx configuration:

```ini
worker_processes auto;
http {
  ssl_session_cache shared:SSL:10m;
  ssl_session_timeout 10m;
  server {
    listen 443 ssl;
    server_name www.example.com;
    keepalive_timeout 70;
    ssl_certificate /etc/nginx/cert/certificate.crt;
    ssl_certificate_key /etc/nginx/cert/private.key;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers HIGH:!aNULL:!MD5;
  }
}
```



```ini
server {
    listen       443 ssl http2;
    listen       [::]:443 ssl http2;
    server_name  _;
    root         /usr/share/nginx/html;

    ssl_certificate "/etc/nginx/cert/certificate.crt";
    ssl_certificate_key "/etc/nginx/cert/private.key";
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # Load configuration files for the default server block.
    include /etc/nginx/default.d/*.conf;
    include /etc/nginx/lhfei.d/*.conf;

    error_page 404 /404.html;
    location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
    }

    location / {
        proxy_buffers 16 4k;
        proxy_buffer_size 2k;
        proxy_pass http://websocket;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_redirect http://websocket https://websocket;
    }
}
```



### 4- Configure firewall

we should open port 80 and 443 in firewall to enable successful connection to server:

```
# firewall-cmd --add-service=http --permanent
# firewall-cmd --add-service=https --permanent
# firewall-cmd --reload
```

### 5- Start Nginx service

Now we start Nginx service and refer to https://192.168.147.128 to see if configuration works properly.

```
# systemctl start nginx
```



#### WebSocket

> nginx.conf

```ini
    map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
    }
    upstream websocket {
        server 127.0.0.1:8080;
    }

http {

    ...

    server {
      listen 443 ssl;
      server_name _;

      ssl_certificate /etc/nginx/cert/certificate.crt;
      ssl_certificate_key /etc/nginx/cert/private.key;
      ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
      ssl_ciphers HIGH:!aNULL:!MD5;

      include /etc/nginx/lhfei.d/*.conf;
    }
 
    ...
 
}
```

