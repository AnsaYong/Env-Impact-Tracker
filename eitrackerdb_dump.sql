-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: eitrackerdb
-- ------------------------------------------------------
-- Server version	8.3.0

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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add environmental data',7,'add_environmentaldata'),(26,'Can change environmental data',7,'change_environmentaldata'),(27,'Can delete environmental data',7,'delete_environmentaldata'),(28,'Can view environmental data',7,'view_environmentaldata'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add geo location',9,'add_geolocation'),(34,'Can change geo location',9,'change_geolocation'),(35,'Can delete geo location',9,'delete_geolocation'),(36,'Can view geo location',9,'view_geolocation'),(37,'Can add recommendations',10,'add_recommendations'),(38,'Can change recommendations',10,'change_recommendations'),(39,'Can delete recommendations',10,'delete_recommendations'),(40,'Can view recommendations',10,'view_recommendations'),(41,'Can add energy consumption',11,'add_energyconsumption'),(42,'Can change energy consumption',11,'change_energyconsumption'),(43,'Can delete energy consumption',11,'delete_energyconsumption'),(44,'Can view energy consumption',11,'view_energyconsumption'),(45,'Can add food consumption',12,'add_foodconsumption'),(46,'Can change food consumption',12,'change_foodconsumption'),(47,'Can delete food consumption',12,'delete_foodconsumption'),(48,'Can view food consumption',12,'view_foodconsumption'),(49,'Can add housing',13,'add_housing'),(50,'Can change housing',13,'change_housing'),(51,'Can delete housing',13,'delete_housing'),(52,'Can view housing',13,'view_housing'),(53,'Can add shopping habits',14,'add_shoppinghabits'),(54,'Can change shopping habits',14,'change_shoppinghabits'),(55,'Can delete shopping habits',14,'delete_shoppinghabits'),(56,'Can view shopping habits',14,'view_shoppinghabits'),(57,'Can add transportation',15,'add_transportation'),(58,'Can change transportation',15,'change_transportation'),(59,'Can delete transportation',15,'delete_transportation'),(60,'Can view transportation',15,'view_transportation'),(61,'Can add waste generation',16,'add_wastegeneration'),(62,'Can change waste generation',16,'change_wastegeneration'),(63,'Can delete waste generation',16,'delete_wastegeneration'),(64,'Can view waste generation',16,'view_wastegeneration'),(65,'Can add water usage',17,'add_waterusage'),(66,'Can change water usage',17,'change_waterusage'),(67,'Can delete water usage',17,'delete_waterusage'),(68,'Can view water usage',17,'view_waterusage'),(69,'Can add carbon footprint breakdown',18,'add_carbonfootprintbreakdown'),(70,'Can change carbon footprint breakdown',18,'change_carbonfootprintbreakdown'),(71,'Can delete carbon footprint breakdown',18,'delete_carbonfootprintbreakdown'),(72,'Can view carbon footprint breakdown',18,'view_carbonfootprintbreakdown'),(73,'Can add carbon footprint comparison',19,'add_carbonfootprintcomparison'),(74,'Can change carbon footprint comparison',19,'change_carbonfootprintcomparison'),(75,'Can delete carbon footprint comparison',19,'delete_carbonfootprintcomparison'),(76,'Can view carbon footprint comparison',19,'view_carbonfootprintcomparison'),(77,'Can add carbon footprint',20,'add_carbonfootprint'),(78,'Can change carbon footprint',20,'change_carbonfootprint'),(79,'Can delete carbon footprint',20,'delete_carbonfootprint'),(80,'Can view carbon footprint',20,'view_carbonfootprint'),(81,'Can add environmental impact',21,'add_environmentalimpact'),(82,'Can change environmental impact',21,'change_environmentalimpact'),(83,'Can delete environmental impact',21,'delete_environmentalimpact'),(84,'Can view environmental impact',21,'view_environmentalimpact'),(85,'Can add env data',22,'add_envdata'),(86,'Can change env data',22,'change_envdata'),(87,'Can delete env data',22,'delete_envdata'),(88,'Can view env data',22,'view_envdata'),(89,'Can add carbon footprint data',23,'add_carbonfootprintdata'),(90,'Can change carbon footprint data',23,'change_carbonfootprintdata'),(91,'Can delete carbon footprint data',23,'delete_carbonfootprintdata'),(92,'Can view carbon footprint data',23,'view_carbonfootprintdata'),(93,'Can add environment data',24,'add_environmentdata'),(94,'Can change environment data',24,'change_environmentdata'),(95,'Can delete environment data',24,'delete_environmentdata'),(96,'Can view environment data',24,'view_environmentdata');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (42,'pbkdf2_sha256$720000$qyZll51pT8jIKjn0Dkbkfm$raI4PDCoehBaSeSG0cRyBO+8C2Btb6mKF7t7G8QD+TY=','2024-04-05 16:02:58.220931',0,'User1','','','user1@gmail.com',0,1,'2024-03-11 18:06:22.521888'),(43,'pbkdf2_sha256$720000$cqRC4of8bRLU7fyo68zWVc$XDHJqCNhzRnqE6P8mI7t69M9la7Qrrj0NcSR3WF3Vdw=','2024-03-28 08:04:54.410669',0,'User2','','','user2@gmail.com',0,1,'2024-03-11 18:08:50.401037'),(44,'pbkdf2_sha256$720000$LsYS2B2L8MRSYB5SpB82O9$2n/6IPqrMHOu/1qTwk2QGP+ZpRhAPSHX2eIKBApEb+Y=','2024-04-05 16:03:50.277683',0,'User3','','','User3@gmail.com',0,1,'2024-03-11 18:12:03.286588'),(45,'pbkdf2_sha256$720000$glYXOvC24VKmYbO2QoIwlv$M7y9hAX/qweT/AGHtrXyYUTqzpLxLKXRq8bqBKS+y3U=','2024-03-28 08:34:40.142495',0,'User4','','','user4@gmail.com',0,1,'2024-03-11 18:12:58.140344'),(46,'pbkdf2_sha256$720000$MGr6BeFcV6lt33AsmQlox5$WyPso8AvachHHbCk0CtgxPR20dr3g2Z3sPXa4i+6igA=','2024-03-12 17:03:03.839976',1,'AnsaYong','','','ansahmbomyonng@gmail.com',1,1,'2024-03-11 18:18:54.915885'),(47,'pbkdf2_sha256$720000$6MwD1efa8RJElhS2QHTm6X$+1PDRdHoNEvkP9LDTXtpA0IgnNStMqRBvY9bZJoxvOc=','2024-03-28 08:39:29.111911',0,'User5','','','user5@gmail.com',0,1,'2024-03-12 09:10:46.788602'),(48,'pbkdf2_sha256$720000$SqCIFikltr85mDNGZHX75U$sl8g4iDuKXH7JTBAvs5buGpeVQg+P/jgNX4L17JVib8=','2024-03-28 08:39:43.606276',0,'User6','','','user6@gmail.com',0,1,'2024-03-12 13:16:26.754323'),(49,'pbkdf2_sha256$720000$JhxQwxOTQesddvsS9CAXv1$BVaK7oe3kcdqvHYRCfxCyOKDDhHrZRC/OlgFfnblRQw=','2024-03-28 08:55:19.011735',0,'User7','','','user7@gmail.com',0,1,'2024-03-13 06:32:23.640522'),(50,'pbkdf2_sha256$720000$QGyzbtII9uTVmEkT3L2MY5$comU42YUjzb7/wTK7KcVn+9Fkqi89367Hz90JZjwj0E=','2024-03-28 07:35:33.155381',0,'User8','','','user8@gmail.com',0,1,'2024-03-14 08:20:25.653391'),(51,'pbkdf2_sha256$720000$PxvcQLw0DfxxD2n4Fl5Js3$YVkBWQF8xJA02xxFiesaX8mj9WTwFX7GLTgXkrWSDGU=',NULL,0,'User9','','','user9@gmail.com',0,1,'2024-03-14 08:47:05.614945'),(52,'pbkdf2_sha256$720000$6o5WO2IopA7f29FjKWGQ2G$ThUtcdcBxlFcMrrDfD8MB8LCqKaqCh4aLylfCTxd/jY=',NULL,0,'User10','','','user10@gmail.com',0,1,'2024-03-14 08:56:39.596057'),(53,'pbkdf2_sha256$720000$EqT9WwtaxaHrNe6snmjqLC$f+iv2BuMbdLxUW+nDHR0rDI7tzQ/9gAZ2VqZPR6FezA=',NULL,0,'User11','','','user11@gmail.com',0,1,'2024-03-14 08:57:27.028617'),(54,'pbkdf2_sha256$720000$nZ3bcAr895PvJb6WJDQoWV$qMV3JOsz1t49z3s1+MURHN2jTgSDDv7GuxGWiaM+eBI=','2024-03-14 09:02:08.249937',0,'User12','','','user12@gmail.com',0,1,'2024-03-14 09:01:53.484137'),(55,'pbkdf2_sha256$720000$BNSjAMhTvmWVn8UnRZgvc0$dNS0uGDsKF2b6UdLo0+JkAWigg8biw/7gAqfsCSgAos=',NULL,0,'User13','','','user13@gmail.com',0,1,'2024-03-14 10:15:26.067826'),(56,'pbkdf2_sha256$720000$AGZvewTm9UtOYk5P11tpjR$xNnmA3/efLU8rLmvLkY7O0TQPnxTD6egWKGDoTVqa2g=','2024-03-14 10:25:21.140648',0,'User14','','','user14@gmail.com',0,1,'2024-03-14 10:25:06.463708'),(57,'pbkdf2_sha256$720000$6k4ggvdhHudDyELTLC86EC$kV67z1l1Na6X3G2zOlI5O8RyCKHV5YTnLNrJuUt1tHo=',NULL,0,'User15','','','user15@gmail.com',0,1,'2024-03-14 10:29:41.098804'),(58,'pbkdf2_sha256$720000$9dIP2wY0em3ZjBqUWTSGkh$5i0HBYNVrNSG3Fnl5UENN7gNotAwBVRdGcyK8X5eXjo=','2024-03-21 10:00:37.584102',0,'Ansa','','','ansa@gmail.com',0,1,'2024-03-16 21:50:42.791185'),(59,'pbkdf2_sha256$720000$d38FDBbgATBeOkdtiVuQhZ$q2uckqdymrUkGEI94u7UCNqK4B/wUuiT6z05S283Gxo=',NULL,0,'User20','','','user20@gmail.com',0,1,'2024-03-19 15:28:20.554712'),(60,'pbkdf2_sha256$720000$gYjbx4DBvWrfieEKO8HZSr$4yplggeZHRESIo0DFPa6SOTM2v4Jgl8r9YkK9/wwlwg=','2024-03-26 16:33:04.212205',0,'User22','','','user22@gmail.com',0,1,'2024-03-26 16:32:35.470658'),(61,'pbkdf2_sha256$720000$4UbRrmhDbJm4JPWlIX8LLc$49H+uKShf7+ApJoc6zMqNo4Nqd2wPhiOi++rmMKrtIs=',NULL,0,'User23','','','user23@gmail.com',0,1,'2024-03-28 09:01:11.785571'),(62,'pbkdf2_sha256$720000$Lf5RB6ZnWfexgqxOO8fEO1$XE72OkIDXC9l+EUoO7MDsxbeT5VUeBi7I+685gfgRPU=','2024-03-28 09:07:56.520048',0,'User16','','','user16@gmail.com',0,1,'2024-03-28 09:07:56.155766'),(63,'pbkdf2_sha256$720000$kbAM3BWfCGpgbRE5M6QQB8$Kbw7iyipjQs7nttMjhAGYRQm5tVdMJtazNucr/Mxoto=','2024-03-28 09:08:43.961905',0,'User17','','','user17@gmail.com',0,1,'2024-03-28 09:08:43.584255');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user`
--

DROP TABLE IF EXISTS `custom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_groups`
--

DROP TABLE IF EXISTS `custom_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_groups_user_id_group_id_747bb497_uniq` (`user_id`,`group_id`),
  KEY `custom_user_groups_group_id_02874f21_fk_auth_group_id` (`group_id`),
  CONSTRAINT `custom_user_groups_group_id_02874f21_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `custom_user_groups_user_id_fc78735a_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_groups`
