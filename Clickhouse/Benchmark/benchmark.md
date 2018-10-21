

### DDL



```sql
create database benchmark;
use benchmark;
```





```sql
CREATE TABLE trips (
    trip_id                 UInt32,
    vendor_id               String,

    pickup_datetime         DateTime,
    dropoff_datetime        Nullable(DateTime),

    store_and_fwd_flag      Nullable(FixedString(1)),
    rate_code_id            Nullable(UInt8),
    pickup_longitude        Nullable(Float64),
    pickup_latitude         Nullable(Float64),
    dropoff_longitude       Nullable(Float64),
    dropoff_latitude        Nullable(Float64),
    passenger_count         Nullable(UInt8),
    trip_distance           Nullable(Float64),
    fare_amount             Nullable(Float32),
    extra                   Nullable(Float32),
    mta_tax                 Nullable(Float32),
    tip_amount              Nullable(Float32),
    tolls_amount            Nullable(Float32),
    ehail_fee               Nullable(Float32),
    improvement_surcharge   Nullable(Float32),
    total_amount            Nullable(Float32),
    payment_type            Nullable(String),
    trip_type               Nullable(UInt8),
    pickup                  Nullable(String),
    dropoff                 Nullable(String),

    cab_type                Nullable(String),

    precipitation           Nullable(Int8),
    snow_depth              Nullable(Int8),
    snowfall                Nullable(Int8),
    max_temperature         Nullable(Int8),
    min_temperature         Nullable(Int8),
    average_wind_speed      Nullable(Int8),

    pickup_nyct2010_gid     Nullable(Int8),
    pickup_ctlabel          Nullable(String),
    pickup_borocode         Nullable(Int8),
    pickup_boroname         Nullable(String),
    pickup_ct2010           Nullable(String),
    pickup_boroct2010       Nullable(String),
    pickup_cdeligibil       Nullable(FixedString(1)),
    pickup_ntacode          Nullable(String),
    pickup_ntaname          Nullable(String),
    pickup_puma             Nullable(String),

    dropoff_nyct2010_gid    Nullable(UInt8),
    dropoff_ctlabel         Nullable(String),
    dropoff_borocode        Nullable(UInt8),
    dropoff_boroname        Nullable(String),
    dropoff_ct2010          Nullable(String),
    dropoff_boroct2010      Nullable(String),
    dropoff_cdeligibil      Nullable(String),
    dropoff_ntacode         Nullable(String),
    dropoff_ntaname         Nullable(String),
    dropoff_puma            Nullable(String)
) ENGINE = Log;
```



### Load Data



```shell
touch trans.py
```

```python
import sys

for line in sys.stdin:
    print ','.join([item if len(item.strip()) else '\N'
                    for item in line.strip().split(',')])
```



> batch load

```shell
time (for filename in /export/app_data/trips_x*.csv.gz; do
            gunzip -c $filename | \
                python trans.py | \
                clickhouse-client -m -u default --password Lhfei -h 10.182.57.104 \
                    --query="INSERT INTO benchmark.trips FORMAT CSV"
        done)
```



```shell
cat file.csv | clickhouse-client -m -u default --password Lhfei -h 10.182.57.104 --database=benchmark --query="INSERT INTO trips FORMAT CSV";
```

