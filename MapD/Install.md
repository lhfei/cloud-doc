## Preparation

### Update and Reboot

Update the entire system and reboot to activate the latest kernel.

```
sudo yum update
sudo reboot
```

### Create the MapD User

Create the mapd group and mapd user, who will be the owner of the MapD database. You can create both the group and user with the useradd command and the -U switch.

```
sudo useradd -U mapd
```

### Firewall

To use Immerse, you must prepare your host machine to accept HTTP connections. You can configure your firewall for external access.

```
sudo firewall-cmd --zone=public --add-port=9092/tcp --permanent
sudo firewall-cmd --reload
```

For more information, see <https://fedoraproject.org/wiki/Firewalld?rd=FirewallD>.

2

## Installation

```shell
curl https://releases.mapd.com/ce/mapd-ce-cpu.repo | sudo tee /etc/yum.repos.d/mapd.repo
```

Use yum to install MapD .

```shell
sudo yum install mapd
```



## Configuration

### Set Environment Variables

For convenience, you can update .bashrc with the required environment variables.

1. Go to your home directory.

2. Show hidden files.

3. Edit the .bashrc file. Add the following variable export commands under “User specific aliases and functions.”

   ```shell
   # User specific aliases and functions
   export MAPD_USER=mapd
   export MAPD_GROUP=mapd
   export MAPD_STORAGE=/var/lib/mapd
   export MAPD_PATH=/opt/mapd
   ```

4. Save the .bashrc file.

5. Open a new terminal window to use your changes.

### Create the Storage Directory

The $MAPD_STORAGE directory must be dedicated to MapD: do not set it to a directory shared by other packages.

You can edit the mapd.conf configuration file with optional settings. See [Configuration](https://www.mapd.com/docs/latest/getting-started/configuration/#configuration).



## Initialization

1. Run the systemd installer. This script requires sudo access. You might be prompted for a password. Accept the values provided (based on your environment variables) or make changes as needed. The script creates a data directory in $MAPD_STORAGE with the directories mapd_catalogs, mapd_data, and mapd_export. mapd_import and mapd_log directories are created when you insert data the first time. The mapd_log directory is the one of most interest to a MapD administrator.

   ```
   cd $MAPD_PATH/systemd sudo ./install_mapd_systemd.sh
   ```



## Activation

1. Start MapD Core

   ```
   cd $MAPD_PATH 
   sudo systemctl start mapd_server 
   sudo systemctl start mapd_web_server 
   ```

2. Enable MapD Core to start when the system reboots.

   ```
   sudosystemctl enable mapd_server
   sudo systemctl enable mapd_web_server
   ```

**Checkpoint**

To verify that all systems are go, load some sample data, perform a mapdql query, and generate a pointmap using Immerse.

MapD ships with two sample datasets of airline flight information collected in 2008. To install the sample data, run the following command.

```
sudo $MAPD_PATH/insert_sample_data
```

When prompted, choose whether to insert dataset 1 (7 million rows) or dataset 2 (10 thousand rows). The examples below use the smaller 10 thousand row dataset.

```
Enter dataset number to download, or 'q' to quit: 
```

| #    | Dataset        | Rows | Table Name       | File Name               |
| ---- | -------------- | ---- | ---------------- | ----------------------- |
| 1)   | Flights (2008) | 7M   | flights_2008_7M  | flights_2008_7M.tar.gz  |
| 2)   | Flights (2008) | 10k  | flights_2008_10k | flights_2008_10k.tar.gz |

Connect to MapD Core by entering the following command (default password is HyperInteractive):

```
$MAPD_PATH/bin/mapdql
password: ••••••••••••••••
```

Enter a SQL query such as the following:

```
mapdql> SELECT origin_city AS "Origin", dest_city AS "Destination", AVG(airtime) AS "Average Airtime" FROM flights_2008_10k WHEREdistance < 175 GROUP BY origin_city, dest_city;
```

The results should be similar to the results below.

```
Origin|Destination|Average Airtime 
Austin|Houston|33.055556
Norfolk|Baltimore|36.071429
Ft. Myers|Orlando|28.666667
Orlando|Ft. Myers|32.583333
Houston|Austin|29.611111
Baltimore|Norfolk|31.714286
```

Connect to Immerse using a web browser connected to your host machine on port 9092. For example, http://mapd.mycompany.com:9092.

Create a new dashboard and a Table chart.

1. Click **New Dashboard**.
2. Select the flights_2008_10K table as the datasource.
3. Click **Connect to Table**.
4. Click **Add Chart**.
5. Click **Table**.
6. Click **Add Measure**.
7. Choose arrdelay.
8. Click **Add Measure**.
9. Choose depdelay.

The resulting chart shows, unsurprisingly, that there is a correlation between departure delay and arrival delay.





## Community

Questions? Ideas? Join the discussion at [community.mapd.com](http://community.mapd.com/)