# Linux downloads (Red Hat family) ![Red Hat Logo](https://www.postgresql.org/media/img/redhat.svg)

The Red Hat family of distributions includes:



- Red Hat Enterprise Linux
- CentOS
- Fedora
- Scientific Linux
- Oracle Linux



and others.

PostgreSQL is available on these platforms by default. However, each version of the platform normally "snapshots" a specific version of PostgreSQL that is then supported throughout the lifetime of this platform. Since this can often mean a different version than preferred, the PostgreSQL project provides a [repository](https://www.postgresql.org/download/linux/redhat/#yum) of packages of all supported versions for the most common distributions.



## PostgreSQL Yum Repository

The [PostgreSQL Yum Repository](https://yum.postgresql.org/) will integrate with your normal systems and patch management, and provide automatic updates for all supported versions of PostgreSQL throughout the support [lifetime](https://www.postgresql.org/support/versioning/) of PostgreSQL.

The PostgreSQL Yum Repository currently supports:



- Red Hat Enterprise Linux
- CentOS
- Scientific Linux
- Oracle Linux
- Fedora*



***Note**: due to the shorter support cycle on Fedora, all supported versions of PostgreSQL are not available on this platform. We do not recommend using Fedora for server deployments.

To use the PostgreSQL Yum Repository, follow these steps:

1. Select version: `1211109.69.5`

2. Select platform: * Select your platformRedHat Enterprise, CentOS, Scientific or Oracle version 6RedHat Enterprise, CentOS, Scientific or Oracle version 7RedHat Enterprise, CentOS, Scientific or Oracle version 8Fedora version 30Fedora version 31Fedora version 32

3. Select architecture: `x86_64ppc64le`

4. Install the repository RPM:

   ```shell
   yum install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
   ```

5. Install the client packages:

   ```shell
   yum install postgresql95
   ```

6. Optionally install the server packages:

   ```
   yum install postgresql95-server
   ```

7. Optionally initialize the database and enable automatic start:

   ```
   /usr/pgsql-9.5/bin/postgresql95-setup initdb
   systemctl enable postgresql-9.5
   systemctl start postgresql-9.5
   ```

## Included in Distribution

These distributions all include PostgreSQL by default. To install PostgreSQL from these repositories, use the yum command on RHEL 6 and 7:

```
yum install postgresql-server
```

or dnf command on RHEL 8 and Fedora 29+:

```
dnf install postgresql-server
```

Which version of PostgreSQL you get will depend on the version of the distribution:

| Distribution        | Version                                                      |
| ------------------- | ------------------------------------------------------------ |
| RHEL/CentOS/OL 8    | 10 and 9.6 via modules                                       |
| RHEL/CentOS/SL/OL 7 | 9.2 (also supplies package rh-postgresql10, rh-postgresql96, rh-postgresql95 and rh-postgresql94 via SCL) |
| RHEL/CentOS/SL/OL 6 | 8.4 (also supplies package rh-postgresql96, via SCL)         |
| Fedora 31           | 11                                                           |
| Fedora 30           | 11                                                           |

Other Red Hat family distributions may ship a different version of PostgreSQL by default, check with your distribution vendor to be sure.

The repository contains many different packages including third party addons. The most common and important packages are (substitute the version number as required):

| postgresql-client  | libraries and client binaries                    |
| ------------------ | ------------------------------------------------ |
| postgresql-server  | core database server                             |
| postgresql-contrib | additional supplied modules                      |
| postgresql-devel   | libraries and headers for C language development |
| pgadmin4           | pgAdmin 4 graphical administration utility       |

### Post-installation

Due to policies for Red Hat family distributions, the PostgreSQL installation will not be enabled for automatic start or have the database initialized automatically. To make your database installation complete, you need to perform the following steps, based on your distribution:

#### For RHEL / CentOS / SL / OL 6

```
  service postgresql initdb
  chkconfig postgresql on
```

#### For RHEL / CentOS / SL / OL 7, 8 Or Fedora 29 And Later Derived Distributions:

```
  postgresql-setup initdb
  systemctl enable postgresql.service
  systemctl start postgresql.service
```



## Direct RPM download

If you cannot, or do not want to, use the yum based installation method, all the RPMs that are in the yum repository are available for [direct download](https://yum.postgresql.org/rpmchart.php) and manual installation as well.

## Cross distribution packages

Generic RPM and DEB packages that provide a server-only distribution are available for some 32 and 64-bit Linux distributions. These packages provide a single set of binaries and consistent packaging across different Linux distributions. They are designed for server installation where a GUI is not available and consistency across multiple distributions is a requirement.

[Download](https://www.bigsql.org/postgresql/installers.jsp) the packages from BigSQL for all supported versions.

*Note:* The cross distribution packages do not fully integrate with the platform-specific packaging systems.

## Interactive installer by EnterpriseDB

[Download the installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) certified by EnterpriseDB for PostgreSQL 10.x and earlier.

**Note:** Installers for Linux are no longer being product for PostgreSQL 11 and later. Users are advised to use platform native packages instead.

This installer includes the PostgreSQL server, pgAdmin; a graphical tool for managing and developing your databases, and StackBuilder; a package manager that can be used to download and install additional PostgreSQL tools and drivers. Stackbuilder includes management, integration, migration, replication, geospatial, connectors and other tools.

This installer can run in graphical, command line, or silent install modes.

The installer is designed to be a straightforward, fast way to get up and running with PostgreSQL on Linux (Red Hat family Linux including CentOS/Fedora/Scientific/Oracle variants), Debian GNU/Linux and derivatives, Ubuntu Linux and derivatives, SuSE and OpenSuSE.

*Advanced users* can also download a [tar.gz archive](https://www.enterprisedb.com/download-postgresql-binaries) of the binaries, without the installer. This download is intended for users who wish to include PostgreSQL as part of another application installer.

*Note:* The installers do not integrate with platform-specific packaging systems.

### Platform support

The installers are tested by EnterpriseDB on the following platforms. They may also work on other variations or versions:

| PostgreSQL Version | 64 Bit Platforms              | 32 Bit Platforms        |
| ------------------ | ----------------------------- | ----------------------- |
| 10                 | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x |
| 9.6                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x |
| 9.5                | RHEL / CentOS / OEL 7.x & 6.x | RHEL / CentOS / OEL 6.x |

## Build from source

The source code can be found in the main [file browser](https://www.postgresql.org/ftp/source/). Instructions for building from source can be found in the [documentation](https://www.postgresql.org/docs/current/installation.html).