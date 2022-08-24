-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlysinhvien
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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ClassID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(60) NOT NULL,
  `StartDate` datetime NOT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'A1','2008-12-20 00:00:00',_binary ''),(2,'A2','2008-12-22 00:00:00',_binary ''),(3,'B3','2022-07-01 00:00:00',_binary '\0'),(4,'C5','2022-07-01 00:00:00',_binary ''),(6,'D1','2022-08-24 15:29:33',_binary ''),(7,'D0','2022-08-24 15:32:40',_binary ''),(9,'D0','2022-08-24 15:33:12',_binary ''),(10,'D1','2022-08-24 15:33:13',_binary ''),(11,'D2','2022-08-24 15:33:13',_binary ''),(12,'D3','2022-08-24 15:33:13',_binary ''),(13,'D4','2022-08-24 15:33:14',_binary ''),(14,'D5','2022-08-24 15:33:15',_binary ''),(15,'D6','2022-08-24 15:33:15',_binary ''),(16,'D7','2022-08-24 15:33:15',_binary ''),(17,'D8','2022-08-24 15:33:16',_binary ''),(18,'D9','2022-08-24 15:33:16',_binary ''),(19,'D10','2022-08-24 15:33:16',_binary ''),(20,'D11','2022-08-24 15:33:16',_binary ''),(21,'D12','2022-08-24 15:33:17',_binary ''),(22,'D13','2022-08-24 15:33:17',_binary ''),(23,'D14','2022-08-24 15:33:17',_binary ''),(24,'D15','2022-08-24 15:33:17',_binary ''),(25,'D16','2022-08-24 15:33:18',_binary ''),(26,'D17','2022-08-24 15:33:18',_binary ''),(27,'D18','2022-08-24 15:33:18',_binary ''),(28,'D19','2022-08-24 15:33:19',_binary '');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mark` (
  `MarkId` int NOT NULL AUTO_INCREMENT,
  `SubId` int NOT NULL,
  `StudentId` int NOT NULL,
  `Mark` float DEFAULT '0',
  `ExamTimes` tinyint DEFAULT '1',
  PRIMARY KEY (`MarkId`),
  UNIQUE KEY `SubId` (`SubId`,`StudentId`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`SubId`) REFERENCES `subject` (`SubId`),
  CONSTRAINT `mark_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  CONSTRAINT `mark_chk_1` CHECK ((`Mark` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,1,1,8,1),(2,1,2,10,2),(3,2,1,8,1);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `ClassID`,
 1 AS `ClassName`,
 1 AS `StartDate`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentId` int NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(30) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `ClassId` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `student_ibfk_1` (`ClassId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `class` (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Hung','Ha Noi','0912113113',_binary '',1,28),(2,'Hoa','Hai phong',NULL,_binary '',NULL,17),(3,'Manh','TP HCM','0123123123',_binary '\0',3,29),(4,'Quang','HCM City','0399578134',_binary '\0',2,23),(7,'PhuLe','28 Nguyen tri Phuong','123456789',_binary '',2,18);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `SubId` int NOT NULL AUTO_INCREMENT,
  `SubName` varchar(30) NOT NULL,
  `Credit` tinyint NOT NULL DEFAULT '1',
  `Status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`SubId`),
  CONSTRAINT `subject_chk_1` CHECK ((`Credit` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'CF',5,_binary ''),(2,'C',6,_binary ''),(3,'H',5,_binary ''),(4,'K',10,_binary '');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zalo`
--

DROP TABLE IF EXISTS `zalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zalo` (
  `class_id` int DEFAULT NULL,
  `student` varchar(45) DEFAULT NULL,
  `test_score` float DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zalo`
--

LOCK TABLES `zalo` WRITE;
/*!40000 ALTER TABLE `zalo` DISABLE KEYS */;
INSERT INTO `zalo` VALUES (1,'tri',9,1),(1,'minh',9,2),(2,'hung',6,3),(2,'hoang',1,4),(2,'thi',8.5,5),(6,'trung',5,6);
/*!40000 ALTER TABLE `zalo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `class`.`ClassID` AS `ClassID`,`class`.`ClassName` AS `ClassName`,`class`.`StartDate` AS `StartDate`,`class`.`Status` AS `Status` from `class` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-24 15:34:19