--

LOCK TABLES `custom_user_groups` WRITE;
/*!40000 ALTER TABLE `custom_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_user_permissions`
--

DROP TABLE IF EXISTS `custom_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_user_permissions_user_id_permission_id_31f85e8f_uniq` (`user_id`,`permission_id`),
  KEY `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `custom_user_user_permissions_user_id_0634b1dc_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_user_permissions`
--

LOCK TABLES `custom_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `custom_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_collection_carbonfootprintdata`
--

DROP TABLE IF EXISTS `data_collection_carbonfootprintdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_collection_carbonfootprintdata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_calculated` datetime(6) NOT NULL,
  `total_carbon_footprint` double NOT NULL,
  `energy_footprint` double NOT NULL,
  `transport_footprint` double NOT NULL,
  `consumer_goods_footprint` double NOT NULL,
  `waste_footprint` double NOT NULL,
  `water_footprint` double NOT NULL,
  `technology_footprint` double NOT NULL,
  `user_id` int NOT NULL,
  `environment_data_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_collection_carb_user_id_b7354711_fk_auth_user` (`user_id`),
  KEY `data_collection_carb_environment_data_id_2e65f148_fk_data_coll` (`environment_data_id`),
  CONSTRAINT `data_collection_carb_environment_data_id_2e65f148_fk_data_coll` FOREIGN KEY (`environment_data_id`) REFERENCES `data_collection_environmentdata` (`id`),
  CONSTRAINT `data_collection_carb_user_id_b7354711_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_collection_carbonfootprintdata`
--

LOCK TABLES `data_collection_carbonfootprintdata` WRITE;
/*!40000 ALTER TABLE `data_collection_carbonfootprintdata` DISABLE KEYS */;
INSERT INTO `data_collection_carbonfootprintdata` VALUES (1,'2024-03-12 16:12:39.540537',76,4,8,8,3.2,2.4000000000000004,50.4,44,8),(3,'2024-03-13 06:29:33.113882',11.8,1,2,2,0.8,0.6000000000000001,5.4,44,10),(4,'2024-03-13 06:35:52.553721',142.8,6,12,12,4.800000000000001,3.6000000000000005,104.4,49,11),(5,'2024-03-18 21:46:34.677229',1774.5,28,630,460,8,603,45.5,58,12),(6,'2024-03-20 14:06:45.646829',468,1.4,4.800000000000001,17.200000000000003,6,6.4,432.2,49,13),(10,'2024-03-22 15:44:13.951019',32,4,9.6,7.199999999999999,0.2,1.7000000000000002,9.299999999999999,44,17),(11,'2024-03-25 14:02:15.694974',222,2.8,24,172,2.0999999999999996,0.7000000000000001,20.4,42,18),(12,'2024-03-26 16:15:25.851961',23.8,6,2,3.9000000000000004,0.3,0.8,10.8,44,19),(13,'2024-03-26 16:23:04.550366',43.2,10,9.600000000000001,6.5,0.2,2.5,14.399999999999999,48,20),(15,'2024-03-26 16:29:16.597015',28.7,3.5,2.5,6,1.5,3.2,12,49,22),(16,'2024-03-28 07:51:54.147666',19.9,3.5,4,5,0.6,2,4.8,50,23);
/*!40000 ALTER TABLE `data_collection_carbonfootprintdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_collection_environmentdata`
--

DROP TABLE IF EXISTS `data_collection_environmentdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_collection_environmentdata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_entered` datetime(6) NOT NULL,
  `energy_source` varchar(20) NOT NULL,
  `energy_amount` double NOT NULL,
  `energy_unit` varchar(20) NOT NULL,
  `transport_mode` varchar(20) NOT NULL,
  `transport_passengers` int unsigned NOT NULL,
  `transport_distance` double NOT NULL,
  `transport_unit` varchar(50) NOT NULL,
  `transport_amount_spent` double NOT NULL,
  `transport_amount_unit` varchar(50) NOT NULL,
  `transport_weight` double NOT NULL,
  `transport_weight_unit` varchar(50) NOT NULL,
  `clothing_type` varchar(20) NOT NULL,
  `clothing_spent` double NOT NULL,
  `clothing_unit` varchar(50) NOT NULL,
  `food_bev_tob_type` varchar(20) NOT NULL,
  `food_bev_tob_spent` double NOT NULL,
  `food_bev_tob_unit` varchar(50) NOT NULL,
  `paper_products_type` varchar(20) NOT NULL,
  `paper_products_spent` double NOT NULL,
  `paper_products_unit` varchar(50) NOT NULL,
  `waste_type` varchar(255) NOT NULL,
  `waste_weight` double NOT NULL,
  `waste_unit` varchar(50) NOT NULL,
  `water_supply_weight` double NOT NULL,
  `water_supply_unit` varchar(50) NOT NULL,
  `water_treatment_volume` double NOT NULL,
  `water_treatment_unit` varchar(50) NOT NULL,
  `cloud_computing_unit` varchar(50) NOT NULL,
  `cloud_computing_number` int NOT NULL,
  `cloud_computing_time` double NOT NULL,
  `networking_data_transferred` double NOT NULL,
  `networking_unit` varchar(50) NOT NULL,
  `personal_computing_time_spent` double NOT NULL,
  `personal_computing_unit` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `env_data_user_id_bcf14113_fk_auth_user_id` (`user_id`),
  CONSTRAINT `env_data_user_id_bcf14113_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `data_collection_environmentdata_chk_1` CHECK ((`transport_passengers` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_collection_environmentdata`
--

LOCK TABLES `data_collection_environmentdata` WRITE;
/*!40000 ALTER TABLE `data_collection_environmentdata` DISABLE KEYS */;
INSERT INTO `data_collection_environmentdata` VALUES (8,'2024-03-12 16:12:39.529502','electricity',8,'kWh','air_travel',8,8,'km',0,'USD',8,'kg','fur',8,'USD','dairy',8,'USD','paper',8,'USD','construction_waste',8,'kg',8,'kg',8,'l','hours',8,8,8,'GB',8,'hours',44),(10,'2024-03-13 06:29:33.107331','electricity',2,'kWh','air_travel',2,2,'km',0,'USD',2,'kg','fur',2,'USD','dairy',2,'USD','paper',2,'USD','construction_waste',2,'kg',2,'kg',2,'l','hours',2,2,2,'GB',2,'hours',44),(11,'2024-03-13 06:35:52.546655','electricity',12,'kWh','air_travel',12,12,'km',0,'USD',12,'kg','fur',12,'USD','dairy',12,'USD','paper',12,'USD','construction_waste',12,'kg',12,'kg',12,'l','hours',12,12,12,'GB',12,'hours',49),(12,'2024-03-18 21:46:34.666900','electricity',56,'kWh','air_travel',4,630,'km',0,'USD',69,'kg','fur',700,'USD','dairy',300,'USD','paper_bags',500,'USD','construction_waste',20,'kg',6000,'kg',15,'l','months',2,5,45,'TB',5,'days',58),(13,'2024-03-20 14:06:45.628823','natural_gas',2,'kWh','vehicle',4,6,'km',0,'USD',10,'kg','leather',14,'USD','meat',16,'USD','pulp',18,'USD','metal_waste',12,'kg',20,'kg',22,'l','hours',24,27,28,'TB',30,'days',49),(17,'2024-03-22 15:44:13.944211','electricity',8,'kWh','freight',2,8,'km',0,'USD',3,'kg','leather',9,'USD','fish',6,'USD','cardboard',3,'USD','glass_waste',1,'kg',5,'kg',6,'l','hours',2,3,1,'TB',7,'hours',44),(18,'2024-03-25 14:02:15.687249','natural_gas',4,'kWh','freight',2,20,'km',0,'USD',30,'kg','leather',300,'USD','meat',100,'USD','pulp',10,'USD','plastic_waste',3,'kg',3,'kg',2,'l','hours',3,6,5,'GB',8,'hours',42),(19,'2024-03-26 16:15:25.846010','fuel',3,'kWh','rail_travel',2,4,'km',0,'USD',1,'kg','leather',3,'USD','meat',5,'USD','cardboard',1,'USD','food_organic_waste',1,'kg',2,'kg',3,'l','hours',2,4,4,'GB',4,'hours',44),(20,'2024-03-26 16:23:04.537549','fuel',5,'kWh','vehicle',2,12,'km',0,'USD',5,'kg','fur',10,'USD','beverage',5,'USD','cardboard',5,'USD','glass_waste',1,'kg',5,'kg',10,'l','hours',2,6,2,'GB',8,'hours',48),(22,'2024-03-26 16:29:16.588182','natural_gas',5,'kWh','rail_travel',1,5,'km',0,'USD',5,'kg','leather',10,'USD','sugar',2,'USD','cardboard',5,'USD','food_organic_waste',5,'kg',12,'kg',10,'l','hours',2,2,5,'GB',8,'hours',49),(23,'2024-03-28 07:51:54.141290','natural_gas',5,'kWh','vehicle',5,5,'km',0,'USD',1,'kg','fur',5,'USD','sugar',5,'USD','pulp',5,'USD','food_organic_waste',2,'kg',10,'kg',5,'l','hours',1,2,1,'GB',4,'hours',50);
/*!40000 ALTER TABLE `data_collection_environmentdata` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (42,'2024-03-11 21:44:23.316966','1','Environmental Data for User1 on 2024-03-11 21:44:23.310316+00:00',1,'[{\"added\": {}}]',24,46);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'data_collection','carbonfootprint'),(18,'data_collection','carbonfootprintbreakdown'),(19,'data_collection','carbonfootprintcomparison'),(23,'data_collection','carbonfootprintdata'),(11,'data_collection','energyconsumption'),(24,'data_collection','environmentdata'),(12,'data_collection','foodconsumption'),(13,'data_collection','housing'),(14,'data_collection','shoppinghabits'),(15,'data_collection','transportation'),(16,'data_collection','wastegeneration'),(17,'data_collection','waterusage'),(22,'impact','envdata'),(21,'impact','environmentalimpact'),(7,'pages','environmentaldata'),(9,'pages','geolocation'),(10,'pages','recommendations'),(8,'pages','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-29 14:39:34.569571'),(2,'auth','0001_initial','2024-02-29 14:39:34.632258'),(3,'admin','0001_initial','2024-02-29 14:39:34.650917'),(4,'admin','0002_logentry_remove_auto_add','2024-02-29 14:39:34.653525'),(5,'admin','0003_logentry_add_action_flag_choices','2024-02-29 14:39:34.655596'),(6,'contenttypes','0002_remove_content_type_name','2024-02-29 14:39:34.674392'),(7,'auth','0002_alter_permission_name_max_length','2024-02-29 14:39:34.682412'),(8,'auth','0003_alter_user_email_max_length','2024-02-29 14:39:34.689618'),(9,'auth','0004_alter_user_username_opts','2024-02-29 14:39:34.691688'),(10,'auth','0005_alter_user_last_login_null','2024-02-29 14:39:34.699294'),(11,'auth','0006_require_contenttypes_0002','2024-02-29 14:39:34.699605'),(12,'auth','0007_alter_validators_add_error_messages','2024-02-29 14:39:34.701632'),(13,'auth','0008_alter_user_username_max_length','2024-02-29 14:39:34.710174'),(14,'auth','0009_alter_user_last_name_max_length','2024-02-29 14:39:34.718707'),(15,'auth','0010_alter_group_name_max_length','2024-02-29 14:39:34.723711'),(16,'auth','0011_update_proxy_permissions','2024-02-29 14:39:34.725746'),(17,'auth','0012_alter_user_first_name_max_length','2024-02-29 14:39:34.734065'),(19,'pages','0001_initial','2024-02-29 14:39:34.749369'),(20,'pages','0002_user','2024-02-29 14:39:34.781212'),(21,'pages','0003_geolocation_recommendations','2024-02-29 14:39:34.790700'),(22,'sessions','0001_initial','2024-02-29 14:39:34.794969'),(34,'data_collection','0001_initial','2024-03-11 21:35:48.177151'),(35,'data_collection','0002_alter_environmentdata_table','2024-03-11 21:38:15.640674'),(36,'data_collection','0003_alter_carbonfootprintdata_options_and_more','2024-03-11 21:49:26.227908'),(37,'data_collection','0004_carbonfootprintdata_environment_data','2024-03-12 16:09:17.259913');
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
INSERT INTO `django_session` VALUES ('12bymyxv7jdeaq74v0wk4jejwte8zbkz','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkKUO:ArOv2k66foQ_HIjaxNdg0hQ27oJFLRSYoGg6v0aFJ6k','2024-03-27 09:01:32.430708'),('12jthwe2eb75rjs7f1ya59kgwgpliv4w','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rnGqw:S6STQf3JyCC38qIQ_AzV5Clz12hiAieL-UsIndmQDpY','2024-04-04 11:44:58.783704'),('18cpmhnsq19vmdcmuq94hsfgj94qkj8d','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rnEy4:CNCHSIvzGgCoFsSs2YyAx50Ko4rdFi49LE0-T5OBB0E','2024-04-04 09:44:12.238970'),('1bhtswwvcudjmlcz4xeaw9klgll5zuyy','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rkICJ:YzYgDWnsy7drF_4kmqUAnTc3_knHPjS9Q4GGP49hMuw','2024-03-27 06:34:43.032728'),('1h9kn11mkmcxsmu4xt4f6jb57cpamj3n','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rkNC0:DaG2KF7cxmRqVjgusPExzDcTPPEj9oBuzVbDfNg6ugU','2024-03-27 11:54:44.371116'),('1r5xcncsmjhjk3obxt4yxy3lamgytn9w','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rmbv9:ezz4Metx-2jc7InpRrE2R0GdfCR1M72sbbr09N_ZSlY','2024-04-02 16:02:35.058151'),('24y3z6k9aoyxyr24zf19w0quvs6nw4ij','.eJxVjrsOwjAMRf8lM6ryfjAhdkbmyk2ctkBTqQ8xIP6dBDqUxbLvuTryi9SwLl29zjjVfSBHIi057MMG_B1TIeEGqR0rP6Zl6puqVKqNztVlDPg4b90_QQdzV7wUuQzaG8aMV9ZGbaySgVNGpTA82ki54DoKB8wDAqVeueiYc1pIq1iWJnz-lGUkGDBrr3nldA9xgP6Ryfolp7ac-emBvD-jiU0_:1rmbOi:fGRCgXTNFaWfnVDOUq_ODsiKbXXXeyO5vGl0cjAXZX8','2024-04-02 15:29:04.028207'),('2dcdg324bkfvhnwe4kfp2rowxsqdho01','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkL3n:qLxPlGtOv1atLxF6cxNHC1ziaqlHSbPX-7z5Zw5txr8','2024-03-27 09:38:07.602613'),('2mliw6nsg5j4uw07t8svdkhxdk30qpx5','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rojkH:UaVP5qALFgzxU3Q_zyYZxkScE-oGrwbThbY5RvLY59o','2024-04-08 12:48:09.036276'),('2s6afnb1ilr5r4hmh4mswmd63t11o4fh','.eJxVjMsOwiAQRf-FtSG0PAou3fsNZGBmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJM4qzMFacfscE-UF1J3iHemsyt7ouc5K7Ig_a5bUhPS-H-3dQoJdvrTyz0Y4nMxhHWiNmN2DQjAEny6wY2ARrCFROXlFw4J1PamQI5P0o3h8YkjiK:1rk1SQ:r-pYAAEbo5WoRMfPnD2j4gDqKUJXlRpPG1QwTF8RekA','2024-03-26 12:42:14.908879'),('3860diwzpgc5vcunmx7yik7vmj5d5lah','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rkMZY:g3htjjbJKJY1eagV3EGQKPvi7wQQvyWbI6R6QWvLWvg','2024-03-27 11:15:00.723287'),('3gap40gxcscaeahswszxgeo2ceem4r9t','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rohZE:2fdVw1L34y_99ixwKpBEW6M4VGbuzCsq-uQeZmZEQP4','2024-04-08 10:28:36.964063'),('3mh2xtyh2ro89m1kjhokyq05cckiqkis','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rmcKb:2NMQ6j14RU1nZ2kjGWz1jxre5QHYiZOdrdUESr20l5w','2024-04-02 16:28:53.563672'),('3zwd5ges5rebgbrs2ezj1a4ueoram4td','.eJxVjDEOwjAMRe-SGUVK62KbkZ0zRHbi0AJqpaadKu4OlTrA-t97f3NR1qWPa7U5DtldHJzd6XdUSU8bd5IfMt4nn6ZxmQf1u-IPWv1tyva6Hu7fQS-1_9amRTIxpkAlsaCoqXbQMQhRaKkEtkaQ2YQyMmYA6lDaAiEQNOreHzVhOGQ:1rk5Wp:gzX6L4HcZY_sDK2WNZe23B3xPi9gLQjVsigcZBc-Hbs','2024-03-26 17:03:03.841287'),('4cfbkrzvvkfloz2rc3un19xz7fr3uy6r','.eJxVjEEOwiAQRe_C2pBpCxRcuu8ZyAwMUjU0Ke3KeHdp0oVu_3vvv4XHfct-r7z6OYqrUKO4_I6E4cnlIPGB5b7IsJRtnUkeijxpldMS-XU73b-DjDW3mh0Y5UyCAcgMZENnkhoTDcyWEzJoN_auMReANVmjNUMzsItg-w7F5wsFkjfl:1rk1gH:FDItrx_Yr49rbuRivdgyT8kX8v_4hXTz11zZJBfB4to','2024-03-26 12:56:33.065392'),('4f2zq7glw271e83v7vp6k0p11yh1adx0','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rlUMy:-JeJhqokd2FSqlDUCtxmgOm3uHNQYPnbd7o2CtTM-sI','2024-03-30 13:46:40.820047'),('4ofd8mbw72owretppe8jcaxh32oebxs3','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rl8k8:6LYwwdY8nRSx4iXRutDUrMfL1G755otgOGjA3hLYvaE','2024-03-29 14:41:08.548715'),('5c684099b2rw81snc68zp3ntc3batwh8','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmtRh:jnk1_N-8U63pIWaEOeEX6LIUD-tjuE6zTiF_0T5Bxc0','2024-04-03 10:45:21.318849'),('5o1chpb8xxyz5yhqyqre47xfg98i46by','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkQOb:AcanwpWmnf1vWzMKmYLAsnCsp0F-cxwoSRXfl7cFFNs','2024-03-27 15:19:57.957015'),('60zo3n57gu2ckn7rheai5gr638edpa81','.eJxVjLsOgzAMRf8lcxXl4QDpVHXv2BkZJwFaCBIPdaj67w0UqWKx7HvO9ZtF_yqXyY_biNh7dmb3tErNTn_oe2y7RJaNXOr15DT0ySlxmZuf1bqkGDiGFdLTx5W4B8Z6SLU4j23FV4XvdOK3wfnuuruHBw1OTWp7kBpNyMgYZTELOVXW5oSGgpEg0AogCUrJHHWQhQYHwookOxXQFsA-X0dmTfQ:1rki7S:ln2_xGmmesaMa2ad7dNrcDr9OWh8G-Qw6nQImy5XRc4','2024-03-28 10:15:26.298489'),('6kjrovi6zay80ivzljlvgc3s4allh9x2','.eJxVjEEOwiAQRe_C2hBIQ5lx6d4zkBkYpGogKe2q8e62SRe6_e-9v6lA61LC2mUOU1JX5Yy6_I5M8SX1IOlJ9dF0bHWZJ9aHok_a9b0led9O9--gUC977TFzlIzECdgTJR7BgvUyIBAJEUQP0aI1LguAyWTG7NAm5wbcQ_X5AkT1OUM:1rpjcE:rz-H_wDDdtYdDJ9jL4ZHa8H4mEWdGQYmIH11Ix-ep3k','2024-04-11 06:51:58.317852'),('6qlbzkomhbsug493odb8nahbh6wo56ls','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rlbhm:jpVpo7UUSwSCodkuIIeTfEUq4eDA0s8b8lOQS4mceT4','2024-03-30 21:36:38.448027'),('6tmuo78oud7vxuva30yqc96vehhq7exl','.eJxVjDkOwjAUBe_iGllxvr8XSvqcIXpeggPIlrJUiLujSCmgfTPz3mLEvpVxX_MyzklchfLi8jsGxGeuB0kP1HuTsdVtmYM8FHnSVQ4t5dftdP8OCtZy1AxQR6yJpzxRH0AuklPWGaM13GQtsvVQhtkET3DcJWQKrHpyAeLzBfv0N6o:1rhUN4:AF1WSk1_1wuBLWY07f0JPfCqNhoIuX79oOJyVaPV5Ts','2024-03-19 12:58:14.277647'),('7ctwwsif4itir1vz3i2legbik5qww1ol','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rncMb:NoVhFZUbRX5FlIYiV2bRq8o6QPHuabbQ8_gn3L9ybbM','2024-04-05 10:43:05.154826'),('7mszpm0iv5oh6hndpckyu3wedt60ng73','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnOFb:XCfn03VfT9iynKI6mQINsjGmFnS3-CbpOs4NIipvsjI','2024-04-04 19:38:55.206114'),('7mvuiy9q9o37chviirwash01encr8460','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmxBJ:bu2QmHAxEoSK8pIBTHCD-jNrVpzdWuX9NkFeDXeI9Qo','2024-04-03 14:44:41.370328'),('7zfdwqhrr5d8kguu8m2i8jpp8n4ea1fc','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rla9h:qoC-S0j4Fqmtq1XYQKUtBIiF4nio533lQyBZXmRlcQ0','2024-03-30 19:57:21.922112'),('84erhohe5zn13v0nh5wk2vvyuuxd114m','.eJxVjLsOwjAMRf8lM4qaOqEJE2JnZK6c2H0ATaU-xID4d9JSCXWx7HvO9VtEfpXzyMM6InYsTuKWVqXE4Q-5w_aZyLySc72cMvRdckqcp-ZntZSU3O5Dj-HBcSF0x1j3qRanofVyUeRGR3ntiZ-Xzd09aHBsUvsIvrKOLZPVrjC5zsA7bXUwitFCoVmBIRMo88AGwVLuTEUIgJmxmsTnC0BLTmc:1riCgf:sGYEwkXZZQ-aalSqJjUwwKBB_TatAY3f99dbLya_-Oc','2024-03-21 12:17:25.386136'),('95cu35twqlzmtt5xyy5x4hmps5yv111n','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rlblR:ZkVoQOzZmPM3iUm4I6E14zkQQGEtcDWGpsEHlw-c7TY','2024-03-30 21:40:25.566789'),('9krp3dbafa01eyz8d1c462ke8i366i4r','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rmCnt:cYymDg0hg_MHwhMTRFAdumgxzDPvliGgpMmhJ_f5SE0','2024-04-01 13:13:25.907173'),('9rz9qi60cwh26dg58jzm026iiex58rv9','.eJxVjMEOwiAQRP-FsyEsRQGP3vsNZMvuStXQpLQn47_bJj3oaZJ5b-atEq5LSWvjOY2krsqBOv2WA-Yn153QA-t90nmqyzwOelf0QZvuJ-LX7XD_Dgq2sq0DQ4wmowfxFh1GJOgsbJGFzhY9eZPFMXDwXqQTNFEuYqIFoRCy-nwBHDk41A:1riy1s:FQf9M1kLagQZxywiqXBVxJ5fBypXb9u6gKHaqCBzbR8','2024-03-23 14:50:28.597414'),('b827c7313cbucf7lwvzgrw5vu3r9ergk','e30:1ri9Va:VrxhK3RqO3_ve4mLO-wYJD_GC1B4RoFT2ttRS6MRagY','2024-03-21 08:53:46.563923'),('b9pr9ak1d99fe9qfkjv62m6kjnt78alk','.eJxVjEEOwiAQRe_C2hBIQ5lx6d4zkBkYpGogKe2q8e62SRe6_e-9v6lA61LC2mUOU1JX5Yy6_I5M8SX1IOlJ9dF0bHWZJ9aHok_a9b0led9O9--gUC977TFzlIzECdgTJR7BgvUyIBAJEUQP0aI1LguAyWTG7NAm5wbcQ_X5AkT1OUM:1rpk6c:kd9WQKQ5ykkNyQDV1rf_JyJIS7021v8Y7J6IQsBTneI','2024-04-11 07:23:22.343681'),('cyjfi3yceohwn66o952dk6wxonpyb2e1','.eJxVjEEOwiAQRe_C2hBIQ5lx6d4zkBkYpGogKe2q8e62SRe6_e-9v6lA61LC2mUOU1JX5Yy6_I5M8SX1IOlJ9dF0bHWZJ9aHok_a9b0led9O9--gUC977TFzlIzECdgTJR7BgvUyIBAJEUQP0aI1LguAyWTG7NAm5wbcQ_X5AkT1OUM:1rpk4Z:VrgW46HK6WTxyvIK30nsDNTo_Ngq6SnwanVgG1rqr1U','2024-04-11 07:21:15.309648'),('d86vqlqvi7msygqb9x7bt6voz7qme824','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rncNX:VupnSvcmAODQjs1TJxMidGhdRPyoba1K5FM1xLeKvlQ','2024-04-05 10:44:03.862736'),('di74sxd7w24ik44ey7914nru22a0mdbz','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkiQ6:uDFpxY_CyEL7f5ZQC_YnRUTjohsAhsFKjan3N4wuVCc','2024-03-28 10:34:42.716307'),('dwzhywm2j6nasu4ttseejpfj0uqynj2t','.eJxVjMsOwiAQRf-FtSG0PAou3fsNZGBmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJM4qzMFacfscE-UF1J3iHemsyt7ouc5K7Ig_a5bUhPS-H-3dQoJdvrTyz0Y4nMxhHWiNmN2DQjAEny6wY2ARrCFROXlFw4J1PamQI5P0o3h8YkjiK:1rk1FY:0BWxXgqBOUEsuA767FLZMGRt6fYMx8wbVlZTrfyEfgU','2024-03-26 12:28:56.734189'),('e0epk7vwn0ywqziyjoaq8a525vy8lqw3','e30:1riBq6:hbgPDMR-KxsAXQa8oyhkhsc04J3lrwnhvBtQoS7Siuw','2024-03-21 11:23:06.150188'),('eo58l5f5o6gg7ikd4mcnzn41oiapi1qo','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkPhx:tToMSbRknkRF2ZlqTtseNgSfJJ2L9cKnXlgcPFa_pEs','2024-03-27 14:35:53.679419'),('ete6kczgxqmubrs0amn7k3mznuy0ze5a','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkkBg:zAWbBAaob6LE3r94S9PLyYhhHp-Am2rhbZmjxLTA67I','2024-03-28 12:27:56.422006'),('exaxfz17qzqz7hfqxp9owpexygxpgbuh','eyJuZXdfdXNlcl9lbWFpbCI6InVzZXIxMUBnbWFpbC5jb20ifQ:1rkgtz:KCw-SrfvADuiY9f-Lzdh7pOZw78krFu4TVr9ZFI_OHc','2024-03-28 08:57:27.254497'),('eyx8qorpz9oykf8mtppy6ma4pkfc0hvt','.eJxVjDsOwyAQBe9CHaHlj1Om9xnQsuDgJALJ2FWUu0dILpL2zcx7s4DHXsLR8xbWxK5MOXb5HSPSM9dB0gPrvXFqdd_WyIfCT9r53FJ-3U7376BgL6Mm8HZabCKZjZ5AC0VWR79kJU2URJDRSUheWOdE0mAUIYASnsBpjOzzBQMtN5A:1ri9wq:_Y1IyAN9hnqoAxlMrZoGpBlBWN73QYkjBhlLXsEDFqE','2024-03-21 09:21:56.774888'),('f6crozhvwa8r2et7n5881p77bjrwtym3','.eJxVjEEOgjAQRe_StWmgLTOtS_ecoZl2poIaSCisjHcXEha6fe_9_1aRtnWIW5Uljqyuyhl1-YWJ8lOmw_CDpvus8zyty5j0kejTVt3PLK_b2f4dDFSHfQ0GTRHIjgICOE42eyviITB62xTkguBbu7OOXEmApivUQhMSN-iD-nwBAyY30g:1rjnxe:2rBQnqPUZuRvSGoJYOWO9-VDgs2LQd2gVqBWRLsWnZo','2024-03-25 22:17:34.010118'),('f9mnbwz47he4lz6k1w5r8g3a9ut5qdsl','.eJxVjDsOwjAQBe_iGln-ZP2hpOcM1nq9wQHkSHFSIe4OkVJA-2bmvUTCba1p67ykqYizMCBOv2NGenDbSblju82S5rYuU5a7Ig_a5XUu_Lwc7t9BxV6_dR6iVYTkbFAwOM_OG6dRQR4duFF5iKEgG2WQ2MQAVMgzKNTaRmu9eH8A7SU3Rg:1rhtkj:bm-PdHbS0PZrpPUEqUeZ6-9n2cBeVWnY2dygcmmfPgQ','2024-03-20 16:04:21.992653'),('fg3x2q004q8v7bkoqpdb92bfng83k0ep','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rncRn:xtyLmeX4aK4mbDHjk-WSQC9oaqyDqFgb5aKSbyBg4kE','2024-04-05 10:48:27.581349'),('fjgu1qnf6gddlo7tsgxr9iq8u2b742vl','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rlT8f:B7F8iI5Zrg2ws4vljhmboG-AEjYk_WdoQGQJPblcPwI','2024-03-30 12:27:49.799626'),('glhk5uymqby29rls5ucebtck3b6g62e9','.eJxVjEEOwiAQRe_C2pBpCxRcuu8ZyAwMUjU0Ke3KeHdp0oVu_3vvv4XHfct-r7z6OYqrUKO4_I6E4cnlIPGB5b7IsJRtnUkeijxpldMS-XU73b-DjDW3mh0Y5UyCAcgMZENnkhoTDcyWEzJoN_auMReANVmjNUMzsItg-w7F5wsFkjfl:1rk1XB:vWr2FGVTnYo3ufTDbgEZlSiFsJmxxm98-yATZ1zMfUo','2024-03-26 12:47:09.984772'),('gu5s1ocx56l9qfqdwuvurf9gjcpytplw','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rk1if:mdP3a-Y_eLupEG9579_9cEK-WVYl6QcmDWAVjHYV9mc','2024-03-26 12:59:01.571137'),('hbk4j1w7mg1gu25o30nyrwqkabkjehvy','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnIWC:IjxpVLpMnumd8zG5yGcEnEJ31Tx2USaCcZFQW7oa2Bw','2024-04-04 13:31:40.807869'),('hhe5li0l4hs83dd6g6m1wl4pe2nuks9d','.eJxVjDkOwjAUBe_iGllxvr8XSvqcIXpeggPIlrJUiLujSCmgfTPz3mLEvpVxX_MyzklchfLi8jsGxGeuB0kP1HuTsdVtmYM8FHnSVQ4t5dftdP8OCtZy1AxQR6yJpzxRH0AuklPWGaM13GQtsvVQhtkET3DcJWQKrHpyAeLzBfv0N6o:1rhpIv:TzCkFgiO9ggm8LSEvVXMRGH01wIdklnHXIercmBAU7c','2024-03-20 11:19:21.690113'),('hoybnqib90n7loiiwum7uv8l8u4ssg2o','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rncQ5:MoKjknQLezQ7zUq4PKlE1ASNOW3fw0_hfFafKhiSVbM','2024-04-05 10:46:41.828107'),('jgqebsyc47efq4wrec5cuy9yhjrgtg1x','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmd5y:TuZGYEiPd9R0hyfpGlyfXj-JIVfqkp7MMHro0NtpaPI','2024-04-02 17:17:50.660104'),('jpsllcpdv9n3en6qu0j330vvdq477qkk','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnHVB:EJwSmqJ9iDqMStR4wz3QPuS5ZVAGkSwCAaUgqVMEMoM','2024-04-04 12:26:33.712968'),('lj2v2qnnjsj5jnd4mig1vgy7srxca9ho','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rmcEr:bBSYVx3eLmpHXMA3lfr721i_UjmeJ-Fhj99ksy4xAz8','2024-04-02 16:22:57.748582'),('mutthylozpfbenndkh3gdlbd2rgykrhh','.eJxVjDkOwjAQAP_iGlnre01JnzdYGx84gBwpTirE35GlFNDOjObNAh17DUfPW1gSuzKN7PILZ4rP3IZJD2r3lce17dsy85Hw03Y-rSm_bmf7N6jU6_hCljrZ6IRw0SAW69DoJEGAVk4WLCCVtEV5EpEyAUTjixfeW6XRCPb5AtmrNpQ:1rkpNT:YKIj8tIijgruNJuA_OyqC7cvAEwnwe2h2vegLM4WULY','2024-03-28 18:00:27.249152'),('n8ccdxpgtxapzq6dip615rgvt5ia47lv','.eJxVjrsOwjAMRf8lM6ryctowIXZG5spJ3AfQVOpDDIh_J4FKqIvl63Ns-cUiPet1pulbIg7EjuyaWmCHP6MB-0cCOcCpzanw45CUGtel-0l9SIbW-6FDf6eYSbhhbMe0Fpepd0VWio3OxWUM9Dhv7u5Ah3OXtqXnAqFxYAxXSkjpvCVOwbjgQ1VCY0FwCaqyUqMibYTlHCqvGleWKn31_gDY2U1f:1rjySO:Vx8389kWkI_j0ohCtAtQXwHZ0Yb9CT_cFscGrtj6E5k','2024-03-26 09:30:00.070481'),('ngxdcg1t5ybu7f5o2mj22fgo2ul8k6lv','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rkmfU:uCYlP0HbFBK584MdQlG0IFWnmx_q-8KUFXMKR3ndUjM','2024-03-28 15:06:52.806596'),('nv1uy330rufxix4d172x0iyvfzbldhco','e30:1riBo0:G__zrwE63SRZYZCNRBuzTGemHVVDR3TwVbXk15GKJg0','2024-03-21 11:20:56.501664'),('nwkbxdmzbwdkhjazdxtqqlht1lgox23b','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rsm2g:u6Iy4zWJMBU8bHW8wNCCUTue4ujewI38On0X8GmRFi4','2024-04-19 16:03:50.278879'),('obxtw35m0wtbb64hm803o8ixqd6cz7tu','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rojsE:CpCQzqYPXQlXwCdE-JnxMz7VC8OiPQKciWSp1mbtM0Q','2024-04-08 12:56:22.077921'),('oupf0te0m2c7m6iugta6fien6h7hd89b','.eJxVjMEOwiAQRP-FsyEsRQGP3vsNZMvuStXQpLQn47_bJj3oaZJ5b-atEq5LSWvjOY2krsqBOv2WA-Yn153QA-t90nmqyzwOelf0QZvuJ-LX7XD_Dgq2sq0DQ4wmowfxFh1GJOgsbJGFzhY9eZPFMXDwXqQTNFEuYqIFoRCy-nwBHDk41A:1riy0q:Qx3WDu2fBgAVCTMItk3NtyhM4ajXSXbDvXsakFF8ZCo','2024-03-23 14:49:24.313275'),('pd9djdn1q70u95jq42nzu4jn9g0o5ths','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rncLn:1uxcrSGRAlv8ZiypudG82AmOJmxwKHUdNFAVyCciQ64','2024-04-05 10:42:15.105445'),('pi67uyoc2lyoxhhm7c3kjl7i1dz35lj0','.eJxVjMEOgyAQRP-Fc0MgBtntqem932AWWNRWMRFND03_vZB68Tgz781HJH53e-a145nGSVxFDXjra5J-mcVFdLRvwx8aQyGMOpeO_ItTXcKTUr8ULW3r6GRF5LFm-VgCT_eDPR0MlIdiW4zOc0RyAZwlCq4FDdpyg0DEROAteI1amcgAKpJqo0EdjGmwiOL7A4qERa8:1rkgjx:_hKA_pQUG9BkVNNupeLNwvKFTWsFK_c_v09K5PiB7Js','2024-03-28 08:47:05.851035'),('r4fbgoxiko1uj88z0nyhsa7iksmoq42t','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rnGv5:8Nj3ze849otwPsSff8VWK9RGRPVPJxxh8ZO2NJ6WdL4','2024-04-04 11:49:15.542075'),('rgg6b4d9d6ar41yh5u49mc3q1otafkid','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1roeIa:hrsV_6XtjhbwRdQfYbDHzA9ML1Vix4ul3pl2C3jHSF0','2024-04-08 06:59:12.176148'),('rw2qnjcjdc8vd4uj6k4ztvt0s2uelanj','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmvyO:9_55vFWoX-Q9IX92eU8k0yhjr3Drh-SEULmVB3rFCBY','2024-04-03 13:27:16.903383'),('rws92rse39gmfeooggesz76j21xi0dap','.eJxVjDsOwjAQRO_iGlmO119K-pzB8npXOIAcKU4qxN1JpBRQTDPvzbxFytta09Z5SROJq7BBXH5LzOXJ7SD0yO0-yzK3dZlQHoo8aZfjTPy6ne7fQc297us4OG_0nhAVasIMfnDsQJFDHTxHpzOgYiSwAQsEIgPBGMPOgvVRfL7g1DcB:1rnFDx:fYDdRFe38dZAYj34U2BKpO1NwprwsA6EMkiE7ykTcOo','2024-04-04 10:00:37.585135'),('shx3mgxek4boi9syej1ehxwdz50y7une','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rmcAa:JeTnkGL5VcrzZuERh0HvAVVHvDsSpw7OSNTtaTOEzOQ','2024-04-02 16:18:32.636299'),('ss8w1qbqhzlocz4rlyq33493iumixmys','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rnGPl:SMpi5GXvxlSXfW70LZEHRiUDeFgaExFZZ6rUscyEYlk','2024-04-04 11:16:53.760180'),('tdaryz2z4adttu6ci1e81x2yqwjmwwk1','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmtAA:EucO8ZeYNd6m0ORxo8_IDi3tao3t5kUcj_qHizFzvHQ','2024-04-03 10:27:14.311818'),('tiicqcueuj5s8uenqhpwp9v5j7kcubeo','.eJxVjEEOwiAQRe_C2hBIQ5lx6d4zkBkYpGogKe2q8e62SRe6_e-9v6lA61LC2mUOU1JX5Yy6_I5M8SX1IOlJ9dF0bHWZJ9aHok_a9b0led9O9--gUC977TFzlIzECdgTJR7BgvUyIBAJEUQP0aI1LguAyWTG7NAm5wbcQ_X5AkT1OUM:1rpjRf:Q9vIuAaA7Ke4ITSto000KsyXBFUJD4gVivgPYB6LIYA','2024-04-11 06:41:03.956092'),('u24u8dg6hzz1uaiaxt53k19qx99fqmzn','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1roeAq:T_rbeaP0kasRp4g7ap0lBemOkFmcPKduB5diultW8Ok','2024-04-08 06:51:12.235524'),('u53x5k5cbdawbmmx52l7lyitea7foz18','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkkCK:t4Mx4u9YGSkhzAXuV5PyX_dnLtYBGiGT_31G2U2ff7Y','2024-03-28 12:28:36.735032'),('vu999l54gmbg4qrnmp709fyjrv58icou','.eJxVjMsOwiAQRf-FtSGA5eXSvd9AhoGRqoGktCvjv0uTLnR7zrn3zQJsawlbz0uYE7uwybPTL4yAz1x3kx5Q741jq-syR74n_LCd31rKr-vR_h0U6GWsR4kKtEBhHYizE9IA4GSUF4QDEHjvYyaHREknJCsJIIO0kzZSIft8ATCfOUU:1rnGnf:-2jjAjWSbMexDE50iNGNyWj19b8FZ_9EtCTs2qHVZkg','2024-04-04 11:41:35.777287'),('w60w2zxltmj6o587zl5k9khr1pa50g8l','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rmwgW:KpZ_GGR5swsf7C3NvzlmznfS_g4lYDF67fNRKmnB1Lg','2024-04-03 14:12:52.194587'),('w8ezxqil1ltfkc60a60ntxypb6bcof4a','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rkjSG:nikmcZXXwlZn3iIjsKqCtLCrkh7Sb1yXozYyY-Bpm6I','2024-03-28 11:41:00.662784'),('wdfr6ytmcja37w9017ayp7x31wz119d9','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rncFD:RwvDb3ARwBhCKo1PQ9nU7iJEHGJobzvz4yNkibT6LMU','2024-04-05 10:35:27.501487'),('wwq8b2662hfkmqn3ktpfb1intxo1lojd','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnH07:SYbqqBYgQNnvEbs38AEw1xkrkkkrAEmrpapa1YoL3oo','2024-04-04 11:54:27.268569'),('xgo5at0hbwg1vzz63khyqhzw3cfwmasv','.eJyrVspLLY8vLU4tAhN5ibmpSlZKoUCmhZIOQi41NzEzBygB4lg4pIN4esn5uUq1APzfFyQ:1ri9eo:6NZfiLdwQPbBixYnFIiCCy2r1-xPciGKtjyEyo4CfxQ','2024-03-21 09:03:18.546361'),('xpf49ljr9dadcoxr3wgrfjfukhgs7dfv','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rk1nU:_APtDiz9EK9iOcOL19imGn8r8wg8Xx5cV7_dN4ZFfzc','2024-03-26 13:04:00.564442'),('xw1flecfqthotxy4z79aq06o549ltxxc','e30:1ri9Qq:-KHbGV9EAhH-6U0d4WjgOt2HRofks9tBMey_zEeZEkk','2024-03-21 08:48:52.803458'),('zb5zvfe63jx3feowvpxhy80wldh6lq36','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnIR2:78ULb_2KEer4-_c099cKkKE5dktnGrG09dAOJdjw89M','2024-04-04 13:26:20.541339'),('zevhdy5imebyk6qvmuth3s00nqfbuf2g','.eJxVjEEOwiAQRe_C2hBKAcGle89AZoZBqgaS0q6Md7dNutDtf-_9t4iwLiWunec4JXERbhSn3xGBnlx3kh5Q701Sq8s8odwVedAuby3x63q4fwcFetlqfw4-5UE7RUh21JjJs_WOlAEIgRV7VjAYtCoYi6DtpuvMmH0iUqP4fAEViTjM:1rplkZ:fLP5gelKf2hwyt6Q2_KborNxukOL3QOzqvN07D6hBMQ','2024-04-11 09:08:43.963128'),('zfyuzpq6ouy8rosigtcgd0saw36qyf26','.eJxVjMEOwiAQRP-FsyEsRQGP3vsNZMvuStXQpLQn47_bJj3oaZJ5b-atEq5LSWvjOY2krsqBOv2WA-Yn153QA-t90nmqyzwOelf0QZvuJ-LX7XD_Dgq2sq0DQ4wmowfxFh1GJOgsbJGFzhY9eZPFMXDwXqQTNFEuYqIFoRCy-nwBHDk41A:1rjfqT:7zt6prRNgYYckEDcRuTNxSTARhlEt9ZSryrxMIze5Mc','2024-03-25 13:37:37.750978'),('zqwrdtpny7gcrs1gyo8adw8kd29ct9iz','.eJxVjssOwiAURP-FtSHA5enSfb-B8LhI1UBS2pXx322TLnQ758xk3sSHba1-G7j4OZMrkZJcfsMY0hPbQfIjtHunqbd1mSM9FHrSQaee8XU73b-BGkbd2yIxHlSJSmsGwIWIySHDrGNO2RpVnOJMKLBOyAAoNXeMKZugRGNgf_X5AvRVNw4:1rnbOn:aq5aSRb2N3RYV6S94eSAfEHxKR_BjrE_WUf98vrAN_w','2024-04-05 09:41:17.511993');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_environmentaldata`
--

DROP TABLE IF EXISTS `pages_environmentaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_environmentaldata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_type` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_environmentaldata`
--

LOCK TABLES `pages_environmentaldata` WRITE;
/*!40000 ALTER TABLE `pages_environmentaldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_environmentaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_geolocation`
--

DROP TABLE IF EXISTS `pages_geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_geolocation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_geolocation`
--

LOCK TABLES `pages_geolocation` WRITE;
/*!40000 ALTER TABLE `pages_geolocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_geolocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_recommendations`
--

DROP TABLE IF EXISTS `pages_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_recommendations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recommendation_text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `data_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_recommendation_data_id_61624a93_fk_pages_env` (`data_id`),
  CONSTRAINT `pages_recommendation_data_id_61624a93_fk_pages_env` FOREIGN KEY (`data_id`) REFERENCES `pages_environmentaldata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_recommendations`
--

LOCK TABLES `pages_recommendations` WRITE;
/*!40000 ALTER TABLE `pages_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_recommendations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-06 15:08:48
