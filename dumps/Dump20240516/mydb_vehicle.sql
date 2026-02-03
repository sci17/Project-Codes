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
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vin_id` varchar(17) NOT NULL,
  `VEHICLE_CATEGORY_id` int NOT NULL,
  `date_created` datetime NOT NULL,
  `model_year` year NOT NULL,
  `color` varchar(45) NOT NULL,
  `license_plate` varchar(15) NOT NULL,
  `engine_type` varchar(45) NOT NULL,
  `transmission_type` varchar(45) NOT NULL,
  `mileage` int NOT NULL,
  `current_location` varchar(45) NOT NULL,
  `daily_rental_rate` double NOT NULL,
  `rental_status` enum('reserved','active','completed','cancelled') NOT NULL,
  `model_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vin_id`),
  KEY `fk_VEHICLE_VEHICLE_CATEGORY1_idx` (`VEHICLE_CATEGORY_id`),
  CONSTRAINT `fk_VEHICLE_VEHICLE_CATEGORY1` FOREIGN KEY (`VEHICLE_CATEGORY_id`) REFERENCES `vehicle_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('1FM5K8GT1FGA62040',2,'2019-05-10 05:23:00',2019,'black','222-CCC','V6 engine','automatic',1024,'Puerto',7000,'cancelled','FORD EXPLORER'),('1FTEW1EF6HFA67295',4,'2023-11-01 07:15:13',2023,'orange','666-GGG','V6 engine','automatic',487,'El Nido',2500,'completed','FORD F-150'),('1HGCR2F31EA270651',1,'2021-07-07 12:54:34',2021,'red','111-BBB','inline four engine','CVT',551,'El Nido',6300,'active','HONDA ACCORD'),('3GCUKTEC1HG123456',4,'2024-01-26 12:00:00',2024,'red','777-HHH','V8 engine','automatic',53,'Narra',8500,'active','CHEVROLET SILVERADO '),('4TIBE32K55U615251',1,'2020-04-15 07:12:01',2020,'gray','000-AAA','inline four engine','automatic',878,'Puerto',5000,'reserved','TOYATA CAMRY'),('5N18T2MVOGC803471',2,'2019-10-01 08:12:00',2019,'white','333-DDD','inline four engine','CVT',1205,'Roxas',5500,'completed','NISSAN ROGUE'),('JM1BL1TF6G1307950',3,'2023-02-13 10:30:10',2023,'red','555-FFF','inline four engine','automatic',154,'Puerto',9000,'reserved','MAZDA 3'),('WBA7E4C59HG609381',5,'2022-06-29 16:09:18',2022,'gold','999-JJJ','inline six engine','automatic',362,'San Vincente',20000,'active','BMW 7-SERIES'),('WDDUG8GV6FA164254',5,'2021-09-12 14:07:02',2021,'black','888-III','V8 engine','automatic',275,'Puerto',15000,'cancelled','MERCEDES BENZ S-CLASS'),('WVWZZZAUZKW152208',3,'2022-08-13 12:05:00',2022,'brown','444-EEE','inline four engine','automatic',336,'Aborlan',10000,'reserved','VOLKSWAGEN GOLF');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16  9:37:30
