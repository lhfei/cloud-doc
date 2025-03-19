

### Check Go env

```shell
go env

GO111MODULE=""
GOARCH="amd64"
GOBIN=""
GOCACHE="/root/.cache/go-build"
GOENV="/root/.config/go/env"
GOEXE=""
GOEXPERIMENT=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOINSECURE=""
GOMODCACHE="/root/go/pkg/mod"
GONOPROXY=""
GONOSUMDB=""
GOOS="linux"
GOPATH="/root/go"
GOPRIVATE=""
GOPROXY="https://proxy.golang.org,direct"
GOROOT="/export/cloud/go"
GOSUMDB="sum.golang.org"
GOTMPDIR=""
GOTOOLDIR="/export/cloud/go/pkg/tool/linux_amd64"
GOVCS=""
GOVERSION="go1.17.5"
GCCGO="gccgo"
AR="ar"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD="/dev/null"
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build1071092851=/tmp/go-build -gno-record-gcc-switches"
```



### Set GOPROXY

- 七牛云	[https://goproxy.cn](https://goproxy.cn/)
- 阿里云    https://mirrors.aliyun.com/goproxy/

```shell
# set Qiuniu cloud as default GOPROXY
go env -w GOPROXY=https://goproxy.cn,direct
```



### 七牛云

```shell
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=goproxy.cn/sumdb/sum.golang.org
```

### 阿里云

```shell
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
# GOSUMDB 不支持
```

### GoCenter

```shell
go env -w GOPROXY=https://gocenter.io,direct
# 不支持 GOSUMDB
```

### 百度

```shell
go env -w GOPROXY=https://goproxy.bj.bcebos.com/,direct
# 不支持 GOSUMDB
```
