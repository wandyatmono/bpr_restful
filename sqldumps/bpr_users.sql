CREATE DATABASE  IF NOT EXISTS `bpr_users` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bpr_users`;
-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: bpr_users
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user_avatars`
--

DROP TABLE IF EXISTS `user_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actived` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `user_avatars_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatars`
--

LOCK TABLES `user_avatars` WRITE;
/*!40000 ALTER TABLE `user_avatars` DISABLE KEYS */;
INSERT INTO `user_avatars` VALUES (1,1,'joko_wandyatmono.jpg',0),(2,2,'lani_husadawati.jpg',0),(3,3,'wongso_hermanto.jpg',0),(4,4,'yusnita_sri_sundari.jpg',0),(5,5,'andi_pratiknyo.jpg',0),(6,6,'atika_shubert.jpg',0),(7,7,'perkuat_akseina.jpg',0),(8,8,'pracoyo_sejati_leno.jpg',0),(9,9,'puji_kaesthi.jpg',0),(10,10,'putri_rimba_manangsang.jpg',0),(11,11,'sopan_sumangkir.jpg',0),(12,12,'urip_wanodyo_sejati.jpg',0),(13,13,'freddy_paloh.jpg',0);
/*!40000 ALTER TABLE `user_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_gender`
--

DROP TABLE IF EXISTS `user_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_gender` (
  `id` tinyint(4) NOT NULL,
  `native` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_gender`
--

LOCK TABLES `user_gender` WRITE;
/*!40000 ALTER TABLE `user_gender` DISABLE KEYS */;
INSERT INTO `user_gender` VALUES (0,'female','laki-laki'),(1,'male','perempuan');
/*!40000 ALTER TABLE `user_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_logs_1_idx` (`user`),
  CONSTRAINT `fk_user_logs_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logs`
--

LOCK TABLES `user_logs` WRITE;
/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
INSERT INTO `user_logs` VALUES (0,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',6,0,'2019-01-22 03:23:54',0),(1,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',7,0,'2019-03-10 19:49:22',0),(2,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',5,1,'2019-03-09 23:10:19',0),(3,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',3,0,'2019-02-10 04:40:04',0),(4,'abd16e0c-7a9b-4cba-bdc7-230535b983cd',2,0,'2019-03-09 23:10:19',0),(5,'201746b2-9088-4d7a-bbc7-5915d52874e0',3,0,'2019-03-09 23:10:19',0),(6,'da3e812b-b5f8-4e9f-a629-30e0907a4e5b',1,0,'2019-02-10 04:40:04',0),(7,'da3e812b-b5f8-4e9f-a629-30e0907a4e5b',4,0,'2019-03-10 19:49:22',0),(8,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',8,0,'2019-03-10 19:49:22',0),(9,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',9,0,'2019-03-10 19:49:22',0),(10,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',10,0,'2019-03-10 19:49:22',0),(11,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',11,0,'2019-03-10 19:49:22',0),(12,'f7b7bafd-ecb0-4a31-96b9-e7a610675624',12,0,'2019-03-10 19:49:22',0);
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_religions`
--

DROP TABLE IF EXISTS `user_religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_religions` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `native` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_religions`
--

LOCK TABLES `user_religions` WRITE;
/*!40000 ALTER TABLE `user_religions` DISABLE KEYS */;
INSERT INTO `user_religions` VALUES (1,'Islam','Islam'),(2,'Roman Catholic','Katolik'),(3,'Christianity','Kristen'),(4,'Hinduism','Hindu'),(5,'Budism','Budha'),(6,'Believism','Kepercayaan');
/*!40000 ALTER TABLE `user_religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `native` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'Developer','Pengembang'),(2,'Application Administrator','Administrator Aplikasi'),(3,'Head of Investment Division','Kabag Investasi'),(4,'Head of Receivables Division','Kabag Piutang'),(5,'Section Chief of Marketing','Kasie Pemasaran'),(6,'Section Chief of Receivables','Kasie Piutang'),(7,'Marketing Officer','Petugas Pemasaran'),(8,'Receivable Collector','Kolektor Piutang');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `ric` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `birth_place` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `faith` tinyint(4) DEFAULT NULL,
  `notifications` int(11) DEFAULT NULL,
  `chats` int(11) DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_1` (`role`),
  KEY `fk_users_2_idx` (`faith`),
  KEY `fk_users_3_idx` (`gender`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_2` FOREIGN KEY (`faith`) REFERENCES `user_religions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_3` FOREIGN KEY (`gender`) REFERENCES `user_gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (
  1,
  'Joko Wandyatmono',
  'bf59af91aeb8306261c665d5c9b50941f5242c94245ce7d3bc92bebae7e3d5b1',
  'bf59af91aeb8306261c665d5c9b50941f5242c94245ce7d3bc92bebae7e3d5b1',
  1,
  '1234567890123456',
  'Solo',
  '1961-06-23',
  1,
  1,
  4,
  10,
  -7.881796,
  110.375526,0
),
(2,'Lani Husadawati','41d2b587f0f0497acd9f17293d22f45f54bc5f0726a3f3d4edf426fe384c11dd','41d2b587f0f0497acd9f17293d22f45f54bc5f0726a3f3d4edf426fe384c11dd',4,'1234567890123456','Solo','1986-08-17',0,2,5,101,-7.870682,110.373856,0),
(3,'Wongso Hermanto','c85ad879e6f75b0b4b51de83450e5530bfd3fab85cc67418d2251f134f0ef92c','c85ad879e6f75b0b4b51de83450e5530bfd3fab85cc67418d2251f134f0ef92c',2,'1234567890123456','Solo','1970-10-15',1,3,0,0,-7.880606,110.373474,0),
(4,'Yusnita Sri Sundari','e28bc14ef7ee01d17147dd302d552645fa7f4df30b05349c8b4099494475cd10','e28bc14ef7ee01d17147dd302d552645fa7f4df30b05349c8b4099494475cd10',3,'1234567890123456','Sukoharjo','1990-04-28',0,1,23,298,-7.865708,110.367065,0),
(5,'Andi Pratiknyo','180348f5b22db17be014d5c1cb8151c858267cb44819e5460a7ae2528b91680e','180348f5b22db17be014d5c1cb8151c858267cb44819e5460a7ae2528b91680e',5,'1234567890123456','Tangerang','1970-07-25',1,2,4,19,-7.864751,110.367386,0),
(6,'Atika Shubert','7d8aa9ea7dfe7be0112d05cc946364aa9334f45ba30fbbe9e376a4bdb85a1964','7d8aa9ea7dfe7be0112d05cc946364aa9334f45ba30fbbe9e376a4bdb85a1964',6,'1234567890123456','Klaten','1981-02-13',1,2,20,11,-7.877505,110.348289,0),
(7,'Perkuat Akseina','c5957d4541f993f63104a756d2a8aa3fa360582b9e4379f38a4297fe815a9c69','c5957d4541f993f63104a756d2a8aa3fa360582b9e4379f38a4297fe815a9c69',5,'1234567890123456','Malang','1981-07-17',0,2,0,187,-7.862339,110.234993,0),
(8,'Pracoyo Sejati Leno','043a43fa0703d0af5d80d84db2bd455c4eb9836e0ad34cc70ea3f451f04d6b16','043a43fa0703d0af5d80d84db2bd455c4eb9836e0ad34cc70ea3f451f04d6b16',7,'1234567890123456','Solo','1980-06-12',0,2,5,0,-7.851403,110.231018,0),
(9,'Puji Kaesthi','8c87f6ec99f742cf462a8c121dbdae4a48fb666cbb002094f6572cd6c1adb951','8c87f6ec99f742cf462a8c121dbdae4a48fb666cbb002094f6572cd6c1adb951',8,'1234567890123456','Solo','1986-01-27',1,2,78,1091,-7.858981,110.231537,0),
(10,'Putri Rimba Manangsang','997af0fb6c844069db0e17d37b90e4e44314c5a84c2187f35ca4e45f82e66d59','997af0fb6c844069db0e17d37b90e4e44314c5a84c2187f35ca4e45f82e66d59',8,'1234567890123456','Mataram','1987-09-10',1,2,40,1,-7.856037,110.227074,0),
(11,'Sopan Sumangkir','b2865123894a3ed061c3546de26914a00a1595a88254a993e98a47d67e41879e','b2865123894a3ed061c3546de26914a00a1595a88254a993e98a47d67e41879e',7,'1234567890123456','Sibolga','1979-08-17',0,2,1,25,-7.858386,110.217934,0),
(12,'Urip Wanodyo Sejati','c7691d57aae84ccae80f8209a90e9f97170ade0d93559399105eb0db9b21a906','c7691d57aae84ccae80f8209a90e9f97170ade0d93559399105eb0db9b21a906',8,'1234567890123456','Yogya','1987-03-02',1,2,6,90,-7.863232,110.210869,0),
(13,'Fredddy Paloh','51eeed7251f3f56288ee554afaa1028b7fbc3daacc4a952be4ae8d18ddaf3320','51eeed7251f3f56288ee554afaa1028b7fbc3daacc4a952be4ae8d18ddaf3320',7,'1234567890123456','Bogor','1970-10-16',1,2,0,0,-7.866251,110.259621,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-14 13:30:28
