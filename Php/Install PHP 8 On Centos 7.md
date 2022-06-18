# [How to Install PHP 8 on CentOS/RHEL 8/7](https://www.tecmint.com/install-php-8-on-centos/)

[James Kiarie](https://www.tecmint.com/author/james2030kiarie/)May 12, 2022 Categories[CentOS](https://www.tecmint.com/category/linux-distros/centos/), [PHP](https://www.tecmint.com/category/php/), [RedHat](https://www.tecmint.com/category/linux-distros/redhat/) [9 Comments](https://www.tecmint.com/install-php-8-on-centos/#comments)

<iframe id="google_ads_iframe_/15184186,18758028/tecmint_leaderboard_article_top_0" name="google_ads_iframe_/15184186,18758028/tecmint_leaderboard_article_top_0" title="3rd party ad content" width="728" height="90" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" role="region" aria-label="Advertisement" tabindex="0" srcdoc="" data-google-container-id="2" data-amx-adroot="5hpdwc95th1lh3ebzz" data-adloox-type="slot" data-adloox-sid="37296634714" style="border: 0px; margin: 0px; padding: 0px; max-width: none; vertical-align: bottom;"></iframe>

**PHP** is a popular open-source server-side scripting language that is integral in developing dynamic web pages. **PHP 8.0** is finally out and was released on November 26th, 2020. It promises lots of improvements and optimizations which are set to streamline how developers write and interact with PHP code.

In this guide, you will learn how to install **PHP 8.0** on **CentOS 8/7** and **RHEL 8/7**.

### Step 1: Enable EPEL and Remi Repository on CentOS/RHEL

Right off the bat, you need to enable the **EPEL** repository on your system. **EPEL**, short for **Extra Packages for Enterprise Linux**, is an effort from the **Fedora** team that provides a set of additional packages that are not present by default on **RHEL & CentOS**.

```shell
$ sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm  [On CentOS/RHEL 8]
$ sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm  [On CentOS/RHEL 7]
```

**Remi** repository is a third-party repository that provides a wide range of **PHP** versions for **RedHat Enterprise Linux**. To install the **Remi** repository, run the command:

```
$ sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm  [On CentOS/RHEL 8]
$ sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm  [On CentOS/RHEL 7]
```

### Step 2: Install PHP 8 on CentOS/RHEL

Once the installation is complete, proceed and list the available **php** module streams as shown:

```
$ sudo dnf module list php   [On RHEL 8]
```

<iframe frameborder="0" src="https://d6483034fe97bea394a5dac33a9787b1.safeframe.googlesyndication.com/safeframe/1-0-38/html/container.html" id="google_ads_iframe_/15184186,18758028/tecmint_incontent_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="728" height="90" data-is-safeframe="true" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" role="region" aria-label="Advertisement" tabindex="0" data-google-container-id="3" data-load-complete="true" style="border: 0px; margin: 0px; padding: 0px; max-width: 100%; vertical-align: bottom;"></iframe>

Right at the bottom, be sure to notice the **remi-8.0** php module.

[![List PHP 8 Modules](https://www.tecmint.com/wp-content/uploads/2020/12/List-PHP-8-Modules.png)](https://www.tecmint.com/wp-content/uploads/2020/12/List-PHP-8-Modules.png)List PHP 8 Modules

We need to enable this module before installing **PHP 8.0**. To enable **php:remi-8.0**, execute:

```
$ sudo dnf module enable php:remi-8.0 -y [On RHEL 8]
```

[![Enable PHP Remi Module](https://www.tecmint.com/wp-content/uploads/2020/12/Enable-PHP-Remi-Repository.png)](https://www.tecmint.com/wp-content/uploads/2020/12/Enable-PHP-Remi-Repository.png)Enable PHP Remi Module

On **CentOS 7**, use the following commands.

```shell
$ sudo yum -y install yum-utils
$ sudo yum-config-manager --disable 'remi-php*'
$ sudo yum-config-manager --enable remi-php80
```

Once enabled, install **PHP 8.0** for **Apache** or **Nginx** web server as shown:

#### Install PHP 8.0 for Apache

To install **PHP 8** on the [installed Apache web server](https://www.tecmint.com/install-apache-with-virtual-host-on-centos-8/), run:

```
$ sudo dnf install php php-cli php-common
```

[![Install PHP 8 for Apache](https://www.tecmint.com/wp-content/uploads/2020/12/Install-PHP-8-for-Apache.png)](https://www.tecmint.com/wp-content/uploads/2020/12/Install-PHP-8-for-Apache.png)Install PHP 8 for Apache

#### Install PHP 8.0 for Nginx

If you are using [Nginx in your development stack](https://www.tecmint.com/install-nginx-on-centos-8/), consider installing **php-fpm** as shown.

```
$ sudo dnf install php php-cli php-common php-fpm
```



```shell
yum -y install php php-fpm php-mysqlnd php-zip php-devel php-gd php-redis php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pdo php-pecl-apcu php-pecl-apcu-devel php-ldap php-gmp
```



### Step 3: Verify PHP 8.0 on CentOS/RHEL

There are two ways that you can use to verify the **PHP** version. On command-line, issue the command.

```
$ php -v
```

[![Verify PHP 8 from Command-line](https://www.tecmint.com/wp-content/uploads/2020/12/Verify-PHP-8-in-CentOS.png)](https://www.tecmint.com/wp-content/uploads/2020/12/Verify-PHP-8-in-CentOS.png)Verify PHP 8 from Command-line

Additionally, you can create a sample php file in the **/var/www/html** folder as shown:

```
$ sudo vim /var/www/html/info.php
```

Then add the following PHP code which will populate the version of PHP alongside installed modules.

```
<?php

phpinfo();

?>
```

Save and exit. Be sure to restart the **Apache** or **Nginx** web server as shown.

```
$ sudo systemctl restart httpd
$ sudo systemctl restart nginx
```

Next, head over to your browser and go to the address shown:

```
http://server-ip/info.php
```

The webpage displays a wealth of information regarding the version of PHP installed such as build date, build system, Architecture, and a host of PHP extensions.

[![Check PHP 8 Info](https://www.tecmint.com/wp-content/uploads/2020/12/Check-PHP-8-Info-CentOS.png)](https://www.tecmint.com/wp-content/uploads/2020/12/Check-PHP-8-Info-CentOS.png)Check PHP 8 Info

### Step 3: Install PHP 8.0 Extensions in CentOS/RHEL

PHP extensions are libraries that provide added functionality to PHP. To install a php extension, use the syntax:

```
$ sudo yum install php-{extension-name}
```

For example, to enable PHP to seamlessly work with MySQL, you can install the MySQL extension as shown.

```
$ sudo yum install php-mysqlnd
```

Finally, you can verify the installed extensions using the command:

```
$ php -m
```

To verify if a specific extension is installed, execute:

```
$ php -m | grep extension-name
```

For example:

```
$ php -m | grep mysqlnd
```

Start php-fpm

```shell
/usr/sbin/php-fpm -R  
```

If throws error: `ERROR: Unable to create the PID file (/run/php-fpm/php-fpm.pid).: No such file or directory (2)`, Plz manual make `/run/php-fpm` as below:

```shell
mkdir -p /run/php-fpm
```



