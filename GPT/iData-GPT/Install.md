```shell
conda create -n twsk-gpt python=3.11
conda activate twsk-gpt
```





> .env

```ini
#*******************************************************************#
#**                  DATABASE SETTINGS                            **#
#*******************************************************************#
### SQLite database (Current default database)
#LOCAL_DB_PATH=data/default_sqlite.db
#LOCAL_DB_TYPE=sqlite

### MYSQL database
LOCAL_DB_TYPE=mysql
LOCAL_DB_NAME=idata_gpt
LOCAL_DB_USER=idatauser
LOCAL_DB_PASSWORD=IDatauser_1473
LOCAL_DB_HOST=182.43.54.95
LOCAL_DB_PORT=3306
```





> pilot/configs/model_config.py

```python


#MODEL_PATH = os.path.join(ROOT_PATH, "models")
MODEL_PATH = "/root/autodl-tmp/app_workspaces/MODELS/"
```





#### QWen

```shell
pip install transformers_stream_generator einops
```

