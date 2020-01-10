



#### build.sh

```shell
#!/bin/bash

declare -a dts=("2019-08")

# year=${dt:0:4} month=${dt:5:2}
for dt in "${dts[@]}";
do
  year=${dt:0:4} 
  month=${dt:5:2}
  echo "partitioned by [Year = ${year}, Month = ${month} start to converting ..."
  hql="insert into benchmark.dmbout partition(year=${year}, month='${month}') select '$dt', d.merchant_no, d.member_id, d.account_name, d.detail_create_date, d.out_trade_no, d.account_balance, d.in_amount, d.out_amount, d.trade_desc, d.bill_date, d.ext_min, d.order_seq_no from benchmark.dmbout_orc d where d.detail_create_date like '$dt%';"
  
  #echo $hql

  hive -e "${hql}"
done
```



#### load.sh

```shell
#!/bin/bash

declare -a dts=("2019-08" "2015-11" "2014-09" "2016-05" "2019-01" "2019-09" "2014-05" "2015-01" "2016-04" "2017-12" "2018-11" "2016-11" "2019-06" "2014-11" "2019-04" "2018-12" "2016-01" "2016-07" "2015-07" "2016-06" "2014-04" "2014-10" "2015-09" "2019-12" "2014-12" "2014-06" "2014-07" "2018-04" "2018-01" "2015-04" "2015-06" "2019-02" "2016-08" "2017-01" "2018-09" "2018-07" "2015-03")

# year=${dt:0:4} month=${dt:5:2}
for dt in "${dts[@]}";
do
  year=${dt:0:4} 
  month=${dt:5:2}
  echo "partitioned by [Year = ${year}, Month = ${month} start to converting ..."
  hql="LOAD DATA INPATH 'hdfs://nn1:8020/benchmark/tmp/dmbout/year=${year}/month=${month}/*' INTO TABLE benchmark.dmbout PARTITION(year=${year}, month='${month}');;"
  
  #echo $hql

  hive -e "${hql}"
done
```



```shell
#!/bin/bash

declare -a dts=("2019-08")

# year=${dt:0:4} month=${dt:5:2}
for dt in "${dts[@]}";
do
  year=${dt:0:4} 
  month=${dt:5:2}
  echo "partitioned by [Year = ${year}, Month = ${month} start to converting ..."
  hql="LOAD DATA INPATH 'hdfs://nn1:8020/benchmark/tmp/dmbout/year=${year}/month=${month}/*' INTO TABLE benchmark.dmbout PARTITION(year=${year}, month='${month}');;"
  
  #echo $hql

  hive -e "${hql}"
done
```

