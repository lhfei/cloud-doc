



## Requires

##### Requires

&emsp;All requires detail info, see ```docker\setup-h2o-dev.sh```

```sh
sudo apt-get install libcurl4-openssl-dev libxml2-dev

# For Centos 7
sudo yum -y install libcurl libcurl-devel

sudo yum -y install openssl-devel
```

```sh
yum install python-requests

yum install -y krb5-devel
yum install python36-gssapi

./gradlew syncSmalldata
./gradlew syncRPackages

pip install colorama --upgrade
pip install future

pip install requests --upgrade

pip install tabulate
pip install requests

pip install setuptools

pip3 install wheel

pip install pip
```

## Build

```sh
# build h2o-web
cd h2o-web
npm i -g bower
bower install --allow-root


./gradlew build -x test --stacktrace --info 
```


## SmallData

```sh
./gradlew syncSmalldata
./gradlew syncRPackages
```


## FAQs

> #### error: X11 not found but required, configure aborted.

```sh
# install requires for `rgl` package 
sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev libx11-dev
```

