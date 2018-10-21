

> TRIPS
>
>

```sql
CREATE TABLE trips (
    vendor_id               String,
    pickup_datetime         DateTime,
    dropoff_datetime        Nullable(DateTime),
    passenger_count         Nullable(UInt8),
    trip_distance           Nullable(Float64),
    pickup_longitude        Nullable(Float64),
    pickup_latitude         Nullable(Float64),
    rate_code_id            Nullable(UInt8),
    store_and_fwd_flag      Nullable(FixedString(1)),
    dropoff_longitude       Nullable(Float64),
    dropoff_latitude        Nullable(Float64),
    payment_type            Nullable(String),
    fare_amount             Nullable(Float32),
    improvement_surcharge   Nullable(Float32),
    mta_tax                 Nullable(Float32),
    tip_amount              Nullable(Float32),
    tolls_amount            Nullable(Float32),
    total_amount            Nullable(Float32)
) ENGINE = Log;
```







```sql
CREATE EXTENSION postgis;

CREATE TABLE green_tripdata_staging (

  id serial primary key,

  vendor_id varchar,

  lpep_pickup_datetime varchar,

  lpep_dropoff_datetime varchar,

  store_and_fwd_flag varchar,

  rate_code_id varchar,

  pickup_longitude numeric,

  pickup_latitude numeric,

  dropoff_longitude numeric,

  dropoff_latitude numeric,

  passenger_count varchar,

  trip_distance varchar,

  fare_amount varchar,

  extra varchar,

  mta_tax varchar,

  tip_amount varchar,

  tolls_amount varchar,

  ehail_fee varchar,

  improvement_surcharge varchar,

  total_amount varchar,

  payment_type varchar,

  trip_type varchar,

  pickup_location_id varchar,

  dropoff_location_id varchar,

  junk1 varchar,

  junk2 varchar

);

/*

N.B. junk columns are there because some tripdata file headers are

inconsistent with the actual data, e.g. header says 20 or 21 columns per row,

but data actually has 22 or 23 columns per row, which COPY doesn't like.

junk1 and junk2 should always be null

*/

CREATE TABLE yellow_tripdata_staging (

  id serial primary key,

  vendor_id varchar,

  tpep_pickup_datetime varchar,

  tpep_dropoff_datetime varchar,

  passenger_count varchar,

  trip_distance varchar,

  pickup_longitude numeric,

  pickup_latitude numeric,

  rate_code_id varchar,

  store_and_fwd_flag varchar,

  dropoff_longitude numeric,

  dropoff_latitude numeric,

  payment_type varchar,

  fare_amount varchar,

  extra varchar,

  mta_tax varchar,

  tip_amount varchar,

  tolls_amount varchar,

  improvement_surcharge varchar,

  total_amount varchar,

  pickup_location_id varchar,

  dropoff_location_id varchar,

  junk1 varchar,

  junk2 varchar

);

CREATE TABLE uber_trips_2014 (

  id serial primary key,

  pickup_datetime timestamp without time zone,

  pickup_latitude numeric,

  pickup_longitude numeric,

  base_code varchar

);

CREATE TABLE fhv_trips (

  id serial primary key,

  dispatching_base_num varchar,

  pickup_datetime timestamp without time zone,

  dropoff_datetime timestamp without time zone,

  pickup_location_id integer,

  dropoff_location_id integer

);

CREATE TABLE fhv_bases (

  base_number varchar primary key,

  base_name varchar,

  dba varchar,

  dba_category varchar

);

CREATE INDEX index_fhv_bases_on_dba_category ON fhv_bases (dba_category);

CREATE TABLE cab_types (

  id serial primary key,

  type varchar

);

INSERT INTO cab_types (type) SELECT 'yellow';

INSERT INTO cab_types (type) SELECT 'green';

CREATE TABLE trips (

  id serial primary key,

  cab_type_id integer,

  vendor_id varchar,

  pickup_datetime timestamp without time zone,

  dropoff_datetime timestamp without time zone,

  store_and_fwd_flag char(1),

  rate_code_id integer,

  pickup_longitude numeric,

  pickup_latitude numeric,

  dropoff_longitude numeric,

  dropoff_latitude numeric,

  passenger_count integer,

  trip_distance numeric,

  fare_amount numeric,

  extra numeric,

  mta_tax numeric,

  tip_amount numeric,

  tolls_amount numeric,

  ehail_fee numeric,

  improvement_surcharge numeric,

  total_amount numeric,

  payment_type varchar,

  trip_type integer,

  pickup_nyct2010_gid integer,

  dropoff_nyct2010_gid integer,

  pickup_location_id integer,

  dropoff_location_id integer

);

SELECT AddGeometryColumn('trips', 'pickup', 4326, 'POINT', 2);

SELECT AddGeometryColumn('trips', 'dropoff', 4326, 'POINT', 2);

CREATE TABLE central_park_weather_observations (

  station_id varchar,

  station_name varchar,

  date date,

  precipitation numeric,

  snow_depth numeric,

  snowfall numeric,

  max_temperature numeric,

  min_temperature numeric,

  average_wind_speed numeric

);

CREATE UNIQUE INDEX index_weather_observations ON central_park_weather_observations (date);

```

