2.查看npm源地址设置：（默认官方镜像地址）

```shell
npm config get registry
```

https://registry.npmjs.org/
3.配置阿里巴巴镜像地址：（推荐，速度够快，同步频率快，稳定）
阿里云官方镜像站：https://developer.aliyun.com/mirror/
Npm阿里云地址：
[http://www.npmmirror.com](http://www.npmmirror.com/)

```shell
npm config set registry https://registry.npmmirror.com
```



原淘宝 npm 域名即将停止解析，正如在《淘宝 NPM 镜像站喊你切换新域名啦》 中预告的那样：[http://npm.taobao.org](http://npm.taobao.org/) 和 [http://registry.npm.taobao.org](http://registry.npm.taobao.org/) 将在 2022.06.30 号正式下线和停止 DNS 解析。域名切换规则：
[http://npm.taobao.org](http://npm.taobao.org/) => [http://npmmirror.com](http://npmmirror.com/)
[http://registry.npm.taobao.org](http://registry.npm.taobao.org/) => [http://registry.npmmirror.com](http://registry.npmmirror.com/)

4.如果需要解除镜像并恢复到官方源，请执行以下命令：

```shell
npm config set registry https://registry.npmjs.org
```

