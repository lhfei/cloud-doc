Google Cloud SDK
================


## Before you begin

1.Make sure that Python 2.7 is installed on your system:

```sh
python -V
```

2.Download the archive file best suited to your operating system. Most machines will run the 64-bit package. If you'd like to check, run **uname -m** to verify if you're running a 64-bit system.

    Platform    |                        Package	            |Size	    |                        SHA256 Checksum                         |
----------------|-----------------------------------------------|-----------|----------------------------------------------------------------|
Linux (x86_64)	|google-cloud-sdk-170.0.1-linux-x86_64.tar.gz	|17.8 MB	|a09ff738ea9b3c9af906ee42e8ded48b84388574944d11406ba0cec6b2acdc89|
Linux (x86)	    |google-cloud-sdk-170.0.1-linux-x86.tar.gz	    |17.3 MB	|21dbe09d6e37ee207c58efb8d2140e8506a1d89eeb59e72db0625b7df76bf2bb|


- [google-cloud-sdk-170.0.1-linux-x86_64.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-170.0.1-linux-x86_64.tar.gz)
- [google-cloud-sdk-170.0.1-linux-x86.tar.gz](https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-170.0.1-linux-x86.tar.gz)

3.Extract the archive to any location on your file system. And add it to $PATH

```sh
#######################
# GOOGLE CLOUD SDK
#######################
GOOGLE_CLOUD=/usr/local/cloud/google-cloud-sdk
PATH=${PATH}:${GOOGLE_CLOUD}/bin
export GOOGLE_CLOUD
```

Now you can check ```gcloud``` by command:

```sh
$gcloud version
Google Cloud SDK 170.0.1
bq 2.0.25
core 2017.09.08
gsutil 4.27
```


4.Set up the Cloud SDK for use. If you're having trouble getting the gcloud command to work, ensure your ```$PATH``` is defined appropriately. Run the install script to add Cloud SDK tools to your path, enable command-completion in your bash shell, and/or enable usage reporting:

```sh
./google-cloud-sdk/install.sh
```

And the terminal output as below:

```
Your current Cloud SDK version is: 170.0.1
The latest available version is: 170.0.1

┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                  Components                                                 │
├───────────────┬──────────────────────────────────────────────────────┬──────────────────────────┬───────────┤
│     Status    │                         Name                         │            ID            │    Size   │
├───────────────┼──────────────────────────────────────────────────────┼──────────────────────────┼───────────┤
│ Not Installed │ App Engine Go Extensions                             │ app-engine-go            │  98.0 MiB │
│ Not Installed │ Cloud Bigtable Command Line Tool                     │ cbt                      │   4.1 MiB │
│ Not Installed │ Cloud Bigtable Emulator                              │ bigtable                 │   3.5 MiB │
│ Not Installed │ Cloud Datalab Command Line Tool                      │ datalab                  │   < 1 MiB │
│ Not Installed │ Cloud Datastore Emulator                             │ cloud-datastore-emulator │  15.4 MiB │
│ Not Installed │ Cloud Datastore Emulator (Legacy)                    │ gcd-emulator             │  38.1 MiB │
│ Not Installed │ Cloud Pub/Sub Emulator                               │ pubsub-emulator          │  33.2 MiB │
│ Not Installed │ Emulator Reverse Proxy                               │ emulator-reverse-proxy   │  14.5 MiB │
│ Not Installed │ Google Container Local Builder                       │ container-builder-local  │   3.7 MiB │
│ Not Installed │ Google Container Registry's Docker credential helper │ docker-credential-gcr    │   2.2 MiB │
│ Not Installed │ gcloud Alpha Commands                                │ alpha                    │   < 1 MiB │
│ Not Installed │ gcloud Beta Commands                                 │ beta                     │   < 1 MiB │
│ Not Installed │ gcloud app Java Extensions                           │ app-engine-java          │ 128.1 MiB │
│ Not Installed │ gcloud app Python Extensions                         │ app-engine-python        │   6.5 MiB │
│ Not Installed │ kubectl                                              │ kubectl                  │  16.0 MiB │
│ Installed     │ BigQuery Command Line Tool                           │ bq                       │   < 1 MiB │
│ Installed     │ Cloud SDK Core Libraries                             │ core                     │   6.7 MiB │
│ Installed     │ Cloud Storage Command Line Tool                      │ gsutil                   │   3.0 MiB │
└───────────────┴──────────────────────────────────────────────────────┴──────────────────────────┴───────────┘
To install or remove components at your current SDK version [170.0.1], run:
  $ gcloud components install COMPONENT_ID
  $ gcloud components remove COMPONENT_ID

To update your SDK installation to the latest version [170.0.1], run:
  $ gcloud components update

==> Source [/usr/local/cloud/google-cloud-sdk/completion.bash.inc] in your profile to enable shell command completion for gcloud.
==> Source [/usr/local/cloud/google-cloud-sdk/path.bash.inc] in your profile to add the Google Cloud SDK command line tools to your $PATH.

For more information on how to get started, please visit:
  https://cloud.google.com/sdk/docs/quickstarts
```

