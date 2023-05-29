

| Table                                           | Rows         | Comments |
| ----------------------------------------------- | ------------ | -------- |
| ck_zh_customer_all_deal_user_cycle_repurchase_d | 440203472719 |          |
| ck_product_browselog_base_d                     | 98749156954  |          |
| ck_flow_browselog_base_d                        | 84072147373  |          |
| ck_zh_customer_all_deal_user_cycle_repurchase   | 66784175798  |          |
| ck_flow_cartlog_base_d                          | 19155827421  |          |
|                                                 |              |          |



## ck_zh_customer_all_deal_user_cycle_repurchase_d

### Desc:

```ini
DESCRIBE TABLE ck_zh_customer_all_deal_user_cycle_repurchase_d

┌─name────────────┬─type───┬─default_type─┬─default_expression─┐
│ repurchaseNum   │ Int64  │              │                    │
│ brandId         │ String │              │                    │
│ dateTime        │ String │              │                    │
│ userLogAcct     │ String │              │                    │
│ thirdIndId      │ String │              │                    │
│ repurchaseCycle │ String │              │                    │
└─────────────────┴────────┴──────────────┴────────────────────┘

6 rows in set. Elapsed: 0.001 sec. 

```



### DDL:

```sql
CREATE TABLE bc_online.ck_zh_customer_all_deal_user_cycle_repurchase_d ( repurchaseNum Int64, brandId String, dateTime String, userLogAcct String, thirdIndId String, repurchaseCycle String) ENGINE = Distributed(conf_6shard_2replica, bc_online, ck_zh_customer_all_deal_user_cycle_repurchase, rand())
```



### DML

- [x] count rows: 

```sql
select count(*) from bc_online.ck_zh_customer_all_deal_user_cycle_repurchase_d
```

- [x] result:

```shell
SELECT count(*)
FROM bc_online.ck_zh_customer_all_deal_user_cycle_repurchase_d 

┌──────count()─┐
│ 440203472719 │
└──────────────┘

1 rows in set. Elapsed: 223.010 sec. Processed 440.20 billion rows, 3.52 TB (1.97 billion rows/s., 15.79 GB/s.) 
```





## ck_product_browselog_base_d

## Desc

```ini
DESCRIBE TABLE ck_product_browselog_base_d

┌─name──────────┬─type──────────┬─default_type─┬─default_expression─┐
│ browserUniqId │ String        │              │                    │
│ dateTime      │ String        │              │                    │
│ terminalId    │ String        │              │                    │
│ virtualId     │ Array(String) │              │                    │
│ skuId         │ String        │              │                    │
│ pv            │ Float64       │              │                    │
│ thirdIndId    │ String        │              │                    │
│ brandId       │ String        │              │                    │
│ shopId        │ String        │              │                    │
│ sessionRt     │ Float64       │              │                    │
│ shopType      │ String        │              │                    │
└───────────────┴───────────────┴──────────────┴────────────────────┘

11 rows in set. Elapsed: 0.001 sec. 
```



### DDL

```sql
CREATE TABLE bc_online.ck_product_browselog_base_d ( browserUniqId String,  dateTime String,  terminalId String,  virtualId Array(String),  skuId String,  pv Float64,  thirdIndId String,  brandId String,  shopId String,  sessionRt Float64,  shopType String) ENGINE = Distributed(conf_6shard_2replica, bc_online, ck_product_browselog_base, rand())
```



### DML

- [x] count rows:

```sql
select count(*) from bc_online.ck_product_browselog_base_d
```

- [x] result:

```ini
SELECT count(*)
FROM bc_online.ck_product_browselog_base_d 

┌─────count()─┐
│ 98749156954 │
└─────────────┘

1 rows in set. Elapsed: 73.700 sec. Processed 98.75 billion rows, 789.99 GB (1.34 billion rows/s., 10.72 GB/s.) 
```





## ck_flow_browselog_base_d

### Desc

```ini
DESCRIBE TABLE ck_flow_browselog_base_d

┌─name─────────────────┬─type──────────┬─default_type─┬─default_expression─┐
│ firstSourceName      │ String        │              │                    │
│ flagId               │ String        │              │                    │
│ browserUniqId        │ String        │              │                    │
│ dateTime             │ String        │              │                    │
│ secondSourceName     │ String        │              │                    │
│ flagUrl              │ String        │              │                    │
│ terminalId           │ String        │              │                    │
│ virtualId            │ Array(String) │              │                    │
│ firstSourceId        │ String        │              │                    │
│ userLogAcct          │ String        │              │                    │
│ thirdSourceId        │ String        │              │                    │
│ secondSourceId       │ String        │              │                    │
│ thirdIndId           │ String        │              │                    │
│ userSiteProvinceName │ String        │              │                    │
│ brandId              │ String        │              │                    │
│ shopId               │ String        │              │                    │
│ flagType             │ String        │              │                    │
│ flagName             │ String        │              │                    │
│ thirdSourceName      │ String        │              │                    │
│ sessionRt            │ Int64         │              │                    │
│ skuId                │ String        │              │                    │
│ flagValueStatus      │ String        │              │                    │
│ shopType             │ String        │              │                    │
└──────────────────────┴───────────────┴──────────────┴────────────────────┘

23 rows in set. Elapsed: 0.001 sec. 
```



### DDL

