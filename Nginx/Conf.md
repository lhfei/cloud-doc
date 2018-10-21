# Adjusting nginx-proxy Timeout Configuration



Add these variables to `nginx.conf` file:



```ini
proxy_connect_timeout       600;
proxy_send_timeout          600;
proxy_read_timeout          600;
send_timeout                600;
```

