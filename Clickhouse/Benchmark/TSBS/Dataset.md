



```shell
./bin/tsbs_generate_data --use-case="iot" --seed=123 --scale=4000 \
    --timestamp-start="2021-01-01T00:00:00Z" \
    --timestamp-end="2022-07-01T00:00:00Z" \
    --log-interval="10s" --format="timescaledb" \
    | gzip > /export/tmp/timescaledb-data.gz
```



```shell
nohup ./bin/tsbs_generate_data --use-case="iot" --seed=123 --scale=4000 \
    --timestamp-start="2021-01-01T00:00:00Z" \
    --timestamp-end="2022-07-01T00:00:00Z" \
    --log-interval="10s" --format="timescaledb" \
    | gzip > /export/tmp/timescaledb-data.gz 2>&1 &
```

