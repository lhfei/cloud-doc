

Set **ClashX** proxy for Clojure project:

```shell
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
```



> WIndows PowerShell (With Administrator model)

```powershell
netsh winhttp set proxy "127.0.0.1:7890"
```





Add Git Proxy

```shell
git config --global http.proxy http://127.0.0.1:7890
```

