



### Required

```shell
yum install libicu libicu-devel
```



> install with order by:

```shell
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-libs-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-libs-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-libs-10.5-1PGDG.rhel################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-10.5-1PGDG.rhel7.x86_64.rpm 
\warning: postgresql10-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-10.5-1PGDG.rhel7    ################################# [100%]
You have new mail in /var/spool/mail/root
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-server-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-server-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-server-10.5-1PGDG.rh################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-contrib-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-contrib-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-contrib-10.5-1PGDG.r################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-10.5-1PGDG.rhel7.x86_64.rpm
warning: postgresql10-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
        package postgresql10-10.5-1PGDG.rhel7.x86_64 is already installed
```



## [PostGis](https://postgis.net/install/)

### Compiling from Source

PostGIS has many packaged installations, but if you are more adventurous and want to compile your own, refer to our source download and compilation instructions:

- [Source Download and Compile Instructions](https://postgis.net/source)

# Binary Installers

Binary distributions of PostGIS are available for various operating systems.

## Windows

- More details about getting up and running with windows can be found on [Windows Downloads](https://postgis.net/windows_downloads) page.

## OSX

- A popular distribution particularly for newbies is [Postgres.app](http://postgresapp.com/). It includes generally latest version of PostgreSQL, PostGIS, and PLV8. Great for development and testing. Do not mix with other installations.
- [Homebrew](http://brew.sh/) users can just run “brew install postgis” and tends to be a favorite for more advanced users since there are brew scripts for most of the popular PostgreSQL extensions, not always present in other Mac distributions.
- The [EnterpriseDb OSX PostgreSQL](http://www.enterprisedb.com/products-services-training/pgdownload) combination from EnterpriseDB includes generally latest stable minor version of PostGIS.
- The [builds from KyngChaos](http://www.kyngchaos.com/software/postgres) are a little dated but useful for older PostGIS versions. Read the instructions carefully. Do not mix with other installations.

## Red Hat / Centos / Scientific Linux

- The best place to get the latest binaries for both PostgreSQL and PostGIS is the

   

  PostgreSQL Yum repository

  1. Choose the correct “[repository RPM](http://yum.postgresql.org/repopackages.php)” for your distribution, download and install it.
  2. Install PostGIS and dependencies by running `yum install postgis2_93`. (where 93 refers to minor version of PostgreSQL you installed.
  3. Refer to [Install PostgreSQL 9.5, PostGIS 2.2, pgRouting 2.1 with Yum](http://www.postgresonline.com/journal/archives/362-An-almost-idiots-guide-to-install-PostgreSQL-9.5,-PostGIS-2.2-and-pgRouting-2.1.0-with-Yum.html) for more detailed instructions.

## Ubuntu / Debian

- [UbuntuGIS](https://wiki.ubuntu.com/UbuntuGIS) project has PostGIS and other OSGeo project offerings
- The PostgreSQL build team has packages for Debian and Ubuntu for several versions of PostgreSQL and PostGIS [APT repository](https://wiki.postgresql.org/wiki/Apt) for PostgreSQL builds. [PostgreSQL Apt Repo PostGIS 2.4 install covers 10](http://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt)
- The [Debian GIS](https://pkg-grass.alioth.debian.org/) project maintains [PostGIS packaging](https://tracker.debian.org/postgis) for Debian also used by Ubuntu and UbuntuGIS.

## OpenSUSE and SUSE

- [OpenSUSE PostGIS 2.1](http://software.opensuse.org/package/postgis21) For OpenSUSE 13.1, 12.3, Tumbleweed, SUSE SLE-11 SP 3

## Distributions targeting more than one OS (these include PostgreSQL and many other PostgreSQL extensions)

- [BigSQL](http://www.bigsql.org/postgresql/installers.jsp) - Supports 64-bit for Linux (RedHat, Debian), MacOSX 64-bit, and Windows 64-bit. It generally has latest version of PostGIS and ogrfdw for all OS supported. As such, it’s ideal if you have users on different OS and want a consistent set of PostGIS related features for all. Refer to [BigSQL: PostGIS Install](http://www.bigsql.org/docs/postgis/postgis.jsp) and [BigSQL: How to create a Spatial Database](https://www.openscg.com/2017/02/postgis-how-to-create-a-spatial-database-with-pgc-command-line/) for PostGIS specific install instructions.
- [EnterpriseDb PostgreSQL](http://www.enterprisedb.com/products-services-training/pgdownload) - Supports 32-bit/64-bit Linux, MacOSX, Windows Note that the MacOSX PostGIS package and EDB Windows PostGIS package have different maintainers, so offerings are not equivalent. Both versions generally have latest minor version of PostGIS, but versions of libraries used may be different, other PostGIS related extensions like pgRouting, postgis_sfcgal are packaged with the windows but not OSX version.

## Additional Install Guides

- [Source, Yum and other installs for latest and older versions of PostGIS](http://trac.osgeo.org/postgis/wiki/UsersWikiInstall)

# Getting Started

These instructions are for PostgreSQL 9.1 and higher, PostGIS 2.2 and higher that is compiled with raster support. Note: if you have postgis, without raster support, you can not use CREATE EXTENSION. Refer to [PostGIS install](https://postgis.net/docs/postgis_installation.html#install_short_version).

## Enabling PostGIS

PostGIS is an optional extension that must be enabled in each database you want to use it in before you can use it. Installing the software is just the first step. DO NOT INSTALL it in the database called `postgres`.

Connect to your database with `psql` or PgAdmin. Run the following SQL. You need only install the features you want:

```
-- Enable PostGIS (as of 3.0 contains just geometry/geography)
CREATE EXTENSION postgis;
-- enable raster support (for 3+)
CREATE EXTENSION postgis_raster;
-- Enable Topology
CREATE EXTENSION postgis_topology;
-- Enable PostGIS Advanced 3D
-- and other geoprocessing algorithms
-- sfcgal not available with all distributions
CREATE EXTENSION postgis_sfcgal;
-- fuzzy matching needed for Tiger
CREATE EXTENSION fuzzystrmatch;
-- rule based standardizer
CREATE EXTENSION address_standardizer;
-- example rule data set
CREATE EXTENSION address_standardizer_data_us;
-- Enable US Tiger Geocoder
CREATE EXTENSION postgis_tiger_geocoder;
```

## Upgrading PostGIS

To upgrade PostGIS, you first have to install the latest binaries and then upgrade each database you have PostGIS installed in

For example connect to database you want to upgrade and if you just installed binaries for 2.1.3 You can upgrade from 2.0 to 2.1, 2.2 et.c using this approach. To go from 1.* to 2.* you need to do a hard upgrade. Refer to [PostGIS install](https://postgis.net/docs/postgis_installation.html#install_short_version) for more extensive instructions. Note: that as of PostGIS 2.1.3 and PostGIS 2.0.6, you need to set [environment variables](https://postgis.net/install/2014/05/19/postgis-2.0.6_and_2.1.3) to get full features.

```
-- Upgrade PostGIS (includes raster) to latest version
ALTER EXTENSION postgis UPDATE;
ALTER EXTENSION postgis_topology UPDATE;
```

or to a specific version

```
-- Upgrade PostGIS (includes raster)
ALTER EXTENSION postgis
 UPDATE TO "3.0.1";
-- Upgrade Topology
ALTER EXTENSION postgis_topology
 UPDATE TO "3.0.1";
 
-- Upgrade US Tiger Geocoder
ALTER EXTENSION postgis_tiger_geocoder
 UPDATE TO "3.0.1";
```

## Spatial SQL

See the [documentation](https://postgis.net/documentation) for more guidance.

```
-- Create table with spatial column
CREATE TABLE mytable (
  id SERIAL PRIMARY KEY,
  geom GEOMETRY(Point, 26910),
  name VARCHAR(128)
);
 
-- Add a spatial index
CREATE INDEX mytable_gix
  ON mytable
  USING GIST (geom);
 
-- Add a point
INSERT INTO mytable (geom) VALUES (
  ST_GeomFromText('POINT(0 0)', 26910)
);
 
-- Query for nearby points
SELECT id, name
FROM mytable
WHERE ST_DWithin(
  geom,
  ST_GeomFromText('POINT(0 0)', 26910),
  1000
);
```