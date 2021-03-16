### About Nginx

nginx is a high performance web server software. It is a much more flexible and lightweight program than apache.

## Set Up

The steps in this tutorial require the user to have root privileges. You can see how to set that up in the[CentOS Initial Server Setup Tutorial ](https://www.digitalocean.com/community/articles/initial-server-setup-with-centos-6)in steps 3 and 4.

## Step One—Install EPEL

EPEL stands for Extra Packages for Enterprise Linux. Because yum as a package manager does not include the latest version of nginx in its default repository, installing EPEL will make sure that nginx on CentOS stays up to date.

To install EPEL, open terminal and type in:

```
sudo yum install epel-release
```

## Step Two—Install nginx

To install nginx, open terminal and type in:

```
sudo yum install nginx
```

After you answer yes to the prompt twice (the first time relates to importing the EPEL gpg-key), nginx will finish installing on your virtual private server.

## Step Three—Start nginx

nginx does not start on its own. To get nginx running, type:

```
sudo /etc/init.d/nginx start
```

You can confirm that nginx has installed on your VPS by directing your browser to your IP address.

You can run the following command to reveal your server’s IP address.

```
ifconfig eth0 | grep inet | awk '{ print $2 }'
```

On the page, you will see the words, “Welcome to nginx”

Congratulations! You have now installed nginx.