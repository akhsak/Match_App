-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: mysql-19cd2296-jyothiswarup99-eca4.b.aivencloud.com    Database: machine_task_db
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '88ca006a-9bac-11f1-8ab0-0e8aa05fed75:1-21846,
a39e89b4-9abe-11f1-b23b-be486f626d98:1-3521';

--
-- Table structure for table `accounts_match`
--

DROP TABLE IF EXISTS `accounts_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_match` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `boy_name` varchar(100) NOT NULL,
  `girl_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `checked_at` datetime(6) DEFAULT NULL,
  `is_match` tinyint(1) NOT NULL,
  `match_percentage` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_match_user_id_b2942153_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_match_user_id_b2942153_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `accounts_match_chk_1` CHECK ((`match_percentage` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_match`
--

LOCK TABLES `accounts_match` WRITE;
/*!40000 ALTER TABLE `accounts_match` DISABLE KEYS */;
INSERT INTO `accounts_match` VALUES (1,'ak','as','2026-08-30 18:11:18.256342',1,'2026-08-30 18:11:18.255977',0,0),(2,'ak','as','2026-08-30 18:11:26.597991',1,'2026-08-30 18:11:26.597410',0,0),(3,'ak','as','2026-08-30 18:11:49.856978',1,'2026-08-30 18:11:49.856636',0,0),(4,'ak','as','2026-08-30 18:11:59.358556',1,'2026-08-30 18:11:59.357852',0,0),(5,'ak','as','2026-08-30 18:13:04.860122',1,'2026-08-30 18:13:04.859811',1,0),(6,'aa','aa','2026-08-30 18:16:48.580075',1,'2026-08-30 18:16:48.579877',1,0),(7,'ak','as','2026-08-30 19:03:14.014025',1,'2026-08-30 19:03:14.009876',0,0),(8,'ab','as','2026-08-30 19:03:27.840621',1,'2026-08-30 19:03:27.840325',1,0),(9,'sharuk','aash','2026-08-30 19:15:47.463304',2,'2026-08-30 19:15:47.462823',1,0),(10,'akhsa','aash','2026-08-30 19:16:10.975070',2,'2026-08-30 19:16:10.974551',0,0),(11,'aju','ammu','2026-08-30 19:16:38.496249',2,'2026-08-30 19:16:38.495886',1,0),(12,'aju','am','2026-08-30 19:18:00.503026',2,'2026-08-30 19:18:00.502560',1,0),(13,'a','am','2026-08-30 19:18:10.978268',2,'2026-08-30 19:18:10.977864',0,0),(14,'ashraf','sameera','2026-08-30 19:18:30.125296',2,'2026-08-30 19:18:30.124974',0,0),(15,'ashraf k','sameera','2026-08-30 19:18:45.220147',2,'2026-08-30 19:18:45.219774',0,0),(16,'aaa','aaa','2026-08-31 07:34:51.140877',2,'2026-08-31 07:34:51.138959',1,0),(17,'aaa','kk','2026-08-31 07:35:12.756350',2,'2026-08-31 07:35:12.756043',0,0),(18,'roshni','rohan','2026-08-31 07:36:10.514047',3,'2026-08-31 07:36:10.513752',1,0),(19,'roshni','abu','2026-08-31 07:36:29.829931',3,'2026-08-31 07:36:29.829689',0,0),(20,'aash','bachan','2026-08-31 07:37:10.455770',3,'2026-08-31 07:37:10.455412',0,0),(21,'aash','bachan','2026-08-31 07:37:25.174449',3,'2026-08-31 07:37:25.174236',0,0),(22,'bachan','aash','2026-08-31 07:37:45.655085',3,'2026-08-31 07:37:45.654793',1,0),(23,'bachan','aash','2026-08-31 07:37:52.375456',3,'2026-08-31 07:37:52.375262',1,0),(24,'bachan','aash','2026-08-31 07:37:58.942557',3,'2026-08-31 07:37:58.942358',1,0),(25,'bachan','aash','2026-08-31 08:25:58.809161',3,'2026-08-31 08:25:58.806440',1,0),(26,'bac','aash','2026-08-31 08:26:26.380967',3,'2026-08-31 08:26:26.380579',0,0),(27,'bb','aa','2026-08-31 08:30:43.021964',4,'2026-08-31 08:30:43.021453',1,0),(28,'bb','aa','2026-08-31 08:31:02.160901',4,'2026-08-31 08:31:02.160461',1,0),(29,'bachan','aash','2026-08-31 08:53:29.784777',2,'2026-08-31 08:53:29.775623',1,0),(30,'bachan','aash','2026-08-31 09:10:30.615651',3,'2026-08-31 09:10:30.613699',1,0),(31,'bachan','aash','2026-08-31 09:34:58.075040',3,'2026-08-31 09:34:58.074674',1,0),(32,'maariyam','akhsa','2026-08-31 09:50:44.772517',2,'2026-08-31 09:50:44.761433',0,0),(33,'bachan','aash','2026-08-31 09:51:40.667032',2,'2026-08-31 09:51:40.666607',1,0),(34,'bachan','aash','2026-08-31 09:54:56.725239',2,'2026-08-31 09:54:56.721875',1,0),(35,'ss','aa','2026-08-31 09:59:44.373764',2,'2026-08-31 09:59:44.372172',0,0),(36,'bachan','aash','2026-08-31 10:00:00.773185',2,'2026-08-31 10:00:00.772926',1,0),(37,'aa','aa','2026-08-31 10:00:42.615304',2,'2026-08-31 10:00:42.614748',1,0),(38,'bachan','aash','2026-08-31 10:22:47.772589',2,'2026-08-31 10:22:47.766161',1,0),(39,'nn','aa','2026-08-31 10:23:03.869535',2,'2026-08-31 10:23:03.869226',0,0),(40,'b','a','2026-08-31 10:26:24.101757',2,'2026-08-31 10:26:24.100331',1,0);
/*!40000 ALTER TABLE `accounts_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `tenant_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$1500000$PJEpBEqsE1ecT5F1CpYxkB$Lue5JgLRxSb/zbnV72THaqlJK3+N+KGEZvRMHtz9994=',NULL,0,'','',0,1,'2026-08-30 18:11:05.946283','aks@gmail.com','aks k','default'),(2,'pbkdf2_sha256$1500000$YQLp1gW9M8fAUjvkTBhtCE$pTT4eZn8nQa/PFsKTUYEg70r3ghbjOLmZjPm3AoZxFU=',NULL,0,'','',0,1,'2026-08-30 19:11:46.034892','akhsa@gmail.com','akhsa k','default'),(3,'pbkdf2_sha256$1500000$URC8hlsYTTg9TLfUj3e4i3$N5qpPhbkmBgetTHVWOjMZgY8hU1iwsJh1ola3YdGkS8=',NULL,0,'','',0,1,'2026-08-31 07:35:57.811865','test@gmail.com','test k','default'),(4,'pbkdf2_sha256$1500000$xQdO6Q1WEAHWXPFKJCbDo9$G33Ptq2JM11ImaIkbUXUU4JFuMzuDUlPt4V8QcIHk+4=',NULL,0,'','',0,1,'2026-08-31 08:30:33.002130','test1@gmail.com','test1','default');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',7,'add_user'),(22,'Can change user',7,'change_user'),(23,'Can delete user',7,'delete_user'),(24,'Can view user',7,'view_user'),(25,'Can add match',6,'add_match'),(26,'Can change match',6,'change_match'),(27,'Can delete match',6,'delete_match'),(28,'Can view match',6,'view_match');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','match'),(7,'accounts','user'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-08-30 18:07:09.808384'),(2,'contenttypes','0002_remove_content_type_name','2026-08-30 18:07:11.174382'),(3,'auth','0001_initial','2026-08-30 18:07:14.247927'),(4,'auth','0002_alter_permission_name_max_length','2026-08-30 18:07:14.756481'),(5,'auth','0003_alter_user_email_max_length','2026-08-30 18:07:14.963939'),(6,'auth','0004_alter_user_username_opts','2026-08-30 18:07:15.191620'),(7,'auth','0005_alter_user_last_login_null','2026-08-30 18:07:15.407328'),(8,'auth','0006_require_contenttypes_0002','2026-08-30 18:07:15.610256'),(9,'auth','0007_alter_validators_add_error_messages','2026-08-30 18:07:15.842854'),(10,'auth','0008_alter_user_username_max_length','2026-08-30 18:07:16.054077'),(11,'auth','0009_alter_user_last_name_max_length','2026-08-30 18:07:16.275535'),(12,'auth','0010_alter_group_name_max_length','2026-08-30 18:07:16.753869'),(13,'auth','0011_update_proxy_permissions','2026-08-30 18:07:17.634441'),(14,'auth','0012_alter_user_first_name_max_length','2026-08-30 18:07:17.851031'),(15,'accounts','0001_initial','2026-08-30 18:07:21.269041'),(16,'accounts','0002_match','2026-08-30 18:07:22.224014'),(17,'accounts','0003_match_checked_at_match_is_match_and_more','2026-08-30 18:07:23.647357'),(18,'admin','0001_initial','2026-08-30 18:07:25.154298'),(19,'admin','0002_logentry_remove_auto_add','2026-08-30 18:07:25.398098'),(20,'admin','0003_logentry_add_action_flag_choices','2026-08-30 18:07:25.608107'),(21,'sessions','0001_initial','2026-08-30 18:07:26.465043');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-31 16:11:57
