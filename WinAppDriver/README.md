# [使用微软的WinAppDriver进行Windows客户端自动化测试](https://www.cnblogs.com/nanshufang/p/winappdriver.html)

一、[WinAppDriver](https://github.com/microsoft/WinAppDriver)简介：

​    参见：https://github.com/microsoft/WinAppDriver

​    Windows Application Driver（[WinAppDriver](https://github.com/microsoft/WinAppDriver)）是在windows应用程序上支持类似Selenium的UI自动化测试服务。支持这些类型的测试**Universal Windows Platform (UWP)**, **Windows Forms (WinForms)**, **Windows Presentation Foundation (WPF)**, and **Classic Windows (Win32)** apps on **Windows 10 PCs**。

​    以上是从GitHub官网翻译过来的，对我的需求讲是可以在**Windows 10PC**电脑上进行客户端的自动化测试。

二、环境搭建：

   (一) [WinAppDriver](https://github.com/microsoft/WinAppDriver)环境搭建

1.  安装[WinAppDriver](https://github.com/microsoft/WinAppDriver):

​      \1)   下载地址：https://github.com/microsoft/WinAppDriver/releases

​           选择最新的release版本就行，比如我用的是v1.1.1 Release

​      \2)   直接运行WindowsApplicationDriver.msi进行安装。

​          这里一定要注意，**必须要通过安装文件进行安装**，**不要复制安装之后的文件夹**，在一台新的没有安装过WindowsApplicationDriver.msi的电脑，只是将其他电脑的安装目录的文件夹及所有文件复制过来，运行的过程会有无法找到控件的情况发生。

​    2.开启开发者模式：

​      \1)   在Windows的开始菜单找到“设置”![img](https://img2018.cnblogs.com/blog/1839122/201910/1839122-20191018004431773-569050300.png)

​          ![img](https://img2018.cnblogs.com/blog/1839122/201910/1839122-20191018005638273-288194641.png)

​        \2)   搜索“开发者选项设置“

​          ![img](https://img2018.cnblogs.com/blog/1839122/201910/1839122-20191018005718352-1073451650.png)

​        \3)   打开“开发人员模式”选项

​          ![img](https://img2018.cnblogs.com/blog/1839122/201910/1839122-20191018005750808-1984269833.png)

​      \4)   启动：

​         使用的时候，在命令行运行WinAppDriver.exe就行，根据实际情况可以选择以下几种方式：

```
1 WinAppDriver.exe 4727
2 WinAppDriver.exe 10.0.0.10 4725
3 WinAppDriver.exe 10.0.0.10 4723/wd/hub
```

   (二) WinAppDriverUiRecorder使用：

​       1.下载：https://github.com/Microsoft/WinAppDriver/releases

​       2.使用方法参见：https://github.com/Microsoft/WinAppDriver/wiki/WinAppDriver-UI-Recorder

   (三) 开发环境搭建

​      1、 Java环境搭建

​        \1)   下载：https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

​        \2)   配置环境变量

​      2、 安装配置maven

​        \1)   下载：http://mirrors.hust.edu.cn/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

​        \2)   配置环境变量

三、框架demo，参见：https://github.com/nanshufang/WinAppDriverDemo

到此基本完成~