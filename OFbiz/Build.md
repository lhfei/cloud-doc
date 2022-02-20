## Pre-Requisites

-  For 18.12, the ofbiz-framework trunk and ofbiz-plugins trunk the minimum requirement you need installed is Java 1.8 SDK.
-  Apache OFBiz can be downloaded and run on both Unix based and Windows based systems

**NOTE:** If you are running an older release or branch then please refer to [our Wiki](https://cwiki.apache.org/confluence/display/OFBIZ/Home) for details

## Download

There are two ways to download the OFBiz source code

### 1. Using a Download Mirror

Download your required version from one of our [download mirrors](https://ofbiz.apache.org/download.html) and extract the zip file

### 2. Checkout the Source Code

Checkout the source code from the repository

Anyone can checkout or [browse the source code ](https://ofbiz.apache.org/developers.html#DevRepo)in the OFBiz public gitbox or GitHub repositories.

To checkout the source code, simply use the following command (if you are using a GUI client, configure it appropriately).

We have split OFBiz into ofbiz-framework and ofbiz-plugins, so if you want to use the ofbiz-plugins you need to checkout both trunks.

-  **ofbiz-framework trunk** : `$ git clone https://gitbox.apache.org/repos/asf/ofbiz-framework.git ofbiz-framework`
-  **ofbiz-plugins trunk** : `$ git clone https://gitbox.apache.org/repos/asf/ofbiz-plugins.git plugins`
-  **branch release18.12 (stable)**: `$ git clone https://gitbox.apache.org/repos/asf/ofbiz-framework.git ofbiz-framework`
- You may need to update the tags before: `git fetch --all --tags`
- `$ git checkout release18.12.04`
-  **branch release18.12 (stable)**: `$ git clone https://gitbox.apache.org/repos/asf/ofbiz-plugins.git ofbiz-plugins`
- `$ git checkout release18.12.04`

Or from GitHub:

-  **ofbiz-framework trunk** : `$ git clone https://github.com/apache/ofbiz-framework.git ofbiz-framework`
-  **ofbiz-plugins trunk** : `$ git clone https://github.com/apache/ofbiz-plugins.git plugins`
-  **branch release18.12 (stable)**: `$ git clone https://github.com/apache/ofbiz-framework.git ofbiz-framework`
- You may need to update the tags before: `git fetch --all --tags`
- `$ git checkout release18.12.04`
-  **branch release18.12 (stable)**: `$ git clone https://github.com/apache/ofbiz-plugins.git ofbiz-plugins`
- `$ git checkout release18.12.04`

## Build and Run

Once you have downloaded the source code it will need to be built. The command to built.

### Building Release 18.12

To build 18.12 release, navigate to the OFBiz or framework-trunk directory and;

Run the following command for Unix-like OS

```
./gradlew cleanAll loadDefault
```



Run the following command for MS Windows

```
gradlew cleanAll loadDefault
```



### Building the Trunk

To build the trunk, navigate to the framework-trunk directory and;

Run the following command for Unix-like OS

```
./gradlew cleanAll loadAll
```



Run the following command for MS Windows

```
gradlew cleanAll loadAll
```



### Starting and Running 18.12 or the ofbiz-framework trunk

To start OFBiz running locally, navigate to the trunk directory and;

Run the following command for Unix-like OS

```
./gradlew ofbiz
```



Run the following command for MS Windows

```
gradlew ofbiz
```



To log into OFBiz, navigate with your browser to

```
https://localhost:8443/accounting
```

and login with username **"admin"** and password **"ofbiz"**

### Stopping OFBiz

To stop OFBiz running locally, open a command line terminal window and navigate to the OFBiz directory and;

Run the following command for Unix-like OS

```
./gradlew 'ofbiz --shutdown'
```



Run the following command for MS Windows

```
gradlew ofbiz --shutdown
```



**NOTE**: That quotes are needed for the Unix based command. For further details and a full list of all available OFBiz Gradle commands, please take a look at the main [**README.md file.**](https://svn.apache.org/repos/asf/ofbiz/tools/wiki-files/README.md.html)
If you are an user migrating from a version which uses Ant you might be interested by: [**From Ant to Gradle**](https://cwiki.apache.org/confluence/display/OFBIZ/From+Ant+to+Gradle+-+trunk+version)



## Browse Repository

You can browse the repository using any of the following links.

-  [**ofbiz-framework on gitbox**](https://gitbox.apache.org/repos/asf/ofbiz-framework.git)
-  [**ofbiz-plugins on gitbox**](https://gitbox.apache.org/repos/asf/ofbiz-plugins.git)
-  [**ofbiz-site on gitbox**](https://gitbox.apache.org/repos/asf/ofbiz-site.git)
-  [**ofbiz-tools on gitbox**](https://gitbox.apache.org/repos/asf/ofbiz-tools.git)



Our ofbiz-framework trunk and ofbiz-plugins trunk are also available on Git at the links below:

-  [**ofbiz-framework trunk on Github**](https://github.com/apache/ofbiz-framework)
-  [**ofbiz-plugins trunk on Github**](https://github.com/apache/ofbiz-plugins)

## Development Tutorial

To help you getting started we have put together a beginners OFBiz development tutorial to get familiar with with OFBiz.

It covers the fundamentals of the OFBiz application development process. The goal of this tutorial is to acquaint a developer with best practices, coding conventions. the control flow and things that the developer needs to know in order to modify OFBiz

-  [**Developer Tutorial**](https://cwiki.apache.org/confluence/display/OFBIZ/OFBiz+Tutorial+-+A+Beginners+Development+Guide)

## Documentation and Help

We have a range of technical documenentation and help for developers. Please see the links below.

-  [**OFBiz Technical Documentation**](https://cwiki.apache.org/confluence/display/OFBIZ/Technical+Documentation)
-  [**Developer and Technical FAQs**](https://cwiki.apache.org/confluence/display/OFBIZ/FAQ+-+Tips+-+Tricks+-+Cookbook+-+HowTo)

### OFBiz API Reference

-  [**Trunk API**](https://ci.apache.org/projects/ofbiz/site/trunk/javadocs/)
-  [**Stable release API**](https://ci.apache.org/projects/ofbiz/site/stable/javadocs/)
-  [**Next release API**](https://ci.apache.org/projects/ofbiz/site/next/javadocs/)

After consulting the documentation you still have questions,please feel free to post questions on our development mailing list.