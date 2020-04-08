# Increasing MemStore size for RegionServer

If you are an administrator, you can increase the size of the MemStore to decrease the number of regions for the RegionServer.

Use of the RegionServer MemStore largely determines the maximum number of regions for the RegionServer. Each region has one MemStore for each column family, which grows to a configurable size, usually between 128 and 256 MB. You can specify this size by using the hbase.hregion.memstore.flush.size property in the hbase-site.xml configuration file. The RegionServer dedicates some fraction of total memory to region MemStores based on the value of the hbase.regionserver.global.memstore.size configuration property. If usage exceeds this configurable size, HBase might become unresponsive or compaction storms might occur.

You can use the following formula to estimate the number of regions for a RegionServer:

```ini
(regionserver_memory_size) * (memstore_fraction) / ((memstore_size) * (num_column_families))
```

For example, assume that your environment uses the following configuration:

- RegionServer with 16 GB RAM (or 16384 MB)
- MemStore fraction of .4
- MemStore with 128 MB RAM
- One column family in table

The formula for this configuration is as follows:

```ini
(16384 MB * .4) / ((128 MB * 1) = approximately 51 regions
```

The easiest way to decrease the number of regions for this example RegionServer is to increase the RAM of the memstore to 256 MB. The reconfigured RegionServer then has approximately 25 regions, and the HBase cluster runs more smoothly if the reconfiguration is applied to all RegionServers in the cluster. The formula can be used for multiple tables with the same configuration by using the total number of column families in all the tables.

| ![Note](https://docs.cloudera.com/common/themes/pre-hdp-3.1/images/admon/note.png) | Note |
| :----------------------------------------------------------- | ---- |
| The formula is based on the assumption that all regions are filled at approximately the same rate. If a fraction of the cluster's regions are written to, divide the result by this fraction. |      |

If the data request pattern is dominated by write operations rather than read operations, you should increase the MemStore fraction. However, this increase negatively impacts the block cache.