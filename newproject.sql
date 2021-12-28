-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: db_hopital
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `accouchement`
--

DROP TABLE IF EXISTS `accouchement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accouchement` (
  `id_accouchement` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_de_naissance` int NOT NULL,
  `mode_accouchement` varchar(120) NOT NULL,
  `id_enfant` int unsigned NOT NULL,
  PRIMARY KEY (`id_accouchement`),
  KEY `id_accouchement` (`id_accouchement`,`id_enfant`),
  KEY `tbl_enfant` (`id_enfant`),
  CONSTRAINT `tbl_enfant` FOREIGN KEY (`id_enfant`) REFERENCES `enfant` (`id_enfant`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accouchement`
--

LOCK TABLES `accouchement` WRITE;
/*!40000 ALTER TABLE `accouchement` DISABLE KEYS */;
/*!40000 ALTER TABLE `accouchement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acte_naissance`
--

DROP TABLE IF EXISTS `acte_naissance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acte_naissance` (
  `id_acte` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_acte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acte_naissance`
--

LOCK TABLES `acte_naissance` WRITE;
/*!40000 ALTER TABLE `acte_naissance` DISABLE KEYS */;
/*!40000 ALTER TABLE `acte_naissance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjoint`
--

DROP TABLE IF EXISTS `adjoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adjoint` (
  `id_adjoint` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_adjoint` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `password` int NOT NULL,
  `signature` int NOT NULL,
  `cachet` int NOT NULL,
  `tel` int NOT NULL,
  PRIMARY KEY (`id_adjoint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjoint`
--

LOCK TABLES `adjoint` WRITE;
/*!40000 ALTER TABLE `adjoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjoint` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add accouchement',7,'add_accouchement'),(26,'Can change accouchement',7,'change_accouchement'),(27,'Can delete accouchement',7,'delete_accouchement'),(28,'Can view accouchement',7,'view_accouchement'),(29,'Can add acte',8,'add_acte'),(30,'Can change acte',8,'change_acte'),(31,'Can delete acte',8,'delete_acte'),(32,'Can view acte',8,'view_acte'),(33,'Can add adjoint',9,'add_adjoint'),(34,'Can change adjoint',9,'change_adjoint'),(35,'Can delete adjoint',9,'delete_adjoint'),(36,'Can view adjoint',9,'view_adjoint'),(37,'Can add declaration',10,'add_declaration'),(38,'Can change declaration',10,'change_declaration'),(39,'Can delete declaration',10,'delete_declaration'),(40,'Can view declaration',10,'view_declaration'),(41,'Can add enfant',11,'add_enfant'),(42,'Can change enfant',11,'change_enfant'),(43,'Can delete enfant',11,'delete_enfant'),(44,'Can view enfant',11,'view_enfant'),(45,'Can add officier',12,'add_officier'),(46,'Can change officier',12,'change_officier'),(47,'Can delete officier',12,'delete_officier'),(48,'Can view officier',12,'view_officier'),(49,'Can add secretaire',13,'add_secretaire'),(50,'Can change secretaire',13,'change_secretaire'),(51,'Can delete secretaire',13,'delete_secretaire'),(52,'Can view secretaire',13,'view_secretaire'),(53,'Can add pere',14,'add_pere'),(54,'Can change pere',14,'change_pere'),(55,'Can delete pere',14,'delete_pere'),(56,'Can view pere',14,'view_pere'),(57,'Can add mere',15,'add_mere'),(58,'Can change mere',15,'change_mere'),(59,'Can delete mere',15,'delete_mere'),(60,'Can view mere',15,'view_mere'),(61,'Can add mairie',16,'add_mairie'),(62,'Can change mairie',16,'change_mairie'),(63,'Can delete mairie',16,'delete_mairie'),(64,'Can view mairie',16,'view_mairie'),(65,'Can add infirmier',17,'add_infirmier'),(66,'Can change infirmier',17,'change_infirmier'),(67,'Can delete infirmier',17,'delete_infirmier'),(68,'Can view infirmier',17,'view_infirmier'),(69,'Can add hopital',18,'add_hopital'),(70,'Can change hopital',18,'change_hopital'),(71,'Can delete hopital',18,'delete_hopital'),(72,'Can view hopital',18,'view_hopital');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$vTkgWLHPIJNzIzS4NwBFFV$CprE6WL7ur10rbqD9s28NyD+ayImFrGNZMuk6Smomgc=','2021-12-27 13:52:31.804024',1,'Fermaud','','','adoumadjifermaud@gmail.com',1,1,'2021-12-27 13:39:47.378162');
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
-- Table structure for table `declaration`
--

DROP TABLE IF EXISTS `declaration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `declaration` (
  `id_declaration` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_declaration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `declaration`
--

LOCK TABLES `declaration` WRITE;
/*!40000 ALTER TABLE `declaration` DISABLE KEYS */;
/*!40000 ALTER TABLE `declaration` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-12-27 15:56:08.931566','1','Acte object (1)',1,'[{\"added\": {}}]',8,1),(2,'2021-12-27 15:57:00.837415','1','Adjoint object (1)',1,'[{\"added\": {}}]',9,1),(3,'2021-12-27 15:57:25.887175','1','Declaration object (1)',1,'[{\"added\": {}}]',10,1),(4,'2021-12-27 15:58:59.320412','2','Acte object (2)',1,'[{\"added\": {}}]',8,1),(5,'2021-12-27 16:01:10.692003','3','Acte object (3)',1,'[{\"added\": {}}]',8,1),(6,'2021-12-27 16:02:01.918723','2','Acte object (2)',3,'',8,1),(7,'2021-12-27 16:03:01.828176','1','Officier object (1)',1,'[{\"added\": {}}]',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'hopital_app','accouchement'),(8,'hopital_app','acte'),(9,'hopital_app','adjoint'),(10,'hopital_app','declaration'),(11,'hopital_app','enfant'),(18,'hopital_app','hopital'),(17,'hopital_app','infirmier'),(16,'hopital_app','mairie'),(15,'hopital_app','mere'),(12,'hopital_app','officier'),(14,'hopital_app','pere'),(13,'hopital_app','secretaire'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-12-27 13:35:32.921354'),(2,'auth','0001_initial','2021-12-27 13:35:34.455777'),(3,'admin','0001_initial','2021-12-27 13:35:34.771726'),(4,'admin','0002_logentry_remove_auto_add','2021-12-27 13:35:34.794401'),(5,'admin','0003_logentry_add_action_flag_choices','2021-12-27 13:35:34.816211'),(6,'contenttypes','0002_remove_content_type_name','2021-12-27 13:35:35.034625'),(7,'auth','0002_alter_permission_name_max_length','2021-12-27 13:35:35.168836'),(8,'auth','0003_alter_user_email_max_length','2021-12-27 13:35:35.214897'),(9,'auth','0004_alter_user_username_opts','2021-12-27 13:35:35.231374'),(10,'auth','0005_alter_user_last_login_null','2021-12-27 13:35:35.365061'),(11,'auth','0006_require_contenttypes_0002','2021-12-27 13:35:35.377271'),(12,'auth','0007_alter_validators_add_error_messages','2021-12-27 13:35:35.399619'),(13,'auth','0008_alter_user_username_max_length','2021-12-27 13:35:35.530073'),(14,'auth','0009_alter_user_last_name_max_length','2021-12-27 13:35:35.675818'),(15,'auth','0010_alter_group_name_max_length','2021-12-27 13:35:35.712424'),(16,'auth','0011_update_proxy_permissions','2021-12-27 13:35:35.730939'),(17,'auth','0012_alter_user_first_name_max_length','2021-12-27 13:35:35.885621'),(18,'hopital_app','0001_initial','2021-12-27 13:35:37.900195'),(19,'sessions','0001_initial','2021-12-27 13:35:37.993597'),(20,'hopital_app','0002_alter_acte_numero_acte','2021-12-27 13:51:21.601504');
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
INSERT INTO `django_session` VALUES ('ew8frb9ylw0v4bcs8bg9zfcovgpfqith','.eJxVjDsOwjAQBe_iGln-xR9Kes5g7doLDiBbipMKcXccKQW0b2bem0XY1hK3TkucMzszyU6_G0J6Ut1BfkC9N55aXZcZ-a7wg3Z-bZlel8P9OyjQy6gtZYLgU5DWBnXL1oFzThH4SVEaZJICBAzBaBG8RjSovTfBYwYNyD5f5gM36w:1n1qQR:BOHw54X-DriFuo-wuAeVJ3J-EP2PUeaB8LWcg2zv2xQ','2022-01-10 13:52:31.818102'),('rmsynqhrtq6m5aczx3xfkeb6gcza1592','.eJxVjDsOwjAQBe_iGln-xR9Kes5g7doLDiBbipMKcXccKQW0b2bem0XY1hK3TkucMzszyU6_G0J6Ut1BfkC9N55aXZcZ-a7wg3Z-bZlel8P9OyjQy6gtZYLgU5DWBnXL1oFzThH4SVEaZJICBAzBaBG8RjSovTfBYwYNyD5f5gM36w:1n1qEh:-zfmowCR0BoYcTB-YLyYyftrhJwAGALMz_HOm1rzE6M','2022-01-10 13:40:23.213586');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfant`
--

DROP TABLE IF EXISTS `enfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfant` (
  `id_enfant` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_enfant` varchar(120) NOT NULL,
  `prenom_enfant` varchar(120) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `num_social` int NOT NULL,
  `num_declaration` int NOT NULL,
  `sexe` varchar(120) NOT NULL,
  `lieu_naissance` varchar(120) NOT NULL,
  `id_acte` int unsigned NOT NULL,
  PRIMARY KEY (`id_enfant`),
  KEY `id_enfant` (`id_enfant`,`id_acte`),
  KEY `tbl_acte_naissance` (`id_acte`),
  CONSTRAINT `tbl_acte_naissance` FOREIGN KEY (`id_acte`) REFERENCES `acte_naissance` (`id_acte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfant`
--

LOCK TABLES `enfant` WRITE;
/*!40000 ALTER TABLE `enfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital`
--

DROP TABLE IF EXISTS `hopital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital` (
  `id_hopital` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `id_declaration` int unsigned NOT NULL,
  `id_infirmier` int unsigned NOT NULL,
  PRIMARY KEY (`id_hopital`),
  KEY `id_hopital` (`id_hopital`,`id_infirmier`,`id_declaration`),
  KEY `tbl_declaration` (`id_declaration`),
  KEY `tbl_infirmier` (`id_infirmier`),
  CONSTRAINT `tbl_declaration` FOREIGN KEY (`id_declaration`) REFERENCES `declaration` (`id_declaration`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_infirmier` FOREIGN KEY (`id_infirmier`) REFERENCES `infirmier` (`id_infirmier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital`
--

LOCK TABLES `hopital` WRITE;
/*!40000 ALTER TABLE `hopital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_accouchement`
--

DROP TABLE IF EXISTS `hopital_app_accouchement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_accouchement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_naissance` int NOT NULL,
  `mode_accouchement` varchar(20) NOT NULL,
  `enfant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_accouche_enfant_id_bd23ea86_fk_hopital_a` (`enfant_id`),
  CONSTRAINT `hopital_app_accouche_enfant_id_bd23ea86_fk_hopital_a` FOREIGN KEY (`enfant_id`) REFERENCES `hopital_app_enfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_accouchement`
--

LOCK TABLES `hopital_app_accouchement` WRITE;
/*!40000 ALTER TABLE `hopital_app_accouchement` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_accouchement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_acte`
--

DROP TABLE IF EXISTS `hopital_app_acte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_acte` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_acte` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_acte`
--

LOCK TABLES `hopital_app_acte` WRITE;
/*!40000 ALTER TABLE `hopital_app_acte` DISABLE KEYS */;
INSERT INTO `hopital_app_acte` VALUES (1,1),(3,2);
/*!40000 ALTER TABLE `hopital_app_acte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_adjoint`
--

DROP TABLE IF EXISTS `hopital_app_adjoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_adjoint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(12) NOT NULL,
  `signature` varchar(50) NOT NULL,
  `cachet` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_adjoint`
--

LOCK TABLES `hopital_app_adjoint` WRITE;
/*!40000 ALTER TABLE `hopital_app_adjoint` DISABLE KEYS */;
INSERT INTO `hopital_app_adjoint` VALUES (1,'Mr Kev','kev','aaa','jsjssjs','shshs','87798879Y6');
/*!40000 ALTER TABLE `hopital_app_adjoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_declaration`
--

DROP TABLE IF EXISTS `hopital_app_declaration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_declaration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `declaration` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_declaration`
--

LOCK TABLES `hopital_app_declaration` WRITE;
/*!40000 ALTER TABLE `hopital_app_declaration` DISABLE KEYS */;
INSERT INTO `hopital_app_declaration` VALUES (1,'declaration de naissance d\'un enfant x');
/*!40000 ALTER TABLE `hopital_app_declaration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_enfant`
--

DROP TABLE IF EXISTS `hopital_app_enfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_enfant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `prenom` varchar(120) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu_de_naissance` varchar(120) NOT NULL,
  `num_social` int NOT NULL,
  `num_declaration` int NOT NULL,
  `sexe` varchar(120) NOT NULL,
  `acte_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_enfant_acte_id_53be8483_fk_hopital_app_acte_id` (`acte_id`),
  CONSTRAINT `hopital_app_enfant_acte_id_53be8483_fk_hopital_app_acte_id` FOREIGN KEY (`acte_id`) REFERENCES `hopital_app_acte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_enfant`
--

LOCK TABLES `hopital_app_enfant` WRITE;
/*!40000 ALTER TABLE `hopital_app_enfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_enfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_hopital`
--

DROP TABLE IF EXISTS `hopital_app_hopital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_hopital` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_hopital` varchar(120) NOT NULL,
  `adress_hopital` varchar(120) NOT NULL,
  `ville` varchar(120) NOT NULL,
  `declarattion_id` bigint NOT NULL,
  `infirmier_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_hopital_declarattion_id_8bd7137d_fk_hopital_a` (`declarattion_id`),
  KEY `hopital_app_hopital_infirmier_id_31645485_fk_hopital_a` (`infirmier_id`),
  CONSTRAINT `hopital_app_hopital_declarattion_id_8bd7137d_fk_hopital_a` FOREIGN KEY (`declarattion_id`) REFERENCES `hopital_app_declaration` (`id`),
  CONSTRAINT `hopital_app_hopital_infirmier_id_31645485_fk_hopital_a` FOREIGN KEY (`infirmier_id`) REFERENCES `hopital_app_infirmier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_hopital`
--

LOCK TABLES `hopital_app_hopital` WRITE;
/*!40000 ALTER TABLE `hopital_app_hopital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_hopital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_infirmier`
--

DROP TABLE IF EXISTS `hopital_app_infirmier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_infirmier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `accouchement_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_infirmie_accouchement_id_6472f541_fk_hopital_a` (`accouchement_id`),
  CONSTRAINT `hopital_app_infirmie_accouchement_id_6472f541_fk_hopital_a` FOREIGN KEY (`accouchement_id`) REFERENCES `hopital_app_accouchement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_infirmier`
--

LOCK TABLES `hopital_app_infirmier` WRITE;
/*!40000 ALTER TABLE `hopital_app_infirmier` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_infirmier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_mairie`
--

DROP TABLE IF EXISTS `hopital_app_mairie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_mairie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `logo` varchar(120) NOT NULL,
  `adjoint_id` bigint NOT NULL,
  `declaration_id` bigint NOT NULL,
  `officier_id` bigint NOT NULL,
  `secretaire_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_mairie_adjoint_id_bc2a735c_fk_hopital_app_adjoint_id` (`adjoint_id`),
  KEY `hopital_app_mairie_declaration_id_53ab079f_fk_hopital_a` (`declaration_id`),
  KEY `hopital_app_mairie_officier_id_6321a157_fk_hopital_a` (`officier_id`),
  KEY `hopital_app_mairie_secretaire_id_fe187ee6_fk_hopital_a` (`secretaire_id`),
  CONSTRAINT `hopital_app_mairie_adjoint_id_bc2a735c_fk_hopital_app_adjoint_id` FOREIGN KEY (`adjoint_id`) REFERENCES `hopital_app_adjoint` (`id`),
  CONSTRAINT `hopital_app_mairie_declaration_id_53ab079f_fk_hopital_a` FOREIGN KEY (`declaration_id`) REFERENCES `hopital_app_declaration` (`id`),
  CONSTRAINT `hopital_app_mairie_officier_id_6321a157_fk_hopital_a` FOREIGN KEY (`officier_id`) REFERENCES `hopital_app_officier` (`id`),
  CONSTRAINT `hopital_app_mairie_secretaire_id_fe187ee6_fk_hopital_a` FOREIGN KEY (`secretaire_id`) REFERENCES `hopital_app_secretaire` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_mairie`
--

LOCK TABLES `hopital_app_mairie` WRITE;
/*!40000 ALTER TABLE `hopital_app_mairie` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_mairie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_mere`
--

DROP TABLE IF EXISTS `hopital_app_mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_mere` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_mere` varchar(12) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `fonction` varchar(120) NOT NULL,
  `accouchement_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_mere_accouchement_id_42328c1a_fk_hopital_a` (`accouchement_id`),
  CONSTRAINT `hopital_app_mere_accouchement_id_42328c1a_fk_hopital_a` FOREIGN KEY (`accouchement_id`) REFERENCES `hopital_app_accouchement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_mere`
--

LOCK TABLES `hopital_app_mere` WRITE;
/*!40000 ALTER TABLE `hopital_app_mere` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_officier`
--

DROP TABLE IF EXISTS `hopital_app_officier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_officier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `cachet` varchar(120) NOT NULL,
  `signature` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_officier`
--

LOCK TABLES `hopital_app_officier` WRITE;
/*!40000 ALTER TABLE `hopital_app_officier` DISABLE KEYS */;
INSERT INTO `hopital_app_officier` VALUES (1,'Cendy','666666','666666','GGVTGUCFYK','GVTYICFDIFYC');
/*!40000 ALTER TABLE `hopital_app_officier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_pere`
--

DROP TABLE IF EXISTS `hopital_app_pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_pere` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_pere` varchar(120) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu_de_naissance` varchar(120) NOT NULL,
  `fonction` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `enfant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hopital_app_pere_enfant_id_9b1f001e_fk_hopital_app_enfant_id` (`enfant_id`),
  CONSTRAINT `hopital_app_pere_enfant_id_9b1f001e_fk_hopital_app_enfant_id` FOREIGN KEY (`enfant_id`) REFERENCES `hopital_app_enfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_pere`
--

LOCK TABLES `hopital_app_pere` WRITE;
/*!40000 ALTER TABLE `hopital_app_pere` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopital_app_secretaire`
--

DROP TABLE IF EXISTS `hopital_app_secretaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopital_app_secretaire` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `tel` varchar(112) NOT NULL,
  `password` varchar(102) NOT NULL,
  `login` varchar(130) NOT NULL,
  `cachet` varchar(120) NOT NULL,
  `signature` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopital_app_secretaire`
--

LOCK TABLES `hopital_app_secretaire` WRITE;
/*!40000 ALTER TABLE `hopital_app_secretaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `hopital_app_secretaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infirmier`
--

DROP TABLE IF EXISTS `infirmier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infirmier` (
  `id_infirmier` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_infirmier` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `login` varchar(150) NOT NULL,
  `id_accouchement` int unsigned NOT NULL,
  PRIMARY KEY (`id_infirmier`),
  KEY `id_infirmier` (`id_infirmier`,`id_accouchement`),
  KEY `tbl_accouchement` (`id_accouchement`),
  CONSTRAINT `tbl_accouchement` FOREIGN KEY (`id_accouchement`) REFERENCES `accouchement` (`id_accouchement`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infirmier`
--

LOCK TABLES `infirmier` WRITE;
/*!40000 ALTER TABLE `infirmier` DISABLE KEYS */;
/*!40000 ALTER TABLE `infirmier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maire`
--

DROP TABLE IF EXISTS `maire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maire` (
  `id_maire` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_maire` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `logo` varchar(120) NOT NULL,
  `id_declaration` int unsigned NOT NULL,
  `id_adjoint` int unsigned NOT NULL,
  `id_officier` int unsigned NOT NULL,
  `id_secretaire` int unsigned NOT NULL,
  PRIMARY KEY (`id_maire`),
  KEY `id_maire` (`id_maire`,`id_adjoint`,`id_officier`,`id_secretaire`),
  KEY `tbl_adjoint` (`id_adjoint`),
  KEY `tbl_officier` (`id_officier`),
  KEY `tbl_declaration` (`id_declaration`),
  KEY `tbl_secretaire` (`id_secretaire`),
  CONSTRAINT `tbl_adjoint` FOREIGN KEY (`id_adjoint`) REFERENCES `adjoint` (`id_adjoint`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_officier` FOREIGN KEY (`id_officier`) REFERENCES `officier` (`id_officier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_secretaire` FOREIGN KEY (`id_secretaire`) REFERENCES `secretaire` (`id_secretaire`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maire`
--

LOCK TABLES `maire` WRITE;
/*!40000 ALTER TABLE `maire` DISABLE KEYS */;
/*!40000 ALTER TABLE `maire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mere`
--

DROP TABLE IF EXISTS `mere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mere` (
  `id_mere` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_mere` varchar(120) NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(120) NOT NULL,
  `profession` varchar(120) NOT NULL,
  `losecretairegin` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `id_accouchement` int unsigned NOT NULL,
  PRIMARY KEY (`id_mere`),
  KEY `id_mere` (`id_mere`,`id_accouchement`),
  KEY `tbl_accouchement` (`id_accouchement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mere`
--

LOCK TABLES `mere` WRITE;
/*!40000 ALTER TABLE `mere` DISABLE KEYS */;
/*!40000 ALTER TABLE `mere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officier`
--

DROP TABLE IF EXISTS `officier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officier` (
  `id_officier` int unsigned NOT NULL AUTO_INCREMENT,
  `cahet` varchar(120) NOT NULL,
  `signature` varchar(120) NOT NULL,
  `nom` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `id_acte` int unsigned NOT NULL,
  PRIMARY KEY (`id_officier`),
  KEY `id_officier` (`id_officier`,`id_acte`),
  KEY `tbl_acte_naissance` (`id_acte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officier`
--

LOCK TABLES `officier` WRITE;
/*!40000 ALTER TABLE `officier` DISABLE KEYS */;
/*!40000 ALTER TABLE `officier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pere`
--

DROP TABLE IF EXISTS `pere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pere` (
  `id_pere` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_pere` varchar(120) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu_naissance` varchar(120) NOT NULL,
  `profession` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `id_enfant` int unsigned NOT NULL,
  PRIMARY KEY (`id_pere`),
  KEY `id_pere` (`id_pere`,`id_enfant`),
  KEY `tbl_enfant` (`id_enfant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pere`
--

LOCK TABLES `pere` WRITE;
/*!40000 ALTER TABLE `pere` DISABLE KEYS */;
/*!40000 ALTER TABLE `pere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretaire`
--

DROP TABLE IF EXISTS `secretaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secretaire` (
  `id_secretaire` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_secretaire` varchar(120) NOT NULL,
  `tel` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `cahet` varchar(120) NOT NULL,
  `signature` int NOT NULL,
  PRIMARY KEY (`id_secretaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaire`
--

LOCK TABLES `secretaire` WRITE;
/*!40000 ALTER TABLE `secretaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `secretaire` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 11:13:23
