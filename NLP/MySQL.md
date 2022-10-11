https://blog.csdn.net/fonnn/article/details/106389196





```
OSError: mysql_config not found
```





```shell
brew install mysql-client
echo 'export PATH="/usr/local/opt/mysql-client/bin:$PATH"' >> ~/.bash_profile
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
pip install mysqlclient
```

