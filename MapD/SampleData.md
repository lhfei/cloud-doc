



```shell
root@A01-R03-I185-75:/opt/mapd# sudo $MAPD_PATH/insert_sample_data
/opt/mapd/sample_datasets /opt/mapd
--2018-10-12 11:25:39--  https://data.mapd.com/manifest.tsv
Resolving data.mapd.com (data.mapd.com)... 72.28.97.165
Connecting to data.mapd.com (data.mapd.com)|72.28.97.165|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 192 [application/octet-stream]
Saving to: ‘manifest.tsv’

manifest.tsv                             100%[==================================================================================>]     192  --.-KB/s    in 0s      

2018-10-12 11:25:41 (27.0 MB/s) - ‘manifest.tsv’ saved [192/192]

/opt/mapd
Enter dataset number to download, or 'q' to quit:
 #     Dataset                   Rows    Table Name             File Name
 1)    Flights (2008)            7M      flights_2008_7M        flights_2008_7M.tar.gz
 2)    Flights (2008)            10k     flights_2008_10k       flights_2008_10k.tar.gz
 3)    NYC Tree Census (2015)    683k    nyc_trees_2015_683k    nyc_trees_2015_683k.tar.gz
1
/opt/mapd/sample_datasets /opt/mapd
- downloading and extracting flights_2008_7M.tar.gz
--2018-10-12 11:26:20--  https://data.mapd.com/flights_2008_7M.tar.gz
Resolving data.mapd.com (data.mapd.com)... 72.28.97.165
Connecting to data.mapd.com (data.mapd.com)|72.28.97.165|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 377039522 (360M) [application/octet-stream]
Saving to: ‘flights_2008_7M.tar.gz’

flights_2008_7M.tar.gz                   100%[==================================================================================>] 359.57M  4.79MB/s    in 75s     

2018-10-12 11:27:37 (4.81 MB/s) - ‘flights_2008_7M.tar.gz’ saved [377039522/377039522]

flights_2008_7M/
flights_2008_7M/flights_2008_7M.csv
flights_2008_7M/flights_2008_7M.sql
/opt/mapd
- adding schema
User mapd connected to database mapd
User mapd disconnected from database mapd
- inserting file: /opt/mapd/sample_datasets/flights_2008_7M/flights_2008_7M.csv
User mapd connected to database mapd
Result
Loaded: 7009728 recs, Rejected: 0 recs in 30.328000 secs
User mapd disconnected from database mapd
```

