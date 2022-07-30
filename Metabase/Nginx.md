

```ini
location /dbi/ {
  #auth_basic "dlink";
  #auth_basic_user_file /etc/nginx/passwd.db;
  proxy_pass http://127.0.0.1:12000/;
  proxy_set_header X-Real-IP  $remote_addr;
  proxy_set_header X-Forwarded-For $remote_addr;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header Host $host;
  proxy_connect_timeout       300;
  proxy_send_timeout          300;
  proxy_read_timeout          300;
  send_timeout                300;
}
```

