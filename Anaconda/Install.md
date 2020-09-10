# Installing on Linux

## Prerequisites

To use GUI packages with Linux, you will need to install the following extended dependencies for Qt:

| Debian        | `apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6` |
| ------------- | ------------------------------------------------------------ |
| RedHat        | `yum install libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver` |
| ArchLinux     | `pacman -Sy libxau libxi libxss libxtst libxcursor libxcomposite libxdamage libxfixes libxrandr libxrender mesa-libgl alsa-lib libglvnd` |
| OpenSuse/SLES | `zypper install libXcomposite1 libXi6 libXext6 libXau6 libX11-6 libXrandr2 libXrender1 libXss1 libXtst6 libXdamage1 libXcursor1 libxcb1 libasound2 libX11-xcb1 Mesa-libGL1 Mesa-libEGL1` |
| Gentoo        | `emerge x11-libs/libXau x11-libs/libxcb x11-libs/libX11 x11-libs/libXext x11-libs/libXfixes x11-libs/libXrender x11-libs/libXi x11-libs/libXcomposite x11-libs/libXrandr x11-libs/libXcursor x11-libs/libXdamage x11-libs/libXScrnSaver x11-libs/libXtst media-libs/alsa-lib media-libs/mesa` |

## Installation

For x86 systems.

1. In your browser, download the [Anaconda installer for Linux](https://www.anaconda.com/download/#linux).

2. RECOMMENDED: [Verify data integrity with SHA-256](https://docs.anaconda.com/anaconda/install/hashes/). For more information on hashes, see [What about cryptographic hash verification?](https://conda.io/projects/conda/en/latest/user-guide/install/download.html#cryptographic-hash-verification)

   - Open a terminal and run the following:

     ```
     sha256sum /path/filename
     ```

3. Enter the following to install Anaconda for Python 3.7:

   ```
   bash ~/Downloads/Anaconda3-2020.02-Linux-x86_64.sh
   ```

   OR Enter the following to install Anaconda for Python 2.7:

   ```
   bash ~/Downloads/Anaconda2-2019.10-Linux-x86_64.sh
   ```

   Note

   Include the `bash` command regardless of whether or not you are using Bash shell.

   Note

   If you did not download to your Downloads directory, replace `~/Downloads/` with the path to the file you downloaded.

4. The installer prompts “In order to continue the installation process, please review the license agreement.” Click Enter to view license terms.

5. Scroll to the bottom of the license terms and enter “Yes” to agree.

6. The installer prompts you to click Enter to accept the default install location, CTRL-C to cancel the installation, or specify an alternate installation directory. If you accept the default install location, the installer displays “PREFIX=/home/<user>/anaconda<2 or 3>” and continues the installation. It may take a few minutes to complete.

   Note

   We recommend you accept the default install location. Do not choose the path as /usr for the Anaconda/Miniconda installation.

7. The installer prompts “Do you wish the installer to initialize Anaconda3 by running conda init?” We recommend “yes”.

   Note

   If you enter “no”, then conda will not modify your shell scripts at all. In order to initialize after the installation process is done, first run `source <path to conda>/bin/activate` and then run `conda init`. See [FAQ](https://docs.anaconda.com/anaconda/user-guide/faq/#distribution-faq-linux-path).

8. The installer finishes and displays “Thank you for installing Anaconda<2 or 3>!”

9. The installer provides a link to install PyCharm for Anaconda at https://www.anaconda.com/pycharm.

10. Close and open your terminal window for the installation to take effect, or you can enter the command `source ~/.bashrc`.

11. To control whether or not each shell session has the base environment activated or not, run `conda config --set auto_activate_base False or True`. To run conda from anywhere without having the base environment activated by default, use `conda config --set auto_activate_base False`. This only works if you have run `conda init` first.

    Note

    `conda init` is available in conda versions 4.6.12 and later.

12. [Verify your installation](https://docs.anaconda.com/anaconda/install/verify-install/).

    Note

    If you install multiple versions of Anaconda, the system defaults to the most current version as long as you haven’t altered the default install path.