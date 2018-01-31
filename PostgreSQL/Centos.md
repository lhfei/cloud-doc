# Linux downloads (Red Hat family)

The Red Hat family of distributions includes Red Hat Enterprise Linux, CentOS, Fedora, Scientific Linux, Oracle Linux and others. PostgreSQL is available on these platforms by default. However, each version of the platform normally "snapshots" a specific version of PostgreSQL that is then supported throughout the lifetime of this platform. Since this can often mean a different version than preferred, the PostgreSQL project provides a [repository](https://www.postgresql.org/download/linux/redhat/#yum) of packages of all supported versions for the most common distributions.

## PostgreSQL Yum Repository

This repository will integrate with your normal systems and patch management, and provide automatic updates for all supported versions of PostgreSQL throughout the support [lifetime](https://www.postgresql.org/support/versioning/) of PostgreSQL.

The PostgreSQL yum repository currently supports Red Hat Enterprise Linux, CentOS, Oracle Enterprise Linux and Scientific Linux, as well as current versions of Fedora. Note that due to the shorter support cycle on Fedora, all versions are not available on this platform, and we recommend not using Fedora for server deployments.

To use the yum repository, follow these steps:

- Select version: 109.69.59.49.3
- Select platform: * Select your platformRedHat Enterprise Linux 7RedHat Enterprise Linux 6CentOS 7CentOS 6Scientific Linux 7Scientific Linux 6Fedora 27Fedora 26Fedora 25Oracle Enterprise Linux 7Oracle Enterprise Linux 6
- Select architecture: x86_64ppc64le
- Install the repository RPM:`yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-1.noarch.rpm`
- Install the client packages:`yum install postgresql10`
- Optionally install the server packages:`yum install postgresql10-server`
- Optionally initialize the database and enable automatic start:`/usr/pgsql-10/bin/postgresql-10-setup initdbsystemctl enable postgresql-10systemctl start postgresql-10`

## Included in distribution

These distributions all include PostgreSQL by default. To install PostgreSQL from these repositories, use the *yum* command on RHEL 5,6 and 7, or *dnf* command on Fedora 24+:

`yum install postgresql-server`

`dnf install postgresql-server`

Which version of PostgreSQL you get will depend on the version of the distribution:

| Distribution        | Version                                  |
| ------------------- | ---------------------------------------- |
| RHEL/CentOS/SL/OL 7 | 9.2(also supplies package rh-postgresql95 and rh-postgresql94 via SCL) |
| RHEL/CentOS/SL/OL 6 | 8.4(also supplies package postgresql92)  |
| RHEL/CentOS/SL/OL 5 | 8.1 (also supplies package postgresql84) |
| Fedora 25           | 9.6                                      |
| Fedora 24           | 9.4                                      |

Other Red Hat family distributions may ship a different version of PostgreSQL by default, check with your distribution vendor to be sure.

The repository contains many different packages including third party addons. The most common and important packages are (substitute the version number as required):

- postgresql-client libraries and client binaries
- postgresql-server core database server
- postgresql-contrib additional supplied modules
- postgresql-devel libraries and headers for C language development
- pgadmin3 - pgAdmin III graphical administration utility

### Post-installation

Due to policies for Red Hat family distributions, the PostgreSQL installation will not be enabled for automatic start or have the database initialized automatically. To make your database installation complete, you need to perform these two steps:`service postgresql initdbchkconfig postgresql on`or, on Fedora 24 and other later derived distributions:
`postgresql-setup initdbsystemctl enable postgresql.service systemctl start postgresql.service`

## Direct RPM download

If you cannot, or do not want to, use the yum based installation method, all the RPMs that are in the yum repository are available for [direct download](https://yum.postgresql.org/rpmchart.php) and manual installation as well.

## Cross distribution packages

Generic RPM and DEB packages that provide a server-only distribution are avaliable for some 32 and 64-bit Linux distributions. These packages provide a single set of binaries and consistent packaging across different Linux distributions. They are designed for server installation where a GUI is not available and consistency across multiple distributions is a requirement.

[Download](https://www.bigsql.org/postgresql/installers.jsp) the packages from BigSQL for all supported versions.

*Note:* The cross distribution packages do not fully integrate with the platform-specific packaging systems.

## Interactive installer by EnterpriseDB

[Download the installer](http://www.enterprisedb.com/products/pgdownload.do#linux) certified by EnterpriseDB for all supported PostgreSQL versions.

This installer includes the PostgreSQL server, pgAdmin; a graphical tool for managing and developing your databases, and StackBuilder; a package manager that can be used to download and install additional PostgreSQL tools and drivers. Stackbuilder includes management, integration, migration, replication, geospatial, connectors and other tools.

This installer can run in graphical, command line, or silent install modes.

The installer is designed to be a straightforward, fast way to get up and running with PostgreSQL on Linux (Red Hat family Linux including CentOS/Fedora/Scientific/Oracle variants), Debian GNU/Linux and derivatives, Ubuntu Linux and derivatives, SuSE and OpenSuSE.

*Advanced users* can also download a [tar.gz archive](http://www.enterprisedb.com/products/pgbindownload.do) of the binaries, without the installer. This download is intended for users who wish to include PostgreSQL as part of another application installer.

*Note:* The installers do not integrate with platform-specific packaging systems.

### Platform support

The installers are tested by EnterpriseDB on the following platforms. They may also work on other variations or versions:

| PostgreSQL Version | 64 Bit Platforms              | 32 Bit Platforms             |
| ------------------ | ----------------------------- | ---------------------------- |
| 10                 | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.6                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.5                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.4                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x      |
| 9.3                | RHEL / CentOS / OEL 6.x       | RHEL / CentOS / OEL 6.x      |
| 9.2                | RHEL / CentOS / OEL 6.x, 5.x  | RHEL / CentOS / OEL 6.x, 5.x |

## Build from source

The source code can be found in the main [file browser](https://www.postgresql.org/ftp/source). Instructions for building from source can be found in the [documentation](https://www.postgresql.org/docs/current/static/installation.html).