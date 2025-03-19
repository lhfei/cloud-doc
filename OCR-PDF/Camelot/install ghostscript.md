# Installation of dependencies

The dependencies [Ghostscript](https://www.ghostscript.com/) and [Tkinter](https://wiki.python.org/moin/TkInter) can be installed using your system’s package manager or by running their installer.

## OS-specific instructions

### Ubuntu

```
$ apt install ghostscript python3-tk
```

### MacOS

```
$ brew install ghostscript tcl-tk
```

### Windows

For Ghostscript, you can get the installer at their [downloads page](https://www.ghostscript.com/download/gsdnld.html). And for Tkinter, you can download the [ActiveTcl Community Edition](https://www.activestate.com/activetcl/downloads) from ActiveState.

| Platform/License                                | [![AGPL Logo](https://ghostscript.com/images/logos/agpl.svg)](http://www.gnu.org/licenses/agpl-3.0.html) GNU Affero General Public License | [![Artifex Logo](https://ghostscript.com/images/logos/artifex-logo.png)](https://www.ghostscript.com/licensing/) Artifex Commercial License |
| ----------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Ghostscript 10.04.0 for Windows (32 bit)        | [Ghostscript AGPL Release](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/gs10040w32.exe) | [Ghostscript Commercial License](http://www.ghostscript.com/~customer/releases/ghostpdl/) |
| Ghostscript 10.04.0 for Windows (64 bit)        | [Ghostscript AGPL Release](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/gs10040w64.exe) | [Ghostscript Commercial License](http://www.ghostscript.com/~customer/releases/ghostpdl/) |
| Ghostscript 10.04.0 snap for Linux x86 (64 bit) | [Ghostscript AGPL Release](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/gs_10.04.0_amd64_snap.tgz) | [Ghostscript Commercial License](http://www.ghostscript.com/~customer/releases/ghostpdl/) |
| Ghostscript 10.04.0 Source for all platforms    | [Ghostscript AGPL Release](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/ghostscript-10.04.0.tar.gz) | [Ghostscript Commercial License](http://www.ghostscript.com/~customer/releases/ghostpdl/) |

## Checks to see if dependencies are installed correctly

You can run the following checks to see if the dependencies were installed correctly.

### For Ghostscript

Open the Python REPL and run the following:

For Ubuntu/MacOS:

```
>>> from ctypes.util import find_library
>>> find_library("gs")
"libgs.so.9"
```

For Windows:

```
>>> import ctypes
>>> from ctypes.util import find_library
>>> find_library("".join(("gsdll", str(ctypes.sizeof(ctypes.c_voidp) * 8), ".dll")))
<name-of-ghostscript-library-on-windows>
```

**Check:** The output of the `find_library` function should not be empty.

If the output is empty, then it’s possible that the Ghostscript library is not available one of the `LD_LIBRARY_PATH`/`DYLD_LIBRARY_PATH`/`PATH` variables depending on your operating system. In this case, you may have to modify one of those path variables.

### For Tkinter

Launch Python and then import Tkinter:

```
>>> import tkinter
```

**Check:** Importing `tkinter` should not raise an import error.