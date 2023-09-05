





```shell
mkdir -p /export/app_workspaces/h2o/h2ogpt/docs_db
```



```shell
scl enable devtoolset-11 bash
```



> dfd

```shell
python generate.py --base_model='llama' --prompt_type=wizard2 --score_model=None --langchain_mode='UserData' --user_path='/export/app_workspaces/h2o/h2ogpt/docs_db'
```



> llam2

```shell
python generate.py --base_model='llama' --prompt_type=llama2 --score_model=None --langchain_mode='UserData' --user_path='/export/app_workspaces/h2o/h2ogpt/docs_db'
```

```shell
python generate.py --base_model='llama' --prompt_type=llama2 --score_model=None --langchain_mode='UserData' --user_path=user_path
```

