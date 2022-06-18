## Step 3: Install LDAP Account Manager

Download the latest RPM file from LAM [release page](https://www.ldap-account-manager.org/lamcms/releases). At the time of this tutorial, the latest version is 7.4.0.

```shell
wget http://prdownloads.sourceforge.net/lam/ldap-account-manager-7.9.1-0.fedora.1.noarch.rpm
```

Install the RPM file on your CentOS 8 host.

```shell
sudo yum localinstall ldap-account-manager-*.rpm
```

## Step 3: Configure LDAP Account Manager

Access the LDAP Manager web interface with:

```shell
http://(server IP or hostname)/lam
```

Example: **`//ldapmaster.computingforgeeks.com/lam`**.

You will be directed to the LDAP account manager login page.





### Configuration

Install location `/usr/share/ldap-account-manager`, and file tree as below:

```ini
├── config
│   ├── pdf
│   ├── profiles
│   ├── selfService
│   └── templates
│       ├── pdf
│       │   └── logos
│       └── profiles
├── sess
└── tmp
    └── internal
```





### Nginx

> lam.conf

```ini
location /lam {
  index index.html;
  alias /usr/share/ldap-account-manager;
  autoindex off;
  
  location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    #fastcgi_pass unix:/var/run/php7-fpm.sock;
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

