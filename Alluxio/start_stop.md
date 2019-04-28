





> alluxio-start.sh

```ini
Usage: alluxio-start.sh [-hNwm] [-i backup] ACTION [MOPT] [-f]
Where ACTION is one of:
  all [MOPT]            Start all masters, proxies, and workers.
  local [MOPT]          Start all processes locally.
  master                Start the local master on this node.
  secondary_master      Start the local secondary master on this node.
  masters               Start masters on master nodes.
  proxy                 Start the proxy on this node.
  proxies               Start proxies on master and worker nodes.
  safe                  Script will run continuously and start the master if it's not running.
  worker [MOPT]         Start a worker on this node.
  workers [MOPT]        Start workers on worker nodes.
  restart_worker        Restart a failed worker on this node.
  restart_workers       Restart any failed workers on worker nodes.

MOPT (Mount Option) is one of:
  Mount         Mount the configured RamFS. Notice: this will format the existing RamFS.
  SudoMount     Mount the configured RamFS using sudo.
                Notice: this will format the existing RamFS.
  NoMount       Do not mount the configured RamFS.
                Notice: to avoid sudo requirement but using tmpFS in Linux,
             set ALLUXIO_RAM_FOLDER=/dev/shm on each worker and use NoMount.
  NoMount is assumed if MOPT is not specified.

-f         format Journal, UnderFS Data and Workers Folder on master.
-h         display this help.
-i backup  a journal backup to restore the master from. The backup should be
           a URI path within the root under filesystem, e.g.
           hdfs://mycluster/alluxio_backups/alluxio-journal-YYYY-MM-DD-timestamp.gz.
-m         launch monitor process to ensure the target processes come up.
-N         do not try to kill previous running processes before starting new ones.
-w         wait for processes to end before returning.
```

