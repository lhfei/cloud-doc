
```sh
bin/mkdistro.sh -DskipTests -Dhadoop.version=2.7.3 -Dhadoop.auth.version=2.7.3 -Dhbase.version=1.2.5 -Dhive.version=2.1.1 -Dtomcat.version=8.5.14 -Phadoop-2
```



```sh

$ bin/mkdistro.sh [-DskipTests]Running =mkdistro.sh= will create the binary distribution of Oozie. By default, oozie war will not contain hadoop and
hcatalog libraries, however they are required for oozie to work. There are 2 options to add these libraries:
1. At install time, copy the hadoop and hcatalog libraries to libext and run oozie-setup.sh to setup oozie war. This is
suitable when same oozie package needs to be used in multiple set-ups with different hadoop/hcatalog versions.
2. Build with -Puber which will bundle the required libraries in the oozie war. Further, the following options are
available to customise the versions of the dependencies:
-P<profile> - default hadoop-2. Valid are hadoop-1, hadoop-2 or hadoop-3. Choose the correct hadoop
profile depending on the hadoop version used.
-Dhadoop.version=<version> - default 1.2.1 for hadoop-1, 2.4.0 for hadoop-2 and 3.0.0-SNAPSHOT for hadoop-3
-Dhadoop.auth.version=<version> - defaults to hadoop version
-Ddistcp.version=<version> - defaults to hadoop version
-Dpig.version=<version> - default 0.16.0
-Dpig.classifier=<classifier> - default none
-Dsqoop.version=<version> - default 1.4.3
-Dsqoop.classifier=<classifier> - default hadoop100
-Dtomcat.version=<version> - default 6.0.47
-Dopenjpa.version=<version> - default 2.2.2
-Dxerces.version=<version> - default 2.10.0
-Dcurator.version=<version> - default 2.5.0
-Dhive.version=<version> - default 0.13.1 for hadoop-1, 1.2.0 for hadoop-2 and hadoop-3 profile
-Dhbase.version=<version> - default 0.94.2

```