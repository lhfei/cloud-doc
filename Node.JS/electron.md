



> RequestError: connect ETIMEDOUT 20.205.243.166:443

```shell
yarn config set electron_mirror https://npmmirror.com/mirrors/electron/

npm config set ELECTRON_MIRROR https://npmmirror.com/mirrors/electron/
```



> Error: ENOSPC: System limit for number of file watchers reached

```bash
# insert the new value into the system config
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# check that the new value was applied
cat /proc/sys/fs/inotify/max_user_watches

# config variable name (not runnable)
fs.inotify.max_user_watches=524288
```

