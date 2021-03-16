## Binary Releases

### Prebuilt Packages for Linux and BSD

Most Linux distributions and BSD variants have NGINX in the usual package repositories and they can be installed via whatever method is normally used to install software (`apt-get` on Debian, `emerge` on Gentoo, `ports` on FreeBSD, etc).

Be aware that these packages are often somewhat out-of-date. If you want the latest features and bugfixes, it’s recommended to build from source or use packages directly from nginx.org.

## Official Red Hat/CentOS packages

To add NGINX yum repository, create a file named `/etc/yum.repos.d/nginx.repo` and paste one of the configurations below:

CentOS:

```
[nginx]
name=nginx repo
baseurl=https://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
```

RHEL:

```
[nginx]
name=nginx repo
baseurl=https://nginx.org/packages/rhel/$releasever/$basearch/
gpgcheck=0
enabled=1
```

Due to differences between how CentOS, RHEL, and Scientific Linux populate the `$releasever` variable, it is necessary to manually replace `$releasever` with either `5` (for 5.x) or `6` (for 6.x), depending upon your OS version.

## Official Debian/Ubuntu packages

Ubuntu:

The available NGINX Ubuntu release support is listed at [this distribution page](https://nginx.org/packages/ubuntu/dists/). For a mapping of Ubuntu versions to release names, please visit the [Official Ubuntu Releases page](https://wiki.ubuntu.com/Releases).

Append the appropriate stanza to `/etc/apt/sources.list`. If there is concern about persistence of repository additions (i.e. DigitalOcean Droplets), the appropriate stanza may instead be added to a different list file under `/etc/apt/sources.list.d/`, such as `/etc/apt/sources.list.d/nginx.list`.

```
## Replace $release with your corresponding Ubuntu release.
deb https://nginx.org/packages/ubuntu/ $release nginx
deb-src https://nginx.org/packages/ubuntu/ $release nginx
```

e.g. Ubuntu 16.04 (Xenial):

```
deb https://nginx.org/packages/ubuntu/ xenial nginx
deb-src https://nginx.org/packages/ubuntu/ xenial nginx
```

To install the packages, execute in your shell:

```
sudo apt-get update
sudo apt-get install nginx
```

If a `W: GPG error: https://nginx.org/packages/ubuntu xenial Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY $key` is encountered during the NGINX repository update, execute the following:

```
## Replace $key with the corresponding $key from your GPG error.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
sudo apt-get update
sudo apt-get install nginx
```

Debian 6:

Append the appropriate stanza to `/etc/apt/sources.list`.

```
deb https://nginx.org/packages/debian/ squeeze nginx
deb-src https://nginx.org/packages/debian/ squeeze nginx
```

### Ubuntu PPA

This PPA is maintained by volunteers and is not distributed by nginx.org. It has some additional compiled-in modules and may be more fitting for your environment.

You can get the latest stable version of NGINX from the [NGINX PPA](https://launchpad.net/~nginx/+archive/ubuntu/development) on Launchpad: You will need to have root privileges to perform the following commands.

For Ubuntu 10.04 and newer:

```
sudo -s
nginx=stable # use nginx=development for latest development version
add-apt-repository ppa:nginx/$nginx
apt-get update
apt-get install nginx
```

If you get an error about add-apt-repository not existing, you will want to install `python-software-properties`. For other Debian/Ubuntu based distributions, you can try the lucid variant of the PPA which is the most likely to work on older package sets:

```
sudo -s
nginx=stable # use nginx=development for latest development version
echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu lucid main" > /etc/apt/sources.list.d/nginx-$nginx-lucid.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
apt-get update
apt-get install nginx
```



## Official Win32 Binaries

As of NGINX 0.8.50, NGINX is now available as an [official Windows binary](https://nginx.org/en/download.html).

Installation:

```
cd c:\
unzip nginx-1.2.3.zip
ren nginx-1.2.3 nginx
cd nginx
start nginx
```

Control:

```
nginx -s [ stop | quit | reopen | reload ]
```

For problems look in c:nginxlogserror.log or in EventLog.

In addition, Kevin Worthington maintains earlier [Windows](https://kevinworthington.com/nginx-for-windows/) builds of the development branch.

## Source Releases

There are currently two versions of NGINX available: `stable (1.10.x)`, `mainline (1.11.x)`. The mainline branch gets new features and bugfixes sooner but might introduce new bugs as well. Critical bugfixes are backported to the stable branch.

In general, the stable release is recommended, but the mainline release is typically quite stable as well. See the [FAQ](https://www.nginx.com/resources/wiki/community/faq/#faq-is-it-safe).

### Stable

[NGINX 1.10.1](https://nginx.org/download/nginx-1.10.1.tar.gz)

31 May 2016

[changelog](https://nginx.org/en/CHANGES-1.10)

### Mainline

[NGINX 1.11.3](https://nginx.org/download/nginx-1.11.3.tar.gz)

26 Jul 2016

[changelog](https://nginx.org/en/CHANGES)

Source code repository is at [hg.nginx.org/nginx](https://hg.nginx.org/nginx).

Older versions can be found [here](https://nginx.org/en/download.html).

### Building NGINX From Source

After extracting the source, run these commands from a terminal:

```
./configure
make
sudo make install
```

By default, NGINX will be installed in `/usr/local/nginx`. You may change this and other options with the [Installation and Compile-Time Options](https://www.nginx.com/resources/wiki/start/topics/tutorials/installoptions/).

You might also want to peruse the [3rd party modules](https://www.nginx.com/resources/wiki/modules/), since these must be built at compile-time.

### Other Systems

- [Installing on Solaris 10u5](https://www.nginx.com/resources/wiki/start/topics/tutorials/solaris_10_u5/)
- [Installing on Solaris 11](https://www.nginx.com/resources/wiki/start/topics/tutorials/solaris_11/)
- [Installing and configuring NGINX / Mongrel on OpenBSD with Rails support](https://www.nginx.com/resources/wiki/start/topics/tutorials/openbsd/)

Warning

These pages are not thoroughly, if at all, reviewed for accuracy as they are on this page.

## After Installing

There are many different example configurations that can be found in [Getting Started](https://www.nginx.com/resources/wiki/start/) section. Also the [Pitfalls and Common Mistakes](https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/) page will help keep you from making mistakes that so many users before you did.

## References

[Original Documentation](https://nginx.org/en/docs/install.html)