# [Installing CMake](https://cmake.org/install/)

There are several ways to install **[CMake](https://cmake.org/install/)**, depending on your platform.



## Windows

There are pre-compiled binaries available on the [Download](https://cmake.org/download/) page for Windows as MSI packages and ZIP files. The Windows installer has an option to modify the system `PATH` environment variable. If that is not selected during installation, one may manually add the install directory (e.g. `C:\Program Files\CMake\bin`) to the `PATH` in a command prompt.

One may alternatively download and build CMake from source. The [Download](https://cmake.org/download/) page also provides source releases. In order to build CMake from a source tree on Windows, you must first install the latest binary version of CMake because it is used for building the source tree. Once the binary is installed, run it on CMake as you would any other project. Typically this means selecting CMake as the Source directory and then selecting a binary directory for the resulting executables.



## macOS

There are pre-compiled binaries available on the [Download](https://cmake.org/download/) page for macOS as disk images and tarballs. After copying `CMake.app` into `/Applications` (or a custom location), run it and follow the “How to Install For Command Line Use” menu item for instructions to make the command-line tools (e.g. `cmake`) available in the `PATH`. Or, one may manually add the install directory (e.g. `/Applications/CMake.app/Contents/bin`) to the `PATH`.

One may alternatively download and build CMake from source as in the following section.



## Linux, UNIX

There are pre-compiled binaries available on the [Download](https://cmake.org/download/) page for some UNIX platforms. One may alternatively download and build CMake from source. The [Download](https://cmake.org/download/) page provides source releases. There are two possible approaches for building CMake from a source tree. If there is no existing CMake installation, a bootstrap script is provided:

```
  ./bootstrap
  make
  make install
```

(Note: the make install step is optional, cmake will run from the build directory.)

By default bootstrap will build CMake without any debug or optimization flags. To enable optimizations you will need to specify the `CMAKE_BUILD_TYPE` option to bootstrap like this: `./bootstrap -- -DCMAKE_BUILD_TYPE:STRING=Release`

For more options with bootstrap, run `./bootstrap --help ` .

Or, an existing CMake installation can be used to build a new version:

```
  cmake .
  make      
  make install
```

(Note: the make install step is optional, cmake will run from the build directory.) If you are not using the GNU C++ compiler, you need to tell the bootstrap script (or cmake) which compiler you want to use. This is done by setting the environment variables CC and CXX before running it. For example:

```
  env CC=cc CXX=CC ./bootstrap
  make
  make install
```



## Download Verification

Each release on the [Download](https://cmake.org/download/) page comes with a file named `cmake-$version-SHA-256.txt`, where `$version` is the release version number.
One may use this file to verify other downloads, such as the source tarball. For example:

```
  $ curl -OL https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1-SHA-256.txt
  $ curl -OL https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1.tar.gz
  $ sha256sum -c --ignore-missing cmake-3.20.1-SHA-256.txt
  cmake-3.20.1.tar.gz: OK
```

The SHA-256 file itself can be verified by GPG signature:

```
  $ curl -OL https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1-SHA-256.txt.asc
  $ gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys C6C265324BBEBDC350B513D02D2CEF1034921684
  $ gpg --verify cmake-3.20.1-SHA-256.txt.asc cmake-3.20.1-SHA-256.txt
```

The GPG key [C6C265324BBEBDC350B513D02D2CEF1034921684](https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xcba23971357c2e6590d9efd3ec8fef3a7bfb4eda) is a signing subkey whose expiry is updated yearly.