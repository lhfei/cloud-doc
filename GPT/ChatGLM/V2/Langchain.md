



```ini
pip install setuptools-scm
pip install PyMySQL
```



#### KB Storage

> kb_config.py

```python
SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://idatauser:IDatauser_1473@dlink-app-08/gpt_idata"
```





WebUI

> /etc/sysctl.conf

```ini
fs.inotify.max_user_watches=99999999
```



```shell
streamlit run webui.py --server.fileWatcherType none
```

