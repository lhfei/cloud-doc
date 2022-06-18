## Nginx configuration

### tar.bz2 based installations

```shell
bzip2 -v -d ldap-account-manager-6.7.tar.bz2

tar -xvf ldap-account-manager-6.7.tar

cd ldap-account-manager-6.7

chmod 777 sess templates tmp

cd config

cp config.cfg.sample config.cfg
```



### Install PHP 5.6

```shell
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

rpm -Uvh epel-release-6-8.noarch.rpm remi-release-6.rpm

yum install yum-utils

yum-config-manager --enable remi-php56 


yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-fpm php-xml
```



> Start php-fpm

```shell
/etc/rc.d/init.d/php-fpm start
```



### Configure Nginx

```
# application: LAM
location /lam {
  index index.html;
  alias /usr/share/ldap-account-manager;
  autoindex off;
  
  location ~ \.php$ {
  	fastcgi_split_path_info ^(.+\.php)(/.+)$;
  	fastcgi_pass 127.0.0.1:9000;
  	fastcgi_index index.php;
  	include fastcgi_params;
  	fastcgi_param SCRIPT_FILENAME $request_filename;
  }
  
  location ~ /lam/(tmp/internal|sess|config|lib|help|locale) {
  	deny all;
  	return 403;
  }
}
```





## Configuration

### Add/Edit Profiles

```shell
cd /usr/shar/ldap-account-manager/config

cp addressbook.conf.sample addressbook.conf

cp samba3.conf.sample samba3.conf

cp unix.conf.sample unix.conf


# add permisions
chmod 666 *.conf
```

