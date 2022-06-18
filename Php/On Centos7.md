## [How To Install PHP 7, 7.2 & 7.3 On CentOS 7](https://phoenixnap.com/kb/install-php-7-on-centos#:~:text=1%20Choose%20PHP%20Version%20to%20Install.%20The%20newest,and%20its%20Dependencies.%20...%205%20PHP%20Modules.%20)

Introduction

**PHP** is a programming language often used to automate server tasks. It is part of the LAMP (Linux, Apache, MySQL, PHP) stack, which is a bundle of software used for running internet servers and services. PHP handles dynamic content, database requests, and processing and displaying data.

**This step-by-step guide shows how to install PHP on CentOS 7.**

Prerequisites

- Access to a user account with **sudo** privileges
- Access to a terminal window/command-line
- The **yum** package manager, included by default
- A third-party software repository, detailed below

How to Install PHP 7.2 with Apache on CentOS

### Step 1: Choose PHP Version to Install

The newest stable release version of PHP is PHP 7.3.1. However, some software repositories default to older versions of the software.

One advantage of using an older release is its high stability and reliability. Newer releases may include more features, but are often more experimental and could cause system instability. If you cannot decide which version is right for you, version 7.2 is a great place to start.

### Step 2: Enable Additional Software Repositories

By default, the **yum** package manager does not include access to the repositories that store the PHP packages. Therefore, you need to enable access to these software packages.

\1. First, start by installing the **yum-utils package** by entering the following command in a terminal window:

```
sudo yum install yum-utils –y
```

\2. Then, enable the **epel-release** repository by entering the following:

```
sudo yum install epel-release –y
```

\3. Finally, add the following software repositories that contain the PHP packages:

```
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

**Note:** This procedure uses Remi’s Software Repository. You can find more information about this utility by visiting the [FAQ page](https://blog.remirepo.net/pages/English-FAQ).

### Step 3: Enable Repository For PHP Version

Next, use the **yum-config-manager** to point your installer to the repository of the PHP version you want to install:

```
sudo yum-config-manager ––enable remi–php70
```

This command configures your system to download and install PHP 7.0.
To install PHP 7.1, change the entry as follows:

```
sudo yum-config-manager ––enable remi–php71
```

Likewise, replace the last two characters with **72** to install PHP 7.2.

### Step 4: Install PHP and its Dependencies

At this point, you can install PHP. Enter the following command in the terminal:

```
sudo yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql –y
```

As you see, the line includes many of the modules and add-ons that help PHP integrate with your local server configuration.

The output will also indicate which dependencies have been installed.

![How to install PHP on CentOS](https://phoenixnap.com/kb/wp-content/uploads/2021/04/install-php.png)

### Step 5: PHP Modules

You may have noticed that the installation script included more than just the base PHP package. Many of these are modules that provide basic functionality to PHP. Installing this set helps ensure that your PHP installation meets your expectations for usage.

Like many other Linux applications, you can enhance your system’s PHP functionality using **modules**.

To search for available modules and generate a list of modules, type in the following command:

```
sudo yum search php | more
```

![Generate a list of PHP modules.](https://phoenixnap.com/kb/wp-content/uploads/2021/04/php-modules.png)

## Step 6: Verify PHP Version

Finally, verify your installation was successful. Check which version of PHP you are running with the command:

```
php –v
```

![How to check PHP version installed?](https://phoenixnap.com/kb/wp-content/uploads/2021/04/check-php-version.png)

## Optional: Install PHP 7.3

You can enable Remi’s PHP 7.3 repository the same way you enabled other repositories in Step 3. However, this installation may fail if you have extensions that are not compatible with PHP 7.3.

If this is a first-time installation and you are confident that your system is compatible, you can enable PHP 7.3. Install the release with the following commands:

```
sudo yum-config-manager ––enable remi–php73``sudo yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql –y
```