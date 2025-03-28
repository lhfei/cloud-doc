## Installing Superset from Scratch

### OS Dependencies

Superset stores database connection information in its metadata database. For that purpose, we use the cryptography Python library to encrypt connection passwords. Unfortunately, this library has OS level dependencies.

**Debian and Ubuntu**

The following command will ensure that the required dependencies are installed:

```
sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev
```

In Ubuntu 20.04 the following command will ensure that the required dependencies are installed:

```
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev python3-pip libsasl2-dev libldap2-dev
```

**Fedora and RHEL-derivative Linux distributions**

Install the following packages using the `yum` package manager:

```
sudo yum install gcc gcc-c++ libffi-devel python-devel python-pip python-wheel openssl-devel cyrus-sasl-devel openldap-devel
```

**Mac OS X**

If you're not on the latest version of OS X, we recommend upgrading because we've found that many issues people have run into are linked to older versions of Mac OS X. After updating, install the latest version of XCode command line tools:

```
xcode-select --install
```

We don't recommend using the system installed Python. Instead, first install the [homebrew](https://brew.sh/) manager and then run the following commands:

```
brew install pkg-config libffi openssl python

env LDFLAGS="-L$(brew --prefix openssl)/lib" CFLAGS="-I$(brew --prefix openssl)/include" pip install cryptography==2.4.2
```

Let's also make sure we have the latest version of `pip` and `setuptools`:

```
pip install --upgrade setuptools pip
```

### Python Virtual Environment

We highly recommend installing Superset inside of a virtual environment. Python ships with `virtualenv` out of the box but you can install it using:

```
pip install virtualenv
```

You can create and activate a virtual environment using:

```
# virtualenv is shipped in Python 3.6+ as venv instead of pyvenv.
# See https://docs.python.org/3.6/library/venv.html
python3 -m venv venv
. venv/bin/activate
```

Once you activated your virtual environment, all of the Python packages you install or uninstall will be confined to this environment. You can exit the environment by running `deactivate` on the command line.

### Installing and Initializing Superset

First, start by installing `apache-superset`:

```shell
pip install apache-superset
```

Then, you need to initialize the database:

```shell
superset db upgrade
```

Finish installing by running through the following commands:

```shell
# Create an admin user (you will be prompted to set a username, first and last name before setting a password)
$ export FLASK_APP=superset
superset fab create-admin

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# To start a development web server on port 8088, use -p to bind to another port
superset run -p 8088 --with-threads --reload --debugger
```

If everything worked, you should be able to navigate to `hostname:port` in your browser (e.g. locally by default at `localhost:8088`) and login using the username and password you created.

### Installing Superset with Helm in Kubernetes

You can install Superset into Kubernetes with [Helm](https://helm.sh/). The chart is located in `install/helm`.

To install Superset in Kubernetes, run:

```
helm upgrade --install superset ./install/helm/superset
```

Note that the above command will install Superset into `default` namespace of your Kubernetes cluster.