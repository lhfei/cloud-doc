# BUILD FROM SOURCES

### Prerequisites

**Jitsu** is written primarily in Go with the frontend written in JavaScript.

To install the required pre-requisites see the following guides:

- [Installing Go (>=1.16)](https://golang.org/doc/install)
- [Installing npm](https://www.npmjs.com/get-npm)
- [Installing yarn](https://classic.yarnpkg.com/lang/en/docs/install)

Please make sure your version of Go is > 1.16 with the following command:`go version`.

### Cloning source code

```shell
git clone https://github.com/jitsucom/jitsu.git
cd jitsu
```

Make build scripts executable:

```shell
chmod +x local-build-server.sh && \
chmod +x local-build-configurator.sh && \
chmod +x local-build-jitsu.sh && \
```

### Building Jitsu Server

Building **Jitsu Server** is simple, just run:

```shell
./local-build-server.sh -d false
```

`-d false` skips docker image build.

If build is successful, all artifacts will be placed inside the `./server/build/dist` directory:

```shell
$ ls -l ./server/build/dist
-rwxr-xr-x  1 vklmn  staff  30723620 Aug  6 15:58 eventnative
drwxr-xr-x  5 vklmn  staff       160 Aug  6 15:58 web
```

### Run Jitsu Server

`./eventnative` is the main application binary; `web` contains static files (JS and HTML). Application doesn't require config file, but it will be mostly useless to run without config. You can generate config file on [Cloud.Jitsu](https://cloud.jitsu.com/cfg_download) or create a new one according to [Configuration documentation](https://jitsu.com/docs/configuration).

Run the application with the following:

Run the application with configuration file using `-cfg` parameter:

```shell
./eventnative -cfg /path/to/eventnative.yaml
```

The configuration might be one of the [described formats](https://jitsu.com/docs/deployment/configuration-source). For example, run with [Raw JSON configuration source](https://jitsu.com/docs/deployment/configuration-source#raw-json):

```shell
./eventnative -cfg '{"server":{"name":"test_instance", "auth":"token1"}}'
```

### Building Jitsu Configurator

For building **Jitsu Configurator** just run:

```shell
./local-build-configurator.sh -d false
```

`-d false` skips docker image build.

If build is successful, all artifacts will be placed inside the `./configurator/build/dist` directory:

```shell
$ ls -l ./server/build/dist
-rwxr-xr-x  1 vklmn  staff  50602019 Aug  6 15:58 configurator
drwxr-xr-x  5 vklmn  staff       608 Aug  6 15:58 web
```

### Run Jitsu Configurator

`./configurator` is the configurator UI backend application binary; `web` contains static Configurator UI files (JS and HTML). Application requires config file. You can create one according to [Configuration documentation](https://jitsu.com/docs/configurator-configuration).

Run the application with configuration file using `-cfg` parameter:

```shell
./configurator -cfg /path/to/configurator.yaml
```