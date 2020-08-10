### Install

Copy `lombok.jar` to **STS** `SpringToolSuite4.ini` location, then append the `-javaagent` section content to it. As below: 

```ini
-startup
../Eclipse/plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar
--launcher.library
../Eclipse/plugins/org.eclipse.equinox.launcher.cocoa.macosx.x86_64_1.1.1200.v20200508-1552
-product
org.springframework.boot.ide.branding.sts4
--launcher.defaultAction
openFile
-vmargs
-Dosgi.requiredJavaVersion=1.8
-Dosgi.dataAreaRequiresExplicitInit=true
-Xms256m
-Xmx2048m
--add-modules=ALL-SYSTEM
-XstartOnFirstThread
-Dorg.eclipse.swt.internal.carbon.smallFonts
-Xdock:icon=../Resources/sts4.icns
-javaagent:/Applications/SpringToolSuite4.app/Contents/Eclipse/lombok.jar
```