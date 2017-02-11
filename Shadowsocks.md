# Shadowsocks



~~yum install python-pip~~


~~yum install asciidoc~~

~~yum install xmlto~~~~


```sh
yum install m2crypto python-setuptools
easy_install pip
pip install shadowsocks
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
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 1
}
```

```sh
nohup ssserver -c /etc/shadowsocks.json > log&
```

```sh
firewall-cmd --zone=public --add-port=8888/tcp --permanent
systemctl restart firewalld.service
```

