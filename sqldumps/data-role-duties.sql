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
-- Table structure for table `role_duty_list`
--

DROP TABLE IF EXISTS `role_duty_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_duty_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `native` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class` (`class`),
  CONSTRAINT `role_duty_list_ibfk_1` FOREIGN KEY (`class`) REFERENCES `role_duty_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_duty_list`
--

LOCK TABLES `role_duty_list` WRITE;
/*!40000 ALTER TABLE `role_duty_list` DISABLE KEYS */;
INSERT INTO `role_duty_list` VALUES (1,'Role Structure','Struktur Peran',1,'role-structure.png'),(2,'Authorities','Autoritas',1,'authorities.png'),(3,'Registration','Registrasi',1,'registration.png'),(4,'Delegation','Delegasi',1,'delegation.png'),(5,'Marketing Report','Laporan Pemasaran',2,'marketing-report.png'),(6,'Receivables Report','Laporan Piutang',2,'receivable-report.png'),(7,'Taskforce Mobility Report','Laporan Mobilitas Gugus Tugas',2,'taskforce-mobility-report.png'),(8,'Personal Mobility Report','Laporan Mobilitas Pribadi',2,'personal-mobility-report'),(9,'Personal Achievement Report','Laporan Pencapaian Pribadi',2,'personal-achiement-report.png'),(10,'Profile','Profil',3,'profile.png'),(11,'Command Chains','Rantai Komando',3,'command-chains.png'),(12,'Intercom','Interkom',3,'intercom.png');
/*!40000 ALTER TABLE `role_duty_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_duties`
--

DROP TABLE IF EXISTS `role_duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_duties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `rights` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  KEY `item` (`item`),
  CONSTRAINT `role_duties_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`),
  CONSTRAINT `role_duties_ibfk_2` FOREIGN KEY (`item`) REFERENCES `role_duty_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_duties`
--

LOCK TABLES `role_duties` WRITE;
/*!40000 ALTER TABLE `role_duties` DISABLE KEYS */;
INSERT INTO `role_duties` VALUES (1,1,1,'rw'),(2,1,2,'rw'),(3,1,3,'rw'),(4,1,4,'rw'),(5,1,5,'rw'),(6,1,6,'rw'),(7,1,7,'rw'),(8,1,8,'rw'),(9,1,9,'rw'),(10,1,10,'rw'),(11,1,11,'rw'),(12,1,12,'rw'),(13,2,1,'rw'),(14,2,2,'rw'),(15,2,3,'rw'),(16,2,4,'rw'),(17,2,5,'rw'),(18,2,6,'rw'),(19,2,7,'rw'),(20,2,8,'rw'),(21,2,9,'rw'),(22,2,10,'rw'),(23,2,11,'rw'),(24,2,12,'rw'),(25,3,1,'ro'),(26,3,2,'ro'),(27,3,3,'ro'),(28,3,4,'ro'),(29,3,5,'ro'),(30,3,7,'ro'),(31,3,8,'ro'),(32,3,9,'ro'),(33,3,10,'rw'),(34,3,11,'rw'),(35,3,12,'rw'),(36,4,1,'ro'),(37,4,2,'ro'),(38,4,3,'ro'),(39,4,4,'ro'),(40,4,6,'ro'),(41,4,7,'ro'),(42,4,8,'ro'),(43,4,9,'ro'),(44,4,10,'rw'),(45,4,11,'rw'),(46,4,12,'rw'),(47,5,1,'ro'),(48,5,2,'ro'),(49,5,3,'rw'),(50,5,4,'rw'),(51,5,5,'ro'),(52,5,7,'ro'),(53,5,8,'ro'),(54,5,9,'ro'),(55,5,10,'rw'),(56,5,11,'rw'),(57,5,12,'rw'),(58,6,1,'ro'),(59,6,2,'ro'),(60,6,3,'rw'),(61,6,4,'rw'),(62,6,6,'ro'),(63,6,7,'ro'),(64,6,8,'ro'),(65,6,9,'ro'),(66,6,10,'rw'),(67,6,11,'rw'),(68,6,12,'rw'),(69,7,1,'ro'),(70,7,2,'ro'),(71,7,3,'ro'),(72,7,4,'ro'),(73,7,5,'rw'),(74,7,7,'ro'),(75,7,8,'ro'),(76,7,9,'ro'),(77,7,10,'rw'),(78,7,11,'rw'),(79,7,12,'rw'),(80,8,1,'ro'),(81,8,2,'ro'),(82,8,3,'ro'),(83,8,4,'ro'),(84,8,6,'rw'),(85,8,7,'ro'),(86,8,8,'ro'),(87,8,9,'ro'),(88,8,10,'rw'),(89,8,11,'rw'),(90,8,12,'rw');
/*!40000 ALTER TABLE `role_duties` ENABLE KEYS */;
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
-- Table structure for table `role_duty_classes`
--

DROP TABLE IF EXISTS `role_duty_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_duty_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `native` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_duty_classes`
--

LOCK TABLES `role_duty_classes` WRITE;
/*!40000 ALTER TABLE `role_duty_classes` DISABLE KEYS */;
INSERT INTO `role_duty_classes` VALUES (1,'Administration','Administrasi'),(2,'Taskforce Performance','Kinerja Gugus Tugas'),(3,'Personal Activities','Aktivitas Pribady');
/*!40000 ALTER TABLE `role_duty_classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-08 21:13:40
