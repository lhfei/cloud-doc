/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.37 : Database - griffin_master
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`griffin_master` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `griffin_master`;

/*Table structure for table `DATACONNECTOR` */

DROP TABLE IF EXISTS `DATACONNECTOR`;

CREATE TABLE `DATACONNECTOR` (
  `ID` bigint(20) NOT NULL,
  `CONFIG` text,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DATAFRAMENAME` varchar(255) DEFAULT NULL,
  `DATATIMEZONE` varchar(255) DEFAULT NULL,
  `DATAUNIT` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VERSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DATASOURCE` */

DROP TABLE IF EXISTS `DATASOURCE`;

CREATE TABLE `DATASOURCE` (
  `ID` bigint(20) NOT NULL,
  `BASELINE` tinyint(1) DEFAULT '0',
  `CHECKPOINT` varchar(1024) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `data_source_id` bigint(20) DEFAULT NULL,
  `measure_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DATASOURCE_data_source_id` (`data_source_id`),
  KEY `FK_DATASOURCE_measure_id` (`measure_id`),
  CONSTRAINT `FK_DATASOURCE_data_source_id` FOREIGN KEY (`data_source_id`) REFERENCES `DATACONNECTOR` (`ID`),
  CONSTRAINT `FK_DATASOURCE_measure_id` FOREIGN KEY (`measure_id`) REFERENCES `MEASURE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `EVALUATERULE` */

DROP TABLE IF EXISTS `EVALUATERULE`;

CREATE TABLE `EVALUATERULE` (
  `ID` bigint(20) NOT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `EXTERNALMEASURE` */

DROP TABLE IF EXISTS `EXTERNALMEASURE`;

CREATE TABLE `EXTERNALMEASURE` (
  `ID` bigint(20) NOT NULL,
  `METRICNAME` varchar(255) DEFAULT NULL,
  `VIRTUALJOB_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EXTERNALMEASURE_VIRTUALJOB_ID` (`VIRTUALJOB_ID`),
  CONSTRAINT `FK_EXTERNALMEASURE_ID` FOREIGN KEY (`ID`) REFERENCES `MEASURE` (`ID`),
  CONSTRAINT `FK_EXTERNALMEASURE_VIRTUALJOB_ID` FOREIGN KEY (`VIRTUALJOB_ID`) REFERENCES `job` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `GRIFFINMEASURE` */

DROP TABLE IF EXISTS `GRIFFINMEASURE`;

CREATE TABLE `GRIFFINMEASURE` (
  `ID` bigint(20) NOT NULL,
  `PROCESSTYPE` varchar(255) DEFAULT NULL,
  `RULEDESCRIPTION` varchar(1024) DEFAULT NULL,
  `evaluate_rule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GRIFFINMEASURE_evaluate_rule_id` (`evaluate_rule_id`),
  CONSTRAINT `FK_GRIFFINMEASURE_ID` FOREIGN KEY (`ID`) REFERENCES `MEASURE` (`ID`),
  CONSTRAINT `FK_GRIFFINMEASURE_evaluate_rule_id` FOREIGN KEY (`evaluate_rule_id`) REFERENCES `EVALUATERULE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `JOBDATASEGMENT` */

DROP TABLE IF EXISTS `JOBDATASEGMENT`;

CREATE TABLE `JOBDATASEGMENT` (
  `ID` bigint(20) NOT NULL,
  `ASTSBASELINE` tinyint(1) DEFAULT '0',
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DATACONNECTORNAME` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `segment_range_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_JOBDATASEGMENT_segment_range_id` (`segment_range_id`),
  KEY `FK_JOBDATASEGMENT_job_id` (`job_id`),
  CONSTRAINT `FK_JOBDATASEGMENT_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`ID`),
  CONSTRAINT `FK_JOBDATASEGMENT_segment_range_id` FOREIGN KEY (`segment_range_id`) REFERENCES `SEGMENTRANGE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `JOBINSTANCEBEAN` */

DROP TABLE IF EXISTS `JOBINSTANCEBEAN`;

CREATE TABLE `JOBINSTANCEBEAN` (
  `ID` bigint(20) NOT NULL,
  `APPID` varchar(255) DEFAULT NULL,
  `APPURI` varchar(2048) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DELETED` tinyint(1) DEFAULT '0',
  `expire_timestamp` bigint(20) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `predicate_job_deleted` tinyint(1) DEFAULT '0',
  `predicate_group_name` varchar(255) DEFAULT NULL,
  `predicate_job_name` varchar(255) DEFAULT NULL,
  `SESSIONID` bigint(20) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `TRIGGERKEY` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_JOBINSTANCEBEAN_triggerKey` (`TRIGGERKEY`),
  KEY `FK_JOBINSTANCEBEAN_job_id` (`job_id`),
  CONSTRAINT `FK_JOBINSTANCEBEAN_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `MEASURE` */

DROP TABLE IF EXISTS `MEASURE`;

CREATE TABLE `MEASURE` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DELETED` tinyint(1) DEFAULT '0',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DQTYPE` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORGANIZATION` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `SINKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_BLOB_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_CALENDARS` */

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_CRON_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_FIRED_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_JOB_DETAILS` */

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_LOCKS` */

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS` */

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_SCHEDULER_STATE` */

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_SIMPLE_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_SIMPROP_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `QRTZ_TRIGGERS` */

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `RULE` */

DROP TABLE IF EXISTS `RULE`;

CREATE TABLE `RULE` (
  `ID` bigint(20) NOT NULL,
  `CACHE` tinyint(1) DEFAULT '0',
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DETAILS` varchar(1024) DEFAULT NULL,
  `DQTYPE` varchar(255) DEFAULT NULL,
  `DSLTYPE` varchar(255) DEFAULT NULL,
  `INDATAFRAMENAME` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `out` varchar(255) DEFAULT NULL,
  `OUTDATAFRAMENAME` varchar(255) DEFAULT NULL,
  `RULE` varchar(8192) DEFAULT NULL,
  `evaluate_rule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RULE_evaluate_rule_id` (`evaluate_rule_id`),
  CONSTRAINT `FK_RULE_evaluate_rule_id` FOREIGN KEY (`evaluate_rule_id`) REFERENCES `EVALUATERULE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `SEGMENTPREDICATE` */

DROP TABLE IF EXISTS `SEGMENTPREDICATE`;

CREATE TABLE `SEGMENTPREDICATE` (
  `ID` bigint(20) NOT NULL,
  `CONFIG` varchar(255) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `data_connector_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SEGMENTPREDICATE_data_connector_id` (`data_connector_id`),
  CONSTRAINT `FK_SEGMENTPREDICATE_data_connector_id` FOREIGN KEY (`data_connector_id`) REFERENCES `DATACONNECTOR` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `SEGMENTRANGE` */

DROP TABLE IF EXISTS `SEGMENTRANGE`;

CREATE TABLE `SEGMENTRANGE` (
  `ID` bigint(20) NOT NULL,
  `data_begin` varchar(255) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `LENGTH` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `SEQUENCE` */

DROP TABLE IF EXISTS `SEQUENCE`;

CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `STREAMINGPREPROCESS` */

DROP TABLE IF EXISTS `STREAMINGPREPROCESS`;

CREATE TABLE `STREAMINGPREPROCESS` (
  `ID` bigint(20) NOT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DETAILS` varchar(1024) DEFAULT NULL,
  `DSLTYPE` varchar(255) DEFAULT NULL,
  `INDATAFRAMENAME` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `OUTDATAFRAMENAME` varchar(255) DEFAULT NULL,
  `RULE` varchar(255) DEFAULT NULL,
  `pre_process_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_STREAMINGPREPROCESS_pre_process_id` (`pre_process_id`),
  CONSTRAINT `FK_STREAMINGPREPROCESS_pre_process_id` FOREIGN KEY (`pre_process_id`) REFERENCES `DATACONNECTOR` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `ID` bigint(20) NOT NULL,
  `type` varchar(31) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `CRONEXPRESSION` varchar(255) DEFAULT NULL,
  `DELETED` tinyint(1) DEFAULT '0',
  `quartz_group_name` varchar(255) DEFAULT NULL,
  `JOBNAME` varchar(255) DEFAULT NULL,
  `MEASUREID` bigint(20) DEFAULT NULL,
  `METRICNAME` varchar(255) DEFAULT NULL,
  `MODIFIEDDATE` datetime DEFAULT NULL,
  `quartz_job_name` varchar(255) DEFAULT NULL,
  `PREDICATECONFIG` varchar(255) DEFAULT NULL,
  `TIMEZONE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
