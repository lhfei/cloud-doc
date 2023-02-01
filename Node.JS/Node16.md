





yum install -y rsync lsof jq mmv net-tools unzip hostname nginx

```shell
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```



```shell

curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
```



### Issues

#### [Errno 14] 

[Errno 14] curl#37 - "Couldn't open file /etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL"

```shell
cd /etc/pki/rpm-gpg
wget https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL
```

