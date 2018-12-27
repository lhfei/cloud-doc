# Adjusting nginx-proxy Timeout Configuration



Add these variables to `nginx.conf` file:



```ini
proxy_connect_timeout       600;
proxy_send_timeout          600;
proxy_read_timeout          600;
send_timeout                600;
```





> #### Nginx: 413 – Request Entity Too Large Error and Solution

Add the following line to **http or server or location context** to increase the size limit in nginx.conf, enter:

```ini
# set client body size to ?M #
client_max_body_size {replace_it}M;
```

