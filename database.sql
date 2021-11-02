-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'OK','Czech Airlines','Czech Republic'),(2,'DL','Delta Air Lines','United States'),(3,'EW','Eurowings','Germany'),(4,'MU','China Eastern Airlines','China'),(5,'BA','British Airways','United Kingdom');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Guangzhou Baiyun International Airport','China','Guangdong','Guangzhou'),(2,'Hartsfield–Jackson Atlanta International Airport','United States','Georgia','Atlanta'),(3,'Chengdu Shuangliu International Airport','China','Sichuan','Chengdu'),(4,'Dallas/Fort Worth International Airport','United States','Texas','Dallas'),(5,'Shenzhen Bao\'an International Airport','China','Guangdong','Shenzhen'),(6,'Chongqing Jiangbei International Airport','China','Chongqing','Yubei'),(7,'Beijing Capital International Airport','China','Beijing','Beijing'),(8,'Denver International Airport','United States','Colorado','Denver'),(9,'Kunming Changshui International Airport','China','Yunnan','Kunming'),(10,'Shanghai Hongqiao International Airport','China','Shanghai','Shanghai'),(11,'Xi\'an Xianyang International Airport','China','Shaanxi','Xianyang'),(12,'Tokyo Haneda Airport','China','Tokyo','Tokyo'),(13,'O\'Hare International Airport','United States','Illinois','Chicago'),(14,'Shanghai Pudong International Airport','China','Shanghai','Shanghai'),(15,'Los Angeles International Airport','United States','California','Los Angeles'),(16,'Indira Gandhi International Airport','India','Delhi','Delhi'),(17,'Hangzhou Xiaoshan International Airport','China','Zhejiang','Hangzhou'),(18,'Charlotte Douglas International Airport','United States','North Carolina','Charlotte'),(19,'Dubai International Airport','United Arab Emirates','Dubai','Dubai'),(20,'Istanbul Airport','Turkey','Istanbul','Istanbul'),(21,'Charles de Gaulle Airport','France','Île-de-France','Paris'),(22,'Heathrow Airport','United Kingdom','London','London'),(23,'Mexico City International Airport','Mexico','Mexico City','Mexico City'),(24,'Phoenix Sky Harbor International Airport','United States','Arizona','Phoenix'),(25,'Tan Son Nhat International Airport','Vietnam','Ho Chi Minh City','Ho Chi Minh City'),(26,'Orlando International Airport','United States','Florida','Orlando'),(27,'Zhengzhou Xinzheng International Airport','China','Henan','Zhengzhou'),(28,'Jeju International Airport','South Korea','Jeju Province','Jeju City'),(29,'Amsterdam Airport Schiphol','Netherlands','North Holland','Haarlemmermeer'),(30,'São Paulo/Guarulhos International Airport','Brazil','Guarulhos','Guarulhos'),(31,'Seattle–Tacoma International Airport','United States','Washington','SeaTac'),(32,'Nanjing Lukou International Airport','China','Jiangsu','Nanjing'),(33,'Sheremetyevo International Airport','Russia','Moscow Oblast','Khimki'),(34,'Changsha Huanghua International Airport','China','Hunan','Changsha'),(35,'Frankfurt Airport','Germany','Hesse','Frankfurt'),(36,'Miami International Airport','United States','Florida','Miami'),(37,'George Bush Intercontinental Airport','United States','Texas','Houston'),(38,'Gimpo International Airport','South Korea','Seoul','Seoul'),(39,'Madrid Barajas Airport','Spain','Madrid','Madrid'),(40,'Istanbul Sabiha Gökçen International Airport','Turkey','Istanbul','Istanbul'),(41,'Xiamen Gaoqi International Airport','China','Fujian','Xiamen'),(42,'Suvarnabhumi Airport','Thailand','Samut Prakan','Bang Phli'),(43,'John F. Kennedy International Airport','United States','New York','New York'),(44,'Guiyang Longdongbao International Airport','China','Guizhou','Guiyang'),(45,'Haikou Meilan International Airport','China','Hainan','Haikou'),(46,'Fort Lauderdale–Hollywood International Airport','United States','Florida','Broward County'),(47,'San Francisco International Airport','United States','California','San Mateo Country'),(48,'Moscow Domodedovo Airport','Russia','Moscow Oblast','Domodedovo'),(49,'Beijing Daxing International Airport','China','Beijing','Beijing'),(50,'Newark Liberty International Airport','United States','New Jersey','Newark');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
INSERT INTO `baggage` VALUES (1,3.25,1),(2,2.13,1),(3,5.58,2),(4,3.07,2),(5,7.17,4);
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `baggage_check`
--

