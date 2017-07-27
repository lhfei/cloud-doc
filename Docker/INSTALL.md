https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#uninstall-docker-ce
sudo apt-get remove docker docker-engine docker.io












```
$ apt-cache madison docker-ce
 docker-ce | 17.06.0~ce-0~ubuntu | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.2~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.1~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.0~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
```


```
$ sudo apt-get install docker-ce=<VERSION>
```