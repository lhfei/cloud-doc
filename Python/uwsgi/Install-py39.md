

```shell
wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz
```



## Installing Python Package Manager PIP

1. Before we can install the Python package manager, PIP, we need to enable additional software repositories using the following command:

   

   ```shell
   sudo yum install epel-release
   ```

2. Next, install PIP using the following command:

   

   ```shell
   sudo yum install python-pip
   ```

3. Finally, confirm that the installation was successful using the following command:

   

   ```shell
   pip --version
   ```

4. If successful, the system should display the PIP version as well as your current Python version.

## Installing Python 3.9 

Now that we have PIP installed, we can proceed with installing the latest version of Python, 3.9. 

1. Before installing Python you will first need to install the requisite software packages using the following command: 

   

   ```shell
   sudo yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel
   ```

2. Once that is done, download the latest version of Python using the wget command as follows:

   

   ```shell
   wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz
   ```

3. Once the file is downloaded, extract it using the following command:

   

   ```shell
   tar -xvf Python-3.9.13.tgz
   ```

4. Once the file has extracted, move into the directory that was created and configure the installation using the following command:

   

   ```shell
   ./configure --enable-optimizations
   ```

5. Run the following command:

   

   ```shell
   sudo make
   ```

6. Next, build Python using the following command:

   

   ```shell
   sudo make altinstall
   ```

7. After the installation process has finished, confirm the version using the following command:

   

   ```shell
   python3.9 --version
   ```

Congratulations, you have successfully installed Python 3.9 and PIP!