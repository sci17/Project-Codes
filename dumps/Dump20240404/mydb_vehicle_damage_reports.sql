-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `vehicle_damage_reports`
--

DROP TABLE IF EXISTS `vehicle_damage_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_damage_reports` (
  `id` int NOT NULL,
  `RENTAL_STATUS_id` int NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `vehicle_vin_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`RENTAL_STATUS_id`),
  KEY `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id`),
  KEY `fk_vehicle_id` (`vehicle_vin_id`),
  CONSTRAINT `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1` FOREIGN KEY (`RENTAL_STATUS_id`) REFERENCES `rental_status` (`id`),
  CONSTRAINT `fk_vehicle_id` FOREIGN KEY (`vehicle_vin_id`) REFERENCES `vehicle` (`vin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_damage_reports`
--

LOCK TABLES `vehicle_damage_reports` WRITE;
/*!40000 ALTER TABLE `vehicle_damage_reports` DISABLE KEYS */;
INSERT INTO `vehicle_damage_reports` VALUES (1,2,'bumper damage','3GCUKTEC1HG123456'),(2,2,'flat tire','JM1BL1TF6G1307950');
/*!40000 ALTER TABLE `vehicle_damage_reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 15:36:55
