### 同比、环比

1. 环比(MoM)：month-on-month

   环比，表示连续2个统计周期（比如连续两月）内的量的变化比。

   环比增长率=（本期数-上期数）/上期数×100%。 反映本期比上期增长了多少；环比发展速度，一般是指报告期水平与前一时期水平之比，表明现象逐期的发展速度。

   ```ini
   环比增长率 =（本期数 - 上期数) /上期数
   ```

2. 同比(YoY)：year-on-year

   同比一般情况下是今年第n月与去年第n月比。同比发展速度主要是为了消除季节变动的影响，用以说明本期发展水平与去年同期发展水平对比而达到的相对发展速度。如，本期2月比去年2月，本期6月比去年6月等。

   ```ini
   同比增长率 =（本期数 - 同期数) / 同期数
   ```

#### 1 

```sql
WITH toDate('2019-01-01') AS start_date
SELECT 
    toStartOfMonth(start_date + (number * 32)) AS date_time, 
    (number + 1) * 100 AS money
FROM numbers(16)
```

```ini
┌──date_time─┬─money─┐
│ 2019-01-01 │   100 │
│ 2019-02-01 │   200 │
│ 2019-03-01 │   300 │
│ 2019-04-01 │   400 │
│ 2019-05-01 │   500 │
│ 2019-06-01 │   600 │
│ 2019-07-01 │   700 │
│ 2019-08-01 │   800 │
│ 2019-09-01 │   900 │
│ 2019-10-01 │  1000 │
│ 2019-11-01 │  1100 │
│ 2019-12-01 │  1200 │
│ 2020-01-01 │  1300 │
│ 2020-02-01 │  1400 │
│ 2020-03-01 │  1500 │
│ 2020-04-01 │  1600 │
└────────────┴───────┘

16 rows in set. Elapsed: 0.002 sec.
```



#### 2

```sql
WITH toDate('2019-01-01') AS start_date
SELECT 
    toStartOfMonth(start_date + (number * 32)) AS date_time, 
    (number + 1) * 100 AS money, 
    neighbor(money, -12) AS prev_year
FROM numbers(16)
```

```ini
┌──date_time─┬─money─┬─prev_year─┐
│ 2019-01-01 │   100 │         0 │
│ 2019-02-01 │   200 │         0 │
│ 2019-03-01 │   300 │         0 │
│ 2019-04-01 │   400 │         0 │
│ 2019-05-01 │   500 │         0 │
│ 2019-06-01 │   600 │         0 │
│ 2019-07-01 │   700 │         0 │
│ 2019-08-01 │   800 │         0 │
│ 2019-09-01 │   900 │         0 │
│ 2019-10-01 │  1000 │         0 │
│ 2019-11-01 │  1100 │         0 │
│ 2019-12-01 │  1200 │         0 │
│ 2020-01-01 │  1300 │       100 │
│ 2020-02-01 │  1400 │       200 │
│ 2020-03-01 │  1500 │       300 │
│ 2020-04-01 │  1600 │       400 │
└────────────┴───────┴───────────┘

16 rows in set. Elapsed: 0.002 sec. 
```



#### 3

```sql
WITH toDate('2019-01-01') AS start_date
SELECT 
    toStartOfMonth(start_date + (number * 32)) AS date_time, 
    (number + 1) * 100 AS money, 
    neighbor(money, -12) AS prev_year, 
    neighbor(money, -1) AS prev_month, 
    if(prev_year = 0, -999, round((money - prev_year) / prev_year, 2)) AS year_over_year, 
    if(prev_month = 0, -999, round((money - prev_month) / prev_month, 2)) AS month_over_month
FROM numbers(16)
```

```ini
┌──date_time─┬─money─┬─prev_year─┬─prev_month─┬─year_over_year─┬─month_over_month─┐
│ 2019-01-01 │   100 │         0 │          0 │           -999 │             -999 │
│ 2019-02-01 │   200 │         0 │        100 │           -999 │                1 │
│ 2019-03-01 │   300 │         0 │        200 │           -999 │              0.5 │
│ 2019-04-01 │   400 │         0 │        300 │           -999 │             0.33 │
│ 2019-05-01 │   500 │         0 │        400 │           -999 │             0.25 │
│ 2019-06-01 │   600 │         0 │        500 │           -999 │              0.2 │
│ 2019-07-01 │   700 │         0 │        600 │           -999 │             0.17 │
│ 2019-08-01 │   800 │         0 │        700 │           -999 │             0.14 │
│ 2019-09-01 │   900 │         0 │        800 │           -999 │             0.12 │
│ 2019-10-01 │  1000 │         0 │        900 │           -999 │             0.11 │
│ 2019-11-01 │  1100 │         0 │       1000 │           -999 │              0.1 │
│ 2019-12-01 │  1200 │         0 │       1100 │           -999 │             0.09 │
│ 2020-01-01 │  1300 │       100 │       1200 │             12 │             0.08 │
│ 2020-02-01 │  1400 │       200 │       1300 │              6 │             0.08 │
│ 2020-03-01 │  1500 │       300 │       1400 │              4 │             0.07 │
│ 2020-04-01 │  1600 │       400 │       1500 │              3 │             0.07 │
└────────────┴───────┴───────────┴────────────┴────────────────┴──────────────────┘

16 rows in set. Elapsed: 0.003 sec. 
```







```sql
-- ceate table
CREATE TABLE default.test_mom
(
    `kprq` Date,
    `je` Decimal(10, 2)
)
ENGINE = MergeTree
ORDER BY kprq
SETTINGS index_granularity = 8192

-- init load test data
INSERT INTO `test_mom` (`kprq`, `je`)
WITH toDate ('2020-01-01') AS start_date
SELECT
  toStartOfMonth (start_date + (number * 32)) AS date_time,
  (number + 1) * 100 AS money
FROM
  numbers (34);
```

