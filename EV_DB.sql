CREATE DATABASE  IF NOT EXISTS `ev_db` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ev_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ev_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin_charging_station_list`
--

DROP TABLE IF EXISTS `admin_charging_station_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_charging_station_list` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `Station_name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` char(20) NOT NULL,
  `Charger_type` char(20) NOT NULL,
  `Available_ports` varchar(50) NOT NULL,
  `Status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_charging_station_list`
--

LOCK TABLES `admin_charging_station_list` WRITE;
/*!40000 ALTER TABLE `admin_charging_station_list` DISABLE KEYS */;
INSERT INTO `admin_charging_station_list` VALUES (1,'ABC Charging Station','MG Road','Bengaluru','AC Level 1 Charging','4','active'),(2,'XYZ Charging Station','Lalbagh Road','Bengaluru','AC Level 2 Charging','2',''),(3,'123 Charging Station','Electronic City','Bengaluru','DC Fast Charging','6','active'),(4,'456 Charging Station','Sayyaji Rao Road','Mysuru','AC Level 1 Charging','3',''),(5,'789 Charging Station','Ashoka Road','Mysuru','AC Level 2 Charging','1','active'),(6,'DEF Charging Station','Vijayanagar','Mysuru','DC Fast Charging','5','active'),(7,'GHI Charging Station','Balmatta Road','Mangaluru','AC Level 1 Charging','2',''),(8,'JKL Charging Station','Kankanady','Mangaluru','AC Level 2 Charging','4','active'),(9,'MNO Charging Station','Hampankatta','Mangaluru','DC Fast Charging','3',''),(10,'PQR Charging Station','Lamington Road','Hubballi','AC Level 1 Charging','1','active'),(11,'ABC Charging Station','Vidyanagar','Hubballi','AC Level 2 Charging','4','active'),(12,'XYZ Charging Station','Gokul Road','Hubballi','DC Fast Charging','2',''),(13,'123 Charging Station','Shahapur','Dharwad','AC Level 1 Charging','3',''),(14,'456 Charging Station','Navanagar','Dharwad','AC Level 2 Charging','2',''),(15,'789 Charging Station','Jubilee Circle','Dharwad','DC Fast Charging','3',''),(16,'DEF Charging Station','Tilakwadi','Belagavi','AC Level 1 Charging','2',''),(17,'GHI Charging Station','Gandhi Nagar','Belagavi','AC Level 2 Charging','3',''),(18,'JKL Charging Station','Shahapur','Belagavi','DC Fast Charging','2',''),(19,'MNO Charging Station','Gandhi Bazar','Shivamogga','AC Level 1 Charging','3',''),(20,'PQR Charging Station','Kuvempu Road','Shivamogga','AC Level 2 Charging','2',''),(21,'ABC Charging Station','B H Road','Shivamogga','DC Fast Charging','3',''),(22,'XYZ Charging Station','Cantonment Road','Ballari','AC Level 1 Charging','2',''),(23,'123 Charging Station','Gandhinagar','Ballari','AC Level 2 Charging','3',''),(24,'456 Charging Station','Hospet Road','Ballari','DC Fast Charging','2',''),(25,'789 Charging Station','Sedam Road','Kalaburagi','AC Level 1 Charging','3',''),(26,'DEF Charging Station','Super Market Area','Kalaburagi','AC Level 2 Charging','2',''),(27,'GHI Charging Station','Ring Road','Kalaburagi','DC Fast Charging','3',''),(28,'JKL Charging Station','PB Road','Davangere','AC Level 1 Charging','2',''),(29,'MNO Charging Station','Jayadeva Circle','Davangere','AC Level 2 Charging','3',''),(30,'PQR Charging Station','Vidyanagar','Davangere','DC Fast Charging','2',''),(31,'ABC Charging Station','BH Road','Tumakuru','AC Level 1 Charging','3',''),(32,'XYZ Charging Station','Jayanagar','Tumakuru','AC Level 2 Charging','2',''),(33,'123 Charging Station','Ring Road','Tumakuru','DC Fast Charging','3',''),(34,'456 Charging Station','Sindagi Road','Vijayapura','AC Level 1 Charging','2',''),(35,'789 Charging Station','Gol Gumbaz Road','Vijayapura','AC Level 2 Charging','3',''),(36,'DEF Charging Station','Station Road','Vijayapura','DC Fast Charging','2',''),(37,'GHI Charging Station','Maruthi Veethika','Udupi','AC Level 1 Charging','3',''),(38,'JKL Charging Station','Kundapura Road','Udupi','AC Level 2 Charging','2',''),(39,'MNO Charging Station','Manipal Road','Udupi','DC Fast Charging','3',''),(40,'PQR Charging Station','BM Road','Hassan','AC Level 1 Charging','2',''),(41,'ABC Charging Station','KR Puram','Hassan','AC Level 2 Charging','3',''),(42,'XYZ Charging Station','Gandhi Nagar','Hassan','DC Fast Charging','2',''),(43,'123 Charging Station','Indira Gandhi Road','Chikkamagaluru','AC Level 1 Charging','3',''),(44,'456 Charging Station','Mallandur Road','Chikkamagaluru','AC Level 2 Charging','2',''),(45,'789 Charging Station','Kadur Road','Chikkamagaluru','DC Fast Charging','3',''),(46,'DEF Charging Station','Navanagar','Bagalkot','AC Level 1 Charging','2',''),(47,'GHI Charging Station','Jamakhandi Road','Bagalkot','AC Level 2 Charging','3',''),(48,'JKL Charging Station','Gandhi Chowk','Bagalkot','DC Fast Charging','2',''),(49,'MNO Charging Station','Udgir Road','Bidar','AC Level 1 Charging','3',''),(50,'PQR Charging Station','Naya Kaman','Bidar','AC Level 2 Charging','2',''),(51,'ABC Charging Station','Gumpa Road','Bidar','DC Fast Charging','3',''),(52,'XYZ Charging Station','Munjunatha Nagar','Raichur','AC Level 1 Charging','2',''),(53,'123 Charging Station','Sindhanur Road','Raichur','AC Level 2 Charging','3',''),(54,'456 Charging Station','Station Road','Raichur','DC Fast Charging','2',''),(55,'789 Charging Station','Bangarpet Road','Kolar','AC Level 1 Charging','3',''),(56,'DEF Charging Station','KGF Road','Kolar','AC Level 2 Charging','2',''),(57,'GHI Charging Station','Chintamani Road','Kolar','DC Fast Charging','3',''),(58,'JKL Charging Station','Holalkere Road','Chitradurga','AC Level 1 Charging','2',''),(59,'MNO Charging Station','Basaveshwara Road','Chitradurga','AC Level 2 Charging','3',''),(60,'PQR Charging Station','Rampura Road','Chitradurga','DC Fast Charging','2',''),(61,'ABC Charging Station','Basaveshwara Road','Chitradurga','AC Level 1 Charging','4','active'),(62,'XYZ Charging Station','Rampura Road','Chitradurga','DC Fast Charging','5','active'),(63,'123 Charging Station','BH Road','Tumakuru','AC Level 2 Charging','1','active'),(64,'456 Charging Station','Jayanagar','Tumakuru','DC Fast Charging','4','active'),(65,'789 Charging Station','Ring Road','Tumakuru','AC Level 1 Charging','2','active'),(66,'DEF Charging Station','Sindagi Road','Vijayapura','DC Fast Charging','3','active'),(67,'GHI Charging Station','Gol Gumbaz Road','Vijayapura','AC Level 2 Charging','6','active'),(68,'JKL Charging Station','Station Road','Vijayapura','AC Level 1 Charging','1','active'),(69,'MNO Charging Station','Maruthi Veethika','Udupi','DC Fast Charging','5','active'),(70,'PQR Charging Station','Kundapura Road','Udupi','AC Level 2 Charging','2','active'),(71,'ABC Charging Station','Manipal Road','Udupi','AC Level 1 Charging','3','active');
/*!40000 ALTER TABLE `admin_charging_station_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `Station_name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Available_ports` varchar(11) NOT NULL,
  `Booking_date` date NOT NULL,
  `Time_from` time NOT NULL,
  `Time_to` time NOT NULL,
  `Created_id` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `login_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,'ABC Charging Station','Bengaluru','4','2024-10-26','14:48:00','18:49:00','2024-10-26 09:19:04',32),(6,'ABC Charging Station','Bengaluru','4','2024-10-26','14:48:00','18:49:00','2024-10-26 09:19:06',32);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station_booking`
