

```shell
```

# Install gcc 11 on Ubuntu 20.04

-  August 29, 2021 (June 24, 2022)
-  [Ubuntu](https://lindevs.com/category/operating-system/linux/ubuntu)
-  [1 Comment](https://lindevs.com/install-gcc-on-ubuntu#comments)
-  55511 Views

The **gcc** is a compiler of the GNU Compiler Collection (GCC). The gcc compiler is mainly used to compile C programs.

This tutorial demonstrates how to install gcc 11 on Ubuntu 20.04.

## Install gcc

Run the following command to add the Toolchain repository:

```plaintext
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
```

Install gcc 11:

```plaintext
sudo apt install -y gcc-11
```

Check gcc version to verify that the installation completed successfully:

```plaintext
gcc-11 --version
```

## Testing gcc

Create a `main.c` file:

```plaintext
nano main.c
```

Add the following code:

```cpp
1234567#include <stdio.h>

int main() {
    printf("Hello world\n");

    return 0;
}
```

Compile a code:

```plaintext
gcc-11 main.c -o test
```

Run a program:

```plaintext
./test
```

## Uninstall gcc

If you want to completely remove gcc and related dependencies, run the following command:

```plaintext
sudo apt purge --autoremove -y gcc-11
```

Remove GPG key and repository:

```Install gcc 11 on Ubuntu 20.04
12sudo rm -rf /etc/apt/trusted.gpg.d/ubuntu-toolchain-r_ubuntu_test.gpg
sudo rm -rf /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-focal.list
```