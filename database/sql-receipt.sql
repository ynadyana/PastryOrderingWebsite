-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: finalproject2
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `ReceiptID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ReceiptDate` date DEFAULT NULL,
  `ReceiptTime` time DEFAULT NULL,
  `PaymentMethod` varchar(20) DEFAULT NULL,
  `TotalPayment` double DEFAULT NULL,
  `DeliveryType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`),
  KEY `OrderID_idx` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1000,NULL,'2024-07-22','13:06:02','onlineBanking',NULL,'inStore'),(1001,1009,'2024-07-22','13:19:13','onlineBanking',NULL,'standard'),(1002,NULL,'2024-07-22','13:24:51','onlineBanking',NULL,'inStore'),(1003,NULL,'2024-07-22','13:28:54','onlineBanking',NULL,'inStore'),(1004,NULL,'2024-07-22','13:35:00','onlineBanking',NULL,'standard'),(1005,1013,'2024-07-22','15:25:58','onlineBanking',NULL,'standard'),(1006,1014,'2024-07-22','15:30:19','cashPayment',NULL,'inStore'),(1007,1014,'2024-07-22','15:30:19','cashPayment',NULL,'inStore'),(1008,1015,'2024-07-22','15:53:18','cashPayment',NULL,'inStore'),(1009,1016,'2024-07-22','15:57:21','cashPayment',NULL,'inStore'),(1010,1017,NULL,NULL,NULL,NULL,NULL),(1011,1018,NULL,NULL,NULL,NULL,NULL),(1012,1018,'2024-07-22','16:56:19','cashPayment',NULL,'inStore'),(1013,1019,NULL,NULL,NULL,NULL,NULL),(1014,1019,'2024-07-22','17:05:15','cashPayment',NULL,'inStore'),(1015,1020,NULL,NULL,NULL,NULL,NULL),(1016,1020,'2024-07-22','17:10:32','cashPayment',NULL,'inStore'),(1017,1021,NULL,NULL,NULL,NULL,NULL),(1018,1021,'2024-07-22','17:12:15','cashPayment',NULL,'inStore'),(1019,1022,NULL,NULL,NULL,NULL,NULL),(1020,1022,'2024-07-22','17:14:40','onlineBanking',NULL,'standard'),(1021,1023,NULL,NULL,NULL,NULL,NULL),(1022,1023,'2024-07-22','17:27:34','cashPayment',NULL,'inStore'),(1023,1024,NULL,NULL,NULL,NULL,NULL),(1024,1024,'2024-07-22','17:32:35','cashPayment',NULL,'inStore'),(1025,1025,NULL,NULL,NULL,NULL,NULL),(1026,1025,'2024-07-22','17:34:47','cashPayment',NULL,'inStore'),(1027,1026,'2024-07-22','17:48:40','onlineBanking',NULL,'standard'),(1028,1031,'2024-07-22','18:27:03','onlineBanking',0,'inStore'),(1029,1031,'2024-07-22','18:30:53','cashPayment',0,'inStore'),(1030,1031,'2024-07-22','18:43:08','cashPayment',49.9,'inStore'),(1031,1032,'2024-07-22','18:46:37','onlineBanking',29.9,'standard'),(1032,1033,'2024-07-22','19:01:52','cashPayment',54,'inStore'),(1033,1035,'2024-07-22','19:04:31','cashPayment',108,'inStore'),(1034,1036,'2024-07-22','19:09:31','cashPayment',44.9,'inStore');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 19:18:20
