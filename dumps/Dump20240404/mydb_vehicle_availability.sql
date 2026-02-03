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
-- Table structure for table `vehicle_availability`
--

DROP TABLE IF EXISTS `vehicle_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_availability` (
  `id` int NOT NULL,
  `VEHICLE_vin_id` varchar(17) NOT NULL,
  `status` enum('available','reserved','maintenance') NOT NULL,
  PRIMARY KEY (`id`,`VEHICLE_vin_id`),
  KEY `fk_VEHICLE_has_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id`),
  CONSTRAINT `fk_VEHICLE_has_RESERVATION_VEHICLE1` FOREIGN KEY (`VEHICLE_vin_id`) REFERENCES `vehicle` (`vin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_availability`
--

LOCK TABLES `vehicle_availability` WRITE;
/*!40000 ALTER TABLE `vehicle_availability` DISABLE KEYS */;
INSERT INTO `vehicle_availability` VALUES (1,'1FM5K8GT1FGA62040','reserved'),(2,'1FTEW1EF6HFA67295','available'),(3,'1HGCR2F31EA270651','available'),(4,'3GCUKTEC1HG123456','reserved'),(5,'4TIBE32K55U615251','maintenance'),(6,'5N18T2MVOGC803471','available'),(7,'JM1BL1TF6G1307950','reserved'),(8,'WBA7E4C59HG609381','available'),(9,'WDDUG8GV6FA164254','available'),(10,'WVWZZZAUZKW152208','reserved');
/*!40000 ALTER TABLE `vehicle_availability` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 15:36:54
