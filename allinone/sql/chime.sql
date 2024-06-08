-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: chime
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE chime;
USE chime;

--
-- Table structure for table `r_alert_rule_group`
--

DROP TABLE IF EXISTS `r_alert_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_alert_rule_group` (
  `rule_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'group uuid',
  `group_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'group uuid',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `udx_uuid` (`rule_uuid`,`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_alert_rule_group`
--

LOCK TABLES `r_alert_rule_group` WRITE;
/*!40000 ALTER TABLE `r_alert_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_alert_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_cluster_instance_inventory`
--

DROP TABLE IF EXISTS `r_cluster_instance_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_cluster_instance_inventory` (
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `instance_spec_uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'instance spec uuid',
  `total_vcpus` int NOT NULL DEFAULT '0',
  `used_vcpus` int NOT NULL DEFAULT '0',
  `phgysical_vcpus` int NOT NULL DEFAULT '0',
  `total_memory` int NOT NULL DEFAULT '0',
  `used_memory` int NOT NULL DEFAULT '0',
  `phgysical_memory` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_uuid` (`cluster_uuid`,`instance_spec_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_cluster_instance_inventory`
--

LOCK TABLES `r_cluster_instance_inventory` WRITE;
/*!40000 ALTER TABLE `r_cluster_instance_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_cluster_instance_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_cluster_instance_spec`
--

DROP TABLE IF EXISTS `r_cluster_instance_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_cluster_instance_spec` (
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `instance_spec_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'instance spec uuid',
  `created_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `udx_uuid` (`cluster_uuid`,`instance_spec_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_cluster_instance_spec`
--

LOCK TABLES `r_cluster_instance_spec` WRITE;
/*!40000 ALTER TABLE `r_cluster_instance_spec` DISABLE KEYS */;
INSERT INTO `r_cluster_instance_spec` VALUES ('d42d3779-e25d-45fd-b7a0-7c36fdd89496','2a3689cb-09d3-41fd-a6e2-992acc0eda22','2024-06-04 21:39:40'),('d42d3779-e25d-45fd-b7a0-7c36fdd89496','ab2fe702-44d4-4c8d-9abc-b1b1bedec0e9','2024-06-04 21:40:05'),('d42d3779-e25d-45fd-b7a0-7c36fdd89496','c947be88-1323-4401-a8b1-fea98d4ceb65','2024-06-04 21:40:10');
/*!40000 ALTER TABLE `r_cluster_instance_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_cluster_volume_inventory`
--

DROP TABLE IF EXISTS `r_cluster_volume_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_cluster_volume_inventory` (
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `volume_spec_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'instance spec uuid',
  `total_size` int NOT NULL DEFAULT '0' COMMENT 'total volume pool logical size in GiB',
  `used_size` int NOT NULL DEFAULT '0' COMMENT 'volume pool logical allocated size in GiB',
  `physical_size` int NOT NULL DEFAULT '0' COMMENT 'volume pool physical size in GiB',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_uuid` (`cluster_uuid`,`volume_spec_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_cluster_volume_inventory`
--

LOCK TABLES `r_cluster_volume_inventory` WRITE;
/*!40000 ALTER TABLE `r_cluster_volume_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_cluster_volume_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_cluster_volume_spec`
--

DROP TABLE IF EXISTS `r_cluster_volume_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_cluster_volume_spec` (
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `volume_spec_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume spec uuid',
  `created_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `udx_uuid` (`cluster_uuid`,`volume_spec_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_cluster_volume_spec`
--

LOCK TABLES `r_cluster_volume_spec` WRITE;
/*!40000 ALTER TABLE `r_cluster_volume_spec` DISABLE KEYS */;
INSERT INTO `r_cluster_volume_spec` VALUES ('d42d3779-e25d-45fd-b7a0-7c36fdd89496','e1acaea8-b260-4f3b-807a-a037f4ef95b6','2024-06-04 21:43:56'),('d42d3779-e25d-45fd-b7a0-7c36fdd89496','f41c85d8-245f-45fb-8c17-8f0cc000450c','2024-06-04 21:44:03');
/*!40000 ALTER TABLE `r_cluster_volume_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_network_host`
--

DROP TABLE IF EXISTS `r_network_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_network_host` (
  `network_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'network uuid',
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host uuid',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available, 10:failed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_network_host` (`network_uuid`,`host_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_network_host`
--

LOCK TABLES `r_network_host` WRITE;
/*!40000 ALTER TABLE `r_network_host` DISABLE KEYS */;
INSERT INTO `r_network_host` VALUES ('1ad0df39-c9ee-41b5-9ac3-4fbdee92b761','b88c944f-9b88-4a3c-a004-4c3e29f1f8c1',1,'2024-06-05 13:37:29','2024-06-05 13:37:28');
/*!40000 ALTER TABLE `r_network_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_vm_nic`
--

DROP TABLE IF EXISTS `r_vm_nic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_vm_nic` (
  `vm_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'vm uuid',
  `nic_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume uuid',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not attached, 1:attached, 2:reservered, 4:deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_vmid_nicid` (`vm_uuid`,`nic_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_vm_nic`
--

LOCK TABLES `r_vm_nic` WRITE;
/*!40000 ALTER TABLE `r_vm_nic` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_vm_nic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_vm_volume`
--

DROP TABLE IF EXISTS `r_vm_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_vm_volume` (
  `vm_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'vm uuid',
  `volume_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume uuid',
  `target` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'hdx, sdx, ...',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not attached, 1:attached, 2:reservered, 4:deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_vmid_volid` (`vm_uuid`,`volume_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_vm_volume`
--

LOCK TABLES `r_vm_volume` WRITE;
/*!40000 ALTER TABLE `r_vm_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_vm_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_alert`
--

DROP TABLE IF EXISTS `t_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_alert` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `rule_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'alert rule uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alert name',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'user uuid',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:new, 1:read, 2:accepted, 5:deleted',
  `severity` tinyint NOT NULL DEFAULT '0' COMMENT '0:info, 1:warn, 2:serious, 3:smoke',
  `priority` tinyint NOT NULL DEFAULT '0' COMMENT '0:low, 1:middle, 2:high, 3:super high',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alert`
--

LOCK TABLES `t_alert` WRITE;
/*!40000 ALTER TABLE `t_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_alert_group`
--

DROP TABLE IF EXISTS `t_alert_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_alert_group` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'group uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'group name',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:disabled, 1:enabled',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user uuid',
  `send_text` tinyint NOT NULL DEFAULT '0' COMMENT '0:disabled, 1:enabled',
  `send_email` tinyint NOT NULL DEFAULT '0' COMMENT '0:disabled, 1:enabled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  UNIQUE KEY `udx_uuid` (`uuid`,`user_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alert_group`
--

LOCK TABLES `t_alert_group` WRITE;
/*!40000 ALTER TABLE `t_alert_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_alert_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_alert_rule`
--

DROP TABLE IF EXISTS `t_alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_alert_rule` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'rule uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'alert name',
  `template` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `match` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the match criteria of this rule',
  `aggregate` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the aggregate criteria of this rule',
  `field` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the select fields',
  `cron` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'cron table of this rule',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:disabled, 1:enabled',
  `severity` tinyint NOT NULL DEFAULT '0' COMMENT '0:info, 1:warn, 2:serious, 3:smoke',
  `priority` tinyint NOT NULL DEFAULT '0' COMMENT '0:low, 1:middle, 2:high, 3:super high',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alert_rule`
--

LOCK TABLES `t_alert_rule` WRITE;
/*!40000 ALTER TABLE `t_alert_rule` DISABLE KEYS */;
INSERT INTO `t_alert_rule` VALUES ('84adf565-2342-11ef-953f-000c29d35f40','Host CPU Usage Larger Than 50%','host name: {{host}}, cpu usage: {{total_avg}}','host_metrics_aggr|total_avg|>|50.0','3','host|total_avg','0 */1 * * * *',1,1,1,'2024-06-05 13:50:07',NULL),('84ae7592-2342-11ef-953f-000c29d35f40','Host Memory Usage Larger Than 50%','host name: {{host}}, memory usage: {{used_avg}}','host_metrics_aggr|used_avg|>|50.0','3','host|used_avg','0 */1 * * * *',1,1,1,'2024-06-05 13:50:07',NULL),('84af14b1-2342-11ef-953f-000c29d35f40','Host CPU Usage Larger Than 80%','host name: {{host}}, cpu usage: {{total_avg}}','host_metrics_aggr|total_avg|>|80.0','3','host|total_avg','0 */1 * * * *',1,2,2,'2024-06-05 13:50:07',NULL),('84bc5caf-2342-11ef-953f-000c29d35f40','Host Memory Usage Larger Than 80%','host name: {{host}}, memory usage: {{used_avg}}','host_metrics_aggr|used_avg|>|80.0','3','host|used_avg','0 */1 * * * *',1,2,2,'2024-06-05 13:50:07',NULL),('84bd2952-2342-11ef-953f-000c29d35f40','Instance Memory Usage Larger Than 80%','vm uuid: {{vm_uuid}}, memory usage: {{used_avg}}','vm_metrics_aggr|used_avg|>|80.0','3','vm_uuid|used_avg','0 */1 * * * *',1,2,2,'2024-06-05 13:50:07',NULL);
/*!40000 ALTER TABLE `t_alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_az`
--

DROP TABLE IF EXISTS `t_az`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_az` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'avaialble zone uuid',
  `parent_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'parent avaialble zone uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`),
  UNIQUE KEY `udx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_az`
--

LOCK TABLES `t_az` WRITE;
/*!40000 ALTER TABLE `t_az` DISABLE KEYS */;
INSERT INTO `t_az` VALUES ('4a28bf21-1600-40e5-924f-5c03c7f76d4f',NULL,'Default',1,'default zone','2024-06-04 21:27:28',NULL);
/*!40000 ALTER TABLE `t_az` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_backup_pool`
--

DROP TABLE IF EXISTS `t_backup_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_backup_pool` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'backup uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cluster uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'backup pool name',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0:local, 1:iscsi',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available',
  `backend_path` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'posix path',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_backup_pool`
--

LOCK TABLES `t_backup_pool` WRITE;
/*!40000 ALTER TABLE `t_backup_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_backup_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_client`
--

DROP TABLE IF EXISTS `t_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'host name',
  `state` tinyint NOT NULL DEFAULT '0',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rack_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'rack name',
  `manage_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'manage ip',
  `domains` int NOT NULL DEFAULT '0' COMMENT 'the domains in the host',
  `active_domains` int NOT NULL DEFAULT '0' COMMENT 'the active domains in the host',
  `vcpus` int NOT NULL DEFAULT '0' COMMENT 'the total vcpus in the host',
  `active_vcpus` int NOT NULL DEFAULT '0' COMMENT 'the active vcpus in the host',
  `memory` bigint NOT NULL DEFAULT '0' COMMENT 'the total memory in the host',
  `active_memory` bigint NOT NULL DEFAULT '0' COMMENT 'the active memory in the host',
  `created_at` timestamp NULL DEFAULT NULL,
  `heartbeat_at` timestamp NULL DEFAULT NULL,
  `node_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip in node network',
  `storage_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip in storage network',
  `reserved_ip1` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'reserved ip1 for other network',
  `reserved_ip2` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'reserved ip2 for other network',
  `monitor_state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unreachable, 1:reachable',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client`
--

LOCK TABLES `t_client` WRITE;
/*!40000 ALTER TABLE `t_client` DISABLE KEYS */;
INSERT INTO `t_client` VALUES ('b88c944f-9b88-4a3c-a004-4c3e29f1f8c1','chime1',1,'','rack1','127.0.0.1',0,0,0,0,0,0,'2024-06-05 09:21:28','2024-06-06 00:44:42','','','','',0);
/*!40000 ALTER TABLE `t_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cluster`
--

DROP TABLE IF EXISTS `t_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cluster` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster name',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT 'cluster type, 0:HCI cluster, 1:computing cluster, 2:storage cluster',
  `hypervisor_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster virtualization type',
  `arch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster cpu arch type',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to operation uuid',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cluster`
--

LOCK TABLES `t_cluster` WRITE;
/*!40000 ALTER TABLE `t_cluster` DISABLE KEYS */;
INSERT INTO `t_cluster` VALUES ('d42d3779-e25d-45fd-b7a0-7c36fdd89496','4a28bf21-1600-40e5-924f-5c03c7f76d4f','Default',0,'kvm','x86_64',1,'','default cluster','2024-06-04 21:27:51','2024-06-04 13:29:21');
/*!40000 ALTER TABLE `t_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_host`
--

DROP TABLE IF EXISTS `t_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_host` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cluster uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to operation uuid',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  `heartbeat_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_host`
--

LOCK TABLES `t_host` WRITE;
/*!40000 ALTER TABLE `t_host` DISABLE KEYS */;
INSERT INTO `t_host` VALUES ('b88c944f-9b88-4a3c-a004-4c3e29f1f8c1','4a28bf21-1600-40e5-924f-5c03c7f76d4f','d42d3779-e25d-45fd-b7a0-7c36fdd89496','chime1',1,'','','2024-06-05 13:37:29',NULL,NULL);
/*!40000 ALTER TABLE `t_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_host_affinity`
--

DROP TABLE IF EXISTS `t_host_affinity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_host_affinity` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host_uuid',
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'for affinity tag',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_host_tag` (`host_uuid`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_host_affinity`
--

LOCK TABLES `t_host_affinity` WRITE;
/*!40000 ALTER TABLE `t_host_affinity` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_host_affinity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_host_filter`
--

DROP TABLE IF EXISTS `t_host_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_host_filter` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host_uuid',
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'for filter tag',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_host_tag` (`host_uuid`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_host_filter`
--

LOCK TABLES `t_host_filter` WRITE;
/*!40000 ALTER TABLE `t_host_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_host_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_host_inventory`
--

DROP TABLE IF EXISTS `t_host_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_host_inventory` (
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host uuid',
  `total_vcpus` int NOT NULL DEFAULT '0' COMMENT 'total logical vcpus',
  `used_vcpus` int NOT NULL DEFAULT '0' COMMENT 'allocated logical vcpus',
  `physical_vcpus` int NOT NULL DEFAULT '0' COMMENT 'total physical vcpus in the host',
  `reserved_vcpus` int NOT NULL DEFAULT '0' COMMENT 'reserved physical vcpus in the host',
  `total_memory` bigint NOT NULL DEFAULT '0' COMMENT 'total logical memory',
  `used_memory` bigint NOT NULL DEFAULT '0' COMMENT 'allocated logical memory',
  `physical_memory` bigint NOT NULL DEFAULT '0' COMMENT 'total physical memory in the host',
  `reserved_memory` bigint NOT NULL DEFAULT '0' COMMENT 'reserved physical memory in the host',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`host_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_host_inventory`
--

LOCK TABLES `t_host_inventory` WRITE;
/*!40000 ALTER TABLE `t_host_inventory` DISABLE KEYS */;
INSERT INTO `t_host_inventory` VALUES ('b88c944f-9b88-4a3c-a004-4c3e29f1f8c1',8,0,4,0,7780073472,0,3890036736,0,'2024-06-05 13:37:29',NULL);
/*!40000 ALTER TABLE `t_host_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_image`
--

DROP TABLE IF EXISTS `t_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_image` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'image uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to operation uuid',
  `bucket_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bucket uuid',
  `format` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'image format, support qcow2 and raw',
  `os_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'os type: linux, window, os x, etc',
  `os_detail` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'os details',
  `os_arch` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'os arch',
  `boot_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '0: bios, 1:uefi',
  `shared` tinyint NOT NULL DEFAULT '0' COMMENT '0:non-shared, 1:shared',
  `install_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the installation url',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_image`
--

LOCK TABLES `t_image` WRITE;
/*!40000 ALTER TABLE `t_image` DISABLE KEYS */;
INSERT INTO `t_image` VALUES ('9fc26afe-63cf-415f-9502-0e0c5b9a6d73','CentOS 8.5.2111 ISO',5,'','','public','iso','CentOS','CentOS 8.x','x86_64','bios',0,'file:///root/CentOS-8.5.2111-x86_64-boot.iso','2024-06-05 00:50:08','2024-06-05 00:52:29'),('b128be43-4e2e-4615-b3c4-4ff9e1e8e2a7','CentOS 8.5.2111 ISO',5,'','','public','iso','CentOS','CentOS 8.x','x86_64','bios',0,'file:///root/CentOS-8.5.2111-x86_64-boot.iso','2024-06-05 00:53:09','2024-06-05 07:56:06'),('c6688223-2460-4121-b81d-038fd5defe39','CentOS 8.5.2111 ISO',1,'','','public','iso','CentOS','CentOS 8.x','x86_64','bios',0,'file:///root/CentOS-8.5.2111-x86_64-boot.iso','2024-06-05 08:14:11','2024-06-05 08:14:26');
/*!40000 ALTER TABLE `t_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_image_bucket`
--

DROP TABLE IF EXISTS `t_image_bucket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_image_bucket` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'image bucket uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0:public, 1:private',
  `owner` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the owner uuid if the bucket type is private',
  `bucket_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'optional, the bucket name',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_image_bucket`
--

LOCK TABLES `t_image_bucket` WRITE;
/*!40000 ALTER TABLE `t_image_bucket` DISABLE KEYS */;
INSERT INTO `t_image_bucket` VALUES ('public','public',1,'',0,'','public','2024-06-05 08:14:11',NULL);
/*!40000 ALTER TABLE `t_image_bucket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_instance_spec`
--

DROP TABLE IF EXISTS `t_instance_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_instance_spec` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'instance specification uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vcpus` int NOT NULL DEFAULT '0' COMMENT 'number of vcpus',
  `memory` bigint NOT NULL DEFAULT '0' COMMENT 'memory in bytes',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0:shared cpus, 1:dedicated cpus',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_instance_spec`
--

LOCK TABLES `t_instance_spec` WRITE;
/*!40000 ALTER TABLE `t_instance_spec` DISABLE KEYS */;
INSERT INTO `t_instance_spec` VALUES ('2a3689cb-09d3-41fd-a6e2-992acc0eda22','Large(4C8G)',1,'',4,8589934592,0,'','2024-06-04 21:39:21',NULL),('ab2fe702-44d4-4c8d-9abc-b1b1bedec0e9','Medium(2C4G)',1,'',2,4294967296,0,'','2024-06-04 21:39:02',NULL),('c947be88-1323-4401-a8b1-fea98d4ceb65','Mini(1C1G)',1,'',1,1073741824,0,'','2024-06-04 21:37:45',NULL);
/*!40000 ALTER TABLE `t_instance_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_network`
--

DROP TABLE IF EXISTS `t_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_network` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'network uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cluster uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'network name',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0:novlan, 1:vlan, 2:vxlan',
  `vlan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'vlan or vpc id',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available',
  `interface_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'interface name',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_network`
--

LOCK TABLES `t_network` WRITE;
/*!40000 ALTER TABLE `t_network` DISABLE KEYS */;
INSERT INTO `t_network` VALUES ('1ad0df39-c9ee-41b5-9ac3-4fbdee92b761','4a28bf21-1600-40e5-924f-5c03c7f76d4f','d42d3779-e25d-45fd-b7a0-7c36fdd89496','chime-bridge',0,'',1,'eth1','','2024-06-05 13:35:33','2024-06-07 03:15:35');
/*!40000 ALTER TABLE `t_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_nic`
--

DROP TABLE IF EXISTS `t_nic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nic` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nic uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nic name',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available',
  `primary` tinyint NOT NULL DEFAULT '0' COMMENT '0:second, 1:primary',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'owner user uuid',
  `subnet_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subnet uuid',
  `network_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'network name',
  `mac` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mac address',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip address',
  `gateway` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'gateway address',
  `netmask` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'netmask',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'empty means no lock and vice versa',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_nic`
--

LOCK TABLES `t_nic` WRITE;
/*!40000 ALTER TABLE `t_nic` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_nic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_session`
--

DROP TABLE IF EXISTS `t_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_session` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'session uuid/token',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'user uuid',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `t_snapshot`
--

DROP TABLE IF EXISTS `t_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_snapshot` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume name',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'user uuid',
  `volume_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'volume uuid',
  `volume_version` int NOT NULL DEFAULT '0' COMMENT 'associated volume version',
  `parent_volume_version` int NOT NULL DEFAULT '0' COMMENT 'associated parent version',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 5:deleted, 10:failed',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'empty means no lock and vice versa',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_snapshot`
--

LOCK TABLES `t_snapshot` WRITE;
/*!40000 ALTER TABLE `t_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_storage_pool`
--

DROP TABLE IF EXISTS `t_storage_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_storage_pool` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'storage uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cluster uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'storage pool name',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0:local, 1:iscsi, 2:ceph',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_storage_pool`
--

LOCK TABLES `t_storage_pool` WRITE;
/*!40000 ALTER TABLE `t_storage_pool` DISABLE KEYS */;
INSERT INTO `t_storage_pool` VALUES ('862b711b-5427-404d-a981-381ef562aa63','4a28bf21-1600-40e5-924f-5c03c7f76d4f','d42d3779-e25d-45fd-b7a0-7c36fdd89496','Local Storage',0,1,'','{\"backend_path\":\"/mnt/local/backend\",\"image_cache_path\":\"/mnt/local/cache\"}','2024-06-04 21:41:44',NULL);
/*!40000 ALTER TABLE `t_storage_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_storage_pool_inventory`
--

DROP TABLE IF EXISTS `t_storage_pool_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_storage_pool_inventory` (
  `storage_pool_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'host uuid',
  `total_size` bigint NOT NULL DEFAULT '0' COMMENT 'total logical size',
  `used_size` bigint NOT NULL DEFAULT '0' COMMENT 'allocated logical size',
  `physical_size` bigint NOT NULL DEFAULT '0' COMMENT 'total physical size',
  `reserved_size` bigint NOT NULL DEFAULT '0' COMMENT 'reserved physical size',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`storage_pool_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_storage_pool_inventory`
--

LOCK TABLES `t_storage_pool_inventory` WRITE;
/*!40000 ALTER TABLE `t_storage_pool_inventory` DISABLE KEYS */;
INSERT INTO `t_storage_pool_inventory` VALUES ('862b711b-5427-404d-a981-381ef562aa63',214748364800,0,107374182400,0,'2024-06-04 21:41:44','2024-06-05 13:33:51');
/*!40000 ALTER TABLE `t_storage_pool_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_subnet`
--

DROP TABLE IF EXISTS `t_subnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_subnet` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subnet uuid',
  `network_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'network uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'subnet name',
  `type` tinyint NOT NULL DEFAULT '0',
  `cidr` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gateway` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reserved_ips` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not available, 1:available',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_subnet`
--

LOCK TABLES `t_subnet` WRITE;
/*!40000 ALTER TABLE `t_subnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_subnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_task`
--

DROP TABLE IF EXISTS `t_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_task` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'task uuid',
  `request_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'for request id',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:not finish, 1:successfully, 2:failed',
  `resource_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the resource type if any, like vm, volume, etc',
  `resource_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the resource uuid if any',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'the operation name',
  `created_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  KEY `udx_resource_uuid` (`resource_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_task`
--

LOCK TABLES `t_task` WRITE;
/*!40000 ALTER TABLE `t_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user uuid',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nick_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:available',
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '0:normal user, 1:admin, 2:super admin',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_ame` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('4d71a3b1-2274-11ef-beaf-000c29d35f40','admin','Admin',1,'$2a$10$vC3F4GuPp7MpcmdvW8U/HuIGAviMyONk7JavYln52eV2JmBmQzAA6',3,'',NULL,NULL),('ec9905f3-3bbd-4c18-88bc-608ff760c5b8','ops','Ops',1,'$2a$10$DisexyDE2PrKhpDpzCTD.uMMjJKOJ.Yunitz0u8YL08M/mSkE0k86',1,'','2024-06-04 22:12:41',NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_default`
--

DROP TABLE IF EXISTS `t_user_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_default` (
  `owner_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'owner uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'default avaialble zone uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'default avaialble zone uuid',
  UNIQUE KEY `udx_owner` (`owner_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_default`
--

LOCK TABLES `t_user_default` WRITE;
/*!40000 ALTER TABLE `t_user_default` DISABLE KEYS */;
INSERT INTO `t_user_default` VALUES ('4d71a3b1-2274-11ef-beaf-000c29d35f40','4a28bf21-1600-40e5-924f-5c03c7f76d4f','d42d3779-e25d-45fd-b7a0-7c36fdd89496');
/*!40000 ALTER TABLE `t_user_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vm`
--

DROP TABLE IF EXISTS `t_vm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_vm` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'vm uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'owner user uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'cluster uuid',
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'host uuid',
  `last_host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'last host uuid',
  `install_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'install path',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:running, 4:stopped, 5:deleted, 10: failed',
  `vcpus` int NOT NULL DEFAULT '0',
  `memory` bigint NOT NULL DEFAULT '0' COMMENT 'in bytes',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'link to t_operation table uuid',
  `instance_spec_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'instance specification uuid',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vnc_password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vm`
--

LOCK TABLES `t_vm` WRITE;
/*!40000 ALTER TABLE `t_vm` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_vm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_volume`
--

DROP TABLE IF EXISTS `t_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_volume` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume name',
  `user_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'user uuid',
  `az_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'az uuid',
  `cluster_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cluster uuid',
  `host_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'host uuid',
  `volume_spec_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'volume specification uuid',
  `size` bigint NOT NULL DEFAULT '0' COMMENT 'volume logical size in bytes',
  `iops` int NOT NULL DEFAULT '0' COMMENT 'volume iops, 0 means no limitation',
  `throughput` bigint NOT NULL DEFAULT '0' COMMENT 'volume throughput, 0 means no limitation',
  `install_path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the volume install path',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:inuse, 3:reserved, 5:deleted, 10:failed',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'empty means no lock and vice versa',
  `root` tinyint NOT NULL DEFAULT '0' COMMENT '0:data volume, 1:root volume',
  `cdrom` tinyint NOT NULL DEFAULT '0' COMMENT '0:non-cdrom, 1:cdrom',
  `image_uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'related to backing image',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  `version` int NOT NULL DEFAULT '0' COMMENT 'volume version',
  `parent_version` int NOT NULL DEFAULT '0' COMMENT 'parent volume version',
  `format` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'raw' COMMENT 'the format of volume, like: raw, qcow2, etc.',
  `type` int NOT NULL DEFAULT '0' COMMENT '0:local, 1:iscsi, 2:ceph',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_volume`
--

LOCK TABLES `t_volume` WRITE;
/*!40000 ALTER TABLE `t_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_volume_spec`
--

DROP TABLE IF EXISTS `t_volume_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_volume_spec` (
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'volume_spec specification uuid',
  `storage_pool_uuid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'storage pool uuid',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `state` tinyint NOT NULL DEFAULT '0' COMMENT '0:unavailable, 1:avaiable, 2:suspend, 4:deleted',
  `operation` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'empty:no lock',
  `min_iops` int NOT NULL DEFAULT '0' COMMENT 'mininum iops of the volume',
  `max_iops` int NOT NULL DEFAULT '0' COMMENT 'maximum iops of the volume',
  `step_iops` int NOT NULL DEFAULT '0' COMMENT 'step iops of the volume per GiB',
  `min_throughput` bigint NOT NULL DEFAULT '0' COMMENT 'mininum throughput of the volume',
  `max_throughput` bigint NOT NULL DEFAULT '0' COMMENT 'maximum throughput of the volume',
  `step_throughput` bigint NOT NULL DEFAULT '0' COMMENT 'step throughput of the volume per GiB',
  `description` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'the time of last operation',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `udx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_volume_spec`
--

LOCK TABLES `t_volume_spec` WRITE;
/*!40000 ALTER TABLE `t_volume_spec` DISABLE KEYS */;
INSERT INTO `t_volume_spec` VALUES ('e1acaea8-b260-4f3b-807a-a037f4ef95b6','862b711b-5427-404d-a981-381ef562aa63','Performance(Local)',1,'',500,10000,100,10485760,524288000,5242880,'','2024-06-04 21:43:50',NULL),('f41c85d8-245f-45fb-8c17-8f0cc000450c','862b711b-5427-404d-a981-381ef562aa63','Standard(Local)',1,'',500,5000,50,10485760,104857600,1048576,'','2024-06-04 21:42:41',NULL);
/*!40000 ALTER TABLE `t_volume_spec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 11:16:08




