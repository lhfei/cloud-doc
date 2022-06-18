# Build and deploy

[See](https://cloudbeaver.io/docs/Build-and-deploy/)

## Introduction

CloudBeaver is a web server which provides a rich web interface.
It consists of two parts:

- Server back-end. It is written in Java and reuses "platform" libraries of [DBeaver](https://github/.com/dbeaver/dbeaver).
- Front-end part. It is written in TypeScript and JavaScript.

This build process is relatively complicated (and also consists of two parts).



### Prerequisites

- [Java 11](https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=hotspot).
- [Apache Maven](https://maven.apache.org/download.cgi)
- [Node.js](https://nodejs.org/en/)
- [Yarn](https://classic.yarnpkg.com/en/docs/install#windows-stable) 
- [NPM](https://www.npmjs.com/get-npm) + [Lerna](https://www.npmjs.com/package/lerna)



#### Install prerequisites on Ubuntu:

Add Node.js and Yarn latest version repo:

```bash
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
```

Install packages:

```bash
sudo apt update
sudo apt install openjdk-11-jdk
sudo apt install maven
sudo apt install yarn
sudo apt install nodejs
sudo apt install npm
sudo npm install -g lerna
```



#### Install prerequisites on Windows:

- Download and install [AdoptOpenJDK](https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=hotspot)
- Download and extract [Maven ](https://maven.apache.org/download.cgi).
- Add path to Maven bin folder in system PATH
- Download and install [Node.js](https://nodejs.org/en/). NPM comes along with Node.js, NPX/Lerna will be installed in the build script.
- Download and install [Yarn](https://classic.yarnpkg.com/en/docs/install#windows-stable)

If lerna is not installed along with Node.js you can do it manually:

```
npm install -g lerna
npm install -g yarn
```



### Build and deploy

```bash
git clone https://github.com/dbeaver/cloudbeaver.git
cd cloudbeaver/deploy
./build.sh
```

The final artifacts can be found in `deploy/cloudbeaver`.



### Running server

```bash
cd cloudbeaver
./run-server.sh
```

By default, the server listens to port `8978` (you can change it in conf/cloudbeaver.conf). So just navigate to [http://localhost:8978](http://localhost:8978/). You can configure [Nginx](https://cloudbeaver.io/docs/CloudBeaver-and-Nginx), Apache or any other web server in front of it.

*Note: you must be in the server root directory to run it.*
If you need to run it from some other directory, then you can set the environment variable `CLOUDBEAVER_HOME` to the server root directory.



### Nginx

```ini
location / {
  proxy_pass       http://localhost:8978;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header Host $http_host;
}
```

