phpldapAdmin

```conf
# application: phpldapadmin
location /phpldapadmin {
    alias /usr/share/phpldapadmin/htdocs;
    index index.php index.html index.htm;
	
	location ~ ^/phpldapadmin/.*\.php$ {
		if ($request_filename !~* htdocs) {
			rewrite ^/phpldapadmin(/.*)?$ /phpldapadmin/htdocs$1;
		}
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME $request_filename;
		include fastcgi_params;
	}
}
```







LAM

```conf
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



