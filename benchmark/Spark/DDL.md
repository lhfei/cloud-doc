

### DDL

```sql
CREATE EXTERNAL TABLE trips_csv (
    trip_id                 INT,
    vendor_id               VARCHAR(3),
    pickup_datetime         TIMESTAMP,
    dropoff_datetime        TIMESTAMP,
    store_and_fwd_flag      VARCHAR(1),
    rate_code_id            SMALLINT,
    pickup_longitude        DECIMAL(18,14),
    pickup_latitude         DECIMAL(18,14),
    dropoff_longitude       DECIMAL(18,14),
    dropoff_latitude        DECIMAL(18,14),
    passenger_count         SMALLINT,
    trip_distance           DECIMAL(6,3),
    fare_amount             DECIMAL(6,2),
    extra                   DECIMAL(6,2),
    mta_tax                 DECIMAL(6,2),
    tip_amount              DECIMAL(6,2),
    tolls_amount            DECIMAL(6,2),
    ehail_fee               DECIMAL(6,2),
    improvement_surcharge   DECIMAL(6,2),
    total_amount            DECIMAL(6,2),
    payment_type            VARCHAR(3),
    trip_type               SMALLINT,
    pickup                  VARCHAR(50),
    dropoff                 VARCHAR(50),

    cab_type                VARCHAR(6),

    precipitation           SMALLINT,
    snow_depth              SMALLINT,
    snowfall                SMALLINT,
    max_temperature         SMALLINT,
    min_temperature         SMALLINT,
    average_wind_speed      SMALLINT,

    pickup_nyct2010_gid     SMALLINT,
    pickup_ctlabel          VARCHAR(10),
    pickup_borocode         SMALLINT,
    pickup_boroname         VARCHAR(13),
    pickup_ct2010           VARCHAR(6),
    pickup_boroct2010       VARCHAR(7),
    pickup_cdeligibil       V
    ARCHAR(1),
    pickup_ntacode          VARCHAR(4),
    pickup_ntaname          VARCHAR(56),
    pickup_puma             VARCHAR(4),

    dropoff_nyct2010_gid    SMALLINT,
    dropoff_ctlabel         VARCHAR(10),
    dropoff_borocode        SMALLINT,
    dropoff_boroname        VARCHAR(13),
    dropoff_ct2010          VARCHAR(6),
    dropoff_boroct2010      VARCHAR(7),
    dropoff_cdeligibil      VARCHAR(1),
    dropoff_ntacode         VARCHAR(4),
    dropoff_ntaname         VARCHAR(56),
    dropoff_puma            VARCHAR(4)
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
  LOCATION 's3://taxis2/csv/';
```



#### Parquet

```sql
CREATE EXTERNAL TABLE trips_parquet (
    trip_id                 INT,
    vendor_id               STRING,
    pickup_datetime         TIMESTAMP,
    dropoff_datetime        TIMESTAMP,
    store_and_fwd_flag      STRING,
    rate_code_id            SMALLINT,
    pickup_longitude        DOUBLE,
    pickup_latitude         DOUBLE,
    dropoff_longitude       DOUBLE,
    dropoff_latitude        DOUBLE,
    passenger_count         SMALLINT,
    trip_distance           DOUBLE,
    fare_amount             DOUBLE,
    extra                   DOUBLE,
    mta_tax                 DOUBLE,
    tip_amount              DOUBLE,
    tolls_amount            DOUBLE,
    ehail_fee               DOUBLE,
    improvement_surcharge   DOUBLE,
    total_amount            DOUBLE,
    payment_type            STRING,
    trip_type               SMALLINT,
    pickup                  STRING,
    dropoff                 STRING,

    cab_type                STRING,

    precipitation           SMALLINT,
    snow_depth              SMALLINT,
    snowfall                SMALLINT,
    max_temperature         SMALLINT,
    min_temperature         SMALLINT,
    average_wind_speed      SMALLINT,

    pickup_nyct2010_gid     SMALLINT,
    pickup_ctlabel          STRING,
    pickup_borocode         SMALLINT,
    pickup_boroname         STRING,
    pickup_ct2010           STRING,
    pickup_boroct2010       STRING,
    pickup_cdeligibil       STRING,
    pickup_ntacode          STRING,
    pickup_ntaname          STRING,
    pickup_puma             STRING,

    dropoff_nyct2010_gid    SMALLINT,
    dropoff_ctlabel         STRING,
    dropoff_borocode        SMALLINT,
    dropoff_boroname        STRING,
    dropoff_ct2010          STRING,
    dropoff_boroct2010      STRING,
    dropoff_cdeligibil      STRING,
    dropoff_ntacode         STRING,
    dropoff_ntaname         STRING,
    dropoff_puma            STRING
) STORED AS parquet
  TBLPROPERTIES ("parquet.compression"="SNAPPY");
```

