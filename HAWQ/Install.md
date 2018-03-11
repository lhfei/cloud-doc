# Build and Install



### How to Build

#### Setup an environment with the dependencies installed

- [**MacOS (10.10+)**](https://cwiki.apache.org/confluence/display/HAWQ/Build+and+Install#macos)
- [**Red Hat/CentOS 7.X**](https://cwiki.apache.org/confluence/display/HAWQ/Build+and+Install#tab-yum)
- [**Red Hat/CentOS 6.X**](https://cwiki.apache.org/confluence/display/HAWQ/Build+and+Install#)
- [**Docker (Red Hat/CentOS 7.X)**](https://cwiki.apache.org/confluence/display/HAWQ/Build+and+Install#docker-tab)

#### Install dependencies on MAC (with xcode installed)

Make sure you have done: xcode-select --install to install developer tools

Please refer to section below titled **Running catalog tidycat perl modules** for installing perl-JSON module on MAC/

Note for Installing Dependencies

- some dependencies require brew install <packagename> --universal, if you see HAWQ complains about an already installed package is required, try that.

- El Capitan issues: boost cannot be installed as --universal (command shell will hang), you need follow manul steps <http://www.boost.org/doc/libs/1_61_0/more/getting_started/unix-variants.html#easy-build-and-install>

- If you see openssl error, try:

  brew link --force openssl

#### OS requirement

Use a text editor to edit the /etc/sysctl.conf file. Add or edit each of the following parameter definitions to set the required value. 

​       kern.sysv.shmmax=2147483648

​       kern.sysv.shmmin=1

​        kern.sysv.shmmni=64

​        kern.sysv.shmseg=16

​        kern.sysv.shmall=524288

​        kern.maxfiles=65535

​        kern.maxfilesperproc=65536

- Reboot to apply the change.

#### Install Xcode and command line tools

After install/update xcode, please run ‘xcode-select --install’ to install command line tools, and then open xcode to make sure you have already installed it. 

#### **MUST**: Turning Off Rootless System Integrity Protection in OS X El Capitan 10.11+

If not do this, you may encounter some tricky LIBRARY_PATH problems. e.g. [HAWQ-513](https://issues.apache.org/jira/browse/HAWQ-513)

Following below instructions: ( refer to [http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x )](http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x)

1. Reboot the Mac and hold down Command + R keys simultaneously after you hear the startup chime, this will boot OS X into Recovery Mode
2. When the “OS X Utilities” screen appears, pull down the ‘Utilities’ menu at the top of the screen instead, and choose “Terminal”
3. Type the following command into the terminal then hit return: csrutil disable; reboot

#### Build optional extension modules

| Extension | How to enable                            | Pre-build steps on Mac                   |
| --------- | ---------------------------------------- | ---------------------------------------- |
| PL/R      | ./configure --with-r                     | #install R before buildbrew tap homebrew/sciencebrew install r |
| PL/Python | ./configure --with-python                |                                          |
| PL/Java   | ./configure --with-java                  |                                          |
| PL/PERL   | ./configure --with-perl                  |                                          |
| pgcrypto  | ./configure --with-pgcrypto --with-openssl |                                          |
| gporca    | ./configure --enable-orca                |                                          |
| rps       | ./configure --enable-rps                 | brew install tomcat@6                    |

#### Install Hadoop

Please follow the steps here: <https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html>

Note:

- you might need to build hadoop from source on Red Hat/CentOS 6.x if the downloaded hadoop package has higher glibc version requirement. When that happens, you will probably see the warning below when running start-dfs.sh." WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform"
- You will also need to set  the port for fs.defaultFS to 8020 in etc/hadoop/core-site.xml (The example above set it as 9000.)
- HDFS is a must, but YARN is optional. YARN is only needed when you want to use YARN as the global resource manager.
- must setup passphraseless ssh, otherwise there will be some problems of "hawq init cluster" in the following step.

Your need to verify your HDFS works.

#### Get the HAWQ code and Compile

Once you have an environment with the necessary dependencies installed and Hadoop is ready, the next step is to get the code and build HAWQ

#### Init/Start/Stop HAWQ

#### Connect and Run basic queries

#### Query external hadoop data

You will need to use [PXF](https://cwiki.apache.org/confluence/display/HAWQ/PXF) to query external hadoop/hive/hbase data. Refer to [PXF Build & Install](https://cwiki.apache.org/confluence/display/HAWQ/PXF+Build+and+Install) document.

#### Test HAWQ

#### Running catalog tidycat perl modules

The JSON Perl Module is required to run the set of Perl scripts (src/include/catalog).  The versioned JSON formatted catalog files are stored in tools/bin/gppylib/data/<version>.json.  In order to install the JSON module, the developer will need to make the module available from CPAN.  The following was validated on a Macbook Pro OS X 10.11.6 using the information from the **Perl on Mac OSX** section (<http://www.cpan.org/modules/INSTALL.html>).  Below you will see the session which performs the following steps:

1. Validate JSON module is not in the environment.  Receive appropriate error message.
2. Run **cpan install JSON **command to install the JSON Perl module.  In the example below, the module is installed locally (local::lib) and not in the system's Perl installation.
3. Execute the environment variable updates added to the .bashrc file by the installation process.
4. Validate the tidycat.pl command can now be run without receiving error.

Note:

- JSON Module version 2.27 and the latest 2.90 have been used to validate they generate the proper catalog JSON formatted file.
- The scripts are essentially validating the evaluation of *require JSON* passes otherwise the error message is displayed:

Fatal Error: The required package JSON is not installed -- please download it from [www.cpan.org](http://www.cpan.org/)

 



https://cwiki.apache.org/confluence/display/HAWQ/Build+and+Install







