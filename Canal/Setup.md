

### 



### MySQL

#### 创建数据库

```sql
-- create database
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `monitor_admin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

-- create user
CREATE USER 'monitor'@'localhost' IDENTIFIED BY 'NxMonitor_1473';

-- grant privileges
GRANT ALL ON monitor_admin.* TO 'monitor'@'%' IDENTIFIED BY 'NxMonitor_1473';

FLUSH PRIVILEGES;


-- create table
DROP TABLE IF EXISTS OPS_LOG;

CREATE TABLE OPS_LOG
(
   ID                   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据库主键',
   INSTANCE_IP          VARCHAR(16) NOT NULL COMMENT '数据库实例IP地址',
   SERVER_ID            INT NOT NULL COMMENT 'MySQL Binlog文件中的server_id',
   DB_NAME              VARCHAR(32) NOT NULL COMMENT '数据库Schema',
   TABLE_NAME           VARCHAR(64) NOT NULL COMMENT '数据库表名称',
   TYPE                 VARCHAR(8) NOT NULL COMMENT '数据库操作类型(DML+DDL)',
   OPS_TIME             DATETIME NOT NULL COMMENT '数据库操作时间戳',
   OPS_TS               BIGINT NOT NULL COMMENT '数据库变更时间戳(long型时间)',
   EFFECT_SIZE          INT NOT NULL COMMENT '操作影响记录数',
   AUDIT_TIME           DATETIME NOT NULL COMMENT '日志记录时间',
   PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE OPS_LOG COMMENT '操作记录表';
```



#### 授权

```sql

GRANT ALL ON buf_pms.* TO 'monitor'@'%' IDENTIFIED BY 'NxMonitor_1473';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'monitor' IDENTIFIED BY 'NxMonitor_1473';
```





#### Monitor

```sql
-- Create DB
CREATE DATABASE IF NOT EXISTS canal_manager;
CREATE DATABASE IF NOT EXISTS canal_tsdb;

CREATE USER 'monitor'@'localhost' IDENTIFIED BY 'NxMonitor_1473';

GRANT ALL ON canal_manager.* TO 'monitor'@'%' IDENTIFIED BY 'NxMonitor_1473';
GRANT ALL ON canal_tsdb.* TO 'monitor'@'%' IDENTIFIED BY 'NxMonitor_1473';

GRANT ALL ON buf_pms.* TO 'monitor'@'%' IDENTIFIED BY 'NxMonitor_1473';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'monitor' IDENTIFIED BY 'NxMonitor_1473';

FLUSH PRIVILEGES;


CREATE DATABASE /*!32312 IF NOT EXISTS*/ `canal_manager` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `canal_manager`;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for canal_adapter_config
-- ----------------------------
DROP TABLE IF EXISTS `canal_adapter_config`;
CREATE TABLE `canal_adapter_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `content` text NOT NULL,
  `modified_time` timestamp ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for canal_cluster
-- ----------------------------
DROP TABLE IF EXISTS `canal_cluster`;
CREATE TABLE `canal_cluster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `zk_hosts` varchar(255) NOT NULL,
  `modified_time` timestamp ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for canal_config
-- ----------------------------
DROP TABLE IF EXISTS `canal_config`;
CREATE TABLE `canal_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster_id` bigint(20) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `content` text NOT NULL,
  `content_md5` varchar(128) NOT NULL,
  `modified_time` timestamp ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid_UNIQUE` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for canal_instance_config
-- ----------------------------
DROP TABLE IF EXISTS `canal_instance_config`;
CREATE TABLE `canal_instance_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster_id` bigint(20) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `content` text NOT NULL,
  `content_md5` varchar(128) DEFAULT NULL,
  `modified_time` timestamp ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for canal_node_server
-- ----------------------------
DROP TABLE IF EXISTS `canal_node_server`;
CREATE TABLE `canal_node_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster_id` bigint(20) DEFAULT NULL,
  `name` varchar(63) NOT NULL,
  `ip` varchar(63) NOT NULL,
  `admin_port` int(11) DEFAULT NULL,
  `tcp_port` int(11) DEFAULT NULL,
  `metric_port` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `modified_time` timestamp ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for canal_user
-- ----------------------------
DROP TABLE IF EXISTS `canal_user`;
CREATE TABLE `canal_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(31) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(31) NOT NULL,
  `roles` varchar(31) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `creation_date` timestamp ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Records of canal_user
-- ----------------------------
BEGIN;
INSERT INTO `canal_user` VALUES (1, 'admin', '6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', 'Canal Manager', 'admin', NULL, NULL, '2019-07-14 00:05:28');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
```

