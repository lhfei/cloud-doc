

> duckdb

duckdb.IOException: IO Error: Trying to read a database file with version number 64, but we can only read version 51.

```shell
```



> alembic.script.revision.ResolutionError: No such revision or branch '28a02d1811d7'

```shell
```



> Exception: model baichuan2-13b@huggingface(172.17.0.4:5000) start failed, 'BaichuanTokenizer' object has no attribute 'sp_model'

```shell
pip uninstall transformers
pip install transformers==4.33.1
```



>  alembic.util.exc.CommandError: Target database is not up to date.

```shell
delete files in `DB-GPT/pilot/meta_data/alembic/versions/` and restart.
```



> ERROR [pilot.model.cluster.worker.manager] Error starting worker manager: IO Error: Trying to read a database file with version number 64, but we can only read version 51.

ERROR [pilot.model.cluster.worker.manager] Error starting worker manager: IO Error: Trying to read a database file with version number 64, but we can only read version 51.

The database file was created with an newer version of DuckDB.

```shell
pip uninstall duckdb
pip install duckdb==0.9.1
```



> SetuptoolsDeprecationWarning: Invalid dash-separated options

```shell
pip install setuptools-scm
pip install seqeval
```





> Exception: model baichuan2-13b@huggingface(X.X.X.X:5000) start failed, not a string

```shell
pip uninstall transformers tokenizers

pip install transformers==4.33.1 
pip install tokenizers==0.13.3
```





> autoawq 0.1.7+cu118 requires transformers>=4.35.0, which is not installed.

```shell
```



> autoawq

```shell
pip install autoawq==0.1.5

pip install autoawq==0.1.3
```





> fastchat not found

```shell
pip3 install  --use-pep517 fschat
```

