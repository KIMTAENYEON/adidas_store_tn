-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: adidas_store_tn
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `or_num` int NOT NULL AUTO_INCREMENT,
  `or_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `or_name` varchar(30) NOT NULL,
  `or_address` varchar(255) NOT NULL,
  `or_phone` char(13) NOT NULL,
  `or_me_email` varchar(255) NOT NULL,
  `or_postnum` varchar(10) NOT NULL,
  `or_address_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`or_num`),
  KEY `or_me_email_idx` (`or_me_email`),
  CONSTRAINT `or_me_email` FOREIGN KEY (`or_me_email`) REFERENCES `member` (`me_email`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (9,'2022-03-10 12:27:28','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(10,'2022-03-10 17:31:39','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(14,'2022-03-11 11:16:58','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(16,'2022-03-11 14:29:09','k9313308','부산 서구 구덕로222번길 5','010-2222-2233','k9313308@gmail.com','49223','222'),(17,'2022-03-11 17:34:27','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(18,'2022-03-11 17:48:23','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(19,'2022-03-11 17:48:28','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(21,'2022-03-15 09:39:49','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(32,'2022-03-16 17:32:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(33,'2022-03-16 17:32:35','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(34,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(35,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(36,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(37,'2022-03-17 11:16:08','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(38,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(39,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(40,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(41,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(42,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(43,'2022-03-17 11:17:30','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(44,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(45,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(46,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(47,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(48,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111'),(49,'2022-03-17 11:18:22','k9313307','서울 강남구 논현로111길 3','010-1111-1111','k9313307@naver.com','06122','1111');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 18:05:14
