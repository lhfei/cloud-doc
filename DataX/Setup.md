



修改文件`datax/conf/core.json`

```json
"core": {
        "dataXServer": {
            "address": "http://localhost:7001/api",
            "timeout": 10000,
            "reportDataxLog": false,
            "reportPerfLog": false
        },
        "transport": {
            "channel": {
                "class": "com.alibaba.datax.core.transport.channel.memory.MemoryChannel",
                "speed": {
                    "byte": 2000000,
                    "record": -1
                },
                "flowControlInterval": 20,
                "capacity": 512,
                "byteCapacity": 67108864
            },
            "exchanger": {
                "class": "com.alibaba.datax.core.plugin.BufferedRecordExchanger",
                "bufferSize": 32
            }
        },
}
```

