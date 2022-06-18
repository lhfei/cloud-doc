



```
yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-fpm php-xml
```



```
firewall-cmd --permanent --add-service=http
```



## Finding the web server username

```
ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1
```



Start

```
systemctl start php-fpm
```













[@see](https://www.tecmint.com/install-php-7-in-centos-7/)