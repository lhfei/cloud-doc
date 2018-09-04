# Installing Apache Kudu

You can deploy Kudu on a cluster using packages or you can build Kudu from source. To run Kudu without installing anything, use the [Kudu Quickstart VM](http://kudu.apache.org/docs/quickstart.html#quickstart_vm).

|      | Cloudera Manager users can install and manage Kudu with [Cloudera Manager](http://www.cloudera.com/content/www/en-us/products/cloudera-manager.html), instead of following these instructions. For more information, see Cloudera’s [Kudu documentation](http://www.cloudera.com/documentation/kudu/latest/topics/kudu_installation.html). |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Upgrading Kudu

To upgrade Kudu from a previous version, see [Upgrade from a Previous Version of Kudu](http://kudu.apache.org/docs/installation.html#upgrade).

## [Prerequisites and Requirements](http://kudu.apache.org/docs/installation.html#_prerequisites_and_requirements)

Hardware

- One or more hosts to run Kudu masters. It is recommended to have either one master (no fault tolerance), three masters (can tolerate one failure), or five masters (two failures).
- One or more hosts to run Kudu tablet servers. When using replication, a minimum of three tablet servers is necessary.

Operating System Requirements

- Linux

  RHEL 6, RHEL 7, CentOS 6, CentOS 7, Ubuntu 14.04 (Trusty), Ubuntu 16.04 (Xenial), Debian 8 (Jessie), or SLES 12.A kernel and filesystem that support *hole punching*. Hole punching is the use of the `fallocate(2)` system call with the `FALLOC_FL_PUNCH_HOLE` option set. See [troubleshooting hole punching](http://kudu.apache.org/docs/troubleshooting.html#req_hole_punching) for more information.ntp.xfs or ext4 formatted drives.

- macOS

  OS X 10.10 Yosemite, OS X 10.11 El Capitan, macOS Sierra, or macOS High Sierra.Prebuilt macOS packages are not provided.

- Windows

  Microsoft Windows is unsupported.

Storage

- If solid state storage is available, storing Kudu WALs on such high-performance media may significantly improve latency when Kudu is configured for its highest durability levels.

Java

- JDK 7 or JDK 8 is required to build Kudu, but a JRE is not required at runtime except for tests.

## [Install Using Packages](http://kudu.apache.org/docs/installation.html#install_packages)

You can install Kudu using packages managed by the operating system.

| OS                 | Repository                                                   | Individual Packages                                          |
| ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **RHEL or CentOS** | [RHEL 6 or CentOS 6](http://archive.cloudera.com/kudu/redhat/6/x86_64/kudu/cloudera-kudu.repo), [RHEL 7 or CentOS 7](http://archive.cloudera.com/kudu/redhat/7/x86_64/kudu/cloudera-kudu.repo) | [RHEL 6 or CentOS 6](http://archive.cloudera.com/kudu/redhat/6/x86_64/kudu/5/RPMS/x86_64/), [RHEL 7 or CentOS 7](http://archive.cloudera.com/kudu/redhat/7/x86_64/kudu/5/RPMS/x86_64/) |
| **SLES**           | [SLES 12](http://archive.cloudera.com/kudu/sles/12/x86_64/kudu/cloudera-kudu.repo) | [SLES 12](http://archive.cloudera.com/kudu/sles/12/x86_64/kudu/5/RPMS/x86_64/) |
| **Ubuntu**         | [Trusty](http://archive.cloudera.com/kudu/ubuntu/trusty/amd64/kudu/cloudera.list), [Xenial](http://archive.cloudera.com/kudu/ubuntu/xenial/amd64/kudu/cloudera.list) | [Trusty](http://archive.cloudera.com/kudu/ubuntu/trusty/amd64/kudu/pool/contrib/k/kudu/), [Xenial](http://archive.cloudera.com/kudu/ubuntu/xenial/amd64/kudu/pool/contrib/k/kudu/) |
| **Debian**         | [Jessie](http://archive.cloudera.com/kudu/debian/jessie/amd64/kudu/cloudera.list) | [Jessie](http://archive.cloudera.com/kudu/debian/jessie/amd64/kudu/pool/contrib/k/kudu/) |

### [Install on RHEL or CentOS Hosts](http://kudu.apache.org/docs/installation.html#_install_on_rhel_or_centos_hosts)

1. Download and configure the Kudu repositories for your operating system, or manually download individual RPMs, using the appropriate link from [Kudu Package Locations](http://kudu.apache.org/docs/installation.html#kudu_package_locations).

2. If using a Yum repository, use the following commands to install Kudu packages on each host, after saving the `cloudera-kudu.repo` file to `/etc/yum.repos.d/`.

   ```
   sudo yum install kudu                         # Base Kudu files
   sudo yum install kudu-master                  # Kudu master init.d service script and default configuration
   sudo yum install kudu-tserver                 # Kudu tablet server init.d service script and default configuration
   sudo yum install kudu-client0                 # Kudu C++ client shared library
   sudo yum install kudu-client-devel            # Kudu C++ client SDK
   ```

3. To manually install the Kudu RPMs, first download them, then use the command `sudo rpm -ivh <RPM to install>` to install them.

4. Note: the `kudu-master` and `kudu-tserver` packages are only necessary on hosts where there is a master or tserver respectively (and completely unnecessary if using Cloudera Manager). Each provides configuration files and an init.d script to manage the corresponding Kudu process. Once installed, the Kudu process is started and stopped automatically when the host starts up and shuts down.

### [Install on SLES Hosts](http://kudu.apache.org/docs/installation.html#_install_on_sles_hosts)

1. Download and configure the Kudu repositories for your operating system, or manually download individual RPMs, using the appropriate link from [Kudu Package Locations](http://kudu.apache.org/docs/installation.html#kudu_package_locations).

2. If using a Zypper repository, use the following commands to install Kudu packages on each host, after saving the `cloudera-kudu.repo` file to `/etc/zypp/repos.d`.

   ```
   sudo zypper install kudu                      # Base Kudu files
   sudo zypper install kudu-master               # Kudu master init.d service script and default configuration
   sudo zypper install kudu-tserver              # Kudu tablet server init.d service script and default configuration
   sudo zypper install kudu-client0              # Kudu C++ client shared library
   sudo zypper install kudu-client-devel         # Kudu C++ client SDK
   ```

3. To manually install the Kudu RPMs, first download them, then use the command `sudo rpm -ivh <RPM to install>` to install them.

4. Note: the `kudu-master` and `kudu-tserver` packages are only necessary on hosts where there is a master or tserver respectively (and completely unnecessary if using Cloudera Manager). Each provides configuration files and an init.d script to manage the corresponding Kudu process. Once installed, the Kudu process is started and stopped automatically when the host starts up and shuts down.

### [Install on Ubuntu or Debian Hosts](http://kudu.apache.org/docs/installation.html#_install_on_ubuntu_or_debian_hosts)

1. If using an Ubuntu or Debian repository, use the following commands to install Kudu packages on each host after saving the `cloudera.list` file to `/etc/apt/sources.list.d/`.

   ```
   sudo apt-get install kudu                     # Base Kudu files
   sudo apt-get install kudu-master              # Service scripts for managing kudu-master
   sudo apt-get install kudu-tserver             # Service scripts for managing kudu-tserver
   sudo apt-get install libkuduclient0           # Kudu C++ client shared library
   sudo apt-get install libkuduclient-dev        # Kudu C++ client SDK
   ```

2. To manually install the Kudu RPMs, first download them, then use the command `sudo rpm -ivh <RPM to install>` to install them.

3. Note: the `kudu-master` and `kudu-tserver` packages are only necessary on hosts where there is a master or tserver respectively (and completely unnecessary if using Cloudera Manager). Each provides configuration files and an init.d script to manage the corresponding Kudu process. Once installed, the Kudu process is started and stopped automatically when the host starts up and shuts down.

### [Verify the Installation](http://kudu.apache.org/docs/installation.html#_verify_the_installation)

1. Verify that services are running using one of the following methods:
   - Examine the output of the `ps` command on servers to verify one or both of `kudu-master` or `kudu-tserver` processes is running.
   - Access the Master or Tablet Server web UI by opening `http://<_host_name_>:8051/` for masters or `http://<_host_name_>:8050/` for tablet servers.
2. If Kudu isn’t running, have a look at the log files in '/var/log/kudu', and if there’s a file ending with '.FATAL' then it means Kudu wasn’t able to start.
   - If the error is 'Error during hole punch test', it might be a problem [with your OS](http://kudu.apache.org/docs/troubleshooting.html#req_hole_punching).
   - If the error is 'Couldn’t get the current time', it’s a [problem with ntp](http://kudu.apache.org/docs/troubleshooting.html#ntp).
   - If it’s something else that doesn’t seem obvious or if you’ve tried the above solutions without luck, you can ask for help on the [user mailing list](http://kudu.apache.org/community.html).

### [Required Configuration](http://kudu.apache.org/docs/installation.html#required_config_without_cm)

Additional configuration steps are required on each host before you can start Kudu services.

1. The packages create a `kudu-conf` entry in the operating system’s alternatives database, and they ship the built-in `conf.dist`alternative. To adjust your configuration, you can either edit the files in `/etc/kudu/conf/` directly, or create a new alternative using the operating system utilities, make sure it is the link pointed to by `/etc/kudu/conf/`, and create custom configuration files there. Some parts of the configuration are configured in `/etc/default/kudu-master` and `/etc/default/kudu-tserver` files as well. You should include or duplicate these configuration options if you create custom configuration files.

   Review the configuration, including the default WAL and data directory locations, and adjust them according to your requirements.

1. Start Kudu services using the following commands:

   ```bash
   $ sudo service kudu-master start
   $ sudo service kudu-tserver start
   ```

2. To stop Kudu services, use the following commands:

   ```bash
   $ sudo service kudu-master stop
   $ sudo service kudu-tserver stop
   ```

3. Configure the Kudu services to start automatically when the server starts, by adding them to the default runlevel.

   ```bash
   $ sudo chkconfig kudu-master on                # RHEL / CentOS / SLES
   $ sudo chkconfig kudu-tserver on               # RHEL / CentOS / SLES
   
   $ sudo update-rc.d kudu-master defaults        # Debian / Ubuntu
   $ sudo update-rc.d kudu-tserver defaults       # Debian / Ubuntu
   ```

4. For additional configuration of Kudu services, see [Configuring Kudu](http://kudu.apache.org/docs/configuration.html).

## [Build From Source](http://kudu.apache.org/docs/installation.html#build_from_source)

If installing Kudu using parcels or packages does not provide the flexibility you need, you can build Kudu from source. You can build from source on any supported operating system.

|      | Known Build IssuesIt is not possible to build Kudu on Microsoft Windows.A C+11 capable compiler (GCC 4.8) is required. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### [RHEL or CentOS](http://kudu.apache.org/docs/installation.html#rhel_from_source)

RHEL or CentOS 6.6 or later is required to build Kudu from source. To build on a version older than 7.0, the Red Hat Developer Toolset must be installed (in order to have access to a C++11 capable compiler).

1. Install the prerequisite libraries, if they are not installed.

   ```
   $ sudo yum install autoconf automake cyrus-sasl-devel cyrus-sasl-gssapi \
     cyrus-sasl-plain flex gcc gcc-c++ gdb git java-1.8.0-openjdk-devel \
     krb5-server krb5-workstation libtool make openssl-devel patch \
     pkgconfig redhat-lsb-core rsync unzip vim-common which
   ```

2. If building on RHEL or CentOS older than 7.0, install the Red Hat Developer Toolset.

   ```
   $ DTLS_RPM=rhscl-devtoolset-3-epel-6-x86_64-1-2.noarch.rpm
   $ DTLS_RPM_URL=https://www.softwarecollections.org/repos/rhscl/devtoolset-3/epel-6-x86_64/noarch/${DTLS_RPM}
   $ wget ${DTLS_RPM_URL} -O ${DTLS_RPM}
   $ sudo yum install -y scl-utils ${DTLS_RPM}
   $ sudo yum install -y devtoolset-3-toolchain
   ```

3. Optional: Install some additional packages, including ruby, if you plan to build documentation.

   ```
   $ sudo yum install doxygen gem graphviz ruby-devel zlib-devel
   ```

   |      | If building on RHEL or CentOS older than 7.0, the gem package may need to be replaced with rubygems |
   | ---- | ------------------------------------------------------------ |
   |      |                                                              |

4. Clone the Git repository and change to the new `kudu` directory.

   ```bash
   $ git clone https://github.com/apache/kudu
   $ cd kudu
   ```

5. Build any missing third-party requirements using the `build-if-necessary.sh` script. Not using the devtoolset will result in `Host compiler appears to require libatomic, but cannot find it.`

   ```bash
   $ build-support/enable_devtoolset.sh thirdparty/build-if-necessary.sh
   ```

6. Build Kudu, using the utilities installed in the previous step. Choose a build directory for the intermediate output, which can be anywhere in your filesystem except for the `kudu` directory itself. Notice that the devtoolset must still be specified, else you’ll get `cc1plus: error: unrecognized command line option "-std=c++11"`.

   ```bash
   mkdir -p build/release
   cd build/release
   ../../build-support/enable_devtoolset.sh \
     ../../thirdparty/installed/common/bin/cmake \
     -DCMAKE_BUILD_TYPE=release \
     ../..
   make -j4
   ```

7. Optional: Install Kudu binaries, libraries, and headers. If you do not specify an installation directory through the `DESTDIR`environment variable, `/usr/local/` is the default.

   ```bash
   sudo make DESTDIR=/opt/kudu install
   ```

8. Optional: Build the documentation. NOTE: This command builds local documentation that is not appropriate for uploading to the Kudu website.

   ```
   $ make docs
   ```

Example 1. RHEL / CentOS Build Script

This script provides an overview of the procedure to build Kudu on a newly-installed RHEL or CentOS host, and can be used as the basis for an automated deployment scenario. It skips the steps marked **Optional** above.

```bash
#!/bin/bash

sudo yum -y install autoconf automake cyrus-sasl-devel cyrus-sasl-gssapi \
  cyrus-sasl-plain flex gcc gcc-c++ gdb git java-1.8.0-openjdk-devel \
  krb5-server krb5-workstation libtool make openssl-devel patch pkgconfig \
  redhat-lsb-core rsync unzip vim-common which
DTLS_RPM=rhscl-devtoolset-3-epel-6-x86_64-1-2.noarch.rpm
DTLS_RPM_URL=https://www.softwarecollections.org/repos/rhscl/devtoolset-3/epel-6-x86_64/noarch/${DTLS_RPM}
wget ${DTLS_RPM_URL} -O ${DTLS_RPM}
sudo yum install -y scl-utils ${DTLS_RPM}
sudo yum install -y devtoolset-3-toolchain
git clone https://github.com/apache/kudu
cd kudu
build-support/enable_devtoolset.sh thirdparty/build-if-necessary.sh
mkdir -p build/release
cd build/release
../../build-support/enable_devtoolset.sh \
  ../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  ../..
make -j4
```

### [Ubuntu or Debian](http://kudu.apache.org/docs/installation.html#ubuntu_from_source)

1. Install the prerequisite libraries, if they are not installed.

   ```
   $ sudo apt-get install autoconf automake curl flex g++ gcc gdb git \
     krb5-admin-server krb5-kdc krb5-user libkrb5-dev libsasl2-dev libsasl2-modules \
     libsasl2-modules-gssapi-mit libssl-dev libtool lsb-release make ntp \
     openjdk-8-jdk openssl patch pkg-config python rsync unzip vim-common
   ```

2. Optional: Install some additional packages, including ruby, if you plan to build documentation.

   ```
   $ sudo apt-get install doxygen gem graphviz ruby-dev xsltproc zlib1g-dev
   ```

3. Clone the Git repository and change to the new `kudu` directory.

   ```bash
   $ git clone https://github.com/apache/kudu
   $ cd kudu
   ```

4. Build any missing third-party requirements using the `build-if-necessary.sh` script.

   ```bash
   $ thirdparty/build-if-necessary.sh
   ```

5. Build Kudu, using the utilities installed in the previous step. Choose a build directory for the intermediate output, which can be anywhere in your filesystem except for the `kudu` directory itself.

   ```bash
   mkdir -p build/release
   cd build/release
   ../../thirdparty/installed/common/bin/cmake -DCMAKE_BUILD_TYPE=release ../..
   make -j4
   ```

6. Optional: Install Kudu binaries, libraries, and headers. If you do not specify an installation directory through the `DESTDIR`environment variable, `/usr/local/` is the default.

   ```bash
   sudo make DESTDIR=/opt/kudu install
   ```

7. Optional: Build the documentation. NOTE: This command builds local documentation that is not appropriate for uploading to the Kudu website.

   ```
   $ make docs
   ```

Example 2. Ubuntu / Debian Build Script

This script provides an overview of the procedure to build Kudu on Ubuntu, and can be used as the basis for an automated deployment scenario. It skips the steps marked **Optional** above.

```bash
#!/bin/bash

sudo apt-get -y install autoconf automake curl flex g++ gcc gdb git \
  krb5-admin-server krb5-kdc krb5-user libkrb5-dev libsasl2-dev libsasl2-modules \
  libsasl2-modules-gssapi-mit libssl-dev libtool lsb-release make ntp \
  openjdk-8-jdk openssl patch pkg-config python rsync unzip vim-common
git clone https://github.com/apache/kudu
cd kudu
thirdparty/build-if-necessary.sh
mkdir -p build/release
cd build/release
../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  ../..
make -j4
```

### [SUSE Linux Enterprise Server](http://kudu.apache.org/docs/installation.html#sles_from_source)

1. Install the prerequisite libraries, if they are not installed.

   ```
   $ sudo zypper install autoconf automake curl cyrus-sasl-devel \
     cyrus-sasl-gssapi flex gcc gcc-c++ gdb git java-1_8_0-openjdk-devel \
     krb5-devel libtool lsb-release make ntp openssl-devel patch \
     pkg-config python rsync unzip vim
   ```

2. Clone the Git repository and change to the new `kudu` directory.

   ```bash
   $ git clone https://github.com/apache/kudu
   $ cd kudu
   ```

3. Build any missing third-party requirements using the `build-if-necessary.sh` script.

   ```bash
   $ thirdparty/build-if-necessary.sh
   ```

4. Build Kudu, using the utilities installed in the previous step. Choose a build directory for the intermediate output, which can be anywhere in your filesystem except for the `kudu` directory itself.

   ```bash
   mkdir -p build/release
   cd build/release
   ../../thirdparty/installed/common/bin/cmake \
     -DCMAKE_BUILD_TYPE=release \
     ../..
   make -j4
   ```

5. Optional: Install Kudu binaries, libraries, and headers. If you do not specify an installation directory through the `DESTDIR`environment variable, `/usr/local/` is the default.

   ```bash
   sudo make DESTDIR=/opt/kudu install
   ```

Example 3. SLES Build Script

This script provides an overview of the procedure to build Kudu on SLES, and can be used as the basis for an automated deployment scenario. It skips the steps marked **Optional** above.

```bash
#!/bin/bash

sudo zypper install -y autoconf automake curl cyrus-sasl-devel \
  cyrus-sasl-gssapi flex gcc gcc-c++ gdb git java-1_8_0-openjdk-devel \
  krb5-devel libtool lsb-release make ntp openssl-devel patch \
  pkg-config python rsync unzip vim
git clone https://github.com/apache/kudu
cd kudu
thirdparty/build-if-necessary.sh
mkdir -p build/release
cd build/release
../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  ../..
make -j4
```

### [macOS](http://kudu.apache.org/docs/installation.html#osx_from_source)

The [Xcode](https://developer.apple.com/xcode/) package is necessary for compiling Kudu. Some of the instructions below use [Homebrew](http://brew.sh/) to install dependencies, but manual dependency installation is possible.

After installing Xcode, don’t forget to accept the license and install command-line tools, if it’s not done yet:

```
$ sudo xcodebuild -license
$ sudo xcode-select --install
```

|      | macOS Known IssuesKudu support for macOS is experimental, and should only be used for development. See [macOS Limitations & Known Issues](https://issues.cloudera.org/browse/KUDU-1219) for more information. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

1. Install the prerequisite libraries, if they are not installed.

   ```
   $ brew tap homebrew/dupes
   $ brew install autoconf automake cmake git krb5 libtool openssl pkg-config pstree
   ```

2. Optional: Install some additional packages, including ruby, if you plan to build documentation.

   ```
   $ brew install doxygen graphviz ruby
   $ brew install gnu-sed --with-default-names #The macOS default sed handles the -i parameter differently
   ```

3. Clone the Git repository and change to the new `kudu` directory.

   ```bash
   $ git clone https://github.com/apache/kudu
   $ cd kudu
   ```

4. Build any missing third-party requirements using the `build-if-necessary.sh` script.

   ```bash
   $ thirdparty/build-if-necessary.sh
   ```

   - If different versions of the dependencies are installed and used when calling `thirdparty/build-if-necessary.sh`, you may get stuck with output similar to the following:

     ```
     ./configure: line 16299: error near unexpected token `newline'
     ./configure: line 16299: `  PKG_CHECK_MODULES('
     ```

     The thirdparty builds may be cached and may reflect the incorrect versions of the dependencies. Ensure that you have the correct dependencies listed in Step 1, clean the workspace, and then try to re-build.

     ```bash
     $ git clean -fdx
     $ thirdparty/build-if-necessary.sh
     ```

   - Some combinations of Homebrew installations and system upgrades can result with a different kind of error:

     ```
     libtool: Version mismatch error.  This is libtool 2.4.6, but the
     libtool: definition of this LT_INIT comes from libtool 2.4.2.
     libtool: You should recreate aclocal.m4 with macros from libtool 2.4.6
     libtool: and run autoconf again.
     ```

     As described in this [thread](https://github.com/Homebrew/legacy-homebrew/issues/43874), a possible fix is to uninstall and reinstall libtool:

     ```bash
     $ brew uninstall libtool && brew install libtool
     ```

5. Build Kudu. Choose a build directory for the intermediate output, which can be anywhere in your filesystem except for the `kudu`directory itself.

   ```bash
   mkdir -p build/release
   cd build/release
   ../../thirdparty/installed/common/bin/cmake \
     -DCMAKE_BUILD_TYPE=release \
     -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl \
     ../..
   make -j4
   ```

Example 4. macOS Build Script

This script provides an overview of the procedure to build Kudu on macOS, and can be used as the basis for an automated deployment scenario. It assumes Xcode and Homebrew are installed.

```
#!/bin/bash

brew tap homebrew/dupes
brew install autoconf automake cmake git krb5 libtool openssl pkg-config pstree
git clone https://github.com/apache/kudu
cd kudu
thirdparty/build-if-necessary.sh
mkdir -p build/release
cd build/release
../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl \
  ../..
make -j4
```

## [Installing the C++ Client Libraries](http://kudu.apache.org/docs/installation.html#build_cpp_client)

If you need access to the Kudu client libraries for development, install the `kudu-client` and `kudu-client-devel` package for your platform. See [Install Using Packages](http://kudu.apache.org/docs/installation.html#install_packages).

|      | Only build against the client libraries and headers (`kudu_client.so` and `client.h`). Other libraries and headers are internal to Kudu and have no stability guarantees. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## [Build the Java Client](http://kudu.apache.org/docs/installation.html#build_java_client)

Requirements

- JDK 7 or JDK 8
- Apache Maven 3.x

|      | Support for Java 7 is deprecated as of Kudu 1.5.0 and may be removed in the next major release. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

To build the Java client, clone the Kudu Git repository, change to the `java` directory, and issue the following command:

```bash
$ mvn install -DskipTests
```

For more information about building the Java API, as well as Eclipse integration, see `java/README.md`.

## [View API Documentation](http://kudu.apache.org/docs/installation.html#view_api)

C++ API Documentation

You can view the [C++ client API documentation](http://kudu.apache.org/cpp-client-api/index.html) online. Alternatively, after [building Kudu from source](http://kudu.apache.org/docs/installation.html#build_from_source), you can additionally build the `doxygen` target (e.g., run `make doxygen` if using make) and use the locally generated API documentation by opening`docs/doxygen/client_api/html/index.html` file in your favorite Web browser.

|      | In order to build the `doxygen` target, it’s necessary to have doxygen with Dot (graphviz) support installed at your build machine. If you installed doxygen after building Kudu from source, you will need to run `cmake` again to pick up the doxygen location and generate appropriate targets. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Java API Documentation

You can view the [Java API documentation](http://kudu.apache.org/apidocs/index.html) online. Alternatively, after [building the Java client](http://kudu.apache.org/docs/installation.html#build_java_client), Java API documentation is available in `java/kudu-client/target/apidocs/index.html`.

## [Upgrade from a Previous Version of Kudu](http://kudu.apache.org/docs/installation.html#upgrade)

Before upgrading, you should read the [Release Notes](http://kudu.apache.org/docs/release_notes.html) for the version of Kudu that you are about to install. Pay close attention to the incompatibilities, upgrade, and downgrade notes that are documented there.

|      | Currently rolling upgrades are not supported. Please shut down all Kudu services before upgrading the software. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### [Upgrade Procedure](http://kudu.apache.org/docs/installation.html#upgrade_procedure)

1. Stop the Kudu master and tablet server services:

   ```bash
   $ sudo service kudu-master stop
   $ sudo service kudu-tserver stop
   ```

2. Upgrade the packages.

   - On RHEL or CentOS hosts:

     ```bash
     sudo yum clean all
     sudo yum upgrade kudu
     ```

   - On SLES hosts:

     ```bash
     sudo zypper clean --all
     sudo zypper update kudu
     ```

   - On Ubuntu or Debian hosts:

     ```bash
     sudo apt-get update
     sudo apt-get install kudu
     ```

3. Start the Kudu master and tablet server services:

   ```bash
   $ sudo service kudu-master start
   $ sudo service kudu-tserver start
   ```

## [Next Steps](http://kudu.apache.org/docs/installation.html#next_steps)

- [Configuring Kudu](http://kudu.apache.org/docs/configuration.html)
- [Kudu Administration](http://kudu.apache.org/docs/administration.html)