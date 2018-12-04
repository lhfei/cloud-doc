# NIFI



### Nginx

```ini
server {
    listen 80;
    listen [::]:80 default_server ipv6only=on;

    location / {

        # you can tell the browser that it can only download content from the domains you explicitly allow
        add_header Content-Security-Policy "default-src 'self'; script-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; font-src 'self' data:; frame-src 'self'; connect-src 'self' https://apis.google.com; object-src 'none' ";
        
        ...
    }
}
```

