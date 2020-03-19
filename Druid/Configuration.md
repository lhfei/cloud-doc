https://towardsdatascience.com/deploying-a-production-druid-cluster-in-google-cloud-platform-43a7f1e15336



```ini
memoryNeeded[20,000,000,000] = druid.processing.buffer.sizeBytes[500,000,000] * (druid.processing.numMergeBuffers[8] + druid.processing.numThreads[11] + 1)
```





```ini
Please adjust -XX:MaxDirectMemorySize, druid.processing.buffer.sizeBytes, druid.processing.numThreads, or druid.processing.numMergeBuffers: maxDirectMemory[6,442,450,944], 

memoryNeeded[33,500,000,000] = druid.processing.buffer.sizeBytes[500,000,000] * (druid.processing.numMergeBuffers[6] + druid.processing.numThreads[60] + 1)
```

