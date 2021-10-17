# Download the Windows Driver Kit (WDK)

- 08/26/2021
- 4 minutes to read
- - [![img](https://github.com/tedhudek.png?size=32)](https://github.com/tedhudek)
  - [![img](https://github.com/Cymoki.png?size=32)](https://github.com/Cymoki)
  - [![img](https://github.com/0xbadfca11.png?size=32)](https://github.com/0xbadfca11)
  - [![img](https://github.com/aviviano.png?size=32)](https://github.com/aviviano)
  - [![img](https://github.com/RAJU2529.png?size=32)](https://github.com/RAJU2529)
  - 

The WDK is used to develop, test, and deploy drivers for Windows.

- [Learn what's new in driver development](https://docs.microsoft.com/en-us/windows-hardware/drivers/what-s-new-in-driver-development)
- [Review known issues](https://docs.microsoft.com/en-us/windows-hardware/drivers/wdk-known-issues)

[Join the Windows Insider Program](https://insider.windows.com/) to get [WDK Insider Preview builds](https://aka.ms/wipwdk). For installation instructions for the Windows Insider Preview builds, see [Installing preview versions of the Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/installing-preview-versions-wdk).

## Windows 11 WDK runtime requirements

You can run the Windows 11 WDK on Windows 7 and later, and use it to develop drivers for these operating systems:

| Client OS   | Server OS                                |
| :---------- | :--------------------------------------- |
| Windows 11  | Windows Server 2022                      |
| Windows 10  | Windows Server 2019, Windows Server 2016 |
| Windows 8.1 | Windows Server 2012 R2                   |
| Windows 8   | Windows Server 2012                      |
| Windows 7   | Windows Server 2008 R2 SP1               |

## Download and install the Windows 11 WDK

### ![download icon.](https://docs.microsoft.com/en-us/windows-hardware/drivers/images/download-install.png) Step 1: Install Visual Studio 2019

The WDK requires Visual Studio. For more information about system requirements for Visual Studio, see [Visual Studio 2019 System Requirements](https://docs.microsoft.com/en-us/visualstudio/releases/2019/system-requirements).

The following editions of Visual Studio 2019 support driver development for this release:

- [Download Visual Studio Community 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16)
- [Download Visual Studio Professional 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Professional&rel=16)
- [Download Visual Studio Enterprise 2019](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Enterprise&rel=16)

When you install Visual Studio 2019, select the **Desktop development with C++** workload. The Windows 10 Software Development Kit (SDK) is automatically included and is displayed in the right-hand **Summary** pane. Note that the version of the SDK that is compatible with the Windows 11 WDK may not be the default installed with Visual Studio. To get the compatible version of the SDK please use the link in step 2 below.

WDK has Spectre mitigation enabled by default but requires spectre mitigated libraries to be installed with Visual Studio for each architecture you are developing for. Additionally, developing drivers for ARM/ARM64/ARM64EC require the build tools for these architectures to also be installed with Visual Studio. To locate these items, you will need to know the latest version of MSVC installed on your system.

To find the latest version of MSVC installed on your system, in **Visual Studio Installer** go to **workload page**, on the right pane under **installation details**, expand **Desktop development with C++** and locate the **MSVC v142 - VS 2019 C++ x64/x86 build tools (V14.xx)** - note where **xx** should be the highest version available.

With this information (v14.xx), go to **Individual components** and search for **v14.xx**. This will return the tool sets for all architectures, including Spectre mitigated libs. Select the driver architecture you are developing for. Alternatively you can search for 'Latest' and the most recent version of MSVC will be displayed to select.

For example, searching for Latest returns the following:

ConsoleCopy

```console
MSVC v142 - VS 2019 C++ ARM build tools (Latest)
MSVC v142 - VS 2019 C++ ARM Spectre-mitigated libs (Latest)
MSVC v142 - VS 2019 C++ ARM64 build tools (Latest)
MSVC v142 - VS 2019 C++ ARM64 Spectre-mitigated libs (Latest)
MSVC v142 - VS 2019 C++ ARM64EC build tools (Latest - experimental)
MSVC v142 - VS 2019 C++ ARM64EC Spectre-mitigated libs (Latest - experimental)
MSVC v142 - VS 2019 C++ x64/x86 build tools (Latest)
MSVC v142 - VS 2019 C++ x64/x86 Spectre-mitigated libs (Latest)
```

### ![download icon.](https://docs.microsoft.com/en-us/windows-hardware/drivers/images/download-install.png) Step 2: Install Windows 11 SDK (22000.1)

- [Download Windows 11 SDK (22000.1)](https://go.microsoft.com/fwlink/?linkid=2166460)

This SDK must be installed separately until available through Visual Studio

### ![download icon.](https://docs.microsoft.com/en-us/windows-hardware/drivers/images/download-install.png) Step 3: Install Windows 11 WDK

- [Download WDK for Windows 11](https://go.microsoft.com/fwlink/?linkid=2166289)

The WDK Visual Studio extension is included in the default WDK installation.

 Tip

If you can't find driver project templates in Visual Studio, the WDK Visual Studio extension didn't install properly. To resolve this, run the WDK.vsix file from this location: C:\Program Files (x86)\Windows Kits\10\Vsix\VS2019\WDK.vsix.

## Enterprise WDK (EWDK)

The EWDK is a standalone, self-contained command-line environment for building drivers. It includes Visual Studio Build Tools, the SDK, and the WDK. The latest public version of the EWDK contains Visual Studio 2019 Build Tools 16.9.2 and MSVC toolset v14.28. To get started, mount the ISO and run **LaunchBuildEnv**.

The EWDK also requires the .NET Framework version 4.7.2. For more information about other requirements for the .NET Framework, see [.NET Framework system requirements](https://docs.microsoft.com/en-us/dotnet/framework/get-started/system-requirements).

### ![download icon.](https://docs.microsoft.com/en-us/windows-hardware/drivers/images/download-install.png) Windows 11 EWDK with Visual Studio Build Tools

- [Download the Windows 11 EWDK](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019-New)

> You can use the Visual Studio interface with the build tools provided in the EWDK.
>
> 1. Mount the EWDK ISO.
> 2. Run `LaunchBuildEnv.cmd`.
> 3. In the environment created in step 2, type **SetupVSEnv**, and then press **Enter**.
> 4. Launch devenv.exe from the same environment, using the full file path. Example: `"C:\Program Files (x86)\Microsoft Visual Studio\2019\\%Community|Professional|Enterprise%\Common7\IDE\devenv.exe"`
>
> Note that the Visual Studio major version should match with the version in the EWDK. For example, Visual Studio 2019 works with the EWDK that contain VS16.X build tools.



## Driver samples for Windows

To download the driver samples, do one of the following:

- Go to the driver samples page on [GitHub](https://github.com/Microsoft/Windows-driver-samples), click **Clone or download**, and then click **Download ZIP**.
- Download the [GitHub Extension for Visual Studio](https://visualstudio.github.com/), and then connect to the GitHub repositories.
- Browse the driver samples on the [Microsoft Samples portal](https://docs.microsoft.com/en-us/samples/browse/?products=windows-wdk).

## Related downloads

- [Download the WDK Insider Preview](https://www.microsoft.com/software-download/windowsinsiderpreviewWDK)
- [Download previous versions of the WDK](https://docs.microsoft.com/en-us/windows-hardware/drivers/other-wdk-downloads)
- [Download the Windows Assessment and Deployment Kit (Windows ADK)](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install)
- [Download the Windows HLK](https://docs.microsoft.com/en-us/windows-hardware/test/hlk/windows-hardware-lab-kit)
- [Download the Windows Debugging Tools (WinDbg)](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools)
- [Download Windows Symbol Packages](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-symbols)

------

## Recommended content

- [Microsoft Enterprise WDK License for VS 2019](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019)

  These license terms apply to the Microsoft Enterprise Windows Driver Kit and Visual Studio 2019.

- [Installing preview versions of the Windows Driver Kit (WDK) - Windows drivers](https://docs.microsoft.com/en-us/windows-hardware/drivers/installing-preview-versions-wdk)

  Istallation instructions for the latest pre-release version of the Windows Driver Kit (WDK)

- [Previous WDK versions and other downloads - Windows drivers](https://docs.microsoft.com/en-us/windows-hardware/drivers/other-wdk-downloads)

  Install versions of the Windows Driver Kit (WDK), the Windows Debugger (WinDBG), and more.

- [Driver Verifier What's New - Windows drivers](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/driver-verifier--what-s-new)

  Driver Verifier is available in all versions of Windows starting with Windows 2000. Each version introduces new features and checks for finding bugs in Windows drivers. This section summarizes the changes and provides links to related documentation.