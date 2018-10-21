



1

#### Preparation

### Update and Reboot

Update the entire system.

```
sudo apt update
sudo apt upgrade
```

Verify that the apt-transport-https utility is installed

```
sudo apt install apt-transport-https
```

Reboot to activate the latest kernel.

```
sudo reboot
```

### Create the MapD User

Create the mapd group and mapd user, who will be the owner of the MapD database. You can create both the group and user with the useradd command and the -U switch.

```
sudo useradd -U mapd
```

### Enable the Firewall

To use Immerse, you must prepare your host machine to accept HTTP connections. You can configure your firewall for external access.

```
sudo ufw disable 
sudo ufw enable 
sudo ufw allow 9092/tcp 
```

For more information, see <https://help.ubuntu.com/lts/serverguide/firewall.html>.

### Install CUDA Drivers

Download the DEB package provided by NVIDIA from the [NVIDIA CUDA Zone](https://developer.nvidia.com/cuda-downloads).

1. Install the CUDA repository, update local repository cache, and then install the CUDA Toolkit and GPU drivers.`sudo dpkg --install cuda-repo-ubuntu1604_8.0.44-1_amd64.deb sudo apt update sudo apt install cuda-drivers linux-image-extra-virtual `Where cuda-repo-ubuntu1604_8.0.44-1_amd64.deb is the name of the package provided by NVIDIA.
2. Reboot.`sudo reboot`
3. Verify installation of the GPU drivers by running the following command.`nvidia-smi`

2

#### Installation

If necessary, install the curl command.

```
sudo apt install curl
```

Use curl to download the MapD list file.

```
curl https://releases.mapd.com/ce/mapd-ce-cuda.list | sudo tee /etc/apt/sources.list.d/mapd.list
```

Download and add a GPG key to apt.

```
curl https://releases.mapd.com/GPG-KEY-mapd | sudo apt-key add -
```

Use

 

update

 

to locate the new installation options, then install MapD.

```
sudo apt update sudo apt install mapd
```

3

#### Configuration

For convenience, you can update bash.rc with the required environment variables.

1. Go to your home directory.
2. Use ctrl-h to show hidden files.
3. Edit the .bashrc file. Add the following export commands under user specific aliases.`# User specific aliases and functions export MAPD_USER=mapd export MAPD_GROUP=mapd export MAPD_STORAGE=/var/lib/mapd export MAPD_PATH=/opt/mapd `
4. Save the .bashrc file.
5. Open a new terminal window to use your changes.

The $MAPD_STORAGE directory must be dedicated to MapD: do not set it to a directory shared by other packages.

1. Create a data directory.

   ```
   sudo mkdir -p $MAPD_STORAGE
   ```

2. Change the owner of the data directory to the MapD user (for example,mapd).

   ```
   sudo chown -R $MAPD_USER $MAPD_STORAGE
   ```

You can also create a configuration file with optional settings. See [Configuration](https://www.omnisci.com/platform/configuration/#configuration).

4

#### Initialization

1. Run the systemd installer. This script requires sudo access. You might be prompted for a password. Accept the values provided (based on your environment variables) or make changes as needed. The script creates a data directory in $MAPD_STORAGE with the directories mapd_catalogs, mapd_data, mapd_export, mapd_import, mapd_log. The mapd_log directory is the one of most interest to a MapD administrator.

   ```
   cd $MAPD_PATH/systemd sudo ./install_mapd_systemd.sh
   ```

5

#### Activation

1. Start MapD Core

   ```
   cd $MAPD_PATH 
   sudo systemctl start mapd_server 
   sudo systemctl start mapd_web_server 
   ```

2. Enable MapD Core to start when the system reboots.

   ```
   sudo systemctl enable mapd_server
   sudo systemctl enable mapd_web_server
   ```

**Checkpoint**

To verify that all systems are go, load some sample data, perform a mapdql query, and generate a pointmap using Immerse.

MapD ships with two sample datasets of airline flight information collected in 2008. To install the sample data, run the following command.

```
sudo $MAPD_PATH/insert_sample_data
```

When prompted, choose whether to insert dataset 1 (7 million rows) or dataset 2 (10 thousand rows).

```
Enter dataset number to download, or 'q' to quit: 
```

| #    | Dataset        | Rows | Table Name       | File Name               |
| ---- | -------------- | ---- | ---------------- | ----------------------- |
| 1)   | Flights (2008) | 7M   | flights_2008_7M  | flights_2008_7M.tar.gz  |
| 2)   | Flights (2008) | 10k  | flights_2008_10k | flights_2008_10k.tar.gz |

Connect to MapD Core by entering the following command in a terminal on the host machine (default password is HyperInteractive):

```
$MAPD_PATH/bin/mapdql 
password: ••••••••••••••••
```

Enter a SQL query such as the following:

```
mapdql> SELECT origin_city AS "Origin", dest_city AS "Destination", AVG(airtime) AS "Average Airtime" FROM flights_2008_10k WHERE distance < 175 GROUP BY origin_city, dest_city; 

Origin|Destination|Average Airtime 
Austin|Houston|33.055556 
Norfolk|Baltimore|36.071429 
Ft. Myers|Orlando|28.666667 
Orlando|Ft. Myers|32.583333 
Houston|Austin|29.611111 
Baltimore|Norfolk|31.714286 
```

Connect to Immerse using a web browser connected to your host machine on port 9092. For example, http://mapd.mycompany.com:9092.

Create a new dashboard and a pointmap to verify that backend rendering is working.

1. Click **New Dashboard**.
2. Select the flights_2008_10K table as the datasource.
3. Click **Connect to Table**.
4. Click **Add Chart**.
5. Click **SCATTER**.
6. Click **X Axis +Add Measure**.
7. Choose arrdelay.
8. Click **Y Axis +Add Measure**.
9. Choose depdelay.

The resulting chart shows, unsurprisingly, that there is a correlation between departure delay and arrival delay.



6

#### Community

Questions? Ideas? Join the discussion at [community.mapd.com](http://community.mapd.com/)

## Getting Started Vi