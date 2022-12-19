

```shell
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
```

