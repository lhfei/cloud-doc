

> Requirements

```ini
torch
records
numpy
tqdm
```





```shell
# checkout base code
git clone https://github.com/ZhuiyiTechnology/nl2sql_baseline.git

# download test data
git clone https://gitee.com/moxi159753/NL2SQL.git

# copy test datasets to nl2sql_baseline project
cp -a NL2SQL/data nl2sql_baseline/data

cd nl2sql_baseline
sh ./start_train.sh 0 128
```