Then, restart your terminal for the changes to take effect.

```
```
**Note:** *The above step is optional. You can call the Cloud SDK after extracting the downloaded archive by invoking its executables via the full path.*
```
```

## Initialize the SDK

Use the gcloud init command to perform several common SDK setup tasks. These include authorizing the SDK tools to access Google Cloud Platform using your user account credentials and setting up the default SDK configuration.

To initialize the SDK:

Run the following at a command prompt:

gcloud init
Accept the option to log in using your Google user account:

To continue, you must log in. Would you like to log in (Y/n)? Y
In your browser, log in to your Google user account when prompted and click Allow to grant permission to access Google Cloud Platform resources.
At the command prompt, select a Cloud Platform project from the list of those where you have Owner, Editor or Viewer permissions:

Pick cloud project to use:
 [1] [my-project-1]
 [2] [my-project-2]
 ...
 Please enter your numeric choice:
If you only have one project, gcloud init selects it for you.
If you have the Google Compute Engine API enabled, gcloud init allows you to choose a default Compute Engine zone:

Which compute zone would you like to use as project default?
 [1] [asia-east1-a]
 [2] [asia-east1-b]
 ...
 [14] Do not use default zone
 Please enter your numeric choice:
gcloud init confirms that you have complete the setup steps successfully:

gcloud has now been configured!
You can use [gcloud config] to change more gcloud settings.

Your active configuration is: [default]

Run core gcloud commands

Run these gcloud commands to view information about your SDK installation:

To list accounts whose credentials are stored on the local system:

gcloud auth list
gcloud displays a list of credentialed accounts:

Credentialed accounts:
 - example-user-1@gmail.com (active)
 - example-user-2@gmail.com
To list the properties in your active SDK configuration:

gcloud config list
gcloud displays the list of properties:

[core]
account = example-user-1@gmail.com
disable_usage_reporting = False
project = example-project
To view information your Cloud SDK installation and the active SDK configuration:

gcloud info
gcloud displays a summary of information about your Cloud SDK installation. This includes information about your system, the installed SDK components, the active user account and current project, and the properties in the active SDK configuration.
To view information about gcloud commands and other topics from the command line:

gcloud help
For example, to view the help for gcloud compute instances create:

gcloud help compute instances create
gcloud displays a help topic that contains a description of the command, a list of command flags and arguments, and examples of how to use it.
What's next

Read the gcloud Tool Guide for an overview of the gcloud command-line tool.
Read the gcloud Reference Guide for descriptions of the gcloud commands that you can use to perform a variety of tasks on Google Cloud Platform.
Install additional components such as the App Engine emulators or kubectl using the Cloud SDK component manager.