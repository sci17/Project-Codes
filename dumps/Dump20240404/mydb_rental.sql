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
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RENTAL_STATUS_id` int NOT NULL,
  `CUSTOMER_id` int NOT NULL,
  `VEHICLE_vin_id` varchar(17) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `pickup_location` varchar(45) NOT NULL,
  `dropoff_location` varchar(45) NOT NULL,
  `estimated_mileage_allowance` int NOT NULL,
  `additional_services` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`RENTAL_STATUS_id`,`CUSTOMER_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_RENTAL_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id`),
  KEY `fk_RENTAL_VEHICLE1_idx` (`VEHICLE_vin_id`),
  KEY `fk_RENTAL_CUSTOMER1_idx` (`CUSTOMER_id`),
  CONSTRAINT `fk_RENTAL_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_RENTAL_RENTAL_STATUS1` FOREIGN KEY (`RENTAL_STATUS_id`) REFERENCES `rental_status` (`id`),
  CONSTRAINT `fk_RENTAL_VEHICLE1` FOREIGN KEY (`VEHICLE_vin_id`) REFERENCES `vehicle` (`vin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,3,1,'5N18T2MVOGC803471','2023-12-29 12:10:00','2023-12-30 12:00:00','Roxas','Puerto',150,NULL),(2,2,7,'3GCUKTEC1HG123456','2024-01-02 12:10:00','2024-01-04 12:10:00','Narra','Narra',300,'sky boxes'),(3,1,5,'1FM5K8GT1FGA62040','2024-03-31 12:10:00','2024-04-01 12:10:00','Puerto','Aborlan',123,'baby seat'),(4,4,8,'WBA7E4C59HG609381','2024-01-01 12:10:00','2024-01-01 12:10:00','San Vicente','San Vicente',0,NULL),(5,1,2,'WVWZZZAUZKW152208','2024-01-01 12:10:00','2024-01-01 13:10:00','Aborlan','Aborlan',100,NULL),(6,2,3,'JM1BL1TF6G1307950','2023-03-29 12:10:00','2023-04-01 12:10:00','Puerto','Narra',430,'portable wifi'),(7,3,4,'4TIBE32K55U615251','2022-04-17 10:10:00','2022-04-18 10:10:00','Puerto','Puerto',70,'Toll Pass'),(8,3,6,'1FTEW1EF6HFA67295','2022-11-30 10:10:00','2022-12-05 10:10:00','El Nido','Brookes Point',550,NULL);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 15:36:56
