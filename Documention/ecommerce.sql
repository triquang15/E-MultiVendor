CREATE DATABASE  IF NOT EXISTS `emultivendor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `emultivendor`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: emultivendor
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `default_address` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn3sth7s3kur1rafwbbrqqnswt` (`country_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKn3sth7s3kur1rafwbbrqqnswt` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `published` bit(1) NOT NULL,
  `title` varchar(256) NOT NULL,
  `type` int DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlc3sm3utetrj1sx4v9ahwopnr` (`user_id`),
  CONSTRAINT `FKlc3sm3utetrj1sx4v9ahwopnr` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  `title` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7q9ccqoo9wjtt4otbjyp5flrn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oce3937d2f4mpfqrycbr0l93m` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (6,'REDROCK','brand-1.png'),(7,'PEGASUS','brand-2.png'),(8,'QUICKEN','brand-3.png'),(9,'ROCKER','brand-4.png'),(10,'MAGENTA','brand-5.png'),(11,'EXTEND','brand-6.png'),(12,'SECRET','brand-7.png'),(13,'EMATIC','brand-8.png'),(14,'VAERON','brand-9.png'),(15,'AVANCE','brand-10.png'),(16,'SABECAMP','brand-11.png'),(17,'CORE','brand-12.png');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_categories`
--

DROP TABLE IF EXISTS `brands_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands_categories` (
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`brand_id`,`category_id`),
  KEY `FK6x68tjj3eay19skqlhn7ls6ai` (`category_id`),
  CONSTRAINT `FK58ksmicdguvu4d7b6yglgqvxo` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK6x68tjj3eay19skqlhn7ls6ai` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_categories`
--

LOCK TABLES `brands_categories` WRITE;
/*!40000 ALTER TABLE `brands_categories` DISABLE KEYS */;
INSERT INTO `brands_categories` VALUES (16,1),(8,2),(14,3),(13,4),(12,5),(6,6),(15,8),(7,9),(9,10),(16,11),(7,12),(17,12),(7,13),(6,14),(7,15),(17,15),(15,16),(10,17),(15,18),(6,19),(6,20),(14,21),(15,22),(17,22),(11,23),(16,24),(17,24),(15,25),(16,25),(7,26),(17,26),(16,27),(16,28),(8,29),(9,30),(9,31),(9,32),(10,33),(11,34),(11,35),(11,36),(12,37),(12,38),(12,39),(13,40),(13,41),(13,42),(14,43);
/*!40000 ALTER TABLE `brands_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdagcsk6v6x4n1kxw3rkp57921` (`customer_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKdagcsk6v6x4n1kxw3rkp57921` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `alias` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `all_parent_ids` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Men Clothes',' Women\'s Fashion','1.png',_binary '',NULL,NULL),(2,'Mobile & Gadgets','Mobile & Gadgets','2.png',_binary '',NULL,NULL),(3,'Consumer Electronics','Consumer Electronics','3.png',_binary '',NULL,NULL),(4,'Computer & Accessories','Computer & Accessories','4.png',_binary '',NULL,NULL),(5,'Cameras','Cameras','5.png',_binary '',NULL,NULL),(6,'Watches','Watches','6.png',_binary '',NULL,NULL),(7,'Men Shoes','Men Shoes','7.png',_binary '',NULL,NULL),(8,'Home Appliances','Home Appliances','8.png',_binary '',NULL,NULL),(9,'Sport & Outdoor','Sport & Outdoor','9.png',_binary '',NULL,NULL),(10,'Automotive','Automotive','10.png',_binary '',NULL,NULL),(11,'Men Bags','Men Bags','11.png',_binary '',NULL,NULL),(12,'Toys','Toys','12.png',_binary '',NULL,NULL),(13,'Pets','Pets','13.png',_binary '',NULL,NULL),(14,'Women Clothes','Women Clothes','14.png',_binary '',NULL,NULL),(15,'Moms, Kids & Babies','Moms, Kids & Babies','15.png',_binary '',NULL,NULL),(16,'Home & Living','Home & Living','16.png',_binary '',NULL,NULL),(17,'Beauty','Beauty','17.png',_binary '',NULL,NULL),(18,'Health','Health','18.png',_binary '\0',NULL,NULL),(19,'Women Shoes','Women Shoes','19.png',_binary '',NULL,NULL),(20,'Women Bags','Women Bags','20.png',_binary '',NULL,NULL),(21,'Fashion Accessories','Fashion Accessories','21.png',_binary '',NULL,NULL),(22,'Grocery','Grocery','23.png',_binary '',NULL,NULL),(23,'Books & Stationery','Books & Stationery','24.png',_binary '',NULL,NULL),(24,'Kid Fashion','Kid Fashion','25.png',_binary '',NULL,NULL),(25,'Home care','Home care','26.png',_binary '',NULL,NULL),(26,'Tickets, Vouchers & Services','Tickets, Vouchers & Services','27.png',_binary '',NULL,NULL),(27,'Jackets, Coats & Vests','Jackets, Coats & Vests','1.png',_binary '\0',1,'-1-'),(28,'Suit Jackets & Blazers','Suit Jackets & Blazers','feat-product-11.jpg',_binary '',1,'-1-'),(29,'Mobile Phones','Mobile Phones','7a23bb82197be858affc76168ee91637.jpg',_binary '',2,'-2-'),(30,'Bike, E-bike','Bike, E-bike','a2be913bbe1f521a4854bbc09e03b58b_tn.jpg',_binary '\0',10,'-10-'),(31,'Motorbike','Motorbike','cc416f288b22a9888b24c1d59896c767_tn.jpg',_binary '',10,'-10-'),(32,'Car','Car','cb3006fd4ff79e9ba811265b1a2f1f11_tn.jpg',_binary '\0',10,'-10-'),(33,'Skincare','Skincare','9e72ea128b312d6511da97d7a7a9f7c3_tn.jpg',_binary '',17,'-17-'),(34,'Domestic Books','Domestic Books','5a95eb77ff019fa302c03f6fdbcec59d_tn.jpg',_binary '\0',23,'-23-'),(35,'Foreign Books','Foreign Books','sg-11134201-22090-i9xd1it0uxhv57_tn.jpg',_binary '\0',23,'-23-'),(36,'Gift & Wrapping','Gift & Wrapping','181063df8d932814c4a7c02b52b5ef6d_tn.jpg',_binary '\0',23,'-23-'),(37,'Security Cameras & Systems','Security Cameras & Systems','sg-11134201-22100-h2p8ml50fjiv50_tn.jpg',_binary '',5,'-5-'),(38,'Memory Cards','Memory Cards','20a11f8920777bd81460605e330a3b4d_tn.jpg',_binary '\0',5,'-5-'),(39,'Lenses','Lenses','df7930bd3e086839f84a70243ec68150_tn.jpg',_binary '',5,'-5-'),(40,'Desktop Computers','Desktop Computers','sg-11134201-22100-xxt1i5c6vsiv75_tn.jpg',_binary '',4,'-4-'),(41,'Data Storage','Data Storage','a380742770f849017cf5d1fd153c68c4_tn.jpg',_binary '\0',4,'-4-'),(42,'Network Components','Network Components','8e18eb2e6ffdf78742ec6e84fc9968bf_tn.jpg',_binary '\0',4,'-4-'),(43,'Wearable Devices','Wearable Devices','d11d015530c2a9e4b882b6e44b7c5740_tn.jpg',_binary '\0',3,'-3-');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` varchar(4096) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Ho Chi Minh - Viet Nam','alonso@yahoo.com','How Are You ?','Tri  Quang','0987645761');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Andorra','AD'),(2,'United Arab Emirates','AE'),(3,'Afghanistan','AF'),(4,'Antigua and Barbuda','AG'),(5,'Anguilla','AI'),(6,'Albania','AL'),(7,'Armenia','AM'),(8,'Netherlands Antilles','AN'),(9,'Angola','AO'),(10,'Antarctica','AQ'),(11,'Argentina','AR'),(12,'American Samoa','AS'),(13,'Austria','AT'),(14,'Australia','AU'),(15,'Aruba','AW'),(16,'Åland Islands','AX'),(17,'Azerbaijan','AZ'),(18,'Bosnia and Herzegovina','BA'),(19,'Barbados','BB'),(20,'Bangladesh','BD'),(21,'Belgium','BE'),(22,'Burkina Faso','BF'),(23,'Bulgaria','BG'),(24,'Bahrain','BH'),(25,'Burundi','BI'),(26,'Benin','BJ'),(27,'Saint Barthélemy','BL'),(28,'Bermuda','BM'),(29,'Brunei','BN'),(30,'Bolivia','BO'),(31,'Bonaire, Sint Eustatius and Saba','BQ'),(32,'Brazil','BR'),(33,'Bahamas','BS'),(34,'Bhutan','BT'),(35,'Bouvet Island','BV'),(36,'Botswana','BW'),(37,'Belarus','BY'),(38,'Belize','BZ'),(39,'Canada','CA'),(40,'Cocos Islands','CC'),(41,'The Democratic Republic Of Congo','CD'),(42,'Central African Republic','CF'),(43,'Congo','CG'),(44,'Switzerland','CH'),(45,'Côte d\'Ivoire','CI'),(46,'Cook Islands','CK'),(47,'Chile','CL'),(48,'Cameroon','CM'),(49,'China','CN'),(50,'Colombia','CO'),(51,'Costa Rica','CR'),(52,'Cuba','CU'),(53,'Cape Verde','CV'),(54,'Curaçao','CW'),(55,'Christmas Island','CX'),(56,'Cyprus','CY'),(57,'Czech Republic','CZ'),(58,'Germany','DE'),(59,'Djibouti','DJ'),(60,'Denmark','DK'),(61,'Dominica','DM'),(62,'Dominican Republic','DO'),(63,'Algeria','DZ'),(64,'Ecuador','EC'),(65,'Estonia','EE'),(66,'Egypt','EG'),(67,'Western Sahara','EH'),(68,'Eritrea','ER'),(69,'Spain','ES'),(70,'Ethiopia','ET'),(71,'Finland','FI'),(72,'Fiji','FJ'),(73,'Falkland Islands','FK'),(74,'Micronesia','FM'),(75,'Faroe Islands','FO'),(76,'France','FR'),(77,'Gabon','GA'),(78,'United Kingdom','GB'),(79,'Grenada','GD'),(80,'Georgia','GE'),(81,'French Guiana','GF'),(82,'Guernsey','GG'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greenland','GL'),(86,'Gambia','GM'),(87,'Guinea','GN'),(88,'Guadeloupe','GP'),(89,'Equatorial Guinea','GQ'),(90,'Greece','GR'),(91,'South Georgia And The South Sandwich Islands','GS'),(92,'Guatemala','GT'),(93,'Guam','GU'),(94,'Guinea-Bissau','GW'),(95,'Guyana','GY'),(96,'Hong Kong','HK'),(97,'Heard Island And McDonald Islands','HM'),(98,'Honduras','HN'),(99,'Croatia','HR'),(100,'Haiti','HT'),(101,'Hungary','HU'),(102,'Indonesia','ID'),(103,'Ireland','IE'),(104,'Israel','IL'),(105,'Isle Of Man','IM'),(106,'India','IN'),(107,'British Indian Ocean Territory','IO'),(108,'Iraq','IQ'),(109,'Iran','IR'),(110,'Iceland','IS'),(111,'Italy','IT'),(112,'Jersey','JE'),(113,'Jamaica','JM'),(114,'Jordan','JO'),(115,'Japan','JP'),(116,'Kenya','KE'),(117,'Kyrgyzstan','KG'),(118,'Cambodia','KH'),(119,'Kiribati','KI'),(120,'Comoros','KM'),(121,'Saint Kitts And Nevis','KN'),(122,'North Korea','KP'),(123,'South Korea','KR'),(124,'Kuwait','KW'),(125,'Cayman Islands','KY'),(126,'Kazakhstan','KZ'),(127,'Laos','LA'),(128,'Lebanon','LB'),(129,'Saint Lucia','LC'),(130,'Liechtenstein','LI'),(131,'Sri Lanka','LK'),(132,'Liberia','LR'),(133,'Lesotho','LS'),(134,'Lithuania','LT'),(135,'Luxembourg','LU'),(136,'Latvia','LV'),(137,'Libya','LY'),(138,'Morocco','MA'),(139,'Monaco','MC'),(140,'Moldova','MD'),(141,'Montenegro','ME'),(142,'Saint Martin','MF'),(143,'Madagascar','MG'),(144,'Marshall Islands','MH'),(145,'Macedonia','MK'),(146,'Mali','ML'),(147,'Myanmar','MM'),(148,'Mongolia','MN'),(149,'Macao','MO'),(150,'Northern Mariana Islands','MP'),(151,'Martinique','MQ'),(152,'Mauritania','MR'),(153,'Montserrat','MS'),(154,'Malta','MT'),(155,'Mauritius','MU'),(156,'Maldives','MV'),(157,'Malawi','MW'),(158,'Mexico','MX'),(159,'Malaysia','MY'),(160,'Mozambique','MZ'),(161,'Namibia','NA'),(162,'New Caledonia','NC'),(163,'Niger','NE'),(164,'Norfolk Island','NF'),(165,'Nigeria','NG'),(166,'Nicaragua','NI'),(167,'Netherlands','NL'),(168,'Norway','NO'),(169,'Nepal','NP'),(170,'Nauru','NR'),(171,'Niue','NU'),(172,'New Zealand','NZ'),(173,'Oman','OM'),(174,'Panama','PA'),(175,'Peru','PE'),(176,'French Polynesia','PF'),(177,'Papua New Guinea','PG'),(178,'Philippines','PH'),(179,'Pakistan','PK'),(180,'Poland','PL'),(181,'Saint Pierre And Miquelon','PM'),(182,'Pitcairn','PN'),(183,'Puerto Rico','PR'),(184,'Palestine','PS'),(185,'Portugal','PT'),(186,'Palau','PW'),(187,'Paraguay','PY'),(188,'Qatar','QA'),(189,'Reunion','RE'),(190,'Romania','RO'),(191,'Serbia','RS'),(192,'Russia','RU'),(193,'Rwanda','RW'),(194,'Saudi Arabia','SA'),(195,'Solomon Islands','SB'),(196,'Seychelles','SC'),(197,'Sudan','SD'),(198,'Sweden','SE'),(199,'Singapore','SG'),(200,'Saint Helena','SH'),(201,'Slovenia','SI'),(202,'Svalbard And Jan Mayen','SJ'),(203,'Slovakia','SK'),(204,'Sierra Leone','SL'),(205,'San Marino','SM'),(206,'Senegal','SN'),(207,'Somalia','SO'),(208,'Suriname','SR'),(209,'South Sudan','SS'),(210,'Sao Tome And Principe','ST'),(211,'El Salvador','SV'),(212,'Sint Maarten (Dutch part)','SX'),(213,'Syria','SY'),(214,'Swaziland','SZ'),(215,'Turks And Caicos Islands','TC'),(216,'Chad','TD'),(217,'French Southern Territories','TF'),(218,'Togo','TG'),(219,'Thailand','TH'),(220,'Tajikistan','TJ'),(221,'Tokelau','TK'),(222,'Timor-Leste','TL'),(223,'Turkmenistan','TM'),(224,'Tunisia','TN'),(225,'Tonga','TO'),(226,'Turkey','TR'),(227,'Trinidad and Tobago','TT'),(228,'Tuvalu','TV'),(229,'Taiwan','TW'),(230,'Tanzania','TZ'),(231,'Ukraine','UA'),(232,'Uganda','UG'),(233,'United States Minor Outlying Islands','UM'),(234,'United States','US'),(235,'Uruguay','UY'),(236,'Uzbekistan','UZ'),(237,'Vatican','VA'),(238,'Saint Vincent And The Grenadines','VC'),(239,'Venezuela','VE'),(240,'British Virgin Islands','VG'),(241,'U.S. Virgin Islands','VI'),(242,'Vietnam','VN'),(243,'Vanuatu','VU'),(244,'Wallis And Futuna','WF'),(245,'Samoa','WS'),(246,'Yemen','YE'),(247,'Mayotte','YT'),(248,'South Africa','ZA'),(249,'Zambia','ZM'),(250,'Zimbabwe','ZW'),(253,'New Country','CCN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'United States Dollar','$','USD'),(2,'British Pound','£','GPB'),(3,'Japanese Yen','¥','JPY'),(4,'Euro','€','EUR'),(5,'Russian Ruble','₽','RUB'),(6,'South Korean Won','₩','KRW'),(7,'Chinese Yuan','¥','CNY'),(8,'Brazilian Real','R$','BRL'),(9,'Australian Dollar','$','AUD'),(10,'Canadian Dollar','$','CAD'),(11,'Vietnamese đồng ','₫','VND'),(12,'Indian Rupee','₹','INR');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  `postal_code` varchar(10) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `authentication_type` varchar(10) DEFAULT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'triquang.15qt@gmail.com','','Quang','Trí','','',NULL,'','',234,'','2022-11-01 17:15:34.908000',_binary '',NULL,'GOOGLE',NULL),(2,'triquang.95qt@gmail.com','','Quang','Trí','','',NULL,'','',234,'','2022-11-01 17:18:01.098000',_binary '',NULL,'GOOGLE',NULL),(3,'triquang.74qt@gmail.com','$2a$10$mkN/Jh4dOUx9eTll/xWKGuF.Q5E5bwnEpCJcH50lldX5EvQufKl8a','Trí','Quang','','',NULL,'','',234,'','2022-11-01 17:19:06.656000',_binary '',NULL,'FACEBOOK',NULL),(4,'quangtri.nguyen@dxc.com','$2a$10$yjimF2bcjg1VWdj8sMFKhuigJVDL0qfMN./H9M90eDEMI4648DhpK','Tri','Quang','0987774191','Viet Nam','Ho Chi Minh','Ha Noi','Cambridge',10,'122425678','2022-11-01 18:12:37.539000',_binary '',NULL,'DATABASE','14DmRRI2xLGlBpeYWXE9MCf9tes9Hy'),(5,'adalane.18@gmail.com','$2a$10$jyIgB3l.699w1986AoOFquHjRgeAmSacZLMo9PvpxMoWBfdsvqKvO','Tri','Quang','0987774191',' ',' ',' ','Cambridge',13,' ','2022-11-03 20:10:58.071000',_binary '\0','7twMy1xlZ47ibCbklpG2gNqQnKR0UudCA9OBK2pKpTSpsONdH9cVe9ILbLq5nPFo','DATABASE',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `position` int NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7fcv9rm1ecfeumh1lo4tuntgm` (`alias`),
  UNIQUE KEY `UK_752mo4d1g26knhksum5pek87` (`title`),
  KEY `FKa5eajuapjflm0jk7xh5mangy5` (`article_id`),
  CONSTRAINT `FKa5eajuapjflm0jk7xh5mangy5` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` float NOT NULL,
  `subtotal` float NOT NULL,
  `product_cost` float NOT NULL,
  `shipping_cost` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_track` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31jv1s212kajfn3kk1ksmnyfl` (`order_id`),
  CONSTRAINT `FK31jv1s212kajfn3kk1ksmnyfl` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `product_cost` float NOT NULL,
  `shipping_cost` float NOT NULL,
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` varchar(45) NOT NULL,
  `deliver_days` int NOT NULL,
  `deliver_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (4,'Vocalism Principle','Dynamic',2),(5,'Style','Over the Ear',2),(6,'Control Button','Yes',2),(7,'Material','Fabric',2),(8,'Certification','CE',2),(9,'Waterproof','Dynamic',3),(10,'Print length','464 pages',3),(11,'Vocalism Principle','Over the Ear',3),(12,'Origin','Mainland China',4),(13,'Codecs','AAC',4),(14,'Vocalism Principle','Over the Ear',4),(15,'Style','Dynamic',4),(16,'Style','Over the Ear',5),(17,'Control Button','Yes',5),(18,'Plug Type','Line Type',5),(19,'Material','Fabric',5),(20,'Print length','352 pages',6),(21,'Vocalism Principle','Dynamic',6),(22,'Screen','Over the Ear',6),(23,'Chip','A16 Bionic chip — superfast and superefficient for amazing all-day battery life',7),(24,'Vocalism Principle','Dynamic',7),(25,'Chip','Over the Ear',7),(38,'Vocalism Principle','Dynamic',1),(39,'Print length','464 pages',1),(40,'Style','OLED6.1\"Super Retina XDR',1),(41,'Style','Over the Ear',2),(42,'Plug Type','Line Type',2),(43,'Material','Fabric',2),(44,'Print length','352 pages',3),(45,'Screen','A16 Bionic chip — superfast and superefficient for amazing all-day battery life',3),(46,'Style','Dynamic',3),(47,'Print length','464 pages',5),(48,'Screen','A16 Bionic chip — superfast and superefficient for amazing all-day battery life',5),(49,'Style','Over the Ear',5),(50,'Print length','OLED6.1\"Super Retina XDR',6),(51,'Style','A16 Bionic chip — superfast and superefficient for amazing all-day battery life',6),(52,'Vocalism Principle','Dynamic',6),(53,'Print length','464 pages',7);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (5,'1.jpg',2),(7,'top-product-3.png',4),(8,'2.jpg',5),(9,'2.jpg',6),(10,'72fcedfd601c115d315384e0f491c1a6_tn.jpg',7),(15,'2.jpg',1),(16,'2.jpg',2),(17,'1.jpg',3),(18,'3.jpg',5),(19,'3.jpg',6),(20,'916053f2e7a8d217b8878e44b08012b8.jpg',7),(21,'4.jpg',6),(22,'4.jpg',1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `alias` varchar(256) NOT NULL,
  `short_description` varchar(4096) NOT NULL,
  `full_description` varchar(4096) NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `in_stock` bit(1) DEFAULT b'1',
  `cost` float NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `discount_percent` float DEFAULT '0',
  `length` float NOT NULL DEFAULT '0',
  `width` float NOT NULL DEFAULT '0',
  `height` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `average_rating` float NOT NULL,
  `review_count` int NOT NULL,
  `shop_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8qwq8q3hk7cxkp9gruxupnif5` (`alias`),
  UNIQUE KEY `UK_o61fmio5yukmmiqgnxf8pnavn` (`name`),
  KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  KEY `FK7kp8sbhxboponhx3lxqtmkcoj` (`shop_id`),
  KEY `FK29w1glmsx19fyn0ts34ak8pc5` (`customer_id`),
  FULLTEXT KEY `products_FTS` (`name`,`short_description`,`full_description`),
  CONSTRAINT `FK29w1glmsx19fyn0ts34ak8pc5` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FK7kp8sbhxboponhx3lxqtmkcoj` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`),
  CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'26 inch sport bike','26-inch-sport-bike','<div><span style=\"color: rgb(96, 96, 96); font-family: Poppins, sans-serif; display: inline !important;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</span><br></div>','<div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div></div>','1.jpg','2022-11-04 18:28:06.640000','2022-11-05 21:08:12.723000',_binary '',_binary '',3,136,3,3,2,3,2,9,30,4,0,4,3),(2,'White short ','White-short-','<div><span style=\"color: rgb(96, 96, 96); font-family: Poppins, sans-serif; display: inline !important;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</span><br></div>','<div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div></div>','1.jpg','2022-11-04 18:30:51.131000','2022-11-05 21:14:07.775000',_binary '',_binary '',4,59,2,2,3,2,1,16,25,5,0,6,3),(3,'White short Flower','White-short-Flower','<div><span style=\"color: rgb(96, 96, 96); font-family: Poppins, sans-serif; display: inline !important;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</span><br></div>','<div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div></div>','flash-deal-3.jpg','2022-11-04 18:34:17.751000','2022-11-05 21:15:09.695000',_binary '',_binary '',5,235,35,2,1,3,3,11,23,4,0,5,3),(5,'Women\'s handbag, crossbody bag MIRRO','Women\'s-handbag,-crossbody-bag-MIRRO','<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</div>','<div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div></div>','1.jpg','2022-11-04 18:38:23.970000','2022-11-05 21:05:37.510000',_binary '',_binary '',3,99,25,3,2,4,3,17,24,5,0,6,3),(6,'Apple iPhone 11','Apple-iPhone-11','<div><span style=\"color: rgb(96, 96, 96); font-family: Poppins, sans-serif; display: inline !important;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</span><br></div>','<div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div></div>','1.jpg','2022-11-04 18:40:29.205000','2022-11-05 20:53:23.893000',_binary '',_binary '',5,123,4,2,3,1,2,8,29,4.5,0,1,3),(7,'EVA Women\'s Sandals 2','EVA-Women\'s-Sandals-2','<span style=\"color: rgb(96, 96, 96); font-family: Poppins, sans-serif; display: inline !important;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae rerum eveniet esse modi nemo mollitia. Vitae adipisci ab nulla sequi fuga saepe harum placeat voluptatibus ea quam, assumenda illum natus.</span><br>','<div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div><div>consectetur, venison ipsum flank hamburger bacon tri-tip. Eu duis est cupidatat prosciutto alcatra, consectetur aute velit shoulder shankle ham ho Cillum deserunt velit dolor, beef ribs excepteur hamburger flank occaecat. Qui dolor flank picanha t-bone lorem</div><div class=\"row\" style=\"--bs-gutter-x:1.5rem; --bs-gutter-y:0; margin-top: calc(-1 * var(--bs-gutter-y)); margin-right: calc(-0.5 * var(--bs-gutter-x)); margin-left: calc(-0.5 * var(--bs-gutter-x)); color: rgb(33, 37, 41); font-family: Poppins, sans-serif;\"><div class=\"col-lg-4 col-md-6\" style=\"width: 399.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div class=\"part-img\" style=\"padding-top: 6px; padding-bottom: 24px;\"><img src=\"https://revelecommerce.codebasket.net/assets/images/product-dscr-img.jpg\" alt=\"Image\"></div></div><div class=\"col-lg-8 col-md-6\" style=\"width: 799.99px; padding-right: calc(var(--bs-gutter-x) * 0.5); padding-left: calc(var(--bs-gutter-x) * 0.5); margin-top: var(--bs-gutter-y);\"><div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt tempor incididunt ut labore et dolore magna aliqua. Quis ipsum vcdisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus Lorem ipsum dolor sit amet, consectetur adipiscing elit,</div><div>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.</div></div></div><div>Shank porchetta anim ham in esse. Duis swine mollit incididunt, quis pork belly rump ut ball tip venison strip steak pancetta proident. Ground roun duis beef, eu sunt non dolor esse capicola shoulder strip steak. Ut fatback chuck minim exercitation kielbasa. Cupidatat nostrud prosciutto corned beefdgf meatball sausage lorem.Ground round jowl pig, short ribs turducken cillum labore aliqua bacon ea doner anim esse. Jerky laboris id, fatback ut gfjb Filet mignon corned beef laboris ipsum porchetta beef irure dolor fatback. Pariatur cupim occaecat short ribs</div>','6a6ada1a3955b30e4fbe6c2aa136c4a2_tn.jpg','2022-11-04 18:44:42.374000','2022-11-05 20:49:20.284000',_binary '',_binary '',3,1414,15,2,2,2,2,14,21,3,0,6,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `answer_time` datetime(6) DEFAULT NULL,
  `approved` bit(1) NOT NULL,
  `ask_time` datetime(6) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `votes` int NOT NULL,
  `answerer_id` int DEFAULT NULL,
  `asker_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm993xs48yltdhr0qws3s1mpdn` (`answerer_id`),
  KEY `FKfujdy3kc9esehjrifstaahivi` (`asker_id`),
  KEY `FKdnt39hlm1bcye9ivenccipd5s` (`product_id`),
  CONSTRAINT `FKdnt39hlm1bcye9ivenccipd5s` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKfujdy3kc9esehjrifstaahivi` FOREIGN KEY (`asker_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKm993xs48yltdhr0qws3s1mpdn` FOREIGN KEY (`answerer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_votes`
--

DROP TABLE IF EXISTS `questions_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2er6vquw4ya7cl6ovtcx9vvm9` (`customer_id`),
  KEY `FKehqtpwaad8w20qfxc8aqj0uiy` (`question_id`),
  CONSTRAINT `FK2er6vquw4ya7cl6ovtcx9vvm9` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKehqtpwaad8w20qfxc8aqj0uiy` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_votes`
--

LOCK TABLES `questions_votes` WRITE;
/*!40000 ALTER TABLE `questions_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `rating` int NOT NULL,
  `review_time` datetime(6) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `votes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sm0k8kw740iyuex3vwwv1etu` (`customer_id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  CONSTRAINT `FK4sm0k8kw740iyuex3vwwv1etu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_votes`
--

DROP TABLE IF EXISTS `reviews_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKckuygkph4k9llo624gn30lxvy` (`customer_id`),
  KEY `FKosupda11xqkvo80r77evmwrey` (`review_id`),
  CONSTRAINT `FKckuygkph4k9llo624gn30lxvy` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKosupda11xqkvo80r77evmwrey` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_votes`
--

LOCK TABLES `reviews_votes` WRITE;
/*!40000 ALTER TABLE `reviews_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Manage everything'),(2,'Salesperson','Manage product price, customers, shipping, orders and sales report'),(3,'Editor','Manage categories, brands, products, articles and menus'),(4,'Shipper','View products, view orders and update order status'),(5,'Assistant','Manage questions and reviews');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(2048) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `heading` varchar(256) NOT NULL,
  `section_order` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i816mxaoddmtveofp1qjbnngf` (`heading`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'Explore Popular Categories',_binary '','Explore Popular Categories',2,'ALL_CATEGORIES'),(2,'Top Brands',_binary '','Top Brands',3,'BRAND'),(3,'Sales Up Products',_binary '','Featured Products',1,'PRODUCT'),(4,'Category',_binary '','Top Category',4,'CATEGORY');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_articles`
--

DROP TABLE IF EXISTS `sections_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_order` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKguoivqg4rnmm8nilb12x40ygh` (`article_id`),
  KEY `FKnbym8cke5rnxjm8bdi70dapl` (`section_id`),
  CONSTRAINT `FKguoivqg4rnmm8nilb12x40ygh` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `FKnbym8cke5rnxjm8bdi70dapl` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_articles`
--

LOCK TABLES `sections_articles` WRITE;
/*!40000 ALTER TABLE `sections_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_brands`
--

DROP TABLE IF EXISTS `sections_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_order` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK63hur81l4do6ck6x015gp3cuu` (`brand_id`),
  KEY `FK68eeev3m314v82j0st116ftm9` (`section_id`),
  CONSTRAINT `FK63hur81l4do6ck6x015gp3cuu` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK68eeev3m314v82j0st116ftm9` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_brands`
--

LOCK TABLES `sections_brands` WRITE;
/*!40000 ALTER TABLE `sections_brands` DISABLE KEYS */;
INSERT INTO `sections_brands` VALUES (1,0,15,2),(2,1,17,2),(3,2,13,2),(4,3,11,2),(5,4,10,2),(6,5,7,2),(7,6,8,2),(8,7,6,2),(9,8,9,2),(10,9,16,2),(11,10,12,2),(12,11,14,2);
/*!40000 ALTER TABLE `sections_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_categories`
--

DROP TABLE IF EXISTS `sections_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_order` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4oqn5st47mm34yvnt3criccsh` (`category_id`),
  KEY `FK7ivge0x7bydfh10vw3d0n837j` (`section_id`),
  CONSTRAINT `FK4oqn5st47mm34yvnt3criccsh` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK7ivge0x7bydfh10vw3d0n837j` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_categories`
--

LOCK TABLES `sections_categories` WRITE;
/*!40000 ALTER TABLE `sections_categories` DISABLE KEYS */;
INSERT INTO `sections_categories` VALUES (1,0,10,4),(2,1,17,4),(3,2,23,4),(4,3,5,4),(5,4,30,4),(6,5,32,4),(7,6,31,4),(8,7,33,4),(9,8,34,4),(10,9,35,4);
/*!40000 ALTER TABLE `sections_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_products`
--

DROP TABLE IF EXISTS `sections_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_order` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5lf8i896cqdnc9shitywps2l` (`product_id`),
  KEY `FKjmh450o9k6x0hrmrumemucg1b` (`section_id`),
  CONSTRAINT `FKjmh450o9k6x0hrmrumemucg1b` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `FKl5lf8i896cqdnc9shitywps2l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_products`
--

LOCK TABLES `sections_products` WRITE;
/*!40000 ALTER TABLE `sections_products` DISABLE KEYS */;
INSERT INTO `sections_products` VALUES (1,0,7,3);
/*!40000 ALTER TABLE `sections_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('CURRENCY_ID','3','CURRENCY'),('CURRENCY_SYMBOL','¥','CURRENCY'),('CURRENCY_SYMBOL_POSITION','Before price','CURRENCY'),('CUSTOMER_VERIFY_CONTENT','<b>&nbsp; &nbsp; &nbsp; Dear [[name]],</b><div><i><b><br></b></i></div><div><i><b>&nbsp;Click the link below to verify your registration:</b></i></div><div><i><b><br></b></i></div>\r\n\r\n\r\n&nbsp; <a href=\"[[URL]]\" target=\"_self\">VERIFY</a><a href=\"[[URL]]\" target=\"_self\"></a><h3></h3><div><br></div><a href=\"[[URL]]\" target=\"_self\"></a><div><b>&nbsp;Best Regard,</b></div><div><b>&nbsp;The Aptech Team.</b></div>','MAIL_TEMPLATES'),('CUSTOMER_VERIFY_SUBJECT','Please verify your registration to continue Revel eCommerce-Multi Vendor','MAIL_TEMPLATES'),('DECIMAL_DIGITS','2','CURRENCY'),('DECIMAL_POINT_TYPE','COMMA','CURRENCY'),('MAIL_FROM','aptech.amazonbook@gmail.com','MAIL_SERVER'),('MAIL_HOST','smtp.gmail.com','MAIL_SERVER'),('MAIL_PASSWORD','fgfexbtvnqboebat','MAIL_SERVER'),('MAIL_PORT','587','MAIL_SERVER'),('MAIL_SENDER_NAME','The Aptech Team','MAIL_SERVER'),('MAIL_USERNAME','aptech.amazonbook@gmail.com','MAIL_SERVER'),('ORDER_CONFIRMATION_CONTENT','&nbsp; &nbsp; &nbsp; &nbsp; Dear [[name]],&nbsp;<div>&nbsp;This email is to confirm that you have successfully placed an order through our website. Please review the following order summary:<div><br></div></div><div>- Order ID: [[orderId]]</div><div>- Order time: [[orderTime]]</div><div>- Ship to: [[shippingAddress]]</div><div>- Total: [[total]]</div><div>- Payment method: [[paymentMethod]]</div><div><br></div><div>We\'re currently processing your order. Click here to view full details of your order on our website (login required).</div><div><br></div><div>Thanks for purchasing products at&nbsp;<span style=\"background-color: rgb(30, 30, 30); color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 14px; white-space: pre;\">Revel eCommerce-Multi Vendor</span></div><div><b>The Aptech Team.</b></div>','MAIL_TEMPLATES'),('ORDER_CONFIRMATION_SUBJECT','[Amazon Book] Purchase Confirmation of your order ID #[[orderId]]','MAIL_TEMPLATES'),('PAYPAL_API_BASE_URL','https://api-m.sandbox.paypal.com','PAYMENT'),('PAYPAL_API_CLIENT_ID','AVrNYKEuIxaJqdoYptMfy8ENDvwBc93u0ClhROkZz_J0sX3-Wa6vCv0s85WDO10e4GyVJo_UnTni47mq','PAYMENT'),('PAYPAL_API_CLIENT_SECRET','EFNVxb4GD57B_OLyw6nYsDJ6l-S08Dk8-l7qJMAf9pvEv5T-UkSMpjjsQoxGMFKVGTuAqe6mgj3Rfpox','PAYMENT'),('SITE_LOGO','/site-logo/logo.png','GENERAL'),('SITE_NAME','Aptech.com','GENERAL'),('SMTP_AUTH','true','MAIL_SERVER'),('SMTP_SECURED','true','MAIL_SERVER'),('THOUSANDS_POINT_TYPE','POINT','CURRENCY');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rates`
--

DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `state` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `days` int NOT NULL,
  `cod_supported` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKef7sfgeybt3xn13nlt2j6sljw` (`country_id`),
  CONSTRAINT `FKef7sfgeybt3xn13nlt2j6sljw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (2,234,'New York',10,7,_binary ''),(3,234,'Florida',12,6,_binary '\0'),(5,242,'Hanoi',3.98,2,_binary ''),(6,234,'California',11.56,6,_binary '\0'),(7,242,'Hai Phong',3.93,2,_binary '\0'),(8,242,'Bac Giang',4.12,2,_binary '\0'),(9,242,'Phu Tho',4.21,3,_binary '\0'),(10,242,'Thanh Hoa',3.52,1,_binary ''),(11,106,'Karnataka',8.22,5,_binary '\0'),(12,106,'Maharashtra',8.69,5,_binary ''),(13,106,'Meghalaya',8.1,4,_binary '\0'),(14,106,'Punjab',7.89,3,_binary ''),(15,106,'Tamil Nadu',8.25,4,_binary '\0'),(16,106,'Telangana',7.72,4,_binary '\0'),(17,242,'Da Nang',0.5,1,_binary ''),(18,234,'Ohio',11.5,8,_binary ''),(19,78,'London',9.88,6,_binary ''),(20,106,'Delhi',8.45,5,_binary ''),(21,106,'West Bengal',8.88,5,_binary ''),(22,78,'Barton',7.78,6,_binary ''),(23,106,'Andhra Pradesh',8.12,6,_binary ''),(24,234,'Tennessee',12,8,_binary ''),(25,234,'Massachusetts',11.85,7,_binary ''),(26,14,'Queensland',4.99,5,_binary ''),(27,199,'Singapore',3.33,3,_binary ''),(28,39,'British Columbia',9.88,7,_binary ''),(29,14,'New South Wales',4.57,6,_binary ''),(30,234,'Illinois',13,9,_binary '');
/*!40000 ALTER TABLE `shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `delivery_address` varchar(64) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ar5yyuartm46e1brh920fpfiv` (`name`),
  KEY `FKrw9f7c3cun0p6x4qauhd8ihxw` (`customer_id`),
  CONSTRAINT `FKrw9f7c3cun0p6x4qauhd8ihxw` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Computer & Accessories','2022-11-04 17:12:13.071000','Ho Chi Minh - Viet Nam',_binary '','FPT Shop',3),(2,'Mobile & Gadgets','2022-11-04 17:12:29.569000','Ho Chi Minh - Viet Nam',_binary '','Thegioididong.com',3),(3,'Consumer Electronics','2022-11-04 17:12:42.916000','Ho Chi Minh - Viet Nam',_binary '','Viettel Store',3),(4,'Get the items you ordered or get your money back.','2022-11-04 20:00:10.179000','Ho Chi Minh - Viet Nam',_binary '','Shopee Guarantee',3),(5,'minminstore96','2022-11-04 20:00:29.817000','Ho Chi Minh - Viet Nam',_binary '','minminstore96',3),(6,'fashionalloy.vn','2022-11-04 20:01:07.375000','Ho Chi Minh - Viet Nam',_binary '','fashionalloy.vn',3);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKskkdphjml9vjlrqn4m5hi251y` (`country_id`),
  CONSTRAINT `FKskkdphjml9vjlrqn4m5hi251y` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Ha Noi',242),(2,'Da Nang',242),(3,'New York',234),(4,'California',234),(5,'Ho Chi Minh City',242),(6,'Hai Phong',242),(7,'Bac Giang',242),(8,'Son La',242),(9,'Quang Ninh',242),(10,'Nghe An',242),(12,'Utah',234),(13,'Washington',234),(14,'Florida',234),(15,'Illinois',234),(16,'Texas',234),(18,'Colorado',234),(19,'Alaska',234),(20,'Can Tho',242),(22,'Binh Duong',242),(23,'Thanh Hoa',242),(24,'Andhra Pradesh',106),(25,'Arunachal Pradesh',106),(26,'Assam',106),(27,'Bihar',106),(28,'Haryana',106),(29,'Himacha Pradesh',106),(30,'Karnataka',106),(31,'Maharashtra',106),(32,'Meghalaya',106),(33,'Punjab',106),(34,'Tamil Nadu',106),(35,'Telangana',106),(36,'Uttar Pradesh',106),(37,'West Bengal',106),(38,'Bac Ninh',242),(40,'Ha Tinh',242),(41,'Hue',242),(42,'Binh Dinh',242),(43,'An Giang',242),(44,'Blackpool',78),(45,'London',78),(46,'Liverpool',78),(47,'Manchester',78),(48,'Newcastle',78),(49,'Bristol',78),(50,'Cambridge',78),(51,'Lang Son',242),(52,'Delhi',106),(53,'Hawaii',234),(54,'Georgia',234),(55,'Pennsylvania',234),(56,'Virginia',234),(57,'Arizona',234),(59,'Kerala',106),(60,'Rajasthan',106),(61,'Odisha',106),(62,'Mizoram',106),(63,'Sikkim',106),(64,'Manipur',106),(65,'Nagaland',106),(66,'Tripura',106),(67,'Jharkhand',106),(68,'Uttarakhand',106),(69,'Goa',106),(70,'Madhya Pradesh',106),(71,'Gujarat',106),(72,'Massachusetts',234),(73,'Indiana',234),(74,'Michigan',234),(75,'Ohio',234),(76,'New Jersey',234),(77,'Minnesota',234),(78,'North Carolina',234),(79,'Oregon',234),(80,'Maryland',234),(81,'Tennessee',234),(82,'Montana',234),(83,'Maine',234),(84,'Alabama',234),(85,'Wisconsin',234),(86,'Louisiana',234),(87,'Connecticut',234),(88,'Missouri',234),(89,'South Carolina',234),(90,'Mississippi',234),(91,'New Mexico',234),(92,'Nevada',234),(93,'Kentucky',234),(94,'Arkansas',234),(95,'Wyoming',234),(96,'Kansas',234),(97,'Delaware',234),(98,'Iowa',234),(99,'Idaho',234),(100,'Nebraska',234),(101,'Rhode Island',234),(102,'Vermont',234),(103,'South Dakota',234),(104,'New Hamsphire',234),(105,'West Virginia',234),(106,'North Dakota',234),(107,'Oklahoma',234),(109,'Nam Dinh',242),(110,'Khanh Hoa',242),(112,'Tay Ninh',242),(113,'Kien Giang',242),(114,'Lai Chau',242),(115,'Lao Cai',242),(116,'Ha Giang',242),(117,'Hoa Binh',242),(118,'Thai Binh',242),(119,'Dong Nai',242),(120,'Soc Trang',242),(121,'Bac Lieu',242),(123,'Ca Mau',242),(124,'Quang Binh',242),(125,'Quang Tri',242),(126,'Quang Nam',242),(127,'Quang Ngai',242),(128,'Gia Lai',242),(129,'Vinh Phuc',242),(130,'Lam Dong',242),(131,'Dak Lak',242),(132,'Phu Yen',242),(133,'Binh Phuoc',242),(134,'Dak Nong',242),(135,'Dong Thap',242),(136,'Hau Giang',242),(137,'Ba Ria Vung Tau',242),(138,'Binh Thuan',242),(139,'Hai Duong',242),(140,'Hung Yen',242),(141,'Thai Nguyen',242),(142,'Long An',242),(143,'Ben Tre',242),(144,'Bac Kan',242),(145,'Ninh Binh',242),(146,'Kon Tum',242),(147,'Tra Vinh',242),(148,'Yen Bai',242),(149,'Tuyen Quang',242),(150,'Phu Tho',242),(151,'Vinh Long',242),(152,'New South Wales',14),(153,'Queensland',14),(154,'Tasmania',14),(155,'Western Australia',14),(156,'Victoria',14),(157,'South Australia',14),(158,'Ontario',39),(159,'Quebec',39),(160,'Nova Scotia',39),(161,'New Brunswick',39),(162,'Manitoba',39),(163,'British Columbia',39),(164,'Prince Edward Island',39),(165,'Saskatchewan',39),(166,'Alberta',39),(167,'Newfoundland and Labrador',39),(168,'Grand Est',76),(169,'Hauts-de-France',76),(170,'Normandy',76),(171,'Nouvelle-Aquitaine',76),(172,'Occitanie',76),(173,'Brittany',76),(174,'Centre-Val de Loire',76),(175,'Corsica',76),(176,'French Guiana',76),(177,'Guadeloupe',76),(178,'Île-de-France',76),(179,'Martinique',76),(180,'Mayotte',76),(181,'Pays de la Loire',76),(182,'Provence-Alpes-Côte d\'Azur',76),(183,'Réunion',76),(184,'Aichi',115),(185,'Akita',115),(186,'Chiba',115),(187,'Ehime',115),(188,'Fukui',115),(189,'Fukuoka',115),(190,'Fukushima',115),(191,'Gunma',115),(192,'Kobe',115),(193,'Hiroshima',115),(194,'Hokkaido',115),(195,'Ishikawa',115),(196,'Kagawa',115),(197,'Kochi',115),(198,'Kyoto',115),(199,'Nagasaki',115),(200,'Okinawa',115),(201,'Osaka',115),(202,'Saga',115),(203,'Tokushima',115),(204,'Tokyo',115),(205,'Yamagata',115),(206,'Yamaguchi',115),(207,'Yamanashi',115),(208,'Greater Poland',180),(209,'Kuyavia-Pomerania',180),(210,'Lesser Poland',180),(211,'Łódź',180),(212,'Lower Silesia',180),(213,'Lublin',180),(214,'Lubusz',180),(215,'Masovia',180),(216,'Opole',180),(217,'Podlaskie',180),(218,'Pomerania',180),(219,'Silesia',180),(220,'Subcarpathia',180),(221,'Holy Cross Province',180),(222,'Warmia-Masuria',180),(223,'West Pomerania',180),(224,'Baden-Württemberg',58),(225,'Bavaria',58),(226,'Berlin',58),(227,'Brandenburg',58),(228,'Bremen',58),(229,'Hamburg',58),(230,'Hesse',58),(231,'Lower Saxony',58),(232,'Mecklenburg-Vorpommern',58),(233,'North Rhine- Westphalia',58),(234,'Rhineland-Palatinate',58),(235,'Saarland',58),(236,'Saxony',58),(237,'Saxony-Anhalt',58),(238,'Schleswig-Holstein',58),(239,'Thuringia',58),(240,'Acre',32),(241,'Alagoas',32),(242,'Amapá',32),(243,'Amazonas',32),(244,'Bahia',32),(245,'Ceará',32),(246,'Distrito Federal',32),(247,'Espírito Santo',32),(248,'Goiás',32),(249,'Maranhão',32),(250,'Mato Grosso',32),(251,'Minas Gerais',32),(252,'Pará',32),(253,'Paraíba',32),(254,'Paraná',32),(255,'Pernambuco',32),(256,'Piauí',32),(257,'Rio de Janeiro',32),(258,'Rio Grande do Norte',32),(259,'Rio Grande do Sul',32),(260,'Rondônia',32),(261,'Roraima',32),(262,'Santa Catarina',32),(263,'São Paulo',32),(264,'Sergipe',32),(265,'Tocantins',32),(266,'Adana',226),(267,'Adıyaman',226),(268,'Ankara',226),(269,'Balıkesir',226),(270,'Bilecik',226),(271,'Bingöl',226),(272,'Bursa',226),(273,'Çanakkale',226),(274,'Çankırı',226),(275,'Çorum',226),(276,'Denizli',226),(277,'Diyarbakır',226),(278,'Edirne',226),(279,'Erzurum',226),(280,'Gaziantep',226),(281,'Giresun',226),(282,'Hakkâri',226),(283,'Hatay',226),(284,'Isparta',226),(285,'Istanbul',226),(286,'Konya',226),(287,'Malatya',226),(288,'Manisa',226),(289,'Iğdır',226),(290,'Karaman',226),(291,'Osmaniye',226),(292,'Tokat',226),(293,'Sivas',226),(294,'Sinop',226),(295,'Siirt',226),(296,'Batman',226),(297,'Kilis',226),(298,'Rize',226),(299,'Ordu',226),(300,'Tunceli',226),(301,'Yozgat',226),(302,'Van',226),(303,'Bayburt',226),(304,'Yalova',226),(305,'Samsun',226),(306,'Sakarya',226);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `photos` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'triquang.15qt@gmail.com',_binary '','Tri','Quang','$2a$10$1xBCB8mUsBv3EHPQQ82MT.2i.n50Q0JIOBj/Z9su1v0C3rvXLtG.a','avatar-s-1.png'),(2,'kanna.allada@gmail.com',_binary '','Allada','Pavan','$2a$10$zRa/rmQ8JarpYG2bNKftyelKnsUhsHwGB.xmCKTWJClsB7O9wzTnG','avatar-1.png'),(3,'aecllc.bnk@gmail.com',_binary '\0','Bruce','Kitchell','$2a$10$GINThwCjVZAbGnmOe9BIeuDuvDlyfuwZrg/Rsmrjs1Lsq2pnXtO/S','avatar-s-5.png'),(4,'muhammad.evran13@gmail.com',_binary '','Muhammad','Evran','$2a$10$UcHWHC72azPVZJb5Ky.Yy.X695WGf1ZkkGMS3WL3B9WqWf2dQD04G','avatar-s-22.png'),(5,'kent.hervey8@gmail.com',_binary '','Kent','Hervey','$2a$10$YHXRsZ07/Btv.qCgGht.7u2PW.GLWzpVB7eabfgH1mhTVVXffDT6K','avatar-s-9.png'),(6,'alfredephraim26@gmail.com',_binary '','Alfred','Ephraim','$2a$10$1jl3q3r/Fh9ZBv6ziM4XhuxCi2GMFWcfHUrxsesXAEwnsiV/NJKbq','avatar-s-5.png'),(7,'nathihsa@gmail.com',_binary '','Nathi','Sangweni','$2a$10$WyHmQiXCSYuHcGeg8eFWvOScqzSgg88MmqpajPdzSkLsvZjT3tKC.','avatar-s-18.png'),(8,'ammanollashirisha2020@gmail.com',_binary '','Ammanolla','Shirisha','$2a$10$N1eE87eXFB2XQ5nmWKaTXOofnrPn8koeNvZhEpleJzO49i55e/Vk.','avatar-s-2.png'),(9,'bfeeny238@hotmail.com',_binary '','Bill','Feeny','$2a$10$3sH0v..zpjwA8ux5/q.OAeu0HgmSdMj8VzMWzhwwBDkE8wOISsUyi','avatar-s-4.png'),(10,'redsantosph@gmail.com',_binary '','Frederick','delos Santos','$2a$10$KXHmKpE6YB/0sjiy3fkMv.muKyxqvOXE6jVeaPu8KEaExx62ZmmNe','avatar-s-7.png'),(11,'ro_anamaria@mail.ru',_binary '','Ana','Maria','$2a$10$sz0CHOHAY1Xjt2ajIZgnG.L2KBQ4SsQkOGsPYue.C5gr6j.KMDdqS','avatar-s-3.png'),(12,'maytassatya@hotmail.com',_binary '\0','Satya','Narayana','$2a$10$R7EJcaYijjJo/IVk6c1CieBML2uP3RAKMVlCxylPAePlCfJsX7OOy','avatar-s-17.png'),(13,'matthewefoli@gmail.com',_binary '','Matthew','Efoli','$2a$10$clNXcpozocz3H4bmzPaWu.QHz85IIv2JeLzca./JXr8u6rCF04OC.','avatar-s-11.png'),(14,'davekumara2@gmail.com',_binary '','Dave','Kumar Singh','$2a$10$5ebeZu18V5RheieYqpl/LORCN41E3H7yvxKqEwtq5Zq2JVw.E9dva','avatar-s-6.png'),(15,'jackkbruce@yahoo.com',_binary '','Jack','Bruce','$2a$10$a6iyIHRj8DNpu15obVHTSOGcLe4IfpBcD4iEEJesWaFpBQvRoF2da','avatar-s-10.png'),(16,'zirri.mohamed@gmail.com',_binary '','Mohamed','Zirri','$2a$10$TmvyH1AoyDqRmQ4uC8NAZOOV29CPEDGuxVsHLP1cJoHQGr78L4kjW','avatar-s-14.png'),(17,'mk.majumdar009@hotmail.com',_binary '\0','Mithun','Kumar Majumdar','$2a$10$Y6SEy2INN0Rk/vhLHHJUYO6IMqNW3Ar.jVe9o0W1lpBRX8xr2Itui','avatar-s-13.png'),(18,'aliraza.arain.28@gmail.com',_binary '','Ali','Raza','$2a$10$PISZ2KitSbhE4/Z3dtIGk.WUi2ILiDl4PzRUDEQSp5BJIxcdcPq4G','avatar-s-26.png'),(19,'isaachenry2877@gmail.com',_binary '','Isaac','Henry','$2a$10$CtmhrOz/AhDoCpKbeYl8O.0ngCFMukcznNZq7.YcHrkRyKpBG8Zca','avatar-s-8.png'),(20,'s.stasovska82@hotmail.com',_binary '','Svetlana','Stasovska','$2a$10$fcN2cNa7vB.78QnmzfNZEeUBkrwUaM.bVK3iDB.KFQlR15DwL7QZy','avatar-s-23.png'),(21,'mikegates2012@gmail.com',_binary '','Mike','Gates','$2a$10$zIO1tygsw6cB2ymiR.WX0ulr9NKdTlZHqu7w/W/LLwk8HhK7nVnH.','avatar-s-12.png'),(22,'pedro.quintero.2000@gmail.com',_binary '','Pedro','Quintero','$2a$10$UPX5EwZw0MyBvbe.7mxg2u8GOl/4KgaUU40iSjr1PLFYvhu35fMmu','avatar-s-20.png'),(23,'amina.elshal2@yahoo.com',_binary '','Amina','Elshal','$2a$10$J1yoyqG5vWNe5N663PkgY.h53gfJtTR7Bb8E8u3sXdNbOZxhXgHu.','avatar-s-1.png'),(30,'admin@gmail.com',_binary '','Mr','Quang','$2a$10$444619UZ4Zbg4KpliNgAFuDCztnzmhlzbAl8D.wvaILz5Cxfm.tFy','avatar-s-21.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(30,1),(3,2),(9,2),(10,2),(11,2),(12,2),(13,2),(19,2),(20,2),(2,3),(4,3),(5,3),(6,3),(7,3),(8,3),(11,3),(14,3),(15,3),(18,3),(20,3),(2,4),(16,4),(17,4),(18,4),(5,5),(9,5),(14,5),(15,5),(19,5),(20,5),(21,5),(22,5),(23,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 13:51:30
