# Install g++ 11 on Ubuntu 20.04

-  August 30, 2021 (June 25, 2022)
-  [Ubuntu](https://lindevs.com/category/operating-system/linux/ubuntu)
-  [0 Comments](https://lindevs.com/install-g-on-ubuntu#comments)
-  34655 Views

The **g++** is a compiler of the GNU Compiler Collection (GCC). The g++ compiler is mainly used to compile C++ programs.

This tutorial explains how to install g++ 11 on Ubuntu 20.04.

## Install g++

Add the Toolchain repository:

```plaintext
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
```

Install g++ 11 by using the following command:

```plaintext
sudo apt install -y g++-11
```

Now you can verify that the installation finished successfully by checking g++ version:

```plaintext
1
g++-11 --version
```

## Testing g++

Create a `main.cpp` file:

```plaintext
1
nano main.cpp
```

Add the following lines of code:

```cpp
1234567#include <iostream>
 
int main() {
    std::cout << "Hello world" << std::endl;
 
    return 0;
}
```

Compile a code with command:

```plaintext
1
g++-11 main.cpp -o test
```

Run a program:

```plaintext
1
./test
```

## Uninstall g++

If you decided to completely remove g++ and related dependencies, execute the following command:

```plaintext
1
sudo apt purge --autoremove -y g++-11
```

Remove GPG key and repository:

```plaintext
12sudo rm -rf /etc/apt/trusted.gpg.d/ubuntu-toolchain-r_ubuntu_test.gpg
sudo rm -rf /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-focal.list
```