LOCK TABLES `baggage_check` WRITE;
/*!40000 ALTER TABLE `baggage_check` DISABLE KEYS */;
INSERT INTO `baggage_check` VALUES (1,'OK',NULL,1),(2,'OK',NULL,2),(3,'OK',NULL,3),(4,'PENDING','found fruit and vegetable',4),(5,'FAILED','not proper type of baggage',5);
/*!40000 ALTER TABLE `baggage_check` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `boarding_pass`
--

LOCK TABLES `boarding_pass` WRITE;
/*!40000 ALTER TABLE `boarding_pass` DISABLE KEYS */;
INSERT INTO `boarding_pass` VALUES (1,'lapsingw5vhj59i8h2xd'),(2,'6fea8nhpz0q3a5c82d5e'),(3,'qb5c6az8b5q3y6s5d8bb'),(4,'33agrtmhfcqb5c6az8b5'),(5,'6adcvbttrfasf58ecvbg'),(6,'saf5e8asc2ert9vfastg'),(7,'dalgfivclst58x6v2f4a');
/*!40000 ALTER TABLE `boarding_pass` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'confirmed','booking.com','2021-02-07 23:00:00','2021-02-07 23:00:00',7,1),(2,'confirmed','booking.com','2021-06-23 19:59:30','2021-06-24 06:22:30',8,2),(3,'pending','booking.com','2021-11-01 21:35:27','2021-11-01 21:35:27',39,3),(4,'confirmed','booking.com','2021-08-02 23:22:04','2021-08-02 23:22:04',16,4),(5,'cancelled','booking.com','2021-08-09 10:21:30','2021-09-01 15:12:30',3,5),(6,'confirmed','booking.com','2021-12-01 22:25:27','2021-12-01 22:25:27',9,6),(7,'confirmed','booking.com','2021-09-03 09:22:04','2021-09-03 09:22:04',10,7);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `booking_has_flights`
--

LOCK TABLES `booking_has_flights` WRITE;
/*!40000 ALTER TABLE `booking_has_flights` DISABLE KEYS */;
INSERT INTO `booking_has_flights` VALUES (1,1),(2,2),(4,3),(6,4),(7,5);
/*!40000 ALTER TABLE `booking_has_flights` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `covid_certificate`
--

LOCK TABLES `covid_certificate` WRITE;
/*!40000 ALTER TABLE `covid_certificate` DISABLE KEYS */;
INSERT INTO `covid_certificate` VALUES (1,'URN:UVCI:01:CZ:EHSU2S4F8YYYQVKMW5DF7BDYGEACB9D2','YES',1),(2,'URN:UVCI:01:CZ:EHSU2SAFKLMSDNFNA5DF7BDYGEASASCVE','YES',6),(3,'URN:UVCI:03:CZ:ASDJKLNKMNASMNDKW5DF7BDYGEASPXIQ2','YES',7),(4,'URN:UVCI:11:CZ:EHSWASDMNWAMNIXKWJA7BDYGEASA3Q5','NO',13),(5,'URN:UVCI:05:CZ:EHSU2S4F8YYYQVKMW5DASDAWKJJSKWJS','YES',8);
/*!40000 ALTER TABLE `covid_certificate` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'J44','A13',1,9,2),(2,'C23','B19',6,7,3),(3,'B1','A8',34,20,4),(4,'C5','A1',1,2,5),(5,'A7','A2',14,34,4);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `no_fly_list`
--

LOCK TABLES `no_fly_list` WRITE;
/*!40000 ALTER TABLE `no_fly_list` DISABLE KEYS */;
INSERT INTO `no_fly_list` VALUES (1,'2020-03-15','2120-03-15','suspected member of terorist organization',43),(2,'2017-07-19','2117-07-19','member of terorist organization',28),(3,'2003-01-01','2006-01-01','insulting other passangers during flight',38),(4,'2005-11-12','2010-11-12','damaging airline seats during flight',40),(5,'2011-12-11','2051-12-11','dangerous criminal',46);
/*!40000 ALTER TABLE `no_fly_list` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Pavel','Ostrý','2001-03-21','Czech Republic','Czech Republic','16851250'),(2,'Karolína','Kopřivová','1984-10-06','Czech Republic','Czech Republic','95723548'),(3,'Věra','Štarhová','1989-04-25','Czech Republic','Czech Republic','68745135'),(4,'Marie','Hrbáčová','1939-04-01','Czech Republic','Czech Republic','54862418'),(5,'Tereza','Kadlečková','1953-02-06','Czech Republic','Czech Republic','85245600'),(6,'Michael','Dohnal','1990-02-22','Czech Republic','Czech Republic','21557896'),(7,'Aleš','Mach','1955-08-19','Czech Republic','Czech Republic','78965412'),(8,'Pavel','Mach','1982-03-08','Czech Republic','Czech Republic','35412856'),(9,'Leona','Ottová','1996-11-22','Czech Republic','Czech Republic','32165485'),(10,'Elena','Juráková','1985-12-06','Czech Republic','Czech Republic','84563572'),(11,'Rostislav','Bartík','1979-07-15','Czech Republic','Czech Republic','55588866'),(12,'Helena','Štorkánová','2009-12-04','Czech Republic','Czech Republic','65488749'),(13,'Marie','Petrželová','1973-10-25','Czech Republic','Czech Republic','35445123'),(14,'Miroslav','Bošek','1978-09-13','Czech Republic','Germany','65485521'),(15,'Miroslav','Černý','1996-07-07','Czech Republic','Canada','33215789'),(16,'Jiřina','Hermanová','2007-06-29','Czech Republic','Brazil','54877862'),(17,'David','Novák','1997-04-20','Czech Republic','France','24158796'),(18,'František','Marek','1969-02-21','Czech Republic','Austria','95632157'),(19,'Monika','Pechanová','1997-12-14','Czech Republic','Estonia','22115588'),(20,'Michala','Jeriová','1990-07-05','Czech Republic','Tunisia','35125870'),(21,'Louis','Eusebio','1971-03-03','United States','United States','57803651'),(22,'Toya','Benally','1965-05-27','United States','United States','45122500'),(23,'Katie','Raymond','1989-04-12','United States','United States','32521356'),(24,'Christiana','Summerfield','1995-06-11','United States','United States','65488004'),(25,'Marry','Puccio','2003-12-21','United States','United States','54009573'),(26,'Larry','Crowley','2005-06-09','United States','United States','65248900'),(27,'James','Jones','1987-11-16','United States','Poland','20062048'),(28,'Ed','Jason','1963-07-03','United States','Tunisia','65002587'),(29,'Eugine','Conrad','1988-09-11','United States','Sweden','97060842'),(30,'John','Houston','1998-11-04','United States','Switzeland','03654028'),(31,'George','Savage','1983-11-05','United States','United Kingdom','60054826'),(32,'Elliot','Reyes','1982-08-22','United States','Belgium','89632175'),(33,'Neil','Harris','1958-10-28','United States','Brazil','00585200'),(34,'Edward','Bray','1974-01-23','United States','Austria','65090275'),(35,'Manuela','Nagel','1957-10-03','Germany','Germany','15589635'),(36,'Thomas','Fenstermacher','1996-05-05','Germany','Germany','32896540'),(37,'Uta','Farber','2006-07-13','Germany','Germany','59674005'),(38,'Sussane','Eggers','1954-02-22','Germany','Germany','68000528'),(39,'Marco','Friedman','1952-12-23','Germany','Germany','20080540'),(40,'Marcel','Gerste','1992-09-26','Germany','Germany','97080506'),(41,'Monika','Herzog','1969-03-21','Germany','Germany','56984000'),(42,'Swen','Seiler','1980-04-18','Germany','Czech Republic','00580548'),(43,'Philipp','Herman','1949-06-16','Germany','Poland','50487365'),(44,'Vanessa','Kaufmann','1963-08-02','Germany','Estonia','60154780'),(45,'Kristian','Voglet','1967-03-27','Germany','Finland','02459024'),(46,'Sabrina','Fuerst','1994-02-23','Germany','France','06900582'),(47,'Lena','Hertzog','1998-05-19','Germany','Spain','99085460'),(48,'Florian','Neudorf','1991-09-20','Germany','Sweden','30069087'),(49,'Leon','Gerste','1957-11-01','Germany','Portugal','30685420'),(50,'Ralph','Kastner','1966-02-12','Germany','Italy','56804569');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `security_check`
--

LOCK TABLES `security_check` WRITE;
/*!40000 ALTER TABLE `security_check` DISABLE KEYS */;
INSERT INTO `security_check` VALUES (1,'OK',NULL,'2021-10-31 23:00:00','2021-10-31 23:00:00',7),(2,'OK',NULL,'2021-10-28 22:00:00','2021-10-28 22:00:00',8),(3,'OK',NULL,'2021-10-19 22:00:00','2021-10-19 22:00:00',16),(4,'OK',NULL,'2021-10-06 22:00:00','2021-10-06 22:00:00',9),(5,'OK',NULL,'2021-10-24 22:00:00','2021-10-24 22:00:00',10);
/*!40000 ALTER TABLE `security_check` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02  8:41:13
