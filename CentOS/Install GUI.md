







Linux admins spend most of their time on working in a terminal; there are some who like to work on GUI instead of a terminal. By default, **CentOS 7** installed as the minimal server, and user intervention is required to change the installation type. This guide will help you to install GUI on **CentOS 7** on the top of the minimal server installation.

Before installing GUI, make a **Local Yum Repository** to avoid downloading packages from the internet.

**Optional:** Run the following command to list down the available package groups for **CentOS 7**.

```
# yum group list
```

**Output:**

```
Loaded plugins: fastestmirror
There is no installed groups file.
Maybe run: yum groups mark convert (see man yum)
Loading mirror speeds from cached hostfile
Available Environment Groups:
 Minimal Install
 Compute Node
 Infrastructure Server
 File and Print Server
 Basic Web Server
 Virtualization Host
 Server with GUI
 GNOME Desktop
 KDE Plasma Workspaces
 Development and Creative Workstation
Available Groups:
 Compatibility Libraries
 Console Internet Tools
 Development Tools
 Graphical Administration Tools
 Legacy UNIX Compatibility
 Scientific Support
 Security Tools
 Smart Card Support
 System Administration Tools
 System Management
Done
```

**Step 1:** Install Gnome GUI using the **YUM command**.

**CentOS 7**

```
# yum groupinstall "GNOME Desktop" "Graphical Administration Tools"
```

**RHEL 7**

```
# yum groupinstall "Server with GUI"
```

**Step 2:** Enable GUI on system startup. In CentOS 7,  systemd uses “**targets**” instead of runlevel. The **/etc/inittab** file is no more used to change run levels. So, issue the following command to enable the GUI on system start.

```
# ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```

**Step 3:** Reboot the machine to start the server in the graphical mode.

```
# reboot
```

**License Agreement:**

Accept the license by clicking on the “**LICENSE INFORMATION**“.

[![Install Gnome GUI on CentOS 7 - Licensing Page](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-Licensing-Page-1024x614.png)](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-Licensing-Page.png)Install Gnome GUI on CentOS 7 – Licensing Page

Tick mark the “**I **accept** the license agreement**” and click on “**Done**“.

[![Install Gnome GUI on CentOS 7 - License Agreement](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-License-Agreement-1024x614.png)](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-License-Agreement.png)Install Gnome GUI on CentOS 7 – License Agreement

Click on “**FINISH CONFIGURATION**” to complete the setup.

[![Install Gnome GUI on CentOS 7 - License Accepted](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-License-Accepted-1024x614.png)](https://cdn.itzgeek.com/wp-content/uploads/2014/08/Install-Gnome-GUI-on-CentOS-7-License-Accepted.png)Install Gnome GUI on CentOS 7 – License Accepted

You may need to do some post configuration tasks, like **creating first user (local account), language, etc**.

Then finally you will get the desktop.

[![Install Gnome GUI on CentOS 7 - GUI Desktop](https://cdn.itzgeek.com/wp-content/uploads/2014/08/CentOS-7-GUI-Desktop-1024x614.png)](https://cdn.itzgeek.com/wp-content/uploads/2014/08/CentOS-7-GUI-Desktop.png)Install Gnome GUI on CentOS 7 – GUI Desktop

That’s All. You have successfully installed GUI on **CentOS 7 / RHEL 7**.