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
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `ol_num` int NOT NULL AUTO_INCREMENT,
  `ol_op_num` int NOT NULL,
  `ol_or_num` int NOT NULL,
  `ol_total_price` int NOT NULL,
  `ol_amount` int NOT NULL,
  `ol_state` varchar(10) NOT NULL DEFAULT '주문완료',
  PRIMARY KEY (`ol_num`),
  KEY `ol_or_num_idx` (`ol_or_num`),
  KEY `ol_op_num_idx` (`ol_op_num`),
  CONSTRAINT `ol_op_num` FOREIGN KEY (`ol_op_num`) REFERENCES `option` (`op_num`),
  CONSTRAINT `ol_or_num` FOREIGN KEY (`ol_or_num`) REFERENCES `order` (`or_num`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (4,3,9,358000,2,'배송준비중'),(5,4,10,299000,1,'배송중'),(9,5,14,178000,2,'주문완료'),(11,1,16,89000,1,'배송완료'),(12,3,17,716000,4,'배송완료'),(13,4,18,299000,1,'배송중'),(14,4,19,299000,1,'배송중'),(16,6,21,240000,1,'주문완료'),(27,1,32,89000,1,'주문완료'),(28,2,33,178000,2,'주문완료'),(29,5,34,89000,1,'주문완료'),(30,2,35,89000,1,'주문완료'),(31,4,36,299000,1,'주문완료'),(32,1,37,267000,3,'주문완료'),(33,3,38,179000,1,'주문완료'),(34,4,39,299000,1,'주문완료'),(35,6,40,240000,1,'주문완료'),(36,1,41,89000,1,'주문완료'),(37,2,42,89000,1,'주문완료'),(38,5,43,89000,1,'주문완료'),(39,3,44,179000,1,'주문완료'),(40,4,45,299000,1,'주문완료'),(41,6,46,240000,1,'주문완료'),(42,1,47,89000,1,'주문완료'),(43,2,48,89000,1,'주문완료'),(44,5,49,89000,1,'주문완료');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
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
