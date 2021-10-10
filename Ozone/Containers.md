# Containers

容器是 Ozone/HDDS 的基本复制单元，由 Storage Container Manager (SCM) 服务管理。

容器是可以包含多个块的大型二进制单元：

![Containers](https://ozone.apache.org/docs/1.1.0/zh/concept/Containers.png)

块作为本地信息，不由 SCM 管理。因此，即使在系统中创建了数十亿个小文件（即创建了数十亿个块），数据节点也仅报告容器的状态，以及复制容器。

当 Ozone Manager 向 SCM 请求分配一个新的块时，SCM 将找到一个合适的容器，并且产生一个包含 `容器ID` + `本地ID` 的块Id，客户端则连接到存储这个容器的数据节点上。而数据节点则能够基于 `本地ID` 管理这个独立的块。

## OPEN 和 CLOSED 容器

当一个容器被创建后，它就以 OPEN 状态开始。而当其被写满（写入约 5GB 数据）时，它就会被关闭并且处于 CLOSED 状态。

OPEN 和 CLOSED 容器之间的根本区别：

| OPEN                       | CLOSED                   |
| :------------------------- | :----------------------- |
| 可变                       | 不可变                   |
| 基于 RAFT (Ratis) 进行复制 | 异步地对容器副本进行复制 |
| 只有 Raft leader 用于读/写 | 所有节点都可用于读       |