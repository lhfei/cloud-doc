# Install Prerequisites

These are the set of tools which are required in order to complete any build of the Metabase code. Follow the links to download and install them on your own before continuing.

1. [Oracle JDK 8 (http://www.oracle.com/technetwork/java/javase/downloads/index.html)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
2. [Node.js (http://nodejs.org/)](http://nodejs.org/)
3. [Yarn package manager for Node.js](https://yarnpkg.com/)
4. [Leiningen (http://leiningen.org/)](http://leiningen.org/)
5. [Install Clojure](https://www.clojure.org/guides/getting_started)
6. Install WSL and dos2unix

If you are developing on Windows, make sure to use Ubuntu on Windows and follow instructions for Ubuntu/Linux instead of installing ordinary Windows versions.



```shell
# install nodejs
yum -y install nodejs

# install yarn by npm
npm i -g yarn

yum -y install gettext
```



Change ./bin/* file model to unix

```shel
# makesure dos2unix installed
dos2unix bin/* 
```



# Build Metabase

The entire Metabase application is compiled and assembled into a single .jar file which can run on any modern JVM. There is a script which will execute all steps in the process and output the final artifact for you.

```shell
yarn run build

npx browserslist@latest --update-db

./bin/build
```

After running the build script simply look in `target/uberjar` for the output .jar file and you are ready to go.