--

DROP TABLE IF EXISTS `charging_station_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station_booking` (
  `id` int NOT NULL,
  `charging_station_id` int NOT NULL,
  `user_id` int NOT NULL,
  `booking_start_time` datetime NOT NULL,
  `booking_end_time` datetime NOT NULL,
  `status` enum('Active','Cancelled','Completed') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station_booking`
--

LOCK TABLES `charging_station_booking` WRITE;
/*!40000 ALTER TABLE `charging_station_booking` DISABLE KEYS */;
INSERT INTO `charging_station_booking` VALUES (1,1,1,'2022-01-01 10:00:00','2022-01-01 12:00:00','Completed'),(2,2,2,'2022-01-02 13:00:00','2022-01-02 15:00:00','Cancelled'),(3,3,3,'2022-01-03 16:00:00','2022-01-03 18:00:00','Active'),(4,4,4,'2022-01-04 19:00:00','2022-01-04 21:00:00','Active'),(5,5,5,'2022-01-05 22:00:00','2022-01-05 23:00:00','Completed'),(6,6,6,'2022-01-06 10:00:00','2022-01-06 11:00:00','Completed'),(7,7,7,'2022-01-07 12:00:00','2022-01-07 13:00:00','Active'),(8,8,8,'2022-01-08 14:00:00','2022-01-08 16:00:00','Cancelled'),(9,9,9,'2022-01-09 17:00:00','2022-01-09 19:00:00','Active'),(10,10,10,'2022-01-10 20:00:00','2022-01-10 22:00:00','Completed');
/*!40000 ALTER TABLE `charging_station_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station_list`
--

DROP TABLE IF EXISTS `charging_station_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station_list` (
  `id` int NOT NULL,
  `station_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` char(100) NOT NULL,
  `charger_type` char(20) NOT NULL,
  `available_ports` int NOT NULL,
  `status` enum('Active','Under Maintenance','Out of Service') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station_list`
--

LOCK TABLES `charging_station_list` WRITE;
/*!40000 ALTER TABLE `charging_station_list` DISABLE KEYS */;

-- Insert new values into charging_station_list
INSERT INTO `charging_station_list` VALUES 
(1,'ABC Charging Station','MG Road','Bengaluru','AC Level 1 Charging',5,'Active'),
(2,'XYZ Charging Station','Lalbagh Road','Bengaluru','AC Level 2 Charging',3,'Active'),
(3,'123 Charging Station','Electronic City','Bengaluru','DC Fast Charging',4,'Active'),
(4,'DEF Charging Station','Sayyaji Rao Road','Mysuru','AC Level 1 Charging',3,'Active'),
(5,'GHI Charging Station','Ashoka Road','Mysuru','AC Level 2 Charging',2,'Active'),
(6,'JKL Charging Station','Vijayanagar','Mysuru','DC Fast Charging',3,'Active'),
(7,'MNO Charging Station','Balmatta Road','Mangaluru','AC Level 1 Charging',2,'Active'),
(8,'PQR Charging Station','Kankanady','Mangaluru','AC Level 2 Charging',3,'Active'),
(9,'ABC Charging Station','Hampankatta','Mangaluru','DC Fast Charging',3,'Active'),
(10,'XYZ Charging Station','Lamington Road','Hubballi','AC Level 1 Charging',2,'Active'),
(11,'123 Charging Station','Vidyanagar','Hubballi','AC Level 2 Charging',3,'Active'),
(12,'456 Charging Station','Gokul Road','Hubballi','DC Fast Charging',2,'Active'),
(13,'789 Charging Station','Shahapur','Dharwad','AC Level 1 Charging',3,'Active'),
(14,'DEF Charging Station','Navanagar','Dharwad','AC Level 2 Charging',2,'Active'),
(15,'GHI Charging Station','Jubilee Circle','Dharwad','DC Fast Charging',3,'Active'),
(16,'JKL Charging Station','Tilakwadi','Belagavi','AC Level 1 Charging',2,'Active'),
(17,'MNO Charging Station','Gandhi Nagar','Belagavi','AC Level 2 Charging',3,'Active'),
(18,'PQR Charging Station','Shahapur','Belagavi','DC Fast Charging',2,'Active'),
(19,'ABC Charging Station','Gandhi Bazar','Shivamogga','AC Level 1 Charging',3,'Active'),
(20,'XYZ Charging Station','Kuvempu Road','Shivamogga','AC Level 2 Charging',2,'Active'),
(21,'123 Charging Station','B H Road','Shivamogga','DC Fast Charging',3,'Active'),
(22,'456 Charging Station','Cantonment Road','Ballari','AC Level 1 Charging',2,'Active'),
(23,'789 Charging Station','Gandhinagar','Ballari','AC Level 2 Charging',3,'Active'),
(24,'DEF Charging Station','Hospet Road','Ballari','DC Fast Charging',2,'Active'),
(25,'GHI Charging Station','Sedam Road','Kalaburagi','AC Level 1 Charging',3,'Active'),
(26,'JKL Charging Station','Super Market Area','Kalaburagi','AC Level 2 Charging',2,'Active'),
(27,'MNO Charging Station','Ring Road','Kalaburagi','DC Fast Charging',3,'Active'),
(28,'PQR Charging Station','PB Road','Davangere','AC Level 1 Charging',2,'Active'),
(29,'ABC Charging Station','Jayadeva Circle','Davangere','AC Level 2 Charging',3,'Active'),
(30,'XYZ Charging Station','Vidyanagar','Davangere','DC Fast Charging',2,'Active'),
(31,'123 Charging Station','BH Road','Tumakuru','AC Level 1 Charging',3,'Active'),
(32,'456 Charging Station','Jayanagar','Tumakuru','AC Level 2 Charging',2,'Active'),
(33,'789 Charging Station','Ring Road','Tumakuru','DC Fast Charging',3,'Active'),
(34,'DEF Charging Station','Sindagi Road','Vijayapura','AC Level 1 Charging',2,'Active'),
(35,'GHI Charging Station','Gol Gumbaz Road','Vijayapura','AC Level 2 Charging',3,'Active'),
(36,'JKL Charging Station','Station Road','Vijayapura','DC Fast Charging',2,'Active'),
(37,'MNO Charging Station','Maruthi Veethika','Udupi','AC Level 1 Charging',3,'Active'),
(38,'PQR Charging Station','Kundapura Road','Udupi','AC Level 2 Charging',2,'Active'),
(39,'ABC Charging Station','Manipal Road','Udupi','DC Fast Charging',3,'Active'),
(40,'XYZ Charging Station','BM Road','Hassan','AC Level 1 Charging',2,'Active'),
(41,'123 Charging Station','KR Puram','Hassan','AC Level 2 Charging',3,'Active'),
(42,'456 Charging Station','Gandhi Nagar','Hassan','DC Fast Charging',2,'Active'),
(43,'789 Charging Station','Indira Gandhi Road','Chikkamagaluru','AC Level 1 Charging',3,'Active'),
(44,'DEF Charging Station','Mallandur Road','Chikkamagaluru','AC Level 2 Charging',2,'Active'),
(45,'GHI Charging Station','Kadur Road','Chikkamagaluru','DC Fast Charging',3,'Active'),
(46,'JKL Charging Station','Navanagar','Bagalkot','AC Level 1 Charging',2,'Active'),
(47,'MNO Charging Station','Jamakhandi Road','Bagalkot','AC Level 2 Charging',3,'Active'),
(48,'PQR Charging Station','Gandhi Chowk','Bagalkot','DC Fast Charging',2,'Active'),
(49,'ABC Charging Station','Udgir Road','Bidar','AC Level 1 Charging',3,'Active'),
(50,'XYZ Charging Station','Naya Kaman','Bidar','AC Level 2 Charging',2,'Active'),
(51,'123 Charging Station','Gumpa Road','Bidar','DC Fast Charging',3,'Active'),
(52,'456 Charging Station','Munjunatha Nagar','Raichur','AC Level 1 Charging',2,'Active'),
(53,'789 Charging Station','Sindhanur Road','Raichur','AC Level 2 Charging',3,'Active'),
(54,'DEF Charging Station','Station Road','Raichur','DC Fast Charging',2,'Active'),
(55,'GHI Charging Station','Bangarpet Road','Kolar','AC Level 1 Charging',3,'Active'),
(56,'JKL Charging Station','KGF Road','Kolar','AC Level 2 Charging',2,'Active'),
(57,'MNO Charging Station','Chintamani Road','Kolar','DC Fast Charging',3,'Active'),
(58,'PQR Charging Station','Holalkere Road','Chitradurga','AC Level 1 Charging',2,'Active'),
(59,'ABC Charging Station','Basaveshwara Road','Chitradurga','AC Level 2 Charging',3,'Active'),
(60,'XYZ Charging Station','Rampura Road','Chitradurga','DC Fast Charging',2,'Active');

/*!40000 ALTER TABLE `charging_station_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `Sl_no` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Feedback_date` date NOT NULL,
  `Feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`Sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (1,'dummy','dummy@gmail.com','2024-10-26','dummy feedback\r\n');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` enum('admin','user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (29,'admin','123','admin'),(32,'user','user','user'),(33,'janedoe','zxcvbnm','user'),(34,'admin','adminpass','user'),(35,'testuser','testpass','user'),(36,'guest','guestpass','user'),(37,'user3','pass789','user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (29,'John Doe','johndoe@example.com'),(30,'Jane Smith','janesmith@example.com'),(31,'Bob Johnson','bjohnson@example.com'),(32,'Sara Lee','saralee@example.com'),(33,'Maxwell Smart','msmart@example.com'),(34,'Lucy Liu','lucyliu@example.com'),(35,'Jack Black','jblack@example.com'),(36,'Amy Adams','aadams@example.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dashboard`
--

DROP TABLE IF EXISTS `user_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dashboard` (
  `booking_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `station` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dashboard`
--

LOCK TABLES `user_dashboard` WRITE;
/*!40000 ALTER TABLE `user_dashboard` DISABLE KEYS */;
INSERT INTO `user_dashboard` VALUES ('2023-04-27','10:00:00','Bengaluru','Station A'),('2023-04-27','14:30:00','Mysuru','Station B'),('2023-04-28','09:15:00','Hubballi','Station C'),('2023-04-28','16:00:00','Belagavi','Station D'),('2023-04-29','11:45:00','Shivamogga','Station E'),('2023-04-29','15:30:00','Ballari','Station F'),('2023-04-30','13:00:00','Kalaburagi','Station G'),('2023-04-30','18:45:00','Davangere','Station H'),('2023-05-01','10:30:00','Tumakuru','Station I'),('2023-05-01','14:15:00','Vijayapura','Station J'),('2023-05-02','12:00:00','Udupi','Station K'),('2023-05-02','17:30:00','Hassan','Station L'),('2023-05-03','08:45:00','Chikkamagaluru','Station M'),('2023-05-03','13:15:00','Bagalkot','Station N'),('2023-05-04','11:00:00','Bidar','Station O');
/*!40000 ALTER TABLE `user_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'admin','admin','admin@example.com','+1-555-555-5555','123 Main St, Anytown, USA'),(2,'Jane','Smith','janesmith@example.com','+1-555-555-5555','456 Elm St, Anytown, USA'),(3,'Bob','Johnson','bobjohnson@example.com','+1-555-555-5555','789 Oak St, Anytown, USA'),(4,'Alice','Williams','alicewilliams@example.com','+1-555-555-5555','321 Pine St, Anytown, USA'),(5,'David','Brown','davidbrown@example.com','+1-555-555-5555','654 Cedar St, Anytown, USA'),(6,'Sarah','Davis','sarahdavis@example.com','+1-555-555-5555','987 Maple St, Anytown, USA'),(7,'Michael','Wilson','michaelwilson@example.com','+1-555-555-5555','456 Birch St, Anytown, USA'),(8,'Amy','Lee','amylee@example.com','+1-555-555-5555','789 Walnut St, Anytown, USA'),(9,'Kevin','Jones','kevinjones@example.com','+1-555-555-5555','123 Oak St, Anytown, USA'),(10,'Emily','Taylor','emilytaylor@example.com','+1-555-555-5555','456 Maple St, Anytown, USA');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 15:50:42

UPDATE booking SET City = 'Bengaluru' WHERE City = 'Thiruvananthapuram';
UPDATE booking SET City = 'Mysuru' WHERE City = 'Kollam';
UPDATE booking SET City = 'Mangaluru' WHERE City = 'Pathanamthitta';
UPDATE booking SET City = 'Hubballi' WHERE City = 'Alapuzha';
UPDATE booking SET City = 'Dharwad' WHERE City = 'Kottayam';
UPDATE booking SET City = 'Belagavi' WHERE City = 'Idukki';
UPDATE booking SET City = 'Shivamogga' WHERE City = 'Ernakulam';
UPDATE booking SET City = 'Ballari' WHERE City = 'Thrissur';
UPDATE booking SET City = 'Kalaburagi' WHERE City = 'Palakkad';
UPDATE booking SET City = 'Davangere' WHERE City = 'Malappuram';
UPDATE booking SET City = 'Tumakuru' WHERE City = 'Kozhikode';
UPDATE booking SET City = 'Vijayapura' WHERE City = 'Wayanad';
UPDATE booking SET City = 'Udupi' WHERE City = 'Kannur';
UPDATE booking SET City = 'Hassan' WHERE City = 'Kasaragod';

UPDATE admin_charging_station_list SET City = 'Bengaluru' WHERE City = 'Thiruvananthapuram';
UPDATE admin_charging_station_list SET City = 'Mysuru' WHERE City = 'Kollam';
UPDATE admin_charging_station_list SET City = 'Mangaluru' WHERE City = 'Pathanamthitta';
UPDATE admin_charging_station_list SET City = 'Hubballi' WHERE City = 'Alapuzha';
UPDATE admin_charging_station_list SET City = 'Dharwad' WHERE City = 'Kottayam';
UPDATE admin_charging_station_list SET City = 'Belagavi' WHERE City = 'Idukki';
UPDATE admin_charging_station_list SET City = 'Shivamogga' WHERE City = 'Ernakulam';
UPDATE admin_charging_station_list SET City = 'Ballari' WHERE City = 'Thrissur';
UPDATE admin_charging_station_list SET City = 'Kalaburagi' WHERE City = 'Palakkad';
UPDATE admin_charging_station_list SET City = 'Davangere' WHERE City = 'Malappuram';
UPDATE admin_charging_station_list SET City = 'Tumakuru' WHERE City = 'Kozhikode';
UPDATE admin_charging_station_list SET City = 'Vijayapura' WHERE City = 'Wayanad';
UPDATE admin_charging_station_list SET City = 'Udupi' WHERE City = 'Kannur';
UPDATE admin_charging_station_list SET City = 'Hassan' WHERE City = 'Kasaragod';


UPDATE user_dashboard SET city = 'Bengaluru' WHERE city = 'Thiruvananthapuram';
UPDATE user_dashboard SET city = 'Mysuru' WHERE city = 'Kollam';
UPDATE user_dashboard SET city = 'Mangaluru' WHERE city = 'Pathanamthitta';
UPDATE user_dashboard SET city = 'Hubballi' WHERE city = 'Alapuzha';
UPDATE user_dashboard SET city = 'Dharwad' WHERE city = 'Kottayam';
UPDATE user_dashboard SET city = 'Belagavi' WHERE city = 'Idukki';
UPDATE user_dashboard SET city = 'Shivamogga' WHERE city = 'Ernakulam';
UPDATE user_dashboard SET city = 'Ballari' WHERE city = 'Thrissur';
UPDATE user_dashboard SET city = 'Kalaburagi' WHERE city = 'Palakkad';
UPDATE user_dashboard SET city = 'Davangere' WHERE city = 'Malappuram';
UPDATE user_dashboard SET city = 'Tumakuru' WHERE city = 'Kozhikode';
UPDATE user_dashboard SET city = 'Vijayapura' WHERE city = 'Wayanad';
UPDATE user_dashboard SET city = 'Udupi' WHERE city = 'Kannur';
UPDATE user_dashboard SET city = 'Hassan' WHERE city = 'Kasaragod';

UPDATE admin_charging_station_list SET Address = 'MG Road' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Lalbagh Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'Electronic City' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Sayyaji Rao Road' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Ashoka Road' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'Vijayanagar' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Balmatta Road' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'Kankanady' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Hampankatta' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Lamington Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'Vidyanagar' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gokul Road' WHERE Station_name = '456 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Shahapur' WHERE Station_name = '789 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Navanagar' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Jubilee Circle' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'Tilakwadi' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gandhi Nagar' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'Shahapur' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gandhi Bazar' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Kuvempu Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'B H Road' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Cantonment Road' WHERE Station_name = '456 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gandhinagar' WHERE Station_name = '789 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Hospet Road' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Sedam Road' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'Super Market Area' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Ring Road' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'PB Road' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Jayadeva Circle' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Vidyanagar' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'BH Road' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Jayanagar' WHERE Station_name = '456 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Ring Road' WHERE Station_name = '789 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Sindagi Road' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gol Gumbaz Road' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'Station Road' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Maruthi Veethika' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'Kundapura Road' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Manipal Road' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'BM Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'KR Puram' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gandhi Nagar' WHERE Station_name = '456 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Indira Gandhi Road' WHERE Station_name = '789 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Mallandur Road' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Kadur Road' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'Navanagar' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Jamakhandi Road' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gandhi Chowk' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Udgir Road' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Naya Kaman' WHERE Station_name = 'XYZ Charging Station';
UPDATE admin_charging_station_list SET Address = 'Gumpa Road' WHERE Station_name = '123 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Munjunatha Nagar' WHERE Station_name = '456 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Sindhanur Road' WHERE Station_name = '789 Charging Station';
UPDATE admin_charging_station_list SET Address = 'Station Road' WHERE Station_name = 'DEF Charging Station';
UPDATE admin_charging_station_list SET Address = 'Bangarpet Road' WHERE Station_name = 'GHI Charging Station';
UPDATE admin_charging_station_list SET Address = 'KGF Road' WHERE Station_name = 'JKL Charging Station';
UPDATE admin_charging_station_list SET Address = 'Chintamani Road' WHERE Station_name = 'MNO Charging Station';
UPDATE admin_charging_station_list SET Address = 'Holalkere Road' WHERE Station_name = 'PQR Charging Station';
UPDATE admin_charging_station_list SET Address = 'Basaveshwara Road' WHERE Station_name = 'ABC Charging Station';
UPDATE admin_charging_station_list SET Address = 'Rampura Road' WHERE Station_name = 'XYZ Charging Station';

UPDATE booking SET Address = 'MG Road' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Lalbagh Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'Electronic City' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Sayyaji Rao Road' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Ashoka Road' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'Vijayanagar' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Balmatta Road' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'Kankanady' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Hampankatta' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Lamington Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'Vidyanagar' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Gokul Road' WHERE Station_name = '456 Charging Station';
UPDATE booking SET Address = 'Shahapur' WHERE Station_name = '789 Charging Station';
UPDATE booking SET Address = 'Navanagar' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Jubilee Circle' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'Tilakwadi' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Gandhi Nagar' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'Shahapur' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Gandhi Bazar' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Kuvempu Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'B H Road' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Cantonment Road' WHERE Station_name = '456 Charging Station';
UPDATE booking SET Address = 'Gandhinagar' WHERE Station_name = '789 Charging Station';
UPDATE booking SET Address = 'Hospet Road' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Sedam Road' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'Super Market Area' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Ring Road' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'PB Road' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Jayadeva Circle' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Vidyanagar' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'BH Road' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Jayanagar' WHERE Station_name = '456 Charging Station';
UPDATE booking SET Address = 'Ring Road' WHERE Station_name = '789 Charging Station';
UPDATE booking SET Address = 'Sindagi Road' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Gol Gumbaz Road' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'Station Road' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Maruthi Veethika' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'Kundapura Road' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Manipal Road' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'BM Road' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'KR Puram' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Gandhi Nagar' WHERE Station_name = '456 Charging Station';
UPDATE booking SET Address = 'Indira Gandhi Road' WHERE Station_name = '789 Charging Station';
UPDATE booking SET Address = 'Mallandur Road' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Kadur Road' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'Navanagar' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Jamakhandi Road' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'Gandhi Chowk' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Udgir Road' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Naya Kaman' WHERE Station_name = 'XYZ Charging Station';
UPDATE booking SET Address = 'Gumpa Road' WHERE Station_name = '123 Charging Station';
UPDATE booking SET Address = 'Munjunatha Nagar' WHERE Station_name = '456 Charging Station';
UPDATE booking SET Address = 'Sindhanur Road' WHERE Station_name = '789 Charging Station';
UPDATE booking SET Address = 'Station Road' WHERE Station_name = 'DEF Charging Station';
UPDATE booking SET Address = 'Bangarpet Road' WHERE Station_name = 'GHI Charging Station';
UPDATE booking SET Address = 'KGF Road' WHERE Station_name = 'JKL Charging Station';
UPDATE booking SET Address = 'Chintamani Road' WHERE Station_name = 'MNO Charging Station';
UPDATE booking SET Address = 'Holalkere Road' WHERE Station_name = 'PQR Charging Station';
UPDATE booking SET Address = 'Basaveshwara Road' WHERE Station_name = 'ABC Charging Station';
UPDATE booking SET Address = 'Rampura Road' WHERE Station_name = 'XYZ Charging Station';
