### Install 

> For Centos

```shell
yum install httpd-tools -y
```



> For Ubuntu

```shell
$ sudo apt-get update
$ sudo apt-get install apache2-utils
```



### HTPasswd Generator

```shell
htpasswd -c /etc/nginx/passwd.db admin
New password: [DLink@01]
Re-type new password: 
Adding password for user admin

```



```shell
cat /etc/nginx/passwd.db 
admin:$apr1$wmED6tdd$BkAT3nHwRVtyegwJcSpmF/
```



#### Nginx

```ini
server {
    .
    .
    location / {
        .
        .
        auth_basic "DLink";
        auth_basic_user_file /etc/nginx/passwd.db;
    }
}
```

