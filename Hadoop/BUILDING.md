```ini
Build instructions for Hadoop

----------------------------------------------------------------------------------
Requirements:

* Unix System
* JDK 1.8
* Maven 3.3 or later
* Boost 1.72 (if compiling native code)
* Protocol Buffers 3.7.1 (if compiling native code)
* CMake 3.19 or newer (if compiling native code)
* Zlib devel (if compiling native code)
* Cyrus SASL devel (if compiling native code)
* One of the compilers that support thread_local storage: GCC 9.3.0 or later, Visual Studio,
  Clang (community version), Clang (version for iOS 9 and later) (if compiling native code)
* openssl devel (if compiling native hadoop-pipes and to get the best HDFS encryption performance)
* Linux FUSE (Filesystem in Userspace) version 2.6 or above (if compiling fuse_dfs)
* Doxygen ( if compiling libhdfspp and generating the documents )
* Internet connection for first build (to fetch all Maven and Hadoop dependencies)
* python (for releasedocs)
* bats (for shell code testing)
* Node.js / bower / Ember-cli (for YARN UI v2 building)

----------------------------------------------------------------------------------
The easiest way to get an environment with all the appropriate tools is by means
of the provided Docker config.
This requires a recent version of docker (1.4.1 and higher are known to work).

On Linux / Mac:
    Install Docker and run this command:

    $ ./start-build-env.sh

The prompt which is then presented is located at a mounted version of the source tree
and all required tools for testing and building have been installed and configured.

Note that from within this docker environment you ONLY have access to the Hadoop source
tree from where you started. So if you need to run
    dev-support/bin/test-patch /path/to/my.patch
then the patch must be placed inside the hadoop source tree.

Known issues:
- On Mac with Boot2Docker the performance on the mounted directory is currently extremely slow.
  This is a known problem related to boot2docker on the Mac.
  See:
    https://github.com/boot2docker/boot2docker/issues/593
  This issue has been resolved as a duplicate, and they point to a new feature for utilizing NFS mounts
  as the proposed solution:
    https://github.com/boot2docker/boot2docker/issues/64
  An alternative solution to this problem is to install Linux native inside a virtual machine
  and run your IDE and Docker etc inside that VM.

----------------------------------------------------------------------------------
Installing required packages for clean install of Ubuntu 18.04 LTS Desktop.
(For Ubuntu 20.04, gcc/g++ and cmake bundled with Ubuntu can be used.
Refer to  dev-support/docker/Dockerfile):

* Open JDK 1.8
  $ sudo apt-get update
  $ sudo apt-get -y install java-8-openjdk
* Maven
  $ sudo apt-get -y install maven
* Native libraries
  $ sudo apt-get -y install build-essential autoconf automake libtool cmake zlib1g-dev pkg-config libssl-dev libsasl2-dev
* GCC 9.3.0
  $ sudo apt-get -y install software-properties-common
  $ sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
  $ sudo apt-get update
  $ sudo apt-get -y install g++-9 gcc-9
  $ sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9
* CMake 3.19
  $ curl -L https://cmake.org/files/v3.19/cmake-3.19.0.tar.gz > cmake-3.19.0.tar.gz
  $ tar -zxvf cmake-3.19.0.tar.gz && cd cmake-3.19.0
  $ ./bootstrap
  $ make -j$(nproc)
  $ sudo make install
* Protocol Buffers 3.7.1 (required to build native code)
  $ curl -L -s -S https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-java-3.7.1.tar.gz -o protobuf-3.7.1.tar.gz
  $ mkdir protobuf-3.7-src
  $ tar xzf protobuf-3.7.1.tar.gz --strip-components 1 -C protobuf-3.7-src && cd protobuf-3.7-src
  $ ./configure
  $ make -j$(nproc)
  $ sudo make install
* Boost
  $ curl -L https://sourceforge.net/projects/boost/files/boost/1.72.0/boost_1_72_0.tar.bz2/download > boost_1_72_0.tar.bz2
  $ tar --bzip2 -xf boost_1_72_0.tar.bz2 && cd boost_1_72_0
  $ ./bootstrap.sh --prefix=/usr/
  $ ./b2 --without-python
  $ sudo ./b2 --without-python install

Optional packages:

* Snappy compression (only used for hadoop-mapreduce-client-nativetask)
  $ sudo apt-get install libsnappy-dev
* Intel ISA-L library for erasure coding
  Please refer to https://01.org/intel%C2%AE-storage-acceleration-library-open-source-version
  (OR https://github.com/01org/isa-l)
* Bzip2
  $ sudo apt-get install bzip2 libbz2-dev
* Linux FUSE
  $ sudo apt-get install fuse libfuse-dev
* ZStandard compression
  $ sudo apt-get install libzstd1-dev
* PMDK library for storage class memory(SCM) as HDFS cache backend
  Please refer to http://pmem.io/ and https://github.com/pmem/pmdk

----------------------------------------------------------------------------------
Maven main modules:

  hadoop                                (Main Hadoop project)
         - hadoop-project               (Parent POM for all Hadoop Maven modules.             )
                                        (All plugins & dependencies versions are defined here.)
         - hadoop-project-dist          (Parent POM for modules that generate distributions.)
         - hadoop-annotations           (Generates the Hadoop doclet used to generate the Javadocs)
         - hadoop-assemblies            (Maven assemblies used by the different modules)
         - hadoop-maven-plugins         (Maven plugins used in project)
         - hadoop-build-tools           (Build tools like checkstyle, etc.)
         - hadoop-common-project        (Hadoop Common)
         - hadoop-hdfs-project          (Hadoop HDFS)
         - hadoop-yarn-project          (Hadoop YARN)
         - hadoop-mapreduce-project     (Hadoop MapReduce)
         - hadoop-tools                 (Hadoop tools like Streaming, Distcp, etc.)
         - hadoop-dist                  (Hadoop distribution assembler)
         - hadoop-client-modules        (Hadoop client modules)
         - hadoop-minicluster           (Hadoop minicluster artifacts)
         - hadoop-cloud-storage-project (Generates artifacts to access cloud storage like aws, azure, etc.)

----------------------------------------------------------------------------------
Where to run Maven from?

  It can be run from any module. The only catch is that if not run from trunk
  all modules that are not part of the build run must be installed in the local
  Maven cache or available in a Maven repository.

----------------------------------------------------------------------------------
Maven build goals:

 * Clean                     : mvn clean [-Preleasedocs]
 * Compile                   : mvn compile [-Pnative]
 * Run tests                 : mvn test [-Pnative] [-Pshelltest]
 * Create JAR                : mvn package
 * Run spotbugs              : mvn compile spotbugs:spotbugs
 * Run checkstyle            : mvn compile checkstyle:checkstyle
 * Install JAR in M2 cache   : mvn install
 * Deploy JAR to Maven repo  : mvn deploy
 * Run clover                : mvn test -Pclover
 * Run Rat                   : mvn apache-rat:check
 * Build javadocs            : mvn javadoc:javadoc
 * Build distribution        : mvn package [-Pdist][-Pdocs][-Psrc][-Pnative][-Dtar][-Preleasedocs][-Pyarn-ui]
 * Change Hadoop version     : mvn versions:set -DnewVersion=NEWVERSION

 Build options:

  * Use -Pnative to compile/bundle native code
  * Use -Pdocs to generate & bundle the documentation in the distribution (using -Pdist)
  * Use -Psrc to create a project source TAR.GZ
  * Use -Dtar to create a TAR with the distribution (using -Pdist)
  * Use -Preleasedocs to include the changelog and release docs (requires Internet connectivity)
  * Use -Pyarn-ui to build YARN UI v2. (Requires Internet connectivity)
  * Use -DskipShade to disable client jar shading to speed up build times (in
    development environments only, not to build release artifacts)

 YARN Application Timeline Service V2 build options:

   YARN Timeline Service v.2 chooses Apache HBase as the primary backing storage. The supported
   versions of Apache HBase are 1.2.6 (default) and 2.0.0-beta1.

  * HBase 1.2.6 is used by default to build Hadoop. The official releases are ready to use if you
    plan on running Timeline Service v2 with HBase 1.2.6.

  * Use -Dhbase.profile=2.0 to build Hadoop with HBase 2.0.0-beta1. Provide this option if you plan
    on running Timeline Service v2 with HBase 2.0.


 Snappy build options:

   Snappy is a compression library that can be utilized by the native code.
   It is currently an optional component, meaning that Hadoop can be built with
   or without this dependency. Snappy library as optional dependency is only
   used for hadoop-mapreduce-client-nativetask.

  * Use -Drequire.snappy to fail the build if libsnappy.so is not found.
    If this option is not specified and the snappy library is missing,
    we silently build a version of libhadoop.so that cannot make use of snappy.
    This option is recommended if you plan on making use of snappy and want
    to get more repeatable builds.
  * Use -Dsnappy.prefix to specify a nonstandard location for the libsnappy
    header files and library files. You do not need this option if you have
    installed snappy using a package manager.
  * Use -Dsnappy.lib to specify a nonstandard location for the libsnappy library
    files.  Similarly to snappy.prefix, you do not need this option if you have
    installed snappy using a package manager.
  * Use -Dbundle.snappy to copy the contents of the snappy.lib directory into
    the final tar file. This option requires that -Dsnappy.lib is also given,
    and it ignores the -Dsnappy.prefix option. If -Dsnappy.lib isn't given, the
    bundling and building will fail.


 ZStandard build options:

   ZStandard is a compression library that can be utilized by the native code.
   It is currently an optional component, meaning that Hadoop can be built with
   or without this dependency.

  * Use -Drequire.zstd to fail the build if libzstd.so is not found.
    If this option is not specified and the zstd library is missing.

  * Use -Dzstd.prefix to specify a nonstandard location for the libzstd
    header files and library files. You do not need this option if you have
    installed zstandard using a package manager.

  * Use -Dzstd.lib to specify a nonstandard location for the libzstd library
    files.  Similarly to zstd.prefix, you do not need this option if you have
    installed using a package manager.

  * Use -Dbundle.zstd to copy the contents of the zstd.lib directory into
    the final tar file. This option requires that -Dzstd.lib is also given,
    and it ignores the -Dzstd.prefix option. If -Dzstd.lib isn't given, the
    bundling and building will fail.

 OpenSSL build options:

   OpenSSL includes a crypto library that can be utilized by the native code.
   It is currently an optional component, meaning that Hadoop can be built with
   or without this dependency.

  * Use -Drequire.openssl to fail the build if libcrypto.so is not found.
    If this option is not specified and the openssl library is missing,
    we silently build a version of libhadoop.so that cannot make use of
    openssl. This option is recommended if you plan on making use of openssl
    and want to get more repeatable builds.
  * Use -Dopenssl.prefix to specify a nonstandard location for the libcrypto
    header files and library files. You do not need this option if you have
    installed openssl using a package manager.
  * Use -Dopenssl.lib to specify a nonstandard location for the libcrypto library
    files. Similarly to openssl.prefix, you do not need this option if you have
    installed openssl using a package manager.
  * Use -Dbundle.openssl to copy the contents of the openssl.lib directory into
    the final tar file. This option requires that -Dopenssl.lib is also given,
    and it ignores the -Dopenssl.prefix option. If -Dopenssl.lib isn't given, the
    bundling and building will fail.

   Tests options:

  * Use -DskipTests to skip tests when running the following Maven goals:
    'package',  'install', 'deploy' or 'verify'
  * -Dtest=<TESTCLASSNAME>,<TESTCLASSNAME#METHODNAME>,....
  * -Dtest.exclude=<TESTCLASSNAME>
  * -Dtest.exclude.pattern=**/<TESTCLASSNAME1>.java,**/<TESTCLASSNAME2>.java
  * To run all native unit tests, use: mvn test -Pnative -Dtest=allNative
  * To run a specific native unit test, use: mvn test -Pnative -Dtest=<test>
  For example, to run test_bulk_crc32, you would use:
  mvn test -Pnative -Dtest=test_bulk_crc32

 Intel ISA-L build options:

   Intel ISA-L is an erasure coding library that can be utilized by the native code.
   It is currently an optional component, meaning that Hadoop can be built with
   or without this dependency. Note the library is used via dynamic module. Please
   reference the official site for the library details.
   https://01.org/intel%C2%AE-storage-acceleration-library-open-source-version
   (OR https://github.com/01org/isa-l)

  * Use -Drequire.isal to fail the build if libisal.so is not found.
    If this option is not specified and the isal library is missing,
    we silently build a version of libhadoop.so that cannot make use of ISA-L and
    the native raw erasure coders.
    This option is recommended if you plan on making use of native raw erasure
    coders and want to get more repeatable builds.
  * Use -Disal.prefix to specify a nonstandard location for the libisal
    library files. You do not need this option if you have installed ISA-L to the
    system library path.
  * Use -Disal.lib to specify a nonstandard location for the libisal library
    files.
  * Use -Dbundle.isal to copy the contents of the isal.lib directory into
    the final tar file. This option requires that -Disal.lib is also given,
    and it ignores the -Disal.prefix option. If -Disal.lib isn't given, the
    bundling and building will fail.

 Special plugins: OWASP's dependency-check:

   OWASP's dependency-check plugin will scan the third party dependencies
   of this project for known CVEs (security vulnerabilities against them).
   It will produce a report in target/dependency-check-report.html. To
   invoke, run 'mvn dependency-check:aggregate'. Note that this plugin
   requires maven 3.1.1 or greater.

 PMDK library build options:

   The Persistent Memory Development Kit (PMDK), formerly known as NVML, is a growing
   collection of libraries which have been developed for various use cases, tuned,
   validated to production quality, and thoroughly documented. These libraries are built
   on the Direct Access (DAX) feature available in both Linux and Windows, which allows
   applications directly load/store access to persistent memory by memory-mapping files
   on a persistent memory aware file system.

   It is currently an optional component, meaning that Hadoop can be built without
   this dependency. Please Note the library is used via dynamic module. For getting
   more details please refer to the official sites:
   http://pmem.io/ and https://github.com/pmem/pmdk.

  * -Drequire.pmdk is used to build the project with PMDK libraries forcibly. With this
    option provided, the build will fail if libpmem library is not found. If this option
    is not given, the build will generate a version of Hadoop with libhadoop.so.
    And storage class memory(SCM) backed HDFS cache is still supported without PMDK involved.
    Because PMDK can bring better caching write/read performance, it is recommended to build
    the project with this option if user plans to use SCM backed HDFS cache.
  * -Dpmdk.lib is used to specify a nonstandard location for PMDK libraries if they are not
    under /usr/lib or /usr/lib64.
  * -Dbundle.pmdk is used to copy the specified libpmem libraries into the distribution tar
    package. This option requires that -Dpmdk.lib is specified. With -Dbundle.pmdk provided,
    the build will fail if -Dpmdk.lib is not specified.

----------------------------------------------------------------------------------
Building components separately

If you are building a submodule directory, all the hadoop dependencies this
submodule has will be resolved as all other 3rd party dependencies. This is,
from the Maven cache or from a Maven repository (if not available in the cache
or the SNAPSHOT 'timed out').
An alternative is to run 'mvn install -DskipTests' from Hadoop source top
level once; and then work from the submodule. Keep in mind that SNAPSHOTs
time out after a while, using the Maven '-nsu' will stop Maven from trying
to update SNAPSHOTs from external repos.

----------------------------------------------------------------------------------
Importing projects to eclipse

At first, install artifacts including hadoop-maven-plugins at the top of the source tree.

  $ mvn clean install -DskipTests -DskipShade

Then, import to eclipse by specifying the root directory of the project via
[File] > [Import] > [Maven] > [Existing Maven Projects].

----------------------------------------------------------------------------------
Building distributions:

Create binary distribution without native code and without documentation:

  $ mvn package -Pdist -DskipTests -Dtar -Dmaven.javadoc.skip=true

Create binary distribution with native code and with documentation:

  $ mvn package -Pdist,native,docs -DskipTests -Dtar

Create source distribution:

  $ mvn package -Psrc -DskipTests

Create source and binary distributions with native code and documentation:

  $ mvn package -Pdist,native,docs,src -DskipTests -Dtar

Create a local staging version of the website (in /tmp/hadoop-site)

  $ mvn clean site -Preleasedocs; mvn site:stage -DstagingDirectory=/tmp/hadoop-site

Note that the site needs to be built in a second pass after other artifacts.

----------------------------------------------------------------------------------
Installing Hadoop

Look for these HTML files after you build the document by the above commands.

  * Single Node Setup:
    hadoop-project-dist/hadoop-common/SingleCluster.html

  * Cluster Setup:
    hadoop-project-dist/hadoop-common/ClusterSetup.html

----------------------------------------------------------------------------------

Handling out of memory errors in builds

----------------------------------------------------------------------------------

If the build process fails with an out of memory error, you should be able to fix
it by increasing the memory used by maven which can be done via the environment
variable MAVEN_OPTS.

Here is an example setting to allocate between 256 MB and 1.5 GB of heap space to
Maven

export MAVEN_OPTS="-Xms256m -Xmx1536m"

----------------------------------------------------------------------------------

Building on macOS (without Docker)

----------------------------------------------------------------------------------
Installing required dependencies for clean install of macOS 10.14:

* Install Xcode Command Line Tools
  $ xcode-select --install
* Install Homebrew
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
* Install OpenJDK 8
  $ brew tap AdoptOpenJDK/openjdk
  $ brew cask install adoptopenjdk8
* Install maven and tools
  $ brew install maven autoconf automake cmake wget
* Install native libraries, only openssl is required to compile native code,
you may optionally install zlib, lz4, etc.
  $ brew install openssl
* Protocol Buffers 3.7.1 (required to compile native code)
  $ wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-java-3.7.1.tar.gz
  $ mkdir -p protobuf-3.7 && tar zxvf protobuf-java-3.7.1.tar.gz --strip-components 1 -C protobuf-3.7
  $ cd protobuf-3.7
  $ ./configure
  $ make
  $ make check
  $ make install
  $ protoc --version

Note that building Hadoop 3.1.1/3.1.2/3.2.0 native code from source is broken
on macOS. For 3.1.1/3.1.2, you need to manually backport YARN-8622. For 3.2.0,
you need to backport both YARN-8622 and YARN-9487 in order to build native code.

----------------------------------------------------------------------------------
Building command example:

* Create binary distribution with native code but without documentation:
  $ mvn package -Pdist,native -DskipTests -Dmaven.javadoc.skip \
    -Dopenssl.prefix=/usr/local/opt/openssl

Note that the command above manually specified the openssl library and include
path. This is necessary at least for Homebrewed OpenSSL.


----------------------------------------------------------------------------------

Building on CentOS 8

----------------------------------------------------------------------------------


* Install development tools such as GCC, autotools, OpenJDK and Maven.
  $ sudo dnf group install --with-optional 'Development Tools'
  $ sudo dnf install java-1.8.0-openjdk-devel maven

* Install python2 for building documentation.
  $ sudo dnf install python2

* Install Protocol Buffers v3.7.1.
  $ git clone https://github.com/protocolbuffers/protobuf
  $ cd protobuf
  $ git checkout v3.7.1
  $ autoreconf -i
  $ ./configure --prefix=/usr/local
  $ make
  $ sudo make install
  $ cd ..

* Install libraries provided by CentOS 8.
  $ sudo dnf install libtirpc-devel zlib-devel lz4-devel bzip2-devel openssl-devel cyrus-sasl-devel libpmem-devel

* Install GCC 9.3.0
  $ sudo dnf -y install gcc-toolset-9-gcc gcc-toolset-9-gcc-c++
  $ source /opt/rh/gcc-toolset-9/enable

* Install CMake 3.19
  $ curl -L https://cmake.org/files/v3.19/cmake-3.19.0.tar.gz > cmake-3.19.0.tar.gz
  $ tar -zxvf cmake-3.19.0.tar.gz && cd cmake-3.19.0
  $ ./bootstrap
  $ make -j$(nproc)
  $ sudo make install

* Install boost.
  $ curl -L -o boost_1_72_0.tar.bz2 https://sourceforge.net/projects/boost/files/boost/1.72.0/boost_1_72_0.tar.bz2/download
  $ tar xjf boost_1_72_0.tar.bz2
  $ cd boost_1_72_0
  $ ./bootstrap.sh --prefix=/usr/local
  $ ./b2
  $ sudo ./b2 install

* Install optional dependencies (snappy-devel).
  $ sudo dnf --enablerepo=PowerTools install snappy-devel

* Install optional dependencies (libzstd-devel).
  $ sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
  $ sudo dnf --enablerepo=epel install libzstd-devel

* Install optional dependencies (isa-l).
  $ sudo dnf --enablerepo=PowerTools install nasm
  $ git clone https://github.com/intel/isa-l
  $ cd isa-l/
  $ ./autogen.sh
  $ ./configure
  $ make
  $ sudo make install

----------------------------------------------------------------------------------

Building on Windows

----------------------------------------------------------------------------------
Requirements:

* Windows System
* JDK 1.8
* Maven 3.0 or later
* Boost 1.72
* Protocol Buffers 3.7.1
* CMake 3.19 or newer
* Visual Studio 2010 Professional or Higher
* Windows SDK 8.1 (if building CPU rate control for the container executor)
* zlib headers (if building native code bindings for zlib)
* Internet connection for first build (to fetch all Maven and Hadoop dependencies)
* Unix command-line tools from GnuWin32: sh, mkdir, rm, cp, tar, gzip. These
  tools must be present on your PATH.
* Python ( for generation of docs using 'mvn site')

Unix command-line tools are also included with the Windows Git package which
can be downloaded from http://git-scm.com/downloads

If using Visual Studio, it must be Professional level or higher.
Do not use Visual Studio Express.  It does not support compiling for 64-bit,
which is problematic if running a 64-bit system.

The Windows SDK 8.1 is available to download at:

http://msdn.microsoft.com/en-us/windows/bg162891.aspx

Cygwin is not required.

----------------------------------------------------------------------------------
Building:

Keep the source code tree in a short path to avoid running into problems related
to Windows maximum path length limitation (for example, C:\hdc).

There is one support command file located in dev-support called win-paths-eg.cmd.
It should be copied somewhere convenient and modified to fit your needs.

win-paths-eg.cmd sets up the environment for use. You will need to modify this
file. It will put all of the required components in the command path,
configure the bit-ness of the build, and set several optional components.

Several tests require that the user must have the Create Symbolic Links
privilege.

All Maven goals are the same as described above with the exception that
native code is built by enabling the 'native-win' Maven profile. -Pnative-win
is enabled by default when building on Windows since the native components
are required (not optional) on Windows.

If native code bindings for zlib are required, then the zlib headers must be
deployed on the build machine. Set the ZLIB_HOME environment variable to the
directory containing the headers.

set ZLIB_HOME=C:\zlib-1.2.7

At runtime, zlib1.dll must be accessible on the PATH. Hadoop has been tested
with zlib 1.2.7, built using Visual Studio 2010 out of contrib\vstudio\vc10 in
the zlib 1.2.7 source tree.

http://www.zlib.net/

----------------------------------------------------------------------------------
Building distributions:

 * Build distribution with native code    : mvn package [-Pdist][-Pdocs][-Psrc][-Dtar][-Dmaven.javadoc.skip=true]

----------------------------------------------------------------------------------
Running compatibility checks with checkcompatibility.py

Invoke `./dev-support/bin/checkcompatibility.py` to run Java API Compliance Checker
to compare the public Java APIs of two git objects. This can be used by release
managers to compare the compatibility of a previous and current release.

As an example, this invocation will check the compatibility of interfaces annotated as Public or LimitedPrivate:

./dev-support/bin/checkcompatibility.py --annotation org.apache.hadoop.classification.InterfaceAudience.Public --annotation org.apache.hadoop.classification.InterfaceAudience.LimitedPrivate --include "hadoop.*" branch-2.7.2 trunk

----------------------------------------------------------------------------------
Changing the Hadoop version declared returned by VersionInfo

If for compatibility reasons the version of Hadoop has to be declared as a 2.x release in the information returned by
org.apache.hadoop.util.VersionInfo, set the property declared.hadoop.version to the desired version.
For example: mvn package -Pdist -Ddeclared.hadoop.version=2.11

If unset, the project version declared in the POM file is used.
```