

### Install



### PostgreSQL

To use the PostgreSQL Yum Repository, follow these steps:

1. Select version: 109.69.59.49.3

2. Select platform: * Select your platformRedHat Enterprise Linux 7RedHat Enterprise Linux 6CentOS 7CentOS 6Scientific Linux 7Scientific Linux 6Fedora 28Fedora 27Fedora 26Fedora 6Oracle Enterprise Linux 7Oracle Enterprise Linux 6Amazon Linux AMI201503 6

3. Select architecture: x86_64i386

4. Install the repository RPM:

   ```
   yum install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm
   ```

5. Install the client packages:

   ```
   yum install postgresql96
   ```

6. Optionally install the server packages:

   ```
   yum install postgresql96-server
   ```

7. Optionally initialize the database and enable automatic start:

   ```
   service postgresql-9.6 initdb
   chkconfig postgresql-9.6 on
   service postgresql-9.6 start
   ```



## POST-INSTALLATION

Due to policies for Red Hat family distributions, the PostgreSQL installation will not be enabled for automatic start or have the database initialized automatically. To make your database installation complete, you need to perform the following steps, based on your distribution:

### FOR RHEL / CENTOS / SL / OL 5,6

```
  service postgresql initdb
  chkconfig postgresql on
```

### FOR RHEL / CENTOS / SL / OL 7 OR FEDORA 27 AND LATER DERIVED DISTRIBUTIONS:

```
  postgresql-setup initdb
  systemctl enable postgresql.service
  systemctl start postgresql.service
```



## DIRECT RPM DOWNLOAD

If you cannot, or do not want to, use the yum based installation method, all the RPMs that are in the yum repository are available for [direct download](https://yum.postgresql.org/rpmchart.php) and manual installation as well.

## CROSS DISTRIBUTION PACKAGES

Generic RPM and DEB packages that provide a server-only distribution are avaliable for some 32 and 64-bit Linux distributions. These packages provide a single set of binaries and consistent packaging across different Linux distributions. They are designed for server installation where a GUI is not available and consistency across multiple distributions is a requirement.

[Download](https://www.bigsql.org/postgresql/installers.jsp) the packages from BigSQL for all supported versions.

*Note:* The cross distribution packages do not fully integrate with the platform-specific packaging systems.

## INTERACTIVE INSTALLER BY ENTERPRISEDB

[Download the installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) certified by EnterpriseDB for all supported PostgreSQL versions.

This installer includes the PostgreSQL server, pgAdmin; a graphical tool for managing and developing your databases, and StackBuilder; a package manager that can be used to download and install additional PostgreSQL tools and drivers. Stackbuilder includes management, integration, migration, replication, geospatial, connectors and other tools.

This installer can run in graphical, command line, or silent install modes.

The installer is designed to be a straightforward, fast way to get up and running with PostgreSQL on Linux (Red Hat family Linux including CentOS/Fedora/Scientific/Oracle variants), Debian GNU/Linux and derivatives, Ubuntu Linux and derivatives, SuSE and OpenSuSE.

*Advanced users* can also download a [tar.gz archive](https://www.enterprisedb.com/download-postgresql-binaries) of the binaries, without the installer. This download is intended for users who wish to include PostgreSQL as part of another application installer.

*Note:* The installers do not integrate with platform-specific packaging systems.

### PLATFORM SUPPORT

The installers are tested by EnterpriseDB on the following platforms. They may also work on other variations or versions:

| PostgreSQL Version | 64 Bit Platforms              | 32 Bit Platforms             |
| ------------------ | ----------------------------- | ---------------------------- |
| 10                 | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.6                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.5                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.4                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.3                | RHEL / CentOS / OEL 6.x       | RHEL / CentOS / OEL 6.x      |
| 9.2                | RHEL / CentOS / OEL 6.x, 5.x  | RHEL / CentOS / OEL 6.x, 5.x |

## BUILD FROM SOURCE

The source code can be found in the main [file browser](https://www.postgresql.org/ftp/source/). Instructions for building from source can be found in the [documentation](https://www.postgresql.org/docs/current/static/installation.html).

### PostGis



```shell
yum install postgis2_96
yum install postgis2_96-client postgis2_96-utils postgis2_96-devel
```



PostGIS has many packaged installations, but if you are more adventurous and want to compile your own, refer to our source download and compilation instructions:

- [Source Download and Compile Instructions](https://postgis.net/source)

# Binary Installers

Binary distributions of PostGIS are available for various operating systems.

## Windows

- More details about getting up and running with windows can be found on [Windows Downloads](https://postgis.net/windows_downloads)page.

## OSX

- A popular distribution particularly for newbies is [Postgres.app](http://postgresapp.com/). It includes generally latest version of PostgreSQL, PostGIS, and PLV8. Great for development and testing. Do not mix with other installations.
- [Homebrew](http://brew.sh/) users can just run “brew install postgis” and tends to be a favorite for more advanced users since there are brew scripts for most of the popular PostgreSQL extensions, not always present in other Mac distributions.
- [BigSQL](https://www.openscg.com/bigsql/) distribution includes versions for MacOSX. It generally has latest version of PostGIS and ogrfdw.
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