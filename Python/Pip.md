#### 步骤

`pip config list` 查看当前 pip 的配置

接着修改配置文件

 ```shell
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
 ```

完成之后可以再使用 `pip config list` 查看是否已经写入，如果有显示我们 设置的信息的话，那么就设置成功了。



### 清华源

```shell
python -m pip install --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```



### 阿里源

```shell
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com
```



### 
