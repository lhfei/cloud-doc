

```ini
planner.width.max_per_node= 0.7 * (cores)

# 2 * 1024 * 1024 * 1024 = 2147483648
planner.memory.max_query_memory_per_node = 2147483648
                                           8589934592
										   17179869184
# Range: 0-2147483647
planner.broadcast_threshold = 1073741824

# 16 * 1024 *1024 = 16777216
drill.exec.memory.operator.output_batch_size=1073741824

planner.memory.percent_per_query= (1- $MAX_DIR_MEM)/10
```

