



## Requires

##### Requires

&emsp;All requires detail info, see ```docker\setup-h2o-dev.sh```

```sh
sudo apt-get install libcurl4-openssl-dev libxml2-dev
```

```sh
./gradlew syncSmalldata
./gradlew syncRPackages


pip install colorama --upgrade
pip install future

pip install requests --upgrade

pip install tabulate

pip install setuptools

pip install pip
```

## Build

```sh
./gradlew build --stacktrace --debug
```



## FAQs

> #### error: X11 not found but required, configure aborted.

```
# install requires for `rgl` package 
sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev libx11-dev
```