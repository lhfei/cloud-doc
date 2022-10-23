

### 1.18.0

#### Centos 6.8

1.  **Required**

   ```shell
   sudo yum install -y pcre-devel
   
   sudo yum install -y openssl openssl-devel
   
   sudo yum install -y zlib-devel
   
   sudo yum install -y gcc gcc-c++
   ```

   

2. **Build**

   ```shell
   ./configure
   
   make
   
   meke install
   ```

   

3. **Configuration**

   1. Websocket

      ```shell
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
              listen 8020;k
              
              # Zeppelin Application
              location /zeppelin {
                  proxy_pass http://websocket;
                  proxy_http_version 1.1;
                  proxy_set_header Upgrade $http_upgrade;
                  proxy_set_header Connection $connection_upgrade;
              }
          }
      }
      ```

      

   2. **SSL**

      ```shell
      mkdir -p /etc/nginx/cert/ 
      
      sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert/private.key -out /etc/nginx/cert/certificate.crt
      
      chown -R nginx:nginx /etc/nginx/cert/ 
      
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

      

   3. dfdf

4. 

