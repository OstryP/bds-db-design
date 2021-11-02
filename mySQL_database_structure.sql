-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage` (
  `id` int NOT NULL,
  `weight_in_kg` decimal(4,2) NOT NULL,
  `booking_id` int NOT NULL,
  PRIMARY KEY (`id`,`booking_id`),
  KEY `fk_baggage_booking1_idx` (`booking_id`),
  CONSTRAINT `fk_baggage_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baggage_check`
--

DROP TABLE IF EXISTS `baggage_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage_check` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_result` varchar(20) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `baggage_id` int NOT NULL,
  PRIMARY KEY (`id`,`baggage_id`),
  KEY `fk_baggage_check_baggage1_idx` (`baggage_id`),
  CONSTRAINT `fk_baggage_check_baggage1` FOREIGN KEY (`baggage_id`) REFERENCES `baggage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `boarding_pass`
--

DROP TABLE IF EXISTS `boarding_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boarding_pass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `booking_platform` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `passenger_id` bigint NOT NULL,
  `boarding_pass_id` int NOT NULL,
  PRIMARY KEY (`id`,`passenger_id`,`boarding_pass_id`),
  KEY `fk_booking_passengers1_idx` (`passenger_id`),
  KEY `fk_booking_boarding_pass1_idx` (`boarding_pass_id`),
  CONSTRAINT `fk_booking_boarding_pass1` FOREIGN KEY (`boarding_pass_id`) REFERENCES `boarding_pass` (`id`),
  CONSTRAINT `fk_booking_passengers1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking_has_flights`
--

DROP TABLE IF EXISTS `booking_has_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_has_flights` (
  `booking_id` int NOT NULL,
  `flights_id` int NOT NULL,
  PRIMARY KEY (`booking_id`,`flights_id`),
  KEY `fk_booking_has_flights_flights1_idx` (`flights_id`),
  KEY `fk_booking_has_flights_booking1_idx` (`booking_id`),
  CONSTRAINT `fk_booking_has_flights_booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `fk_booking_has_flights_flights1` FOREIGN KEY (`flights_id`) REFERENCES `flights` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `covid_certificate`
--

DROP TABLE IF EXISTS `covid_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_certificate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `valid` varchar(20) NOT NULL,
  `passenger_id` bigint NOT NULL,
  PRIMARY KEY (`id`,`passenger_id`),
  KEY `fk_covid_certificate_passenger1_idx` (`passenger_id`),
  CONSTRAINT `fk_covid_certificate_passenger1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departing_gate` varchar(20) NOT NULL,
  `arriving_gate` varchar(20) NOT NULL,
  `departing_airport_id` int NOT NULL,
  `arriving_airport_id` int NOT NULL,
  `airline_id` int NOT NULL,
  PRIMARY KEY (`id`,`departing_airport_id`,`arriving_airport_id`,`airline_id`),
  KEY `fk_flights_airport1_idx` (`departing_airport_id`),
  KEY `fk_flights_airport2_idx` (`arriving_airport_id`),
  KEY `fk_flights_airline1_idx` (`airline_id`),
  CONSTRAINT `fk_flights_airline1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  CONSTRAINT `fk_flights_airport1` FOREIGN KEY (`departing_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `fk_flights_airport2` FOREIGN KEY (`arriving_airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `no_fly_list`
--

DROP TABLE IF EXISTS `no_fly_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_fly_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `no_fly_reason` varchar(500) DEFAULT NULL,
  `passenger_id` bigint NOT NULL,
  PRIMARY KEY (`id`,`passenger_id`),
  KEY `fk_no_fly_list_passenger1_idx` (`passenger_id`),
  CONSTRAINT `fk_no_fly_list_passenger1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` bigint NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `country_of_citizenship` varchar(45) NOT NULL,
  `country_of_residence` varchar(45) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `security_check`
--

DROP TABLE IF EXISTS `security_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_check` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_results` varchar(20) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `passenger_id` bigint NOT NULL,
  PRIMARY KEY (`id`,`passenger_id`),
  KEY `fk_security_check_passengers_idx` (`passenger_id`),
  CONSTRAINT `fk_security_check_passengers` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02  9:47:26
