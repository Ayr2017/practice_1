-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: bo
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cover_type_id` int NOT NULL,
  `circulation` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cover_type_fk` (`cover_type_id`),
  CONSTRAINT `cover_type_fk` FOREIGN KEY (`cover_type_id`) REFERENCES `cover_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Синдзи-кун и пять стадий принятия',1,1000),(2,'Правильный «Червь»',2,2000),(3,'Деньги правят миром',2,3000),(4,'Напряжение',1,500),(5,'Сам себе властелин',2,500),(6,'Очень светлые неприятности',1,4400),(7,'Мама для Совенка. Часть вторая',1,500),(8,'Автократия Гоблинов',2,1500),(9,'Право чёрной розы',2,2500),(10,'Сам себе властелин 4',1,500),(11,'Мама для Совенка. Часть третья',2,500),(12,'Говорят, мы бяки-буки!',1,500);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_genres`
--

DROP TABLE IF EXISTS `books_has_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_has_genres` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  UNIQUE KEY `books_has_genres_pk` (`book_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_genres`
--

LOCK TABLES `books_has_genres` WRITE;
/*!40000 ALTER TABLE `books_has_genres` DISABLE KEYS */;
INSERT INTO `books_has_genres` VALUES (1,1),(4,1),(10,1),(2,2),(5,2),(3,3),(4,3),(5,3),(10,3),(11,3),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(4,5),(5,5),(5,6),(6,6),(7,6),(8,6),(5,7),(6,7),(7,7),(10,7),(5,8),(6,8),(8,8),(5,9),(6,9),(9,9),(5,10),(10,10),(5,11),(6,11),(11,11),(5,12),(7,12),(9,12),(12,12),(1,13),(7,13),(2,14),(7,14),(3,15),(5,15),(6,15),(7,15);
/*!40000 ALTER TABLE `books_has_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover_types`
--

DROP TABLE IF EXISTS `cover_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cover_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover_types`
--

LOCK TABLES `cover_types` WRITE;
/*!40000 ALTER TABLE `cover_types` DISABLE KEYS */;
INSERT INTO `cover_types` VALUES (2,'мягкая'),(1,'твёрдая');
/*!40000 ALTER TABLE `cover_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Детектив'),(2,'Фантастика'),(3,'Приключения'),(4,'Роман'),(5,'Научная'),(6,'Фольклор'),(7,'Юмор'),(8,'Справочная'),(9,'Поэзия'),(10,'Детская'),(11,'Документальная'),(12,'Деловая'),(13,'Религиозная'),(14,'Учебная'),(15,'Техника');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-19 16:26:08