```sql
CREATE TABLE bc_online.ck_flow_browselog_base_d ( firstSourceName String,  flagId String,  browserUniqId String,  dateTime String,  secondSourceName String,  flagUrl String,  terminalId String,  virtualId Array(String),  firstSourceId String,  userLogAcct String,  thirdSourceId String,  secondSourceId String,  thirdIndId String,  userSiteProvinceName String,  brandId String,  shopId String,  flagType String,  flagName String,  thirdSourceName String,  sessionRt Int64,  skuId String,  flagValueStatus String,  shopType String) ENGINE = Distributed(conf_6shard_2replica, bc_online, ck_flow_browselog_base, rand())
```



### DML

count rows:

```sql
select count(*) from bc_online.ck_flow_browselog_base_d
```

result:

```ini
SELECT count(*)
FROM bc_online.ck_flow_browselog_base_d 

┌─────count()─┐
│ 84072147373 │
└─────────────┘

1 rows in set. Elapsed: 24.415 sec. Processed 84.07 billion rows, 672.58 GB (3.44 billion rows/s., 27.55 GB/s.) 
```







## ck_zh_customer_all_deal_user_cycle_repurchase

### Desc

```ini
DESCRIBE TABLE ck_zh_customer_all_deal_user_cycle_repurchase

┌─name────────────┬─type───┬─default_type─┬─default_expression─┐
│ repurchaseNum   │ Int64  │              │                    │
│ brandId         │ String │              │                    │
│ dateTime        │ String │              │                    │
│ userLogAcct     │ String │              │                    │
│ thirdIndId      │ String │              │                    │
│ repurchaseCycle │ String │              │                    │
└─────────────────┴────────┴──────────────┴────────────────────┘

6 rows in set. Elapsed: 0.001 sec. 
```



### DDL

```sql
CREATE TABLE bc_online.ck_zh_customer_all_deal_user_cycle_repurchase ( repurchaseNum Int64,  brandId String,  dateTime String,  userLogAcct String,  thirdIndId String,  repurchaseCycle String) ENGINE = ReplicatedMergeTree(\'/ppzhck.test.local/tables/bc_online/ck_zh_customer_all_deal_user_cycle_repurchase/{shard}\', \'{replica}\') PARTITION BY dateTime ORDER BY (dateTime, thirdIndId, brandId, repurchaseCycle) SETTINGS index_granularity = 8192
```





### DML

- [x] count rows:

```sql
select count(*) from ck_zh_customer_all_deal_user_cycle_repurchase; 
```



- [x] result:

```ini
SELECT count(*)
FROM ck_zh_customer_all_deal_user_cycle_repurchase 

┌─────count()─┐
│ 66784175798 │
└─────────────┘

1 rows in set. Elapsed: 102.081 sec. Processed 66.78 billion rows, 534.27 GB (654.23 million rows/s., 5.23 GB/s.)
```



## ck_flow_cartlog_base_d

### Desc

```ini
DESCRIBE TABLE ck_flow_cartlog_base_d

┌─name─────────────┬─type──────────┬─default_type─┬─default_expression─┐
│ firstSourceName  │ String        │              │                    │
│ flagId           │ String        │              │                    │
│ cartDt           │ String        │              │                    │
│ dt               │ String        │              │                    │
│ secondSourceName │ String        │              │                    │
│ flagUrl          │ String        │              │                    │
│ terminalId       │ String        │              │                    │
│ virtualId        │ Array(String) │              │                    │
│ firstSourceId    │ String        │              │                    │
│ userLogAcct      │ String        │              │                    │
│ thirdSourceId    │ String        │              │                    │
│ secondSourceId   │ String        │              │                    │
│ thirdIndId       │ String        │              │                    │
│ brandId          │ String        │              │                    │
│ dateTime         │ String        │              │                    │
│ shopId           │ String        │              │                    │
│ flagType         │ String        │              │                    │
│ flagName         │ String        │              │                    │
│ shopType         │ String        │              │                    │
│ thirdSourceName  │ String        │              │                    │
│ skuId            │ String        │              │                    │
│ flagValueStatus  │ String        │              │                    │
└──────────────────┴───────────────┴──────────────┴────────────────────┘

22 rows in set. Elapsed: 0.001 sec. 
```



### DDL

```sql
 CREATE TABLE bc_online.ck_flow_cartlog_base_d ( firstSourceName String,  flagId String,  cartDt String,  dt String,  secondSourceName String,  flagUrl String,  terminalId String,  virtualId Array(String),  firstSourceId String,  userLogAcct String,  thirdSourceId String,  secondSourceId String,  thirdIndId String,  brandId String,  dateTime String,  shopId String,  flagType String,  flagName String,  shopType String,  thirdSourceName String,  skuId String,  flagValueStatus String) ENGINE = Distributed(conf_6shard_2replica, bc_online, ck_flow_cartlog_base, rand())
```



### DML

- [x] count rows:

```sql
select count(*) from bc_online.ck_flow_cartlog_base_d
```

- [x] result:

```ini
SELECT count(*)
FROM bc_online.ck_flow_cartlog_base_d 

┌─────count()─┐
│ 19155827421 │
└─────────────┘

1 rows in set. Elapsed: 12.031 sec. Processed 19.16 billion rows, 402.83 GB (1.59 billion rows/s., 33.48 GB/s.) 

```

