1、数据库连接报错

1.1、报错：

Could not connect to address=(host=127.0.0.1)(port=3306)(type=master) : Client does not support authentication protocol requested by server. plugin type was = 'caching_sha2_password'

![img](https://pic1.zhimg.com/80/v2-8ad44b798a80b1ced797ece500ce29c4_1440w.png)

解决办法：百度上的方法（更新加密方式）没有解决，最后在cmd上重新运行 java -jar metabase.jar，打开metabase数据库界面连接成功。

1.2、报错：

mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException: Public Key Retrieval is not allowed

原因:mysql8.0公钥问题，具体没有仔细研究（之前常用mysql5.0，mysql8.0使用较少）

解决办法：

添加：allowPublicKeyRetrieval=true

![img](https://pic3.zhimg.com/80/v2-ce25b4aa2662cc07da56778f13b8d3ca_1440w.jpg)



发布于 2021-11-23 17:04