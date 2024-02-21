-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelmiranda_django
-- ------------------------------------------------------
-- Server version	8.0.35

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add booking',8,'add_booking'),(30,'Can change booking',8,'change_booking'),(31,'Can delete booking',8,'delete_booking'),(32,'Can view booking',8,'view_booking'),(33,'Can add room',9,'add_room'),(34,'Can change room',9,'change_room'),(35,'Can delete room',9,'delete_room'),(36,'Can view room',9,'view_room'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$O6SzNyBxBxdqJjleHQ4OOC$pirSHP8MmgjIugyEG5bjYhJ76kLYma+hyLiakdRREyA=','2024-02-14 17:54:45.836584',1,'jon','','','jon@gmail.com',1,1,'2024-02-05 16:11:42.969431'),(2,'pbkdf2_sha256$720000$UQSyHIfGB9bP5JR8xHL715$EVjzJaVH8XCxy7sBKa1uTo/8wfVKN7QVXGa6ILOP/HI=','2024-02-21 12:50:27.532978',0,'jauregi','','','',0,1,'2024-02-14 17:59:25.488147'),(3,'pbkdf2_sha256$720000$Rn1P5FQeSlxAhf7HwYsNAx$La63T5SFpM/U6uFnbHkXgL1LnSPIR80kU+HzGBA/UF8=','2024-02-18 15:34:26.465668',0,'fadfs','Jon','Barandiaran','jjauregibar13@gmail.com',0,1,'2024-02-15 17:18:10.740116');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-14 17:59:25.847805','2','jauregi',1,'[{\"added\": {}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'hotelMiranda','booking'),(7,'hotelMiranda','contact'),(10,'hotelMiranda','order'),(9,'hotelMiranda','room'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-05 16:09:51.636364'),(2,'auth','0001_initial','2024-02-05 16:09:52.356956'),(3,'admin','0001_initial','2024-02-05 16:09:52.509583'),(4,'admin','0002_logentry_remove_auto_add','2024-02-05 16:09:52.514965'),(5,'admin','0003_logentry_add_action_flag_choices','2024-02-05 16:09:52.521335'),(6,'contenttypes','0002_remove_content_type_name','2024-02-05 16:09:52.592338'),(7,'auth','0002_alter_permission_name_max_length','2024-02-05 16:09:52.653707'),(8,'auth','0003_alter_user_email_max_length','2024-02-05 16:09:52.696831'),(9,'auth','0004_alter_user_username_opts','2024-02-05 16:09:52.704461'),(10,'auth','0005_alter_user_last_login_null','2024-02-05 16:09:52.765629'),(11,'auth','0006_require_contenttypes_0002','2024-02-05 16:09:52.768144'),(12,'auth','0007_alter_validators_add_error_messages','2024-02-05 16:09:52.774157'),(13,'auth','0008_alter_user_username_max_length','2024-02-05 16:09:52.849541'),(14,'auth','0009_alter_user_last_name_max_length','2024-02-05 16:09:52.944666'),(15,'auth','0010_alter_group_name_max_length','2024-02-05 16:09:52.962708'),(16,'auth','0011_update_proxy_permissions','2024-02-05 16:09:52.970511'),(17,'auth','0012_alter_user_first_name_max_length','2024-02-05 16:09:53.075083'),(18,'sessions','0001_initial','2024-02-05 16:09:53.120379'),(19,'hotelMiranda','0001_initial','2024-02-06 13:40:51.188834'),(20,'hotelMiranda','0002_rename_room_id_booking_room','2024-02-06 13:43:45.560642'),(21,'hotelMiranda','0003_alter_contact_comment','2024-02-06 14:23:46.528034'),(22,'hotelMiranda','0004_alter_contact_customer_image_alter_contact_date_and_more','2024-02-10 12:14:58.980290'),(23,'hotelMiranda','0005_booking_email_booking_phone_alter_booking_room_and_more','2024-02-12 11:48:22.766152'),(24,'hotelMiranda','0006_alter_contact_subject','2024-02-12 13:17:51.597908'),(25,'hotelMiranda','0007_alter_booking_email_alter_contact_email','2024-02-12 13:21:32.146018'),(26,'hotelMiranda','0008_alter_booking_guest_image_alter_booking_order_date_and_more','2024-02-13 22:38:20.107458'),(27,'hotelMiranda','0009_alter_booking_status_alter_room_room_type_order','2024-02-16 00:16:32.198151'),(28,'hotelMiranda','0010_rename_room_id_order_room_rename_user_id_order_user','2024-02-16 00:18:20.975800'),(29,'hotelMiranda','0011_alter_order_room_alter_order_user','2024-02-17 15:59:56.561409');
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
INSERT INTO `django_session` VALUES ('w2ajp9jyqb0xqnybvrub8zcut1rzy0v8','.eJxVjMsOwiAQRf-FtSE8Ogy4dO83EGBAqgaS0q6M_65NutDtPefcF_NhW6vfRl78TOzMFDv9bjGkR247oHtot85Tb-syR74r_KCDXzvl5-Vw_w5qGPVbZ41aZBFJSluM0do5pCyCDgiRwEABjehspChKAkeTtJYQklMTKIHs_QHTazcr:1rcm3P:2jzu8URoUCL0O6e5xTyFcq4k85XeokLOjdnifOj_Cp8','2024-03-06 12:50:27.538023');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelmiranda_booking`
--

DROP TABLE IF EXISTS `hotelmiranda_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelmiranda_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(5) NOT NULL,
  `guest` varchar(30) NOT NULL,
  `guest_image` varchar(255) DEFAULT NULL,
  `order_date` datetime(6) NOT NULL,
  `check_in` datetime(6) NOT NULL,
  `check_out` datetime(6) NOT NULL,
  `special_request` varchar(255) NOT NULL,
  `status` varchar(11) NOT NULL,
  `room_id` bigint NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  KEY `hotelMiranda_booking_room_id_36622492_fk_hotelMiranda_room_id` (`room_id`),
  CONSTRAINT `hotelMiranda_booking_room_id_36622492_fk_hotelMiranda_room_id` FOREIGN KEY (`room_id`) REFERENCES `hotelmiranda_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelmiranda_booking`
--

LOCK TABLES `hotelmiranda_booking` WRITE;
/*!40000 ALTER TABLE `hotelmiranda_booking` DISABLE KEYS */;
INSERT INTO `hotelmiranda_booking` VALUES (91,'41257','Paula Marks','https://avatars.githubusercontent.com/u/99854489','2024-02-09 13:21:11.267000','2023-06-14 21:05:10.383000','2023-06-16 09:33:13.447000','Vomito crastinus circumvenio absque comes.','Check In',116,'Vaughn.Fisher24@yahoo.com','879 709 134'),(92,'26630','Shane Quitzon','https://avatars.githubusercontent.com/u/47592248','2023-05-12 02:24:49.523000','2022-10-05 17:18:34.149000','2022-10-09 00:19:59.872000','Facere iure tergeo uredo.','Check In',123,'Deontae_Hartmann@gmail.com','786 945 053'),(93,'16415','Violet Dooley Sr.','https://avatars.githubusercontent.com/u/83380266','2023-12-15 13:31:16.293000','2023-04-09 03:29:44.151000','2023-04-10 23:18:31.143000','Assumenda aegre quis denuo cohaero viscus caute spero delectus.','Check In',108,'Vivian_Davis@yahoo.com','602 150 562'),(94,'01273','Milton Donnelly','https://avatars.githubusercontent.com/u/68247663','2023-07-15 07:37:32.571000','2022-12-04 12:23:44.977000','2022-12-08 09:56:34.934000','Coniuratio voveo tum aer conforto.','Check Out',121,'Lavon.Bashirian36@hotmail.com','767 046 744'),(95,'06059','Micheal Hickle','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1245.jpg','2024-01-10 18:56:00.366000','2023-06-16 07:34:11.098000','2023-06-18 18:14:14.220000','Voluptates ventus tactus turba coepi aperio abeo.','Check Out',133,'Torrance81@yahoo.com','616 608 999'),(96,'13374','Elsa Pacocha','https://avatars.githubusercontent.com/u/9810154','2024-01-02 11:07:24.329000','2023-11-22 16:55:42.850000','2023-11-25 01:51:44.447000','Uredo vis capto uredo sulum consectetur.','Check In',115,'Ismael97@hotmail.com','773 861 313'),(97,'85210','Shelly Zemlak','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/181.jpg','2023-09-23 12:48:55.230000','2023-04-03 11:19:16.083000','2023-04-04 01:49:12.257000','Coepi termes comprehendo ad cupressus.','In Progress',116,'Joseph_Rohan54@gmail.com','894 846 920'),(98,'28645','Ollie Legros MD','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/415.jpg','2024-01-02 03:58:24.454000','2023-12-22 23:32:44.934000','2023-12-26 09:25:08.317000','Comes ulciscor quam testimonium suadeo vorax adflicto caveo carmen.','Check Out',115,'Tom37@yahoo.com','986 579 571'),(99,'83203','Monique Mills','https://avatars.githubusercontent.com/u/7456955','2023-11-05 19:22:31.024000','2023-06-03 11:24:09.576000','2023-06-05 23:01:55.482000','Saepe contego adhuc defaeco.','In Progress',114,'Marquis0@gmail.com','748 068 732'),(100,'77503','Holly Nienow','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','2024-01-13 01:43:40.266000','2023-08-28 09:31:04.319000','2023-08-29 09:23:45.946000','Turbo statim aperiam calamitas ubi asporto catena commemoro.','In Progress',124,'Jackeline.Hand@hotmail.com','960 765 162'),(101,'','Jon Jauregi Barandiaran',NULL,'2024-02-13 23:02:16.801851','2024-02-13 00:00:00.000000','2024-02-15 00:00:00.000000','','',104,'jjauregibar13@gmail.com','634 689 114'),(103,'92666','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:07:03.024993','2024-02-14 00:00:00.000000','2024-02-15 00:00:00.000000','fasdfa','',104,'jjauregibar13@gmail.com','634 689 114'),(104,'40722','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:13:11.656536','2024-02-14 00:00:00.000000','2024-02-15 00:00:00.000000','fasdfa','',104,'jjauregibar13@gmail.com','634 689 114'),(105,'87299','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:15:23.047507','2024-02-14 00:00:00.000000','2024-02-15 00:00:00.000000','fasdfa','',104,'jjauregibar13@gmail.com','634 689 114'),(106,'96299','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:15:49.504105','2024-02-14 00:00:00.000000','2024-02-16 00:00:00.000000','fasfdf','',104,'jjauregibar13@gmail.com','634 689 114'),(107,'84181','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:15:53.380700','2024-02-14 00:00:00.000000','2024-02-16 00:00:00.000000','fasfdf','',104,'jjauregibar13@gmail.com','634 689 114'),(108,'30125','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:21:02.500279','2024-02-14 00:00:00.000000','2024-02-16 00:00:00.000000','fasfdf','',104,'jjauregibar13@gmail.com','634 689 114'),(109,'19481','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:21:18.219533','2024-02-14 00:00:00.000000','2024-02-15 00:00:00.000000','dsda','',104,'jjauregibar13@gmail.com','634 689 114'),(110,'43966','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:26:11.030560','2024-02-14 00:00:00.000000','2024-02-15 00:00:00.000000','dsda','',104,'jjauregibar13@gmail.com','634 689 114'),(111,'66091','Jon Jauregi Barandiaran',NULL,'2024-02-14 00:26:40.323967','2024-02-14 00:00:00.000000','2024-02-17 00:00:00.000000','ffadfadfsgf','',104,'jjauregibar13@gmail.com','634 689 114'),(112,'84674','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:22:10.355681','2024-02-17 00:00:00.000000','2024-02-19 00:00:00.000000','','',107,'jjauregibar13@gmail.com','967 345 091'),(113,'50139','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:36:24.835662','2024-02-17 00:00:00.000000','2024-02-19 00:00:00.000000','gfgadsagd','',107,'jon@gmail.com','678 342 897'),(114,'59155','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:38:17.994513','2024-02-17 00:00:00.000000','2024-02-19 00:00:00.000000','','',107,'jon@gmail.com','634 689 114'),(115,'13781','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:39:12.787770','2024-02-17 00:00:00.000000','2024-02-19 00:00:00.000000','','',107,'jon@gmail.com','634 689 114'),(116,'55457','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:40:37.157291','2024-02-18 00:00:00.000000','2024-02-21 00:00:00.000000','','',112,'jauregi@gmail.com','643 409 129'),(117,'20392','Jon Jauregi Barandiaran',NULL,'2024-02-17 16:42:19.854495','2024-02-17 00:00:00.000000','2024-02-20 00:00:00.000000','','',112,'jjauregibar13@gmail.com','634 689 114');
/*!40000 ALTER TABLE `hotelmiranda_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelmiranda_contact`
--

DROP TABLE IF EXISTS `hotelmiranda_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelmiranda_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review_id` varchar(5) NOT NULL,
  `date` datetime(6) NOT NULL,
  `customer` varchar(30) NOT NULL,
  `customer_image` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelmiranda_contact`
--

LOCK TABLES `hotelmiranda_contact` WRITE;
/*!40000 ALTER TABLE `hotelmiranda_contact` DISABLE KEYS */;
INSERT INTO `hotelmiranda_contact` VALUES (86,'27353','2023-10-24 03:40:29.522000','Dora Hintz','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/146.jpg','Laron.Nikolaus@yahoo.com','708 942 150','Baiulus asporto adfero.','Inflammatio abstergo tener aestivus speciosus thermae quaerat comis. Una iure carpo cohors excepturi triduana absque tamdiu stultus. Vomito vito adhuc vorax taedium ait. Valde cum ullus vindico sapiente deprimo. Volutabrum comitatus summa cras confugo ducimus vomito cervus decretum nobis.',0),(87,'56022','2023-08-07 02:50:53.955000','Claude Herman','https://avatars.githubusercontent.com/u/9916013','Al_Weissnat53@hotmail.com','694 590 382','Turbo canis astrum.','Dignissimos ipsum studio adaugeo laboriosam casus amitto vitium. Quas conduco appono truculenter. Verecundia bibo aliqua. Demergo officia necessitatibus crapula. Subnecto denique alius contabesco soleo vel alias vir.',0),(88,'33305','2023-08-13 22:39:24.829000','Raymond O\'Hara Jr.','https://avatars.githubusercontent.com/u/61613425','Norene.Marks12@hotmail.com','857 414 591','Velociter coma ultra.','Dapifer vacuus aranea suus amplexus. Derelinquo spero auxilium certe hic blanditiis demitto atque. Conitor talis claro aureus. Deleo verus comis angustus inflammatio. Unus depromo cena angulus vereor.',1),(89,'76712','2023-03-29 22:09:53.129000','Malcolm Leannon-Hagenes','https://avatars.githubusercontent.com/u/52469406','Mercedes.Lakin1@hotmail.com','664 183 759','Surgo dedecor tres vicinus.','Natus beatus tumultus abbas bos cattus. Abeo verbera uredo amplitudo iure. Appono adsidue anser complectus canis. Sophismata asperiores paens virgo viscus tum clam vel vetus vero. Perspiciatis vacuus amplus curto molestiae adamo nam.',1),(90,'88619','2023-10-25 04:18:48.342000','Daisy Franecki','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/60.jpg','Kevin_Schmitt35@hotmail.com','790 729 808','Corporis solus virgo.','Corrupti demonstro quia vobis voluptates virtus aveho. Sophismata thesis unde atque cras adeptio. Velit compello taceo vulnero asperiores accendo carmen aestivus. Tergeo capillus varietas acceptus pauci. Coerceo pauci viduo custodia carbo ipsum via.',0),(91,'54199','2023-03-19 19:51:00.813000','Jorge Hoppe','https://avatars.githubusercontent.com/u/32031740','Duane.Balistreri48@yahoo.com','849 273 700','Cogo absens correptius.','Spectaculum quia stipes suscipit theatrum abutor. Totus apparatus acceptus attollo conqueror ipsum triduana nihil adduco addo. Solum copia delego alii sunt allatus cursus vis conservo. Bis clamo administratio illo. Cervus alo voluptas virga clarus facere contigo spero adfectus vomito.',1),(92,'14327','2023-04-14 20:49:25.071000','Tara Grimes','https://avatars.githubusercontent.com/u/26249997','Marshall75@gmail.com','675 868 171','Sumptus cohaero bonus.','Cohaero summopere quasi provident commodi cupiditate trucido compono capillus. Atrox cultura arx tricesimus absorbeo sollicito contra cohibeo territo. Subseco infit angelus auctus vita turpis certus autus tres. Vinitor conatus vivo volva calcar. Nesciunt absens aveho.',0),(93,'64951','2023-03-19 06:01:34.333000','Victoria Boehm','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/281.jpg','Kiera_Leannon@yahoo.com','772 382 713','Sui credo creber quia.','Strues currus cultellus vulgaris debeo quisquam apto adaugeo decimus. Bos vere crebro vaco cresco causa a. Absum celebrer voco. Summa altus utrum contego amitto una thorax angulus. Arbor utilis soluta territo synagoga aequus ante.',1),(94,'46670','2023-10-31 06:24:58.225000','Ora Veum','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/294.jpg','Lavern82@yahoo.com','992 705 269','Balbus viriliter adaugeo.','Certe apto voluptatibus xiphias clibanus audio. Similique utique tertius complectus dolores. Delego capto coniuratio denique credo cattus tempora. Aliquam vilis tamisium vinitor modi peior tandem. Exercitationem arx bibo harum aggero fugit tui adficio congregatio.',1),(95,'49184','2023-12-23 14:25:49.244000','Kelli Botsford','https://avatars.githubusercontent.com/u/868076','Kelley.Satterfield@hotmail.com','672 634 034','Cras illum cuppedia.','Arca comparo adamo. Repudiandae corpus quia aperte derelinquo arcus sumo victus corrumpo. Totidem surgo voluptate cogito usus tremo. Absens solitudo copia admitto caecus iusto calamitas turba. Coerceo coepi viscus volva commemoro aliqua venia quis.',1),(96,'39723','2023-11-20 01:22:22.201000','Joanne Miller-Reilly','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/789.jpg','Jedidiah_Emmerich49@gmail.com','759 752 041','Adimpleo nihil aurum spiculum.','Praesentium vilitas vulpes ait sperno barba. Coniecto eum curis accedo talus audeo vesco tollo tempore. Vester crastinus adipisci utilis tricesimus vindico repellendus valetudo. Verto cinis tam tres iusto rem utor admoneo aggredior adipisci. Thesaurus usitas atqui cimentarius uter.',1),(97,'38364','2023-10-08 04:05:34.477000','Willie Rice','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1059.jpg','Jamel64@gmail.com','866 633 342','Fugiat validus amor nulla.','Summopere claro absque averto tredecim voco curo. Vilis certe adicio nulla victus condico sto. Qui conscendo claustrum. Claustrum credo sono circumvenio odio civis vivo. Caelestis reprehenderit tabgo.',1),(98,'07954','2023-02-25 16:39:46.732000','Irene Koss','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1227.jpg','Barbara.Harris52@yahoo.com','608 052 300','Derideo ambulo cibo.','Vergo consectetur argentum carcer. Curatio amicitia crustulum tonsor suasoria quas. Bonus ipsum amitto umerus copiose nisi conor. Natus thermae maxime vulnero ventus caritas villa tempus culpo basium. Defleo repudiandae tepidus ars.',0),(99,'36418','2023-03-15 15:17:16.409000','Katrina Tillman','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/98.jpg','Noah43@yahoo.com','694 739 350','Dolore spero exercitationem beatus amita.','Calculus corporis explicabo cognatus. Articulus fuga via confido sapiente vorax suffoco. Calamitas sulum expedita via degenero. Arbitro adfectus adsidue. Vehemens omnis derideo cena decens censura ex victus virtus ver.',1),(100,'97208','2023-05-03 09:55:07.187000','Ernesto Dickinson','https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1149.jpg','Concepcion36@gmail.com','806 242 168','Agnosco vivo caelestis depraedor facilis.','Conqueror delinquo aegrus accusamus tero amitto temeritas surgo verus paens. Adulescens et adiuvo cognomen corrumpo eos constans. Vallum ustilo dapifer ustilo. Ullus terebro aliquam delicate. Argumentum sufficio defungo tepidus textilis cumque corrigo nesciunt.',0);
/*!40000 ALTER TABLE `hotelmiranda_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelmiranda_order`
--

DROP TABLE IF EXISTS `hotelmiranda_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelmiranda_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_type` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `room_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotelMiranda_order_room_id_75a2f677_fk_hotelMiranda_room_id` (`room_id`),
  KEY `hotelMiranda_order_user_id_684b1ce1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `hotelMiranda_order_room_id_75a2f677_fk_hotelMiranda_room_id` FOREIGN KEY (`room_id`) REFERENCES `hotelmiranda_room` (`id`),
  CONSTRAINT `hotelMiranda_order_user_id_684b1ce1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelmiranda_order`
--

LOCK TABLES `hotelmiranda_order` WRITE;
/*!40000 ALTER TABLE `hotelmiranda_order` DISABLE KEYS */;
INSERT INTO `hotelmiranda_order` VALUES (1,'Food','Pasta','2024-02-16 17:34:20.130110','2024-02-21 12:50:49.897673',104,2),(2,'Food','Menu of restaurant','2024-02-16 17:48:51.287268','2024-02-19 16:09:31.969890',105,3),(6,'Other','Clean','2024-02-18 15:56:35.917388','2024-02-18 15:56:35.918386',104,3),(7,'Food','Chuletón','2024-02-18 15:56:48.490335','2024-02-19 16:18:00.223954',107,3),(8,'Food','Italian food','2024-02-18 16:02:12.957327','2024-02-19 16:07:25.207934',104,3);
/*!40000 ALTER TABLE `hotelmiranda_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelmiranda_room`
--

DROP TABLE IF EXISTS `hotelmiranda_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelmiranda_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` varchar(5) NOT NULL,
  `room_type` varchar(15) NOT NULL,
  `room_number` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `amenities` json NOT NULL,
  `cancellation` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `offer` int NOT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelmiranda_room`
--

LOCK TABLES `hotelmiranda_room` WRITE;
/*!40000 ALTER TABLE `hotelmiranda_room` DISABLE KEYS */;
INSERT INTO `hotelmiranda_room` VALUES (104,'99404','Double Superior',471,'Catena contego aestas thorax absum verecundia tum blandior texo facere. Ustilo tenuis anser vitae. Ipsam verecundia veritas voluptates taedium toties veritas.','[{\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}]','Adipisci et allatus valens tutis. Vociferor depraedor tabesco ulciscor antepono celebrer curis sol tendo. Aro atrocitas debeo artificiose causa.',860,30,0),(105,'72764','Double Superior',451,'Eaque contabesco credo qui statim video cotidie agnitio ultra numquam. Cubicularis infit bestia sursum paens inflammatio vilis venia creator. Patria vilitas adsum contra pecto deduco.','[{\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}]','Aestas ascisco peior solutio nobis adfectus utroque vae temporibus. Tener possimus statim statim comis demens ciminatio atavus. Argumentum sint ater molestias damnatio.',483,71,1),(106,'14786','Suite',160,'Tergeo tergum traho tutis defleo dolorum ulterius compono aduro. Rerum damnatio cado adaugeo fugit sint eligendi tutis thorax. Stella vulgivagus utique ante calamitas.','[{\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}]','Causa aqua modi. Umbra ambulo accusamus vos deduco. Xiphias adulatio sto.',370,75,1),(107,'58468','Suite',466,'Demulceo dedecor desidero convoco adduco vestrum coadunatio campana. Assumenda aeger umbra coniuratio trepide cupio ambitus labore sapiente subseco. Laborum turpis apparatus clibanus capio soleo sopor nisi agnitio cinis.','[{\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}]','Alter audeo ventito. Tribuo capitulus vulgivagus cultura suscipit facere error ex usitas defluo. Conscendo ut catena animus vel aegrus thymum tabernus.',937,83,1),(108,'43722','Single Bed',561,'Demens nobis audeo assentator debilito ara spiritus libero aliquam. Adduco ventosus tergeo. Denuo suscipit deleniti calco clamo centum aiunt necessitatibus vix decimus.','[{\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}]','Aspernatur vigilo cresco supra spiculum aer termes tristis amet vae. Neque collum cerno aequitas volaticus crur apud viridis tamquam. Repellat aeternus deserunt venustas dapifer verbum appono maiores.',267,73,0),(109,'61382','Double Superior',302,'Turbo teres textilis. Adulatio succurro atrocitas nemo creber uterque thesis fuga. Consequuntur curis constans praesentium deporto.','[{\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}]','Cicuta cupiditas decipio ventito atavus aiunt. Tristis thesis tolero. Cur adsum recusandae assumenda vita cariosus.',758,46,1),(110,'67757','Double Superior',418,'Volo tristis crudelis terror tonsor. Tredecim molestiae terminatio tenus concedo. Maiores quae stips.','[{\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}]','Supellex dolores supplanto crastinus accedo complectus. Depulso sortitus caelum adduco. Tam thymbra eum tutamen spero vorax considero.',596,44,1),(111,'98587','Single Bed',125,'Tibi summisse vigor cursus. Tolero textus auxilium cubicularis similique thorax similique adiuvo theatrum. Delibero eaque velociter.','[{\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}]','Victus torqueo strenuus vix taceo versus. Comburo tenax comprehendo vallum velum quisquam sit cubo spoliatio. Odio celo tristis audacia eum adflicto minus labore similique causa.',736,63,0),(112,'42324','Double Superior',206,'Via beneficium uredo utrum conventus vado doloremque. Combibo caritas vinco barba atqui ait sortitus summisse. Comedo avarus avarus depraedor animus speculum deduco.','[{\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}]','Sustineo acies assumenda audeo vado copiose. Atque colligo officiis curiositas facere doloremque tunc voluntarius videlicet. Cresco caecus quam testimonium cupiditas urbanus studio accedo aestus.',286,40,0),(113,'78463','Single Bed',533,'Attonbitus vae aliquid conservo tibi complectus censura. Tolero deinde votum. Summisse animus pecco clamo.','[{\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}]','Veritas absconditus caveo. Degero abutor trepide vigilo vero usus. Carbo adsidue dens cunctatio eveniet cupiditate audio curriculum vereor suadeo.',394,55,0),(114,'33834','Double Bed',122,'Alioqui communis subseco ex tergum tendo atrocitas acceptus. Repellat illum defleo asporto adhaero absque adaugeo acsi. Clam attonbitus adversus aspicio vix auxilium terreo somnus conservo.','[{\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}]','Omnis pecus turbo conventus urbanus tepesco alo voveo. Nisi cuppedia subito defungo angulus velum vereor ars decretum armarium. Viriliter natus cunae currus cultellus vulnus armarium conventus.',840,92,1),(115,'48565','Single Bed',175,'Textor sumo cuppedia adipisci bardus. Tantum tersus voro volup synagoga usque viridis. Complectus cultura abduco pecco catena.','[{\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Tergiversatio arbor tubineus victoria. Amo depono cupiditate suspendo agnitio patior. Conturbo coaegresco colo bene admiratio.',249,35,1),(116,'86996','Double Bed',148,'Aduro damnatio terga villa aufero veritatis cruciamentum cogito. Solio cras thalassinus apparatus conor. Sonitus ambitus desino arcesso apparatus.','[{\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}]','Cicuta vulnero culpa adulatio vivo abundans tempus summa cervus. Sopor sursum spoliatio arbitro cunabula magnam avaritia. Facere utrum qui statim valde.',98,66,1),(117,'09526','Double Superior',206,'Appono earum cresco tam. Perferendis demonstro valde spero adstringo error turba curtus distinctio. Cresco umerus aqua tumultus decretum mollitia calcar.','[{\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Animus commodi vulticulus degenero animadverto conduco conforto. Crudelis utrum approbo volaticus denuncio spero cenaculum ter cognatus ait. Voco suffoco aro comminor comprehendo avaritia amo.',858,69,1),(118,'78201','Single Bed',202,'Bibo vicissitudo succedo. Vacuus accusator unus teneo reiciendis adsidue sub vitae uterque aliquam. Exercitationem calco timidus cresco argumentum tergiversatio calculus cena.','[{\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}]','Modi coadunatio apparatus peccatus. Cervus socius defluo. Currus iusto suspendo tam calculus caelestis.',564,8,0),(119,'92010','Suite',457,'Solium autus coruscus uxor laudantium aggredior stillicidium assentator charisma testimonium. Dignissimos demitto undique. Ciminatio curatio magni.','[{\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}]','Pariatur ab pecus adulescens reprehenderit capto. Adfectus comparo sulum synagoga universe amplexus tui patruus usitas velum. Arcesso suadeo adipisci.',444,37,1),(120,'38877','Suite',324,'Sed benevolentia desolo cibo tubineus provident comptus. Pauper angustus admoneo avaritia solium fugit adsidue. Cibus cruciamentum deputo.','[{\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}]','Speciosus dapifer termes quibusdam verto peccatus denuncio consequuntur verus apto. Appono accusantium supra sumo supra vestrum vindico arto degero corpus. Talis creator placeat praesentium stultus advoco adipiscor cavus.',325,65,0),(121,'56300','Suite',241,'Ab conitor utrum testimonium volo. Tantillus acceptus sui. Beatus voluptas vallum.','[{\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Testimonium correptius commodi surculus labore tonsor curvo dignissimos alienus. Vomica certus villa tutis coniuratio demoror tredecim custodia adulatio. Adnuo culpa vulpes.',53,98,0),(122,'09228','Suite',496,'Capillus trado caveo. Possimus commemoro repellendus vae animi minus decretum maxime vergo tergiversatio. Quod debitis animi cuius talus subiungo.','[{\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Sustineo aveho conscendo uberrime adfectus. Cado vacuus paulatim creo aspicio appello ratione. Aequus commemoro certe temperantia peior vestrum taceo amaritudo.',186,25,0),(123,'08411','Double Bed',314,'Decens theatrum nulla collum tabesco tabella atrocitas. Demergo videlicet peccatus abscido coerceo venustas. Suus aspernatur angelus baiulus dolores audeo acer crepusculum termes.','[{\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}]','Atavus deorsum conscendo esse urbanus. Undique concido cohibeo desparatus triduana cubo solutio comminor dicta turbo. Cur avaritia audeo explicabo cibus ab ara.',467,16,0),(124,'83400','Double Superior',566,'Administratio accendo ars pariatur tricesimus modi utor timor aperte utrum. Clibanus celebrer colo perferendis sordeo textor similique depopulo similique. Vado desparatus aliquam tenetur.','[{\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Non calco avaritia arcus pectus careo confero pectus. Cogo sonitus video pauper condico iste. Terra attollo cicuta amaritudo vae adsuesco acceptus.',296,88,0),(125,'92326','Single Bed',209,'Vulgaris saepe abscido uberrime. Bellicus solium audeo. Conor tutis aranea cohibeo conscendo caveo vociferor.','[{\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}]','Super nisi thesis temporibus atrox caritas benigne ubi tantum veritatis. Vitae auditor sono solium quisquam vivo coruscus aiunt. Vorax spero apto altus animi arbitro vero atavus.',618,96,1),(126,'21489','Double Superior',208,'Consequuntur arto utrum adulatio talus crux territo. Viscus admiratio calamitas bellum. Cattus fuga nemo arbor pecco voluptatibus.','[{\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}]','Ara fugiat vehemens tripudio. Testimonium iure blandior. Culpo coerceo succedo ulciscor adhaero comptus ver tubineus calamitas atrocitas.',186,44,1),(127,'98645','Suite',101,'Amet tactus unde deleo. Capio culpa arto carcer coniuratio cubitum. Pecus censura peccatus aeneus utor adipiscor cupio natus terra tempora.','[{\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}]','Sapiente delinquo mollitia depraedor spiculum labore solio tametsi vir. Uterque uberrime repellendus. Communis coadunatio deputo clementia ultra bonus ultio decretum aurum.',144,11,0),(128,'73090','Single Bed',207,'Cervus nobis comprehendo. Viscus tamquam arbitro sunt ara. Votum caries cumque curia abduco currus.','[{\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"24/7 Online Support\", \"image_name\": \"online-support-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}]','Cognomen conservo baiulus est. Decretum adamo patria victoria. Rerum considero cavus consuasor cavus sustineo averto arguo.',287,93,1),(129,'91107','Single Bed',184,'Ustulo cognatus accendo cunctatio. Inventore aspicio canonicus natus vaco ex nostrum vinitor cribro tamen. Summopere sublime damnatio demergo dolorum stabilis cerno viscus fuga tres.','[{\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}]','Tondeo utpote perferendis. Texo triumphus sustineo ager id auditor benevolentia vos asperiores. Vobis carus accendo.',158,26,0),(130,'36256','Double Bed',254,'Ascit casus adsum tantum cunae nihil coma iusto. Demens minus facilis. Omnis decet fugiat demulceo uxor vel.','[{\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Smart Security\", \"image_name\": \"security-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"AC\", \"image_name\": \"air-conditioner-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}]','Summa subnecto ventus. Cupio delectatio absorbeo. Fugiat suus incidunt ars thalassinus.',827,66,1),(131,'00569','Suite',344,'Voro thorax delinquo. Sapiente quaerat pauper vallum. Benigne curtus benevolentia fugit.','[{\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}]','Adeo eaque thorax bardus. Utroque vinculum sto agnitio admoveo ab tredecim autem clarus. Coerceo conitor suggero inventore sapiente facere una defluo vestrum quaerat.',579,52,0),(132,'32037','Double Bed',590,'Ullam taceo conduco. Amplitudo baiulus tamen deputo campana adduco concedo. Conventus comis volva amita confero stipes.','[{\"value\": \"Single Bed\", \"image_name\": \"bed-icon\"}, {\"value\": \"Cleaning\", \"image_name\": \"cleaning-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}]','Vesco depraedor atrocitas quibusdam vitae antepono creator cattus traho. Patior auxilium debitis aeger defessus aggero. Nisi crudelis curriculum.',709,44,1),(133,'73506','Suite',581,'Tui dens ciminatio spero nisi venio. Amaritudo cunae carmen adstringo. Tutamen titulus canonicus trepide.','[{\"value\": \"Grocery\", \"image_name\": \"grocery-icon\"}, {\"value\": \"Kitchen\", \"image_name\": \"kitchen-icon\"}, {\"value\": \"Breakfast\", \"image_name\": \"breakfast-icon\"}, {\"value\": \"Expert Team\", \"image_name\": \"expert-team-icon\"}, {\"value\": \"Shop near\", \"image_name\": \"shop-icon\"}, {\"value\": \"Towels\", \"image_name\": \"towels-icon\"}, {\"value\": \"Strong Locker\", \"image_name\": \"strong-locker-icon\"}, {\"value\": \"High Speed WiFi\", \"image_name\": \"wifi-icon\"}]','Dolor spero congregatio summisse concido aperiam. Temptatio tui arbor decerno quia ustilo baiulus curriculum cultura. Delinquo villa nisi quam subito.',112,86,0);
/*!40000 ALTER TABLE `hotelmiranda_room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-21 19:28:53
