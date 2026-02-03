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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `driver_license_number` varchar(20) NOT NULL,
  `driver_license_expiry_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `driver_license_number_UNIQUE` (`driver_license_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Keinth','Puerto','098d13','keinth@gmail.com','912033','2025-01-15'),(2,'Pablo','Cavite','028739137','pablo@gmail.com','023701','2024-04-19'),(3,'Ken Suson','Cagayan de Oro','028429','ken@gmail.com','0280102','2024-07-16'),(4,'Sara Duterte','Davao','0091234598','sara@gmail.com','028934','2025-05-29'),(5,'Jewel Magdayao','Puerto','09976538','jewel@gmail.com','023987','2025-08-20'),(6,'Nivram Espots','Buhol','099911234','nivram@gmail.com','029992','2026-04-03'),(7,'Cyrus Reyes','Cebu','099578630','cyrus@gmail.com','038946','2026-12-23'),(8,'Lexe Taladro','El Nido','092638490','lexe@gmail.com','038797','2028-01-30'),(9,'Jah Santos','Roxas','729302918','jah@gmail.com','018831','2030-02-18'),(10,'Josh Nase','Puerto','023832930','josh@gmail.com','092383','2027-07-28');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_refund`
--

DROP TABLE IF EXISTS `customer_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_refund` (
  `id` int NOT NULL,
  `amount` double NOT NULL,
  `PAYMENT_id` int NOT NULL,
  `CUSTOMER_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CUSTOMER_REFUND_PAYMENT1_idx` (`PAYMENT_id`),
  KEY `fk_CUSTOMER_REFUND_CUSTOMER1_idx` (`CUSTOMER_id`),
  CONSTRAINT `fk_CUSTOMER_REFUND_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_CUSTOMER_REFUND_PAYMENT1` FOREIGN KEY (`PAYMENT_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_refund`
--

LOCK TABLES `customer_refund` WRITE;
/*!40000 ALTER TABLE `customer_refund` DISABLE KEYS */;
INSERT INTO `customer_refund` VALUES (1,2000,7,4);
/*!40000 ALTER TABLE `customer_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_rental_history`
--

DROP TABLE IF EXISTS `customer_rental_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_rental_history` (
  `id` int NOT NULL,
  `LATE_FEE_id` int NOT NULL,
  `violation` varchar(45) DEFAULT NULL,
  `past_rental` varchar(45) DEFAULT NULL,
  `CUSTOMER_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1_idx` (`CUSTOMER_id`),
  CONSTRAINT `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_rental_history`
--

LOCK TABLES `customer_rental_history` WRITE;
/*!40000 ALTER TABLE `customer_rental_history` DISABLE KEYS */;
INSERT INTO `customer_rental_history` VALUES (1,2,'Past Due date','none',2);
/*!40000 ALTER TABLE `customer_rental_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `options` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name_UNIQUE` (`options`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (6,'BPI Insurance Corporations'),(7,'COMMONWEALTH Insurance Company'),(4,'FPG Insurance'),(2,'MALAYAN Insurance'),(1,'none'),(5,'PRUDENTIAL GUARANTEE Insurance'),(3,'STANDARD Insurance');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `late_fees`
--

DROP TABLE IF EXISTS `late_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `late_fees` (
  `id` int NOT NULL,
  `amount` double NOT NULL,
  `expected_due_date` datetime NOT NULL,
  `PAYMENT_id` int NOT NULL,
  `CUSTOMER_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LATE_FEES_PAYMENT1_idx` (`PAYMENT_id`),
  KEY `fk_LATE_FEES_CUSTOMER1_idx` (`CUSTOMER_id`),
  CONSTRAINT `fk_LATE_FEES_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_LATE_FEES_PAYMENT1` FOREIGN KEY (`PAYMENT_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `late_fees`
--

LOCK TABLES `late_fees` WRITE;
/*!40000 ALTER TABLE `late_fees` DISABLE KEYS */;
INSERT INTO `late_fees` VALUES (1,8500,'2024-01-04 12:10:00',4,7),(2,20000,'2024-01-01 13:10:00',5,2);
/*!40000 ALTER TABLE `late_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `INSURANCE_id` int NOT NULL,
  `rental_id` int NOT NULL,
  `amount` double NOT NULL,
  `payment_date_time` datetime NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `deposit` double DEFAULT NULL,
  `unpaid_balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_rental_idx` (`rental_id`),
  KEY `fk_PAYMENT_INSURANCE1_idx` (`INSURANCE_id`),
  CONSTRAINT `fk_PAYMENT_INSURANCE1` FOREIGN KEY (`INSURANCE_id`) REFERENCES `insurance` (`id`),
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,2,1,5500,'2023-12-29 12:10:00','digital wallet',3000,2500),(2,5,5,10000,'2024-01-01 12:10:00','debit card',5500,4500),(3,4,8,12500,'2022-11-30 10:10:00','cash',12500,0),(4,1,2,18000,'2024-01-02 12:10:00','cash',10000,8000),(5,3,4,0,'2024-01-01 12:10:00','none',0,0),(6,6,7,5000,'2022-04-17 10:10:00','credit card',2500,2500),(7,7,6,27500,'2023-03-29 12:10:00','debit card',20000,7500),(8,3,3,28300,'2024-03-31 12:10:00','cash',15000,13300);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `rental_status`
--

DROP TABLE IF EXISTS `rental_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental_status` (
  `id` int NOT NULL,
  `name` enum('reserved','active','completed','cancelled') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental_status`
--

LOCK TABLES `rental_status` WRITE;
/*!40000 ALTER TABLE `rental_status` DISABLE KEYS */;
INSERT INTO `rental_status` VALUES (1,'reserved'),(2,'active'),(3,'completed'),(4,'cancelled');
/*!40000 ALTER TABLE `rental_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VEHICLE_vin_id` varchar(17) NOT NULL,
  `CUSTOMER_id` int NOT NULL,
  `reservation_start_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id`),
  KEY `fk_RESERVATION_CUSTOMER1_idx` (`CUSTOMER_id`),
  CONSTRAINT `fk_RESERVATION_CUSTOMER1` FOREIGN KEY (`CUSTOMER_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_RESERVATION_VEHICLE1` FOREIGN KEY (`VEHICLE_vin_id`) REFERENCES `vehicle` (`vin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'1FM5K8GT1FGA62040',5,'2024-03-29 12:10:00'),(2,'WVWZZZAUZKW152208',2,'2023-12-30 12:10:00');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `vehicle_category`
--

DROP TABLE IF EXISTS `vehicle_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_category`
--

LOCK TABLES `vehicle_category` WRITE;
/*!40000 ALTER TABLE `vehicle_category` DISABLE KEYS */;
INSERT INTO `vehicle_category` VALUES (3,'Hatchback'),(5,'Luxury'),(4,'PickUp Truck'),(1,'Sedan'),(2,'SUV');
/*!40000 ALTER TABLE `vehicle_category` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-04-04 15:45:38
