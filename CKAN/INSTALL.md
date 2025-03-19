# Installing CKAN from source[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#installing-ckan-from-source)

CKAN is a Python application that requires three main services: PostgreSQL, Solr and Redis.

This section describes how to install CKAN from source. Although [Installing CKAN from package](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-package.html) is simpler, it requires Ubuntu 20.04 64-bit or Ubuntu 22.04 64-bit. Installing CKAN from source works with other versions of Ubuntu and with other operating systems (e.g. RedHat, Fedora, CentOS, OS X). If you install CKAN from source on your own operating system, please share your experiences on our [How to Install CKAN](https://github.com/ckan/ckan/wiki/How-to-Install-CKAN) wiki page.

**The minimum Python version required is 3.9**

From source is also the right installation method for developers who want to work on CKAN.

## 1. Install the required packages[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#install-the-required-packages)

If you’re using a Debian-based operating system (such as Ubuntu) install the required packages with this command:

```
sudo apt-get install python3-dev libpq-dev python3-pip python3-venv git-core redis-server libmagic1
```

If you’re not using a Debian-based operating system, find the best way to install the following packages on your operating system (see our [How to Install CKAN](https://github.com/ckan/ckan/wiki/How-to-Install-CKAN) wiki page for help):

| Package      | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| Python       | [The Python programming language, v3.9 or newer](https://www.python.org/getit/) |
| PostgreSQL   | [The PostgreSQL database system, v12 or newer](https://www.postgresql.org/docs/10/libpq.html) |
| libpq        | [The C programmer’s interface to PostgreSQL](http://www.postgresql.org/docs/8.1/static/libpq.html) |
| pip          | [A tool for installing and managing Python packages](https://pip.pypa.io/en/stable/) |
| python3-venv | [The Python3 virtual environment builder (or for Python 2 use ‘virtualenv’ instead)](https://virtualenv.pypa.io/en/latest/) |
| Git          | [A distributed version control system](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) |
| Apache Solr  | [A search platform](https://lucene.apache.org/solr/)         |
| Jetty        | [An HTTP server](https://www.eclipse.org/jetty/) (used for Solr). |
| OpenJDK JDK  | [The Java Development Kit](https://openjdk.java.net/install/) (used by Jetty) |
| Redis        | [An in-memory data structure store](https://redis.io/)       |



## 2. Install CKAN into a Python virtual environment[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#install-ckan-into-a-python-virtual-environment)

Tip

If you’re installing CKAN for development and want it to be installed in your home directory, you can symlink the directories used in this documentation to your home directory. This way, you can copy-paste the example commands from this documentation without having to modify them, and still have CKAN installed in your home directory:

```
mkdir -p ~/ckan/lib
sudo ln -s ~/ckan/lib /usr/lib/ckan
mkdir -p ~/ckan/etc
sudo ln -s ~/ckan/etc /etc/ckan
```

1. Create a Python [virtual environment](https://virtualenv.pypa.io/en/latest/) (virtualenv) to install CKAN into, and activate it:

   ```
   sudo mkdir -p /usr/lib/ckan/default
   sudo chown `whoami` /usr/lib/ckan/default
   python3 -m venv /usr/lib/ckan/default
   . /usr/lib/ckan/default/bin/activate
   ```

Important

The final command above activates your virtualenv. The virtualenv has to remain active for the rest of the installation and deployment process, or commands will fail. You can tell when the virtualenv is active because its name appears in front of your shell prompt, something like this:

```
(default) $ _
```

For example, if you logout and login again, or if you close your terminal window and open it again, your virtualenv will no longer be activated. You can always reactivate the virtualenv with this command:

```
. /usr/lib/ckan/default/bin/activate
```

1. Install an up-to-date pip:

   ```
   pip install --upgrade pip
   ```

2. Install the CKAN source code into your virtualenv.

   To install the latest stable release of CKAN (CKAN 2.11.0), run:

   ```
   pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.11.0#egg=ckan[requirements]'
   ```

   If you’re installing CKAN for development, you may want to install the latest development version (the most recent commit on the master branch of the CKAN git repository). In that case, run this command instead:

   ```
   pip install -e 'git+https://github.com/ckan/ckan.git#egg=ckan[requirements,dev]'
   ```

   Warning

   The development version may contain bugs and should not be used for production websites! Only install this version if you’re doing CKAN development.

3. Deactivate and reactivate your virtualenv, to make sure you’re using the virtualenv’s copies of commands like `ckan` rather than any system-wide installed copies:

   ```
   deactivate
   . /usr/lib/ckan/default/bin/activate
   ```



## 3. Setup a PostgreSQL database[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#setup-a-postgresql-database)

- orphan:

  

Install PostgreSQL required packages:

```
sudo apt install -y postgresql
```

Note

If you are facing a problem in case postgresql is not running, execute the command `sudo service postgresql start`

Check that PostgreSQL was installed correctly by listing the existing databases:

```
sudo -u postgres psql -l
```

Check that the encoding of databases is `UTF8`, if not you might find issues later on with internationalisation. Since changing the encoding of PostgreSQL may mean deleting existing databases, it is suggested that this is fixed before continuing with the CKAN install.

Next you’ll need to create a database user if one doesn’t already exist. Create a new PostgreSQL user called ckan_default, and enter a password for the user when prompted. You’ll need this password later:

```
sudo -u postgres createuser -S -D -R -P ckan_default
```

Create a new PostgreSQL database, called ckan_default, owned by the database user you just created:

```
sudo -u postgres createdb -O ckan_default ckan_default -E utf-8
```

Note

If PostgreSQL is run on a separate server, you will need to edit postgresql.conf and pg_hba.conf. On Ubuntu, these files are located in etc/postgresql/{Postgres version}/main.

Uncomment the listen_addresses parameter and specify a comma-separated list of IP addresses of the network interfaces PostgreSQL should listen on or ‘*’ to listen on all interfaces. For example,

```
listen_addresses = 'localhost,192.168.1.21'
```

Add a line similar to the line below to the bottom of pg_hba.conf to allow the machine running the web server to connect to PostgreSQL. Please change the IP address as desired according to your network settings.

```
host  all       all       192.168.1.22/32         md5
```

## 4. Create a CKAN config file[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#create-a-ckan-config-file)

Create a directory to contain the site’s config files:

```
sudo mkdir -p /etc/ckan/default
sudo chown -R `whoami` /etc/ckan/
```

Create the CKAN config file:

```
ckan generate config /etc/ckan/default/ckan.ini
```

Edit the `ckan.ini` file in a text editor, changing the following options:

- sqlalchemy.url

  This should refer to the database we created in [3. Setup a PostgreSQL database](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#setup-a-postgresql-database) above:`sqlalchemy.url = postgresql://ckan_default:pass@localhost/ckan_default`Replace `pass` with the password that you created in [3. Setup a PostgreSQL database](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#setup-a-postgresql-database) above.TipIf you’re using a remote host with password authentication rather than SSL authentication, use:`sqlalchemy.url = postgresql://ckan_default:pass@<remotehost>/ckan_default?sslmode=disable`

- site_id

  Each CKAN site should have a unique `site_id`, for example:`ckan.site_id = default `

- site_url

  Provide the site’s URL (used when putting links to the site into the FileStore, notification emails etc). For example:`ckan.site_url = http://demo.ckan.org `Do not add a trailing slash to the URL.



## 5. Setup Solr[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#setup-solr)

- orphan:

  

CKAN uses [Solr](https://solr.apache.org/) as its search engine, and uses a customized Solr schema file that takes into account CKAN’s specific search needs. Now that we have CKAN installed, we need to install and configure Solr.

Warning

CKAN supports **Solr 9** (recommended version) and Solr 8. Starting from CKAN 2.10 these are the only Solr version supported. CKAN 2.9 can run with Solr 9 and 8 as long as it is patched to at least 2.9.5.

There are two supported ways to install Solr.

1. Using CKAN’s official [Docker](https://www.docker.com/) images. This is generally the easiest one and the recommended one if you are developing CKAN locally
2. Installing Solr locally and configuring it with the CKAN schema. You can use this option if you can’t or don’t want to use Docker.

### Installing Solr using Docker[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#installing-solr-using-docker)

You will need to have Docker installed. Please refer to its [installation documentation](https://docs.docker.com/engine/install/) for details.

There are pre-configured Docker images for Solr for each CKAN version. Make sure to pick the image tag that matches your CKAN version (they are named `ckan/ckan-solr:<Major version>.<Minor version>`). To start a local Solr service you can run:

> ```
> docker run --name ckan-solr -p 8983:8983 -d ckan/ckan-solr:2.10-solr9
> ```

You can now jump to the [Next steps](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#next-steps-with-solr) section.

### Installing Solr manually[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#installing-solr-manually)

The following instructions have been tested in Ubuntu 22.04 and are provided as a guidance only. For a Solr production setup is it recommended that you follow the [official Solr documentation](https://solr.apache.org/guide/solr/latest/deployment-guide/taking-solr-to-production.html).

1. Install the OS dependencies:

   ```
   sudo apt-get install openjdk-11-jdk
   ```

2. Download the latest supported version from the [Solr downloads page](https://solr.apache.org/downloads.html). CKAN supports Solr version 9.x (recommended) and 8.x.

3. Extract the install script file to your desired location (adjust the Solr version number to the one you are using):

   ```
   tar xzf solr-9.2.1.tgz solr-9.2.1/bin/install_solr_service.sh --strip-components=2
   ```

4. Run the installation script as `root`:

   ```
   sudo bash ./install_solr_service.sh solr-9.2.1.tgz
   ```

5. Check that Solr started running:

   ```
   sudo service solr status
   ```

6. Create a new core for CKAN:

   ```
   sudo -u solr /opt/solr/bin/solr create -c ckan
   ```

7. Replace the standard schema with the CKAN one:

   ```
   sudo -u solr wget -O /var/solr/data/ckan/conf/managed-schema https://raw.githubusercontent.com/ckan/ckan/dev-v2.10/ckan/config/solr/schema.xml
   ```

8. Restart Solr:

   ```
   sudo service solr restart
   ```

### Next steps with Solr[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#next-steps-with-solr)

To check that Solr started you can visit the web interface at http://localhost:8983/solr

Warning

The two installation methods above will leave you with a setup that is fine for local development, but Solr should never be exposed publicly in a production site. Pleaser refer to the [Solr documentation](https://solr.apache.org/guide/securing-solr.html) to learn how to secure your Solr instance.

If you followed any of the instructions above, the CKAN Solr core will be available at http://localhost:8983/solr/ckan. If for whatever reason you ended up with a different one (eg with a different port, host or core name), you need to change the [solr_url](https://docs.ckan.org/en/2.11/maintaining/configuration.html#solr-url) setting in your [CKAN configuration file](https://docs.ckan.org/en/2.11/maintaining/configuration.html#config-file) (/etc/ckan/default/ckan.ini) to point to your Solr server, for example:

```
solr_url=http://my-solr-host:8080/solr/ckan-2.10
```



## 6. Setup Redis[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#setup-redis)

If you installed it locally on the first step, make sure you have a Redis instance running in the 6379 port.

If you have Docker installed, you can setup a default Redis instance by running:

```
docker run --name ckan-redis -p 6379:6379 -d redis
```

## 7. Create database tables[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#create-database-tables)

Now that you have a configuration file that has the correct settings for your database, you can [create the database tables](https://docs.ckan.org/en/2.11/maintaining/database-management.html#db-init):

```
cd /usr/lib/ckan/default/src/ckan
ckan -c /etc/ckan/default/ckan.ini db init
```

You should see `Initialising DB: SUCCESS`.

Tip

If the command prompts for a password it is likely you haven’t set up the `sqlalchemy.url` option in your CKAN configuration file properly. See [4. Create a CKAN config file](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#create-a-ckan-config-file).

## 8. Set up the DataStore[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#set-up-the-datastore)

Note

Setting up the DataStore is optional. However, if you do skip this step, the [DataStore features](https://docs.ckan.org/en/2.11/maintaining/datastore.html) will not be available and the DataStore tests will fail.

Follow the instructions in [DataStore extension](https://docs.ckan.org/en/2.11/maintaining/datastore.html) to create the required databases and users, set the right permissions and set the appropriate values in your CKAN config file.

Once you have set up the DataStore, you may then wish to configure either the DataPusher or XLoader extensions to add data to the DataStore. To install DataPusher refer to this link: https://github.com/ckan/datapusher and to install XLoader refer to this link: https://github.com/ckan/ckanext-xloader

## 9. Create CKAN user[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#create-ckan-user)

To create, remove, list and manage users, you can follow the steps at [Create and Manage Users](https://docs.ckan.org/en/latest/maintaining/cli.html#user-create-and-manage-users).

## 10. You’re done![](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#you-re-done)

You can now run CKAN from the command-line. This is a simple and lightweight way to serve CKAN that is useful for development and testing:

```
cd /usr/lib/ckan/default/src/ckan
ckan -c /etc/ckan/default/ckan.ini run
```

Open http://127.0.0.1:5000/ in a web browser, and you should see the CKAN front page.

Now that you’ve installed CKAN, you should:

- Run CKAN’s tests to make sure that everything’s working, see [Testing CKAN](https://docs.ckan.org/en/2.11/contributing/test.html).
- If you want to use your CKAN site as a production site, not just for testing or development purposes, then deploy CKAN using a production web server such as uWSGI or Nginx. See [Deploying a source install](https://docs.ckan.org/en/2.11/maintaining/installing/deployment.html).
- Begin using and customizing your site, see [Getting started](https://docs.ckan.org/en/2.11/maintaining/getting-started.html).

Note

The default authorization settings on a new install are deliberately restrictive. Regular users won’t be able to create datasets or organizations. You should check the [Organizations and authorization](https://docs.ckan.org/en/2.11/maintaining/authorization.html) documentation, configure CKAN accordingly and grant other users the relevant permissions using the [sysadmin account](https://docs.ckan.org/en/2.11/maintaining/getting-started.html#create-admin-user).

## Source install troubleshooting[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#source-install-troubleshooting)



### Solr setup troubleshooting[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#solr-setup-troubleshooting)

Solr requests and errors are logged in the web server log files.

- For Jetty servers, the log files are:

  ```
  /var/log/jetty/<date>.stderrout.log
  ```

- For Tomcat servers, they’re:

  ```
  /var/log/tomcat6/catalina.<date>.log
  ```

#### AttributeError: ‘module’ object has no attribute ‘css/main.debug.css’[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#attributeerror-module-object-has-no-attribute-css-main-debug-css)

This error is likely to show up when debug is set to True. To fix this error, install frontend dependencies. See [Frontend development guidelines](https://docs.ckan.org/en/2.11/contributing/frontend/index.html).

After installing the dependencies, run `npm run build` and then start ckan server again.

If you do not want to compile CSS, you can also copy the main.css to main.debug.css to get CKAN running:

```
cp /usr/lib/ckan/default/src/ckan/ckan/public/base/css/main.css \
/usr/lib/ckan/default/src/ckan/ckan/public/base/css/main.debug.css
```

#### ImportError: No module named ‘flask_debugtoolbar’[](https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html#importerror-no-module-named-flask-debugtoolbar)

This may show up if you have enabled debug mode in the config file. Simply install the development requirements:

```
pip install -r /usr/lib/ckan/default/src/ckan/dev-requirements.txt
```