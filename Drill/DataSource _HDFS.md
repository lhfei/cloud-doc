



```json
{
  "type": "file",
  "enabled": true,
  "connection": "hdfs://host-10-182-93-182:8020",
  "config": null,
  "workspaces": {
    "root": {
      "location": "/",
      "writable": false,
      "defaultInputFormat": null,
      "allowAccessOutsideWorkspace": false
    },
    "tmp": {
      "location": "/tmp",
      "writable": true,
      "defaultInputFormat": null,
      "allowAccessOutsideWorkspace": false
    }
  },
  "formats": {
    "psv": {
      "type": "text",
      "extensions": [
        "tbl"
      ],
      "delimiter": "|"
    },
    "csv": {
      "type": "text",
      "extensions": [
        "csv"
      ],
      "delimiter": ","
    },
    "tsv": {
      "type": "text",
      "extensions": [
        "tsv"
      ],
      "delimiter": "\t"
    },
    "httpd": {
      "type": "httpd",
      "logFormat": "%h %t \"%r\" %>s %b \"%{Referer}i\""
    },
    "parquet": {
      "type": "parquet"
    },
    "json": {
      "type": "json",
      "extensions": [
        "json"
      ]
    },
    "pcap": {
      "type": "pcap"
    },
    "avro": {
      "type": "avro"
    },
    "sequencefile": {
      "type": "sequencefile",
      "extensions": [
        "seq"
      ]
    },
    "csvh": {
      "type": "text",
      "extensions": [
        "csvh"
      ],
      "extractHeader": true,
      "delimiter": ","
    }
  }
}
```

