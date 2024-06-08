CREATE DATABASE portal;
USE portal;

DROP TABLE IF EXISTS `goadmin_menu`;
CREATE TABLE `goadmin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `goadmin_operation_log`;
CREATE TABLE `goadmin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `goadmin_role_menu`;
CREATE TABLE `goadmin_role_menu` (
  `role_id` int unsigned NOT NULL,
  `menu_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `goadmin_session`;
CREATE TABLE `goadmin_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `goadmin_site`;
CREATE TABLE `goadmin_site` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `goadmin_users`;
CREATE TABLE `goadmin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `goadmin_menu` WRITE;
INSERT INTO `goadmin_menu` VALUES (1,0,1,22,'Administration','fa-tasks','','','',NULL,'2019-09-09 16:00:00','2023-09-06 06:44:21'),(2,1,1,22,'Users','fa-users','/info/manager',NULL,'',NULL,'2019-09-09 16:00:00','2019-09-09 16:00:00'),(5,1,1,23,'Menu','fa-bars','/menu',NULL,'',NULL,'2019-09-09 16:00:00','2019-09-09 16:00:00'),(6,1,1,24,'Operation log','fa-history','/info/op',NULL,'',NULL,'2019-09-09 16:00:00','2019-09-09 16:00:00'),(7,0,1,1,'Main','fa-bars','','','',NULL,'2019-09-09 16:00:00','2023-10-30 14:17:18'),(10,0,0,2,'Compute','fa-bars','/compute','','',NULL,'2023-08-03 07:23:19','2023-10-30 14:17:32'),(11,10,0,2,'VM Instances','fa-tv','/info/vm','','',NULL,'2023-08-03 07:23:51','2023-10-30 14:15:52'),(12,0,0,7,'Platform','fa-bars','','','',NULL,'2023-08-04 07:07:40','2023-09-06 06:17:37'),(13,22,0,7,'Zone','fa-flag','/info/az','','',NULL,'2023-08-04 07:08:14','2023-10-30 14:44:52'),(14,22,0,8,'Cluster','fa-flag-o','/info/cluster','','',NULL,'2023-08-07 07:14:01','2023-10-30 14:45:05'),(15,23,0,9,'Registered Hosts','fa-star','/info/host','','',NULL,'2023-08-09 03:06:09','2023-09-06 06:18:28'),(16,23,0,10,'Physical Hosts','fa-star-o','/info/physical_host','','',NULL,'2023-08-09 07:57:25','2023-10-30 14:54:13'),(17,24,0,16,'Instance Specification','fa-th-list','/info/instance_spec','','',NULL,'2023-08-10 08:08:14','2023-10-30 15:10:53'),(18,25,0,11,'Storage Pools','fa-bitbucket','/info/storage_pool','','',NULL,'2023-08-11 03:46:52','2023-10-30 14:53:16'),(19,24,0,18,'Volume Specification','fa-hdd-o','/info/volume_spec','','',NULL,'2023-08-11 08:17:33','2023-10-30 15:11:46'),(20,26,0,14,'Image Buckets','fa-folder','/info/image_bucket','','',NULL,'2023-08-14 05:46:58','2023-10-30 15:02:50'),(21,27,0,12,'Networks','fa-link','/info/network','','',NULL,'2023-08-14 11:59:21','2023-10-30 14:55:02'),(22,12,0,7,'Data Center Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:30:56','2023-10-30 14:51:14'),(23,12,0,9,'Host Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:32:30','2023-10-30 14:51:30'),(24,12,0,16,'Specification Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:34:25','2023-10-30 14:52:10'),(25,12,0,11,'Storage Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:35:47','2023-10-30 14:51:39'),(26,12,0,14,'Image Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:36:31','2023-10-30 14:52:00'),(27,12,0,12,'Network Management','fa-angle-double-right','','','',NULL,'2023-08-25 03:37:11','2023-10-30 14:51:47'),(28,24,0,17,'Cluster and Instance Specification','fa-share-alt','/info/instance_spec_relation','','',NULL,'2023-08-25 03:40:40','2023-10-30 15:11:31'),(29,24,0,19,'Cluster and Volume Specification','fa-share-alt','/info/volume_spec_relation','','',NULL,'2023-08-25 04:06:02','2023-10-30 15:12:09'),(30,26,0,15,'Images','fa-image','/info/image','','',NULL,'2023-08-25 05:42:17','2023-10-30 15:00:56'),(31,27,0,13,'Subnets','fa-object-group','/info/subnet','','',NULL,'2023-08-25 08:16:35','2023-10-30 15:00:19'),(33,7,0,1,'Dashboard','fa-dashboard','/','','',NULL,'2023-08-29 11:20:08','2023-10-30 14:16:33'),(34,0,0,4,'Storage','fa-bars','/storage','','',NULL,'2023-09-27 11:40:22','2023-10-11 03:58:48'),(35,34,0,4,'Volume','fa-database','/info/volume','','',NULL,'2023-09-27 11:41:05','2023-10-30 14:22:46'),(36,0,0,6,'Network','fa-bars','/network','','',NULL,'2023-10-07 04:21:47','2023-10-11 03:59:03'),(37,36,0,6,'Elastic Interface','fa-chain','/info/nic','','',NULL,'2023-10-07 04:22:37','2023-10-30 14:37:00'),(38,10,0,3,'User Images','fa-image','/info/user_image','','',NULL,'2023-10-10 02:37:35','2023-10-30 14:18:18'),(39,0,0,20,'Alert Management','fa-bars','','','',NULL,'2023-10-17 07:58:18','2023-10-18 11:09:18'),(40,39,0,20,'Alert','fa-bell','/info/alert','','',NULL,'2023-10-17 07:58:41','2023-10-30 14:37:54'),(41,39,0,21,'Alert Rule','fa-filter','/info/alert_rule','','',NULL,'2023-10-17 09:53:13','2023-10-30 14:39:50'),(42,34,0,5,'Snapshot','fa-camera','/info/snapshot','','',NULL,'2023-10-23 04:04:45','2023-10-30 14:23:30');
UNLOCK TABLES;

LOCK TABLES `goadmin_role_menu` WRITE;
INSERT INTO `goadmin_role_menu` VALUES (2,12,'2023-09-06 06:17:37','2023-09-06 06:17:37'),(1,12,'2023-09-06 06:17:37','2023-09-06 06:17:37'),(2,15,'2023-09-06 06:18:28','2023-09-06 06:18:28'),(1,15,'2023-09-06 06:18:28','2023-09-06 06:18:28'),(0,34,'2023-10-11 03:58:48','2023-10-11 03:58:48'),(1,34,'2023-10-11 03:58:48','2023-10-11 03:58:48'),(0,36,'2023-10-11 03:59:03','2023-10-11 03:59:03'),(1,36,'2023-10-11 03:59:03','2023-10-11 03:59:03'),(0,39,'2023-10-18 03:09:18','2023-10-18 03:09:18'),(1,39,'2023-10-18 03:09:18','2023-10-18 03:09:18'),(0,11,'2023-10-30 06:15:52','2023-10-30 06:15:52'),(1,11,'2023-10-30 06:15:52','2023-10-30 06:15:52'),(0,33,'2023-10-30 06:16:33','2023-10-30 06:16:33'),(1,33,'2023-10-30 06:16:33','2023-10-30 06:16:33'),(0,7,'2023-10-30 06:17:18','2023-10-30 06:17:18'),(1,7,'2023-10-30 06:17:18','2023-10-30 06:17:18'),(0,10,'2023-10-30 06:17:32','2023-10-30 06:17:32'),(1,10,'2023-10-30 06:17:32','2023-10-30 06:17:32'),(0,38,'2023-10-30 06:18:18','2023-10-30 06:18:18'),(1,38,'2023-10-30 06:18:18','2023-10-30 06:18:18'),(0,35,'2023-10-30 06:22:46','2023-10-30 06:22:46'),(1,35,'2023-10-30 06:22:46','2023-10-30 06:22:46'),(0,42,'2023-10-30 06:23:30','2023-10-30 06:23:30'),(1,42,'2023-10-30 06:23:30','2023-10-30 06:23:30'),(0,37,'2023-10-30 06:37:00','2023-10-30 06:37:00'),(1,37,'2023-10-30 06:37:00','2023-10-30 06:37:00'),(0,40,'2023-10-30 06:37:54','2023-10-30 06:37:54'),(1,40,'2023-10-30 06:37:54','2023-10-30 06:37:54'),(1,41,'2023-10-30 06:39:50','2023-10-30 06:39:50'),(1,13,'2023-10-30 06:44:52','2023-10-30 06:44:52'),(1,14,'2023-10-30 06:45:05','2023-10-30 06:45:05'),(1,22,'2023-10-30 06:51:14','2023-10-30 06:51:14'),(1,23,'2023-10-30 06:51:30','2023-10-30 06:51:30'),(1,25,'2023-10-30 06:51:39','2023-10-30 06:51:39'),(1,27,'2023-10-30 06:51:47','2023-10-30 06:51:47'),(1,26,'2023-10-30 06:52:00','2023-10-30 06:52:00'),(1,24,'2023-10-30 06:52:10','2023-10-30 06:52:10'),(1,18,'2023-10-30 06:53:16','2023-10-30 06:53:16'),(1,16,'2023-10-30 06:54:13','2023-10-30 06:54:13'),(1,21,'2023-10-30 06:55:02','2023-10-30 06:55:02'),(1,31,'2023-10-30 07:00:19','2023-10-30 07:00:19'),(1,30,'2023-10-30 07:00:56','2023-10-30 07:00:56'),(1,20,'2023-10-30 07:02:50','2023-10-30 07:02:50'),(1,17,'2023-10-30 07:10:53','2023-10-30 07:10:53'),(1,28,'2023-10-30 07:11:31','2023-10-30 07:11:31'),(1,19,'2023-10-30 07:11:46','2023-10-30 07:11:46'),(1,29,'2023-10-30 07:12:09','2023-10-30 07:12:09');
UNLOCK TABLES;

LOCK TABLES `goadmin_site` WRITE;
INSERT INTO `goadmin_site` VALUES 
  (1,'url_prefix','portal',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (2,'access_log_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (3,'no_limit_login_ip','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (4,'custom_403_html','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (5,'open_admin_api','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (6,'error_log_path','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (7,'error_log_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (8,'logger_encoder_time_key','ts',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (9,'logger_encoder_time','iso8601',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (10,'operation_log_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (11,'logger_encoder_level','capitalColor',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (12,'animation_duration','0.00',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (13,'language','zh',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (14,'custom_head_html','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (15,'hide_app_info_entrance','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (16,'custom_404_html','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (17,'exclude_theme_components','null',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (18,'info_log_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (19,'logger_encoder_level_key','level',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (20,'color_scheme','skin-blue',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (21,'footer_info','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (22,'hide_plugin_entrance','true',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (23,'go_mod_file_path','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (24,'asset_root_path','./public/',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (25,'logger_rotate_max_size','10',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (26,'logger_rotate_max_age','30',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (27,'session_life_time','144000',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (28,'login_logo','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (29,'bootstrap_file_path','./bootstrap.go',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (30,'logo','                                        <b>Chime</b>Stack\n    \n    \n    ',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (31,'login_url','/login',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (33,'animation_delay','0.00',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (34,'hide_config_center_entrance','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (35,'logger_rotate_compress','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (36,'logger_encoder_duration','string',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (37,'auth_user_table','goadmin_users',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (38,'extra','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (39,'debug','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (40,'sql_log','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (41,'logger_encoder_name_key','logger',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (42,'file_upload_engine','{\"name\":\"local\"}',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (43,'logger_rotate_max_backups','5',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (44,'logger_encoder_caller_key','caller',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (45,'hide_visitor_user_center_entrance','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (46,'prohibit_config_modification','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (47,'theme','adminlte',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (48,'title','ChimeStack',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (49,'mini_logo','                                <b>Chime</b>Stack\n    \n    \n    \n    ',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (50,'info_log_path','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (51,'asset_url','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (52,'env','prod',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (53,'logger_encoder_stacktrace_key','stacktrace',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (54,'custom_500_html','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (55,'logger_encoder_message_key','msg',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (56,'logger_encoder_caller','full',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (57,'logger_encoder_encoding','console',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (58,'app_id','sqoY28UEnGBO',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (59,'domain','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (60,'index_url','/',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (61,'access_log_path','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (62,'access_assets_log_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (63,'logger_level','0',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (64,'hide_tool_entrance','true',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (65,'allow_del_operation_log','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (66,'login_title','ChimeStack',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (67,'animation_type','',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52'),
  (68,'site_off','false',NULL,1,'2023-08-03 01:38:52','2023-08-03 01:38:52');
UNLOCK TABLES;