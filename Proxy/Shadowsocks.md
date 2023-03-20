# Shadowsocks



~~yum install python-pip~~

~~yum install asciidoc~~

~~yum install xmlto~~~~



```shell
get-pip.py for Python 2.7 has been moved to the following URL:

# curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
# python get-pip.py
The moved URL was introduced in the following comment in Stack Overflow: It is now also displayed in error messages when running the latest get-pip.py.
```




```sh
yum install m2crypto python-setuptools
easy_install pip
pip install shadowsocks

pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
```


```sh
vim /etc/shadowsocks.json
```

```json
{
    "server":"0.0.0.0",
    "server_port":8888,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"Lhfei@#2!",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open": false,
    "workers": 1
}
```

```sh
nohup ssserver -c /etc/shadowsocks.json > log&
```

```sh
firewall-cmd --zone=public --add-port=8888/tcp --permanent systemctl restart firewalld.service
```

# Bash Script

```shell
#!/bin/bash

nohup ssserver -c /etc/shadowsocks.json > log&

firewall-cmd --zone=public --add-port=8888/tcp --permanent
systemctl restart firewalld.service
```

