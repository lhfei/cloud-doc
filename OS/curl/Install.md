https://cbs.centos.org/koji/rpminfo?fileOrder=-name&rpmID=9805&buildrootOrder=-id&buildrootStart=0







### First stop the future updates via yum/dnf package manager, if you skip this step then after each update of curl from the base repo you need to rebuild curl

**Centos 7 /EL7 :**

```
cat /etc/yum.conf |grep "^exclude="|grep kernel 1> /dev/null 2> /dev/null || echo 'exclude=curl* libcurl*' >> /etc/yum.conf
```

**Centos 8 stream /EL8 :**

```
cat /etc/dnf.conf |grep "^exclude="|grep kernel 1> /dev/null 2> /dev/null || echo 'exclude=curl* libcurl*' >> /etc/dnf.conf
```

### **Now you need to install dependencies to build curl and libcurl:**

**Centos 7 /EL7 :**

```
yum install libssh libssh-devel libnghttp2-devel libnghttp2 libgsasl libgsasl-devel zstd libzstd-devel libzstd brotli brotli-devel libbrotli 
```

**Centos 8 stream /EL8 :**

```
dnf install libssh libssh-devel libnghttp2-devel libnghttp2 libgsasl libgsasl-devel zstd libzstd-devel libzstd brotli brotli-devel libbrotli 
```

### **After you've installed the dependencies build CURL from the source :**

```
cd /usr/local/src
rm -rf curl*
wget https://curl.se/download/curl-7.88.0.zip
unzip curl-7.88.0.zip
cd curl-7.88.0
./configure --with-ssl --with-zlib --with-gssapi --enable-ldap --enable-ldaps --with-libssh --with-nghttp2
make
make install
```

**After the successful build check the cURL version :**

```
curl -V
```