
SCP(Supply Chain Process)
=========================

```
```

# Table of Contents

## Oozie

>### REST API

```
# sample Notebook ID: 2CEHWP221
http://master1.cloud.cn:9898/api/notebook/job/[noteId]

http://master1.cloud.cn:9898/api/notebook/[noteId]
```


```sh

$SPARK_HOME/bin/spark-submit \
    --master local[2] \
    /home/lhfei/app_sdk/pricing_ligang.py

```

-- run job
    http://master1.cloud.cn:9898/api/notebook/job/2CEXXQ885/paragraph/20170426-234825_1381833199


-- pricing
http://master1.cloud.cn:9898/api/notebook/2CEXXQ885/paragraph/20170426-234825_1381833199


-- get JOB out put


```API
GET     /api/ (com.fly.scp.portal.rest.resources.DashboardResource)
GET     /api/version (com.fly.scp.portal.rest.resources.VersionResource)
GET     /api/notebook/ (com.fly.scp.portal.rest.resources.NotebookResource)
GET     /api/notebook/{noteId}/paragraph/{paragraphId} (com.fly.scp.portal.rest.resources.NotebookResource)

```


-- ready
iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAnklEQVR42u3RAQ0AAAQAMCLZ9FNdDbO/wrOrJzgjhQhBiBCECEGIEIQIESIEIUIQIgQhQhAiBCEIEYIQIQgRghAhCEGIEIQIQYgQhAhBCEKEIEQIQoQgRAhCECIEIUIQIgQhQhCCECEIEYIQIQgRghCECEGIEIQIQYgQhCBECEKEIEQIQoQgBCFCECIEIUIQIgQhQoQIQYgQhAhByHcLNEptxe/revYAAAAASUVORK5CYII=

-- running

-- success

-- failure
