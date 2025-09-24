-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: payvalue_cloudbank
-- ------------------------------------------------------
-- Server version	8.0.42-cll-lve

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_number_unique` (`account_number`),
  KEY `accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (33,2,'1873749930',3010000.00,'2025-07-03 07:46:14','2025-07-03 14:05:36'),(34,3,'6134176661',10000.00,'2025-07-03 08:00:18','2025-07-03 08:57:40'),(35,4,'2146707831',3980.00,'2025-07-03 13:58:42','2025-07-09 11:17:20'),(36,5,'0741082963',0.00,'2025-07-03 15:40:39','2025-07-03 15:40:39'),(37,6,'8672128178',3120477.00,'2025-07-03 17:36:45','2025-07-09 11:17:20');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (12,2,'Resident Permit','documents/XubFqRt4tMg9P6wEVqk2k6XzD5jrrqZcR80zQCBG.png','approved','2025-07-03 07:48:58','2025-07-03 07:49:51'),(13,3,'Resident Permit','documents/XgwsJ1deMRZ681as770rgUEC4E31QMW0ol4zix6d.png','approved','2025-07-03 08:02:12','2025-07-03 08:04:10'),(14,4,'Passport','documents/kBYSNF9BhzWEwE25aG6kjkEk8sp95boRVKZwBxL0.jpg','pending','2025-07-03 14:00:23','2025-07-03 14:00:23'),(15,6,'Resident Permit','documents/BhfI3ukVUu5PuvZqJ712fGviwc0O0HBjJwrZLFr5.jpg','approved','2025-07-03 17:39:44','2025-07-03 17:40:25');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'How do I open a CloudBank account?','You can open an account by visiting our website and clicking on the \"Sign Up\" button. Follow the prompts and submit your details.',0,'2025-06-27 06:36:14','2025-06-27 08:01:33'),(7,'Is my money safe with CloudBank?','Yes, we use industry-standard encryption and security practices to ensure your funds are always safe.',0,'2025-06-27 08:02:00','2025-06-27 08:02:00'),(8,'Can I withdraw money anytime?','Absolutely. You can access your money 24/7 through our  website.',0,'2025-06-27 08:02:34','2025-06-27 08:02:34'),(9,'How do I contact customer support?','You can reach us via email, chat, or phone. We’re available 24/7 to assist you.',0,'2025-06-27 08:03:15','2025-06-27 08:03:15'),(10,'How do I reset my password?','Just click on \"Forgot Password\" on the login page and follow the steps to reset it securely.',0,'2025-06-27 08:03:44','2025-06-27 08:03:44');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `successful` tinyint(1) NOT NULL DEFAULT '0',
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_attempts_user_id_foreign` (`user_id`),
  KEY `login_attempts_email_index` (`email`),
  CONSTRAINT `login_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (161,NULL,'britcofirm6@gmail.com','102.89.83.249',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 07:43:28','2025-07-03 07:43:28'),(162,2,'britcofirm6@gmail.com','102.89.83.249',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 07:48:21','2025-07-03 07:48:22'),(163,1,'admin@gmail.com','102.89.83.249',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-03 07:49:08','2025-07-03 07:49:09'),(164,2,'britcofirm6@gmail.com','105.112.210.19',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 11:21:04','2025-07-03 11:21:06'),(165,1,'admin@gmail.com','105.112.210.19',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 11:30:01','2025-07-03 11:30:03'),(166,2,'britcofirm6@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 13:56:14','2025-07-03 13:56:23'),(167,1,'admin@gmail.com','102.89.68.45',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 OPR/119.0.0.0','2025-07-03 14:02:00','2025-07-03 14:02:06'),(168,2,'britcofirm6@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:27:46','2025-07-03 14:27:51'),(169,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:27:47','2025-07-03 14:27:54'),(170,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:31:46','2025-07-03 14:31:52'),(171,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:34:05','2025-07-03 14:34:13'),(172,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:45:02','2025-07-03 14:45:07'),(173,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:45:02','2025-07-03 14:45:07'),(174,2,'britcofirm6@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:45:58','2025-07-03 14:46:03'),(175,2,'britcofirm6@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 14:49:27','2025-07-03 14:49:30'),(176,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 15:07:33','2025-07-03 15:07:35'),(177,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 15:40:53','2025-07-03 15:40:56'),(178,3,'cloudbankcustomerservice@gmail.com','105.112.100.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 15:40:56','2025-07-03 15:41:05'),(179,5,'abdulsalambadmus955@gmail.com','54.86.50.139',1,'PostmanRuntime/7.44.1','2025-07-03 15:41:05','2025-07-03 15:41:13'),(180,3,'cloudbankcustomerservice@gmail.com','102.89.23.16',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','2025-07-03 17:10:14','2025-07-03 17:10:15'),(181,3,'cloudbankcustomerservice@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:14:11','2025-07-03 17:14:11'),(182,2,'britcofirm6@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:16:00','2025-07-03 17:16:01'),(183,NULL,'parkerchristiana46@gmail.com','102.89.83.97',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:41:12','2025-07-03 17:41:12'),(184,NULL,'parkerchristiana46@gmail.com','102.89.83.97',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:41:25','2025-07-03 17:41:25'),(185,NULL,'parkerchristiana46@gmail.com','102.89.83.97',0,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:41:32','2025-07-03 17:41:32'),(186,6,'parkerchristiana46@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 17:42:10','2025-07-03 17:42:10'),(187,1,'admin@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1 Safari/605.1.15','2025-07-03 19:23:37','2025-07-03 19:23:38'),(188,6,'parkerchristiana46@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 19:49:47','2025-07-03 19:49:54'),(189,6,'parkerchristiana46@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-03 22:40:43','2025-07-03 22:40:45'),(190,6,'parkerchristiana46@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 23:22:42','2025-07-03 23:22:42'),(191,6,'parkerchristiana46@gmail.com','102.89.83.97',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-03 23:22:42','2025-07-03 23:22:42'),(192,6,'parkerchristiana46@gmail.com','105.112.102.79',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-05 18:03:39','2025-07-05 18:03:39'),(193,6,'parkerchristiana46@gmail.com','105.112.217.6',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-06 22:34:11','2025-07-06 22:34:12'),(194,6,'parkerchristiana46@gmail.com','105.112.217.6',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Safari/605.1.15','2025-07-06 22:34:11','2025-07-06 22:34:15'),(195,NULL,'programmersalam91@gmail.com','102.89.47.209',0,'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/129.0.6668.69 Mobile/15E148 Safari/604.1','2025-07-07 20:01:25','2025-07-07 20:01:25'),(196,3,'cloudbankcustomerservice@gmail.com','102.89.47.209',1,'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/129.0.6668.69 Mobile/15E148 Safari/604.1','2025-07-07 20:02:29','2025-07-07 20:02:29'),(197,NULL,'cloudbankservice@gmail.com','102.89.22.213',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','2025-07-08 10:55:42','2025-07-08 10:55:42'),(198,NULL,'cloudbankservice@gmail.com','102.89.22.213',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','2025-07-08 10:55:47','2025-07-08 10:55:47'),(199,3,'cloudbankcustomerservice@gmail.com','102.89.22.213',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','2025-07-08 10:55:59','2025-07-08 10:55:59'),(200,2,'britcofirm6@gmail.com','105.112.103.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-08 15:29:22','2025-07-08 15:29:22'),(201,6,'parkerchristiana46@gmail.com','105.112.103.233',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-08 15:29:58','2025-07-08 15:29:59'),(202,4,'damyridwan@gmail.com','102.89.82.180',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-09 10:06:49','2025-07-09 10:06:50'),(203,2,'britcofirm6@gmail.com','105.112.222.224',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-09 10:47:28','2025-07-09 10:47:29'),(204,2,'britcofirm6@gmail.com','105.112.222.224',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-09 10:47:37','2025-07-09 10:47:37'),(205,1,'admin@gmail.com','102.89.82.180',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0','2025-07-09 11:16:21','2025-07-09 11:16:22'),(206,6,'parkerchristiana46@gmail.com','102.89.82.230',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-17 02:04:15','2025-07-17 02:04:15'),(207,1,'admin@gmail.com','102.89.82.230',1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','2025-07-17 02:04:40','2025-07-17 02:04:40'),(208,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:39:37','2025-07-20 19:39:37'),(209,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:39:52','2025-07-20 19:39:52'),(210,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:39:58','2025-07-20 19:39:58'),(211,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:07','2025-07-20 19:40:07'),(212,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:16','2025-07-20 19:40:16'),(213,NULL,'asha17@ourtimesupport.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:25','2025-07-20 19:40:25'),(214,NULL,'daron.larson6@gmail.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:36','2025-07-20 19:40:36'),(215,NULL,'daron.larson6@gmail.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:41','2025-07-20 19:40:41'),(216,NULL,'isobel72@hotmail.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:40:52','2025-07-20 19:40:52'),(217,NULL,'isobel72@hotmail.com','185.216.35.75',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:41:03','2025-07-20 19:41:03'),(218,NULL,'daron.larson6@gmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:43:37','2025-07-20 19:43:37'),(219,NULL,'daron.larson6@gmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:43:45','2025-07-20 19:43:45'),(220,NULL,'isobel72@hotmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:44:13','2025-07-20 19:44:13'),(221,NULL,'isobel72@hotmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:44:21','2025-07-20 19:44:21'),(222,NULL,'daron.larson6@gmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:44:50','2025-07-20 19:44:50'),(223,NULL,'daron.larson6@gmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:44:57','2025-07-20 19:44:57'),(224,NULL,'isobel72@hotmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:45:06','2025-07-20 19:45:06'),(225,NULL,'isobel72@hotmail.com','156.244.39.96',0,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','2025-07-20 19:45:14','2025-07-20 19:45:14'),(226,NULL,'programmersalam91@gmail.com','102.89.47.183',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','2025-07-27 11:26:10','2025-07-27 11:26:10');
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (10,'2025_05_24_094553_add_is_admin_to_users_table',1),(22,'0001_01_01_000000_create_users_table',2),(23,'0001_01_01_000001_create_cache_table',2),(24,'0001_01_01_000002_create_jobs_table',2),(25,'2025_05_24_094404_create_accounts_table',2),(26,'2025_05_24_094418_create_transactions_table',2),(27,'2025_05_24_094419_create_notifications_table',2),(28,'2025_05_24_094420_create_support_tickets_table',2),(29,'2025_05_24_094421_create_faqs_table',2),(30,'2025_05_24_094433_create_banners_table',2),(31,'2025_05_24_095216_create_personal_access_tokens_table',2),(32,'2025_05_29_180441_create_login_attempts_table',3),(33,'2025_06_12_070528_create_documents_table',4),(34,'2025_06_14_150450_add_pin_to_users_table',5),(35,'2025_06_14_154357_add_pin_security_to_users_table',6),(36,'2025_06_14_193619_add_recipient_account_id_to_transactions_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,3,'User Registration','New user registration',1,'register','2025-07-03 08:00:18','2025-07-03 13:57:57'),(2,3,'Account Credited From Admin','Your account has been credited with $20000',1,'admin','2025-07-03 08:05:24','2025-07-03 14:28:52'),(3,3,'Transfer Completed','You transferred $5000 to 1873749930',1,'transfer','2025-07-03 08:08:28','2025-07-03 13:57:39'),(4,2,'Funds Received','You received $5000 from 6134176661',1,'transfer','2025-07-03 08:08:28','2025-07-03 13:57:39'),(5,3,'Transfer Completed','You transferred $5000 to 1873749930',1,'transfer','2025-07-03 08:57:40','2025-07-03 13:57:39'),(6,2,'Funds Received','You received $5000 from 6134176661',1,'transfer','2025-07-03 08:57:40','2025-07-03 13:57:39'),(7,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 11:21:06','2025-07-03 11:21:06'),(8,1,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 11:30:03','2025-07-03 11:30:03'),(9,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 13:56:23','2025-07-03 13:56:23'),(10,4,'User Registration','New user registration',1,'register','2025-07-03 13:58:42','2025-07-03 14:09:42'),(11,1,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:02:06','2025-07-03 14:02:06'),(12,4,'Account Credited From Admin','Your account has been credited with $4000',0,'admin','2025-07-03 14:05:15','2025-07-03 14:05:15'),(13,2,'Account Credited From Admin','Your account has been credited with $2000000',0,'admin','2025-07-03 14:05:36','2025-07-03 14:05:36'),(14,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:27:51','2025-07-03 14:27:51'),(15,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:27:54','2025-07-03 14:27:54'),(16,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:31:52','2025-07-03 14:31:52'),(17,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:34:13','2025-07-03 14:34:13'),(18,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:45:07','2025-07-03 14:45:07'),(19,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:45:07','2025-07-03 14:45:07'),(20,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:46:03','2025-07-03 14:46:03'),(21,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 14:49:30','2025-07-03 14:49:30'),(22,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 15:07:35','2025-07-03 15:07:35'),(23,5,'User Registration','New user registration',1,'register','2025-07-03 15:40:39','2025-07-03 16:47:45'),(24,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 15:40:56','2025-07-03 15:40:56'),(25,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 15:41:05','2025-07-03 15:41:05'),(26,5,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 15:41:13','2025-07-03 15:41:13'),(27,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 17:10:15','2025-07-03 17:10:15'),(28,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 17:14:11','2025-07-03 17:14:11'),(29,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 17:16:01','2025-07-03 17:16:01'),(30,6,'User Registration','New user registration',1,'register','2025-07-03 17:36:45','2025-07-03 19:24:38'),(31,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 17:42:10','2025-07-03 17:42:10'),(32,6,'Account Credited From Admin','Your account has been credited with $3120457',0,'admin','2025-07-03 17:43:33','2025-07-03 17:43:33'),(33,1,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 19:23:38','2025-07-03 19:23:38'),(34,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 19:49:54','2025-07-03 19:49:54'),(35,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 22:40:45','2025-07-03 22:40:45'),(36,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 23:22:42','2025-07-03 23:22:42'),(37,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-03 23:22:42','2025-07-03 23:22:42'),(38,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-05 18:03:39','2025-07-05 18:03:39'),(39,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-06 22:34:12','2025-07-06 22:34:12'),(40,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-06 22:34:15','2025-07-06 22:34:15'),(41,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-07 20:02:29','2025-07-07 20:02:29'),(42,3,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-08 10:55:59','2025-07-08 10:55:59'),(43,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-08 15:29:22','2025-07-08 15:29:22'),(44,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-08 15:29:59','2025-07-08 15:29:59'),(45,4,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-09 10:06:50','2025-07-09 10:06:50'),(46,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-09 10:47:29','2025-07-09 10:47:29'),(47,2,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-09 10:47:37','2025-07-09 10:47:37'),(48,1,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-09 11:16:22','2025-07-09 11:16:22'),(49,4,'Transfer Completed','You transferred $20 to 8672128178',0,'transfer','2025-07-09 11:17:20','2025-07-09 11:17:20'),(50,6,'Funds Received','You received $20 from 2146707831',0,'transfer','2025-07-09 11:17:20','2025-07-09 11:17:20'),(51,6,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-17 02:04:15','2025-07-17 02:04:15'),(52,1,'Login Notification','You have successfully logged in to your account.',0,'login','2025-07-17 02:04:40','2025-07-17 02:04:40');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','c5c367ff6d8698f02ff3d670ef54f4e0be4992dea9a255d04b8ce24035900f5b','[\"*\"]','2025-07-02 21:54:16',NULL,'2025-05-29 16:59:11','2025-07-02 21:54:16'),(2,'App\\Models\\User',1,'auth_token','2a4d85ce96e2a43d591e10e7ab1cfc46bf500e5220bc6152ba6e76fbe3b752f1','[\"*\"]','2025-06-14 14:43:06',NULL,'2025-06-12 05:43:34','2025-06-14 14:43:06'),(3,'App\\Models\\User',1,'auth_token','396dc318af62aa8ee89ade7a36d546a847d090acd9bd76aefc6a63ecf4227eb7','[\"*\"]',NULL,NULL,'2025-06-12 05:51:26','2025-06-12 05:51:26'),(4,'App\\Models\\User',1,'auth_token','768d0555cacfcf74c7e164f2da5f069ba42237b831ede601df6effe458dd7011','[\"*\"]','2025-06-12 06:53:48',NULL,'2025-06-12 05:57:14','2025-06-12 06:53:48'),(5,'App\\Models\\User',1,'auth_token','2ef575c30a9184bd7165372d8092a515efef1a89ea1f4196647a40d9c220242a','[\"*\"]','2025-06-12 06:54:58',NULL,'2025-06-12 06:16:12','2025-06-12 06:54:58'),(6,'App\\Models\\User',2,'auth_token','9782dcadbe3a7e4fa097da203492a20f58f413333d89c1b951b4752963c3bd1b','[\"*\"]','2025-06-21 07:58:29',NULL,'2025-06-12 06:36:39','2025-06-21 07:58:29'),(7,'App\\Models\\User',2,'auth_token','46d5a6bf364bb11b09c80b095873e763b8a2342724e54325879f4f295e1763da','[\"*\"]',NULL,NULL,'2025-06-13 06:06:25','2025-06-13 06:06:25'),(8,'App\\Models\\User',2,'auth_token','e6a14d1a9b5c56d7cb9ddc1b419586149f3f5ea61b3500149372db25fcc3619f','[\"*\"]',NULL,NULL,'2025-06-13 11:31:35','2025-06-13 11:31:35'),(9,'App\\Models\\User',2,'auth_token','9ce917f4b6b99d03453bbc108a9614ac2657f101f6563707f2576871f3d5197a','[\"*\"]',NULL,NULL,'2025-06-13 11:32:05','2025-06-13 11:32:05'),(10,'App\\Models\\User',2,'auth_token','68e9ac8deb528a3882ef5acb6fe5d95ab1d4b6fd51dedb7b542b2f3f66d2c704','[\"*\"]',NULL,NULL,'2025-06-13 11:34:25','2025-06-13 11:34:25'),(11,'App\\Models\\User',9,'auth_token','f0dac9dbbf54bea4abb21904d4d842d087623c6f58092c1d6a0d6de2866903d9','[\"*\"]',NULL,NULL,'2025-06-13 12:25:20','2025-06-13 12:25:20'),(12,'App\\Models\\User',12,'auth_token','55a3c56b6625699b64551eb96ce13a71a898c243e015267dc6dc46f0df890486','[\"*\"]','2025-06-13 15:03:56',NULL,'2025-06-13 13:12:30','2025-06-13 15:03:56'),(13,'App\\Models\\User',35,'auth_token','6f7ba31831d24b569c83205a3d6f89c898b378f71bf7a5604a2e55214ce80444','[\"*\"]',NULL,NULL,'2025-06-13 15:59:55','2025-06-13 15:59:55'),(14,'App\\Models\\User',37,'auth_token','221285fdfacb05bed099bf3534a5610a0a8498eef27c0bef6b54b031bb3314ed','[\"*\"]',NULL,NULL,'2025-06-13 16:15:25','2025-06-13 16:15:25'),(15,'App\\Models\\User',1,'auth_token','135f8c76aab19b08d7296eca11a332a9b24bef232983774931a21a2526473631','[\"*\"]',NULL,NULL,'2025-06-13 16:35:19','2025-06-13 16:35:19'),(16,'App\\Models\\User',4,'auth_token','e5deb274673be76b090253892efac53704703a1da0cc9b7e016d0939c73efe3e','[\"*\"]','2025-06-13 23:01:38',NULL,'2025-06-13 17:09:49','2025-06-13 23:01:38'),(17,'App\\Models\\User',4,'auth_token','ebbe277fad615a622f697381eb2368ba3238782b7a3b5ceacefedbc1b9c7a777','[\"*\"]',NULL,NULL,'2025-06-13 23:39:46','2025-06-13 23:39:46'),(18,'App\\Models\\User',2,'auth_token','990e88b123a70de4bd9346a32060366ef326e5467382d8dad37a4e860dc4a7b1','[\"*\"]',NULL,NULL,'2025-06-13 23:45:50','2025-06-13 23:45:50'),(19,'App\\Models\\User',2,'auth_token','5dfc8d10ca084edf31ed51afa2735a76aaaf14860c318e41cc43904d97326d35','[\"*\"]',NULL,NULL,'2025-06-13 23:46:01','2025-06-13 23:46:01'),(20,'App\\Models\\User',2,'auth_token','d8800aaa316928d7cc8a8ae2bddd3f02cf4f3a0f8a94cf8fbda1ca7df6f35f99','[\"*\"]',NULL,NULL,'2025-06-13 23:46:05','2025-06-13 23:46:05'),(21,'App\\Models\\User',2,'auth_token','7153c0b272491ddb3d8e4cba00f5b53996b48f0286a25d69faa9bc7d94015fb0','[\"*\"]','2025-06-13 23:49:51',NULL,'2025-06-13 23:46:09','2025-06-13 23:49:51'),(22,'App\\Models\\User',2,'auth_token','36bd620ffb408fc1391a8bd94c7e4f620a83582a5f46a360ff1abd40d10d5a19','[\"*\"]','2025-06-14 09:03:07',NULL,'2025-06-13 23:51:01','2025-06-14 09:03:07'),(23,'App\\Models\\User',2,'auth_token','7a9afbf30f12d1d899a7447c5592dbfad62b9cd3ebc0c5f1ea2ac78a8e2e16d9','[\"*\"]','2025-06-14 00:03:13',NULL,'2025-06-14 00:02:31','2025-06-14 00:03:13'),(24,'App\\Models\\User',4,'auth_token','284282677fe7f92d6e7f81ff8699b8d9bda3ff295335973d9a4f1096ba83b091','[\"*\"]',NULL,NULL,'2025-06-14 01:31:32','2025-06-14 01:31:32'),(25,'App\\Models\\User',4,'auth_token','cb04f21f9adf7b2291daf3d3e5ba749bc72a90279d748f90bc157b4d497fd064','[\"*\"]','2025-06-14 10:44:34',NULL,'2025-06-14 01:32:05','2025-06-14 10:44:34'),(26,'App\\Models\\User',4,'auth_token','10b226eefb923e9182124859e7ce85c42bf495ea95bf65522c42a073a1f0353f','[\"*\"]',NULL,NULL,'2025-06-14 09:47:20','2025-06-14 09:47:20'),(27,'App\\Models\\User',4,'auth_token','2478d654e3f5bba97dd7a89b4273452d1f83897ce1d4b06e2236bf6ea0279041','[\"*\"]',NULL,NULL,'2025-06-14 09:47:29','2025-06-14 09:47:29'),(28,'App\\Models\\User',4,'auth_token','e80f52bb5c4b2da80a5dee7d51699a6c4356741255f10b31e827bf641c456b33','[\"*\"]',NULL,NULL,'2025-06-14 09:48:31','2025-06-14 09:48:31'),(29,'App\\Models\\User',4,'auth_token','c579736760c57c5e4f68c4cfea4c056e0ae3d280e652bff29071eab35d19126b','[\"*\"]','2025-06-14 13:49:43',NULL,'2025-06-14 09:49:04','2025-06-14 13:49:43'),(30,'App\\Models\\User',2,'auth_token','3cd6a3934b35c16a66d5b1d571cd918787a603aceda33ba06f6331a8f27c86e5','[\"*\"]','2025-06-14 14:36:22',NULL,'2025-06-14 14:24:08','2025-06-14 14:36:22'),(31,'App\\Models\\User',4,'auth_token','db323b124af4533cad9696a5bdd3f07c112a751cc1a8d63fccf584bd08dba236','[\"*\"]','2025-06-14 20:56:24',NULL,'2025-06-14 16:24:06','2025-06-14 20:56:24'),(32,'App\\Models\\User',4,'auth_token','0cb094fbb9917c0e301cd150ba0e22f8400f999c7a4fcca249e5068bb5013aa0','[\"*\"]','2025-06-14 17:17:43',NULL,'2025-06-14 16:34:39','2025-06-14 17:17:43'),(33,'App\\Models\\User',2,'auth_token','18ff02784a4aa61bdeb14cb010cdbed0cec03e762e4b780d2c494a9bbea37ff6','[\"*\"]','2025-06-14 16:57:36',NULL,'2025-06-14 16:56:55','2025-06-14 16:57:36'),(34,'App\\Models\\User',1,'auth_token','9c30e6e68008c094ddec9bb96c2dccd6d767fc75465cbc1601ea5f8f29dfd618','[\"*\"]','2025-06-24 23:12:51',NULL,'2025-06-14 16:58:20','2025-06-24 23:12:51'),(35,'App\\Models\\User',2,'auth_token','d4165f4b39f910c832c4556967920ed31c39ac109b00e6e38eea6a335812f180','[\"*\"]',NULL,NULL,'2025-06-14 18:23:52','2025-06-14 18:23:52'),(36,'App\\Models\\User',2,'auth_token','c0d4a8be7905f4b8493719c120d91588a414ecfcdbe1575755f288360603f5f2','[\"*\"]',NULL,NULL,'2025-06-20 04:47:19','2025-06-20 04:47:19'),(37,'App\\Models\\User',2,'auth_token','68259ef83f238236040e09fe950e3ed61a00d162ec006227abd00bd98124fdb7','[\"*\"]',NULL,NULL,'2025-06-20 06:22:04','2025-06-20 06:22:04'),(38,'App\\Models\\User',2,'auth_token','af91aa7315127e7807ee39d22520410466898a102cff0fc6bdbfd51fa64bd5c1','[\"*\"]',NULL,NULL,'2025-06-20 06:23:15','2025-06-20 06:23:15'),(39,'App\\Models\\User',2,'auth_token','70dafcab192a3ec59b580e1db037a586f07029ba6fdf8a827ca76ca7c7ee800c','[\"*\"]','2025-06-20 14:10:11',NULL,'2025-06-20 06:23:24','2025-06-20 14:10:11'),(40,'App\\Models\\User',2,'auth_token','2b67baadf55ac8b521513c0c46b86d80860b788249e2f29d4a6ff6a1366febc4','[\"*\"]','2025-06-20 09:35:04',NULL,'2025-06-20 09:33:35','2025-06-20 09:35:04'),(41,'App\\Models\\User',2,'auth_token','002bb8fc888f0c2677a2e92b83199d4af6efb702c6bf078adf94653d24856a35','[\"*\"]','2025-06-21 08:00:03',NULL,'2025-06-20 11:41:55','2025-06-21 08:00:03'),(42,'App\\Models\\User',6,'auth_token','543b95f9dd739a1dc08815b2f66674349af53a98dba4a6554c085bba21aff056','[\"*\"]','2025-07-03 03:16:54',NULL,'2025-06-21 08:10:45','2025-07-03 03:16:54'),(43,'App\\Models\\User',2,'auth_token','e1dc54637f37e31912ded2a1629d4b79c4813e422b87a2e480558fe2003cff9b','[\"*\"]','2025-06-21 11:40:26',NULL,'2025-06-21 11:02:40','2025-06-21 11:40:26'),(44,'App\\Models\\User',6,'auth_token','bd6f50d2a177d13eeba29b5d98eafda20d21f0b3a7c94860ca19ff93e17a59bb','[\"*\"]','2025-06-21 12:46:03',NULL,'2025-06-21 12:12:40','2025-06-21 12:46:03'),(45,'App\\Models\\User',2,'auth_token','ee718bc085f74befdd08096e1dac526dbc93f04f16c36cd582320723c533e36b','[\"*\"]','2025-06-21 12:42:34',NULL,'2025-06-21 12:41:21','2025-06-21 12:42:34'),(46,'App\\Models\\User',6,'auth_token','88bdde9e9fb919fb274ffc54361e7631a57b47665094f2f45a61f67bc3095a48','[\"*\"]','2025-06-22 06:16:46',NULL,'2025-06-22 02:38:21','2025-06-22 06:16:46'),(47,'App\\Models\\User',2,'auth_token','37472fd7b3f9ef1d9c697406d2b3b95bf283b990d68e00df891231f0d6e753d6','[\"*\"]','2025-06-22 06:15:54',NULL,'2025-06-22 02:46:48','2025-06-22 06:15:54'),(48,'App\\Models\\User',2,'auth_token','e0298296525362ec2a1669d9bb1d2e7f32f583e149833db13b56fc3f781a7aaf','[\"*\"]',NULL,NULL,'2025-06-22 05:23:10','2025-06-22 05:23:10'),(49,'App\\Models\\User',6,'auth_token','37b61c9d216c0d53d5db8114b434b15570788c15f14f459a86a45bbb59865bd6','[\"*\"]','2025-06-24 22:17:58',NULL,'2025-06-22 05:23:43','2025-06-24 22:17:58'),(50,'App\\Models\\User',6,'auth_token','765b4bfc5e0ae8c6a32b8e02fbbf42431b9ae9e4ac5950ba18ed1ccf70e2c095','[\"*\"]','2025-06-23 17:32:31',NULL,'2025-06-22 05:59:27','2025-06-23 17:32:31'),(51,'App\\Models\\User',6,'auth_token','7bf91a02f27346ce1bd495c1637efba399b80b7f6f60717d1274ca9eb0ebe184','[\"*\"]','2025-06-24 12:48:32',NULL,'2025-06-23 17:40:35','2025-06-24 12:48:32'),(52,'App\\Models\\User',6,'auth_token','b0e83956e3ea466802832e4c60ceb10b51da62cac01978f768db9720ec33cc91','[\"*\"]','2025-06-24 05:16:18',NULL,'2025-06-24 05:15:15','2025-06-24 05:16:18'),(53,'App\\Models\\User',6,'auth_token','4aadf445a89fd60c01929600c01ef417cffd9ed685e28c02abddedfabbd29a4f','[\"*\"]','2025-06-24 23:31:27',NULL,'2025-06-24 19:38:31','2025-06-24 23:31:27'),(54,'App\\Models\\User',1,'auth_token','c02f2e1a6171bf04be2bba002be31dba886ef2729f544485ead6e3e017991a21','[\"*\"]',NULL,NULL,'2025-06-25 02:30:55','2025-06-25 02:30:55'),(55,'App\\Models\\User',1,'auth_token','906bf74725f6f0009a93a0ee2b6f0fd6453df259b04d5143f3371134c5fa76ee','[\"*\"]',NULL,NULL,'2025-06-25 02:31:51','2025-06-25 02:31:51'),(56,'App\\Models\\User',6,'auth_token','b5f432c04a1a462180ff270d8b80b3a92dc9938ea4efdc022dbc8094bae297e9','[\"*\"]',NULL,NULL,'2025-06-25 02:35:25','2025-06-25 02:35:25'),(57,'App\\Models\\User',1,'auth_token','85d1098b84d9e16b9e178095322fdd7e173d680582b81631c99d012ca5f50f24','[\"*\"]',NULL,NULL,'2025-06-25 02:35:45','2025-06-25 02:35:45'),(58,'App\\Models\\User',1,'auth_token','e7fae5fa74f204dcd16300a3d86261f3dd4604f70e59e67c612e589890a45a3e','[\"*\"]','2025-06-26 19:28:58',NULL,'2025-06-26 08:34:07','2025-06-26 19:28:58'),(59,'App\\Models\\User',2,'auth_token','b5bbdbc59eb3ef8fb23c29d9b319e515e76242b94a64fbad3f7341e9388d7f8f','[\"*\"]','2025-06-26 12:34:51',NULL,'2025-06-26 08:49:31','2025-06-26 12:34:51'),(60,'App\\Models\\User',2,'auth_token','a70d2d3dc492faf725d2730bc8a322d3fbfa12bc90027af07bfa0be8dcaba50e','[\"*\"]','2025-06-27 08:03:44',NULL,'2025-06-26 08:49:53','2025-06-27 08:03:44'),(61,'App\\Models\\User',2,'auth_token','80cbe8f37cdd3cd669f5ead3e37efbd33c4df372bb53ff46fd66ef8480f23632','[\"*\"]','2025-07-02 22:21:46',NULL,'2025-06-26 12:28:41','2025-07-02 22:21:46'),(62,'App\\Models\\User',2,'auth_token','843f011ef583148f1944130fab95bcad15fd6f427176657dc1338e569aa14204','[\"*\"]','2025-06-26 12:51:18',NULL,'2025-06-26 12:42:12','2025-06-26 12:51:18'),(63,'App\\Models\\User',7,'auth_token','1178fcc35d48e65f307cec9a605889dfe3149091fa048f2b8593dd8692e01e3c','[\"*\"]','2025-06-27 08:34:54',NULL,'2025-06-26 19:34:34','2025-06-27 08:34:54'),(64,'App\\Models\\User',2,'auth_token','1739bb0228b9a159ffd9aa5b93b66b6501b658a5f590b6d035a1c51ad220540c','[\"*\"]',NULL,NULL,'2025-06-27 08:33:30','2025-06-27 08:33:30'),(65,'App\\Models\\User',2,'auth_token','8be7cb91850f7bb2239b9d1fe5636c85cece9157079db4b92248f48ff55c5c9c','[\"*\"]','2025-06-27 08:41:34',NULL,'2025-06-27 08:34:14','2025-06-27 08:41:34'),(66,'App\\Models\\User',9,'auth_token','0381f88a2f1905f480b04ab95b1d71fb3e9744cebc6947445638a9f06e614dbf','[\"*\"]',NULL,NULL,'2025-06-27 08:37:50','2025-06-27 08:37:50'),(67,'App\\Models\\User',9,'auth_token','9a61da78db97f744becc24cb929bc635299bc7e410ef43819c813b52cdc44236','[\"*\"]','2025-06-28 04:55:23',NULL,'2025-06-27 08:43:16','2025-06-28 04:55:23'),(68,'App\\Models\\User',6,'auth_token','6a489c423a7711fd4fc006a507a75748b713641b147e8a4e4181cd943240cafe','[\"*\"]',NULL,NULL,'2025-06-28 04:45:38','2025-06-28 04:45:38'),(69,'App\\Models\\User',9,'auth_token','6f22eadb8c842cc3d374aba560bb55a018f6f3fd6096c6eb00b6a96561dce0c7','[\"*\"]',NULL,NULL,'2025-06-28 04:58:50','2025-06-28 04:58:50'),(70,'App\\Models\\User',9,'auth_token','fe474aba799d49d86e66b1815f48a61169ba1875f4639c1c17110a625cbf4a0d','[\"*\"]',NULL,NULL,'2025-06-28 05:00:38','2025-06-28 05:00:38'),(71,'App\\Models\\User',9,'auth_token','c5d82a5af89cb0231720d5ef7df38a6b1fa34f7195106cfda889a55000826162','[\"*\"]',NULL,NULL,'2025-06-28 05:02:43','2025-06-28 05:02:43'),(72,'App\\Models\\User',9,'auth_token','5868ba4903b746fc9639398d3b9fefefed16dc7b561363bd784b257704f9c51f','[\"*\"]',NULL,NULL,'2025-06-28 05:07:02','2025-06-28 05:07:02'),(73,'App\\Models\\User',9,'auth_token','cb5a8dcdb15aa96bea79b073827021ebd2200e0ac799bda4e666fb6ab0b3811e','[\"*\"]',NULL,NULL,'2025-06-28 05:08:18','2025-06-28 05:08:18'),(74,'App\\Models\\User',9,'auth_token','5f3476d04455b7b8b3a079796b7474ba021e2be5da71d074866e9fdcae7be446','[\"*\"]',NULL,NULL,'2025-06-28 05:12:35','2025-06-28 05:12:35'),(75,'App\\Models\\User',9,'auth_token','446d59fea7f32ec062ff32aa2bcec6a1d1565531c1602679cb77bf628e3cdc53','[\"*\"]',NULL,NULL,'2025-06-28 05:15:30','2025-06-28 05:15:30'),(76,'App\\Models\\User',6,'auth_token','2b8cfa8f3acb7c2b5ee6a7a1dd946a86ef4f2b2a9f77e7ff103a8b1069daa084','[\"*\"]','2025-06-28 12:30:12',NULL,'2025-06-28 12:27:55','2025-06-28 12:30:12'),(77,'App\\Models\\User',2,'auth_token','8419ab6fa85db4ad1368743adceb72af9ecc669a1890c896ef8f6d2ccccd9635','[\"*\"]','2025-06-28 12:37:41',NULL,'2025-06-28 12:31:31','2025-06-28 12:37:41'),(78,'App\\Models\\User',2,'auth_token','07ed9d9eac15c32642ef8d724608e23e0839974ccebb9171e631000882943555','[\"*\"]','2025-06-30 12:33:58',NULL,'2025-06-30 12:19:02','2025-06-30 12:33:58'),(79,'App\\Models\\User',10,'auth_token','dc016d7ab6af00feeff65eb85603fd931ebd462250bb5b6b689cc4b751d66f3c','[\"*\"]',NULL,NULL,'2025-06-30 12:23:42','2025-06-30 12:23:42'),(80,'App\\Models\\User',11,'auth_token','3bbc996e27ad6c69e19713e5fdc9b0779d75089ffe1124fb6a1dd8a15af8ca16','[\"*\"]',NULL,NULL,'2025-06-30 12:27:01','2025-06-30 12:27:01'),(81,'App\\Models\\User',11,'auth_token','09b1d0f11469841bf695f72f8b5ad5622627dc928e4a595d0018d423b3b7c78d','[\"*\"]','2025-06-30 12:36:44',NULL,'2025-06-30 12:27:25','2025-06-30 12:36:44'),(82,'App\\Models\\User',10,'auth_token','82656b9ced1fdf364cb6f13ba0c3662ff5b019cfab37a94006db2126d6ab9a77','[\"*\"]','2025-07-01 12:26:02',NULL,'2025-06-30 23:00:06','2025-07-01 12:26:02'),(83,'App\\Models\\User',14,'auth_token','64e8bd30bb10f9ef6a54443dab2073df197e93fbcff4ffad79a16daa21b0d6fe','[\"*\"]',NULL,NULL,'2025-07-01 14:03:36','2025-07-01 14:03:36'),(84,'App\\Models\\User',15,'auth_token','82375c2d5326e233887545196b36183ee21e81663978c0a59743286482a0143f','[\"*\"]',NULL,NULL,'2025-07-01 14:19:36','2025-07-01 14:19:36'),(85,'App\\Models\\User',10,'auth_token','6915a35d8fd16db0d6133a3ade80e37f1b27958caf394ee8c29c931c93399952','[\"*\"]','2025-07-01 17:45:08',NULL,'2025-07-01 17:45:06','2025-07-01 17:45:08'),(86,'App\\Models\\User',10,'auth_token','ee47300d4a43c7194f3a018600bb4a4fe1c3d1d23200e94039c00c211bccf028','[\"*\"]','2025-07-01 20:22:47',NULL,'2025-07-01 17:45:07','2025-07-01 20:22:47'),(87,'App\\Models\\User',16,'auth_token','1292541e28edc5ea9f306e753d841ac2cef6e2d9f038cee8c2d914deaacdaf04','[\"*\"]',NULL,NULL,'2025-07-01 17:46:49','2025-07-01 17:46:49'),(88,'App\\Models\\User',17,'auth_token','40608d9a2ab533208e46a8c0ee2715ed861196f4b1a35ba12be4c8063f4b5285','[\"*\"]',NULL,NULL,'2025-07-01 17:56:04','2025-07-01 17:56:04'),(89,'App\\Models\\User',18,'auth_token','b4549dae5efd9409f77afed0f4231feaa55e81b34029159b4dc03ec87c6d7ebc','[\"*\"]',NULL,NULL,'2025-07-01 17:59:51','2025-07-01 17:59:51'),(90,'App\\Models\\User',19,'auth_token','b7f237e45b706962f1498e8e8b781729228bac5ccb79e781bee023ac2cc108df','[\"*\"]',NULL,NULL,'2025-07-01 18:06:54','2025-07-01 18:06:54'),(91,'App\\Models\\User',20,'auth_token','2feee6195195a8256a4171e6b2ee7ae5faebbac69cf5b0a114de4466098fe46e','[\"*\"]','2025-07-01 18:15:54',NULL,'2025-07-01 18:14:10','2025-07-01 18:15:54'),(92,'App\\Models\\User',2,'auth_token','da378b0c1b588165d059db9491f23a628fbc9b2c20b184b09f6a93a8bad26904','[\"*\"]','2025-07-01 20:10:33',NULL,'2025-07-01 19:57:25','2025-07-01 20:10:33'),(93,'App\\Models\\User',2,'auth_token','a2f524cde18a10199734244d857c261009e2b2c078e7c23dd1302bd7fe4bce24','[\"*\"]','2025-07-03 02:23:54',NULL,'2025-07-01 20:11:36','2025-07-03 02:23:54'),(94,'App\\Models\\User',6,'auth_token','51a8cffb86deb0921db52d8c4b1890bdd8977cf6dde7b1eeadd8f48e07e4bc08','[\"*\"]','2025-07-02 10:40:42',NULL,'2025-07-01 20:17:30','2025-07-02 10:40:42'),(95,'App\\Models\\User',10,'auth_token','a8e3b062d5f698fa6e8ac171a43b21de2eb99309a6b14e2273a38cf2d7a92409','[\"*\"]','2025-07-01 21:01:04',NULL,'2025-07-01 20:40:18','2025-07-01 21:01:04'),(96,'App\\Models\\User',10,'auth_token','0538babae92686f73870bfe66747c1ee100333a098da6767662897f10e8ab411','[\"*\"]','2025-07-01 21:06:44',NULL,'2025-07-01 21:05:09','2025-07-01 21:06:44'),(97,'App\\Models\\User',10,'auth_token','5df9cc8adda4c5186bddc65ec9ee9c6a33e477088b32b72e4aead70f6bec7122','[\"*\"]','2025-07-02 00:30:04',NULL,'2025-07-01 21:30:01','2025-07-02 00:30:04'),(98,'App\\Models\\User',6,'auth_token','c13ab2bf8adcd072c2017c6f5fc26dfa8a2f4db9c61148b33de0cf13832438c6','[\"*\"]','2025-07-02 14:22:28',NULL,'2025-07-01 23:47:04','2025-07-02 14:22:28'),(99,'App\\Models\\User',10,'auth_token','1bd7944d061eb78ce2a24aa16d5c34599b92389004ee9bdfd140779c78825ebf','[\"*\"]','2025-07-02 00:30:27',NULL,'2025-07-02 00:30:24','2025-07-02 00:30:27'),(100,'App\\Models\\User',10,'auth_token','01f94a40f040d0c1ef7f94df8cd79d7822b1a4bf4cb4ee61bd8de375171d98ed','[\"*\"]','2025-07-02 00:31:15',NULL,'2025-07-02 00:30:44','2025-07-02 00:31:15'),(101,'App\\Models\\User',10,'auth_token','672c48c9c56eef10b8d5605a09a58fadf7dd45f319cdce007362504de6efb1fc','[\"*\"]',NULL,NULL,'2025-07-02 00:58:21','2025-07-02 00:58:21'),(102,'App\\Models\\User',10,'auth_token','5363360d1891ddb404ea2a6c7de18be3c13851cc9630be94afc73e4513205bd1','[\"*\"]','2025-07-02 01:35:28',NULL,'2025-07-02 00:58:21','2025-07-02 01:35:28'),(103,'App\\Models\\User',10,'auth_token','20dafadafc2a8e7d86a2b53af8792c86f4ac279ab22fae68fbd11edbcc35e1a1','[\"*\"]','2025-07-02 11:17:28',NULL,'2025-07-02 01:35:38','2025-07-02 11:17:28'),(104,'App\\Models\\User',10,'auth_token','4d6bc893b1ee21655eab94efdaace18be9c58fbf934e2c8ff71c62445f35d0a1','[\"*\"]','2025-07-02 15:22:17',NULL,'2025-07-02 11:17:38','2025-07-02 15:22:17'),(105,'App\\Models\\User',2,'auth_token','51621c69aad947b6d0993f4d02a8564d540e9d30ac8eeb35865624a3e4fa7f89','[\"*\"]','2025-07-03 03:08:44',NULL,'2025-07-02 11:32:59','2025-07-03 03:08:44'),(106,'App\\Models\\User',6,'auth_token','9022c32edf025a04de8c35d6171315ab4b85c6a9538095202d5372f5ebe1971a','[\"*\"]','2025-07-02 13:03:03',NULL,'2025-07-02 12:51:56','2025-07-02 13:03:03'),(107,'App\\Models\\User',10,'auth_token','eb644354b0a33971ef732712962c2593aa8d1344eb4b2ae96565b8eaa5caaa8c','[\"*\"]','2025-07-02 21:11:59',NULL,'2025-07-02 15:04:41','2025-07-02 21:11:59'),(108,'App\\Models\\User',27,'auth_token','5584bd84530346098680a412fc3c2a9be62dadb70fc224e3d599af1570010cd0','[\"*\"]','2025-07-02 16:15:09',NULL,'2025-07-02 16:09:50','2025-07-02 16:15:09'),(109,'App\\Models\\User',28,'auth_token','b4b3d5201f4b7ae01a8b3e0228618e2f897c626e2980ad1066b8e8d5f31b2d42','[\"*\"]','2025-07-02 18:00:27',NULL,'2025-07-02 17:58:16','2025-07-02 18:00:27'),(110,'App\\Models\\User',2,'auth_token','b844107c784bbefb2d0c0036032847bb43f273503a865e2444762aaac8edebb4','[\"*\"]','2025-07-02 21:49:51',NULL,'2025-07-02 18:00:10','2025-07-02 21:49:51'),(111,'App\\Models\\User',4,'auth_token','104194c8c9daee91f3a84cfb197b7c904c030d233ed5fdb99ad9683cc817e3ff','[\"*\"]','2025-07-02 20:57:47',NULL,'2025-07-02 18:04:24','2025-07-02 20:57:47'),(112,'App\\Models\\User',10,'auth_token','35a5af601fa0f774bd956ccb89296abcdfced2f5d39b8a819263967fadb3d9ff','[\"*\"]','2025-07-02 21:18:19',NULL,'2025-07-02 20:57:21','2025-07-02 21:18:19'),(113,'App\\Models\\User',10,'auth_token','53fa14947fe32d3bed2e7d3c9afb731a3d4642d97a831e3c9dd9ed148d51011d','[\"*\"]','2025-07-02 21:12:19',NULL,'2025-07-02 21:12:13','2025-07-02 21:12:19'),(114,'App\\Models\\User',2,'auth_token','edbe2601e2fd5a312a4968f7f163a4b7bb0725c5e05d739919ccc4031fd7cf3d','[\"*\"]','2025-07-03 19:22:50',NULL,'2025-07-02 21:13:30','2025-07-03 19:22:50'),(115,'App\\Models\\User',29,'auth_token','e7c2f4690a67334ea35ea2e9bea816df54154d412fc68737df827daa07aac5f3','[\"*\"]','2025-07-02 21:26:04',NULL,'2025-07-02 21:21:38','2025-07-02 21:26:04'),(116,'App\\Models\\User',10,'auth_token','31af3d31e5dca3c1bd959867a3bf85451466e32b66e6784b4dede4ae0a004188','[\"*\"]','2025-07-03 01:19:16',NULL,'2025-07-02 21:26:18','2025-07-03 01:19:16'),(117,'App\\Models\\User',2,'auth_token','002148f24bf2a277ca96e6e6116df1ff78c910e5c3199bf0c7f856db62dc4490','[\"*\"]','2025-07-02 22:27:36',NULL,'2025-07-02 21:49:43','2025-07-02 22:27:36'),(118,'App\\Models\\User',2,'auth_token','b535a8773046b8792ad2b1f17be87e8941f56f2777a0a5a897e1b176517c0f6c','[\"*\"]','2025-07-02 22:06:04',NULL,'2025-07-02 21:54:58','2025-07-02 22:06:04'),(119,'App\\Models\\User',2,'auth_token','24f9bdae6cb5d029f5cded0f96fdce765144b852d8589e92e828be2b25fc9be9','[\"*\"]','2025-07-02 22:31:23',NULL,'2025-07-02 22:12:57','2025-07-02 22:31:23'),(120,'App\\Models\\User',10,'auth_token','41d2c97a9c60de5c82ecbfc8734b84cb20fa88c202ab6c8658e45c3365767320','[\"*\"]','2025-07-02 23:07:40',NULL,'2025-07-02 23:07:26','2025-07-02 23:07:40'),(121,'App\\Models\\User',2,'auth_token','74fcf7a9e8da2bb8ff0b49faa2a81d5f16bca6fce3840e62d0536aa40ae3ca13','[\"*\"]','2025-07-02 23:07:54',NULL,'2025-07-02 23:07:52','2025-07-02 23:07:54'),(122,'App\\Models\\User',2,'auth_token','084acade13d8db26ec8a4a74620b4701482a0ec4e0b2f9fa1d06f0ab24cc8226','[\"*\"]','2025-07-03 00:00:37',NULL,'2025-07-03 00:00:36','2025-07-03 00:00:37'),(123,'App\\Models\\User',2,'auth_token','955e2fdf287a8912d4882d9b52d62a34e32ef4b164107d255c0db572478756b0','[\"*\"]',NULL,NULL,'2025-07-03 00:00:36','2025-07-03 00:00:36'),(124,'App\\Models\\User',10,'auth_token','51c04efb91350064688355c339bb12d5f9676de8a7ffbc1febe4ed41f65f7a60','[\"*\"]','2025-07-03 00:03:19',NULL,'2025-07-03 00:01:06','2025-07-03 00:03:19'),(125,'App\\Models\\User',10,'auth_token','b05eab51fb0b3c2b1dbab5b27cc7182981b47707eb6da7bec70c903c8a5dc17b','[\"*\"]',NULL,NULL,'2025-07-03 00:28:04','2025-07-03 00:28:04'),(126,'App\\Models\\User',10,'auth_token','9822aad2fb8a9abe07214708537bf5737f51f80b9af55ee47763feb8a384b15e','[\"*\"]','2025-07-03 00:28:11',NULL,'2025-07-03 00:28:04','2025-07-03 00:28:11'),(127,'App\\Models\\User',10,'auth_token','ba5b156e6d3b23e6e695275614ef12ae89dcd39b6bda90ec4c7c49e65cbac079','[\"*\"]','2025-07-03 00:28:27',NULL,'2025-07-03 00:28:20','2025-07-03 00:28:27'),(128,'App\\Models\\User',2,'auth_token','8e73efaf19517bcb0195932eb680fabea06259f72e8373096c396d5c669c757b','[\"*\"]','2025-07-03 01:28:02',NULL,'2025-07-03 01:28:00','2025-07-03 01:28:02'),(129,'App\\Models\\User',29,'auth_token','905ac578b812dd91329b9aff433fe0510ab886f38cbecc7dc2316dfb2d4b5aa1','[\"*\"]','2025-07-03 01:30:16',NULL,'2025-07-03 01:30:01','2025-07-03 01:30:16'),(130,'App\\Models\\User',10,'auth_token','837cb4c7b82d3f4999d8609812f0b7037ce88ad9d324e9f155169657f64b3081','[\"*\"]','2025-07-03 01:30:58',NULL,'2025-07-03 01:30:31','2025-07-03 01:30:58'),(131,'App\\Models\\User',2,'auth_token','ab8eeb47cbb23d87d2f014af7e069e4bf6d70ee065b8f799d34165470a6731a4','[\"*\"]','2025-07-03 01:53:48',NULL,'2025-07-03 01:53:44','2025-07-03 01:53:48'),(132,'App\\Models\\User',10,'auth_token','7f3370ee841080caa74ff4af0e0a5ddab9f6c48019533bcf90e536f451363ffd','[\"*\"]','2025-07-03 02:01:31',NULL,'2025-07-03 01:53:59','2025-07-03 02:01:31'),(133,'App\\Models\\User',29,'auth_token','51d44e33cdec13b32fa4e417cecc63013f2b75a9e7c8ea41b921a816ade095c0','[\"*\"]','2025-07-03 02:13:02',NULL,'2025-07-03 02:08:42','2025-07-03 02:13:02'),(134,'App\\Models\\User',2,'auth_token','e89c674634167a49c8f90bc95dd2f6ef5012aa6148917dd16a5d591c4982085c','[\"*\"]','2025-07-03 02:13:19',NULL,'2025-07-03 02:13:17','2025-07-03 02:13:19'),(135,'App\\Models\\User',10,'auth_token','5139cfb73eb40bebaf695bd14998fce14fa6f6753f9173633374efcb636cfe9a','[\"*\"]','2025-07-03 07:25:02',NULL,'2025-07-03 02:13:35','2025-07-03 07:25:02'),(136,'App\\Models\\User',6,'auth_token','b321e493e7ff114fdd53bfc3b8adfd9e779b52a37770ada72398ec3f3edb337b','[\"*\"]','2025-07-03 03:32:30',NULL,'2025-07-03 02:47:01','2025-07-03 03:32:30'),(137,'App\\Models\\User',6,'auth_token','f82059e02c01c091b1d01ecb5ee31c801ab98385c5f7a5f4e204fd53bc61c46d','[\"*\"]',NULL,NULL,'2025-07-03 03:14:23','2025-07-03 03:14:23'),(138,'App\\Models\\User',30,'auth_token','fafdb57247fb470b430d5b99d941986b366bc9ab60147b8049759ad54a487a9a','[\"*\"]','2025-07-03 07:08:37',NULL,'2025-07-03 07:07:21','2025-07-03 07:08:37'),(139,'App\\Models\\User',6,'auth_token','892fae6bef1e5a7d41b744762c49059976f9b90be1e1fb5d90fa7787dc1b61bf','[\"*\"]','2025-07-03 07:12:58',NULL,'2025-07-03 07:09:38','2025-07-03 07:12:58'),(140,'App\\Models\\User',6,'auth_token','99f66d8e69ceeafa063c5619e5aa73ac6cb87fc6fd0178ebc5400a96803d07fd','[\"*\"]','2025-07-03 07:21:57',NULL,'2025-07-03 07:21:00','2025-07-03 07:21:57'),(141,'App\\Models\\User',31,'auth_token','f752410f33d72f2d1d62ef455eeadf094d82bd53455aa21d45ae72c9c2ceebdf','[\"*\"]',NULL,NULL,'2025-07-03 07:24:34','2025-07-03 07:24:34'),(142,'App\\Models\\User',10,'auth_token','d5ba88cba8238cc28a5512e110fd9dcddc0de21073229271ca67c1d8e7b8bca8','[\"*\"]','2025-07-03 07:25:30',NULL,'2025-07-03 07:25:26','2025-07-03 07:25:30'),(143,'App\\Models\\User',10,'auth_token','a1045a46dc818683ac712a427758ca5367866c242727f47b94294ddfa0d136ce','[\"*\"]',NULL,NULL,'2025-07-03 07:25:30','2025-07-03 07:25:30'),(144,'App\\Models\\User',10,'auth_token','0c489caf861da349f1cdd11ebaacf59e6c760c53baeb78b67796e0b993b2c329','[\"*\"]','2025-07-03 07:28:06',NULL,'2025-07-03 07:25:30','2025-07-03 07:28:06'),(145,'App\\Models\\User',2,'auth_token','cf6a3912ac962dbba9e75ea89e9ee9abd34b752e2f9344e2abbc06e013dd1764','[\"*\"]','2025-07-03 07:33:54',NULL,'2025-07-03 07:30:12','2025-07-03 07:33:54'),(146,'App\\Models\\User',2,'auth_token','db4bf58c70933b7a9a7909de2af0667a9362d4748a9a3829cfdb68a74e7ab463','[\"*\"]','2025-07-03 07:47:59',NULL,'2025-07-03 07:46:41','2025-07-03 07:47:59'),(147,'App\\Models\\User',2,'auth_token','fa1b960a0c0e99339e38cb8161255a22a3f27a7b4f57a12c265681f45e7e13ce','[\"*\"]','2025-07-03 07:52:54',NULL,'2025-07-03 07:48:22','2025-07-03 07:52:54'),(148,'App\\Models\\User',1,'auth_token','c3f77359b00deca6073eb390ab76baa6b3414c5aea5efb39175aa3da2d3b85bf','[\"*\"]','2025-07-03 22:39:41',NULL,'2025-07-03 07:49:09','2025-07-03 22:39:41'),(149,'App\\Models\\User',3,'auth_token','0f163fe29d0f1a2ec81ef1bb7d9076dc588cd96434cb96a980274a043bacb005','[\"*\"]','2025-07-03 11:20:37',NULL,'2025-07-03 08:01:30','2025-07-03 11:20:37'),(150,'App\\Models\\User',2,'auth_token','cb56436004662d38890fa7066d6679dd9822c72142a11d106c3093e5582fb571','[\"*\"]','2025-07-03 11:29:50',NULL,'2025-07-03 11:21:06','2025-07-03 11:29:50'),(151,'App\\Models\\User',1,'auth_token','0653879c839ae396df90881d273142c393b769b5e21dac45da93e38a4e173266','[\"*\"]','2025-07-03 11:30:14',NULL,'2025-07-03 11:30:03','2025-07-03 11:30:14'),(152,'App\\Models\\User',2,'auth_token','eac7e428e401fd00722999c2335f29a57864707d0e4754dd4b3b2ca24da2c0f5','[\"*\"]','2025-07-03 14:27:13',NULL,'2025-07-03 13:56:23','2025-07-03 14:27:13'),(153,'App\\Models\\User',4,'auth_token','1598db9462425dc5b399765f5816cfaae36836de8a8ee85b9c114d44ce27ae0b','[\"*\"]','2025-07-03 20:43:05',NULL,'2025-07-03 13:59:27','2025-07-03 20:43:05'),(154,'App\\Models\\User',1,'auth_token','dfd449d25792c7e595ebfe86b7df76c6b81ead2c8c128ce7e095eba42e0cf389','[\"*\"]','2025-07-03 14:05:23',NULL,'2025-07-03 14:02:06','2025-07-03 14:05:23'),(155,'App\\Models\\User',2,'auth_token','2fe580d64fc7b91f9b415ed6889401ee7722619c43171be1bfbc3180a8a5f289','[\"*\"]','2025-07-03 14:28:02',NULL,'2025-07-03 14:27:51','2025-07-03 14:28:02'),(156,'App\\Models\\User',3,'auth_token','1832dbefaba1706e3995b84468fc38270888f69d768d726b73d28bfafd07f4f5','[\"*\"]','2025-07-03 14:31:27',NULL,'2025-07-03 14:27:54','2025-07-03 14:31:27'),(157,'App\\Models\\User',3,'auth_token','0d3494fe74fe378e6d9529b8bcac9befa8b37649d18eb2e811207aa6603ec530','[\"*\"]','2025-07-03 14:32:04',NULL,'2025-07-03 14:31:52','2025-07-03 14:32:04'),(158,'App\\Models\\User',3,'auth_token','b01a6f3fb9b22e32dae2be601780dab9e5534f46168af51bc15cf52c04324bf4','[\"*\"]','2025-07-03 14:37:03',NULL,'2025-07-03 14:34:13','2025-07-03 14:37:03'),(159,'App\\Models\\User',3,'auth_token','f0f6f22ce9ae193a5321d3ea3371b0541ab58e54909028942a1f0c100785b9de','[\"*\"]','2025-07-03 14:45:41',NULL,'2025-07-03 14:45:07','2025-07-03 14:45:41'),(160,'App\\Models\\User',3,'auth_token','bf93e9f2c6cc7a8a0f23ed7decae55c4bfce5f6de93ea2ea8c6076a38c47143e','[\"*\"]',NULL,NULL,'2025-07-03 14:45:07','2025-07-03 14:45:07'),(161,'App\\Models\\User',2,'auth_token','56c253203c40d43491e8f926d4148ee07a36264491943f8f339738ff456793c6','[\"*\"]','2025-07-03 14:46:14',NULL,'2025-07-03 14:46:03','2025-07-03 14:46:14'),(162,'App\\Models\\User',2,'auth_token','24e6ba0520286a2a4e96881932c1cc6c6c56239644d2495006789505ce9dae6e','[\"*\"]','2025-07-03 14:49:47',NULL,'2025-07-03 14:49:30','2025-07-03 14:49:47'),(163,'App\\Models\\User',3,'auth_token','145a287a0d69691b1a949e74a1c64d900416aa3f2ece6a1cd2cdbea2e7078848','[\"*\"]','2025-07-03 15:39:43',NULL,'2025-07-03 15:07:35','2025-07-03 15:39:43'),(164,'App\\Models\\User',3,'auth_token','6fc9554152857d8310cc9502fabb81f120e1785370ea4077846f3e8e3a2bb38a','[\"*\"]','2025-07-03 15:41:13',NULL,'2025-07-03 15:40:56','2025-07-03 15:41:13'),(165,'App\\Models\\User',3,'auth_token','0e0911d88be46ddef61c7bf7669591e3ec07489a06d0c7dd2ed5b83267239436','[\"*\"]','2025-07-03 16:14:09',NULL,'2025-07-03 15:41:05','2025-07-03 16:14:09'),(166,'App\\Models\\User',5,'auth_token','e42b34415583a36960d07633b7f43813bc1ea6f613b43049a2a49bbf4f4f6328','[\"*\"]','2025-07-03 15:42:18',NULL,'2025-07-03 15:41:13','2025-07-03 15:42:18'),(167,'App\\Models\\User',3,'auth_token','f2972e8e6bcf4cdb39bf89350618bca3876f5e507531dfec1d43ad786ca8de62','[\"*\"]','2025-07-03 17:14:28',NULL,'2025-07-03 17:10:15','2025-07-03 17:14:28'),(168,'App\\Models\\User',3,'auth_token','4fbce2c8e4320cdae377b6a587595144510e458f6a26c160f50e994ba739911a','[\"*\"]','2025-07-03 17:15:01',NULL,'2025-07-03 17:14:11','2025-07-03 17:15:01'),(169,'App\\Models\\User',2,'auth_token','9054a63431bb355b4f2af53b58774b9e087b8822b97523c00f11cd6dcb61d80f','[\"*\"]','2025-07-03 17:33:33',NULL,'2025-07-03 17:16:01','2025-07-03 17:33:33'),(170,'App\\Models\\User',6,'auth_token','da6a373f4fbb6238ab30b052122195d8f70967b1d4a37fa7be79becd963d4aba','[\"*\"]','2025-07-03 17:40:31',NULL,'2025-07-03 17:38:15','2025-07-03 17:40:31'),(171,'App\\Models\\User',6,'auth_token','24b315c1788207a1c261673e99e26f67d37c7bb9dcc3116c82d46be5cc824026','[\"*\"]','2025-07-03 18:45:02',NULL,'2025-07-03 17:42:10','2025-07-03 18:45:02'),(172,'App\\Models\\User',1,'auth_token','31d62bed6fcb42f923b9a4a6c4b02413df30c46d07aae35ef66c77aa0de0f792','[\"*\"]','2025-07-03 19:24:43',NULL,'2025-07-03 19:23:38','2025-07-03 19:24:43'),(173,'App\\Models\\User',6,'auth_token','27b16bf5ae2741e352dc347e3aff5fec87dec7d823880d534c0460e660929573','[\"*\"]','2025-07-03 21:45:23',NULL,'2025-07-03 19:49:54','2025-07-03 21:45:23'),(174,'App\\Models\\User',6,'auth_token','47d8ea1ebec2f11c9c98a899bc90cb6a089b2bbd285006476d665bd767da1832','[\"*\"]','2025-07-03 22:45:34',NULL,'2025-07-03 22:40:45','2025-07-03 22:45:34'),(175,'App\\Models\\User',6,'auth_token','f05ee75d49751135a8b1f63f8decae35c7a70eed459e5d5c0ae7bdf9f3adbb8d','[\"*\"]',NULL,NULL,'2025-07-03 23:22:42','2025-07-03 23:22:42'),(176,'App\\Models\\User',6,'auth_token','eb5cd43e3c12f46e3ea3ca43f4e99cca90cf438453649c99f10d9d10b07562b0','[\"*\"]','2025-07-03 23:22:46',NULL,'2025-07-03 23:22:42','2025-07-03 23:22:46'),(177,'App\\Models\\User',6,'auth_token','39df33dcb9172c2453ee2781060629e35ce95198985f3b3aae81a16bf895540b','[\"*\"]','2025-07-05 18:03:42',NULL,'2025-07-05 18:03:39','2025-07-05 18:03:42'),(178,'App\\Models\\User',6,'auth_token','c025acdf5426d75c5dd351e26f19e288ddf88d8637c57462419f8ed543286205','[\"*\"]','2025-07-06 22:34:26',NULL,'2025-07-06 22:34:12','2025-07-06 22:34:26'),(179,'App\\Models\\User',6,'auth_token','9e0d47657f5244cacc383c456a5d7d44c91921b7beaf645b0b2346d4c1fc0f05','[\"*\"]','2025-07-07 15:18:00',NULL,'2025-07-06 22:34:15','2025-07-07 15:18:00'),(180,'App\\Models\\User',3,'auth_token','a1bad1d997cbe699cfc3c0e276cd5911e4cf03c95606d99dc4401ef080ed6003','[\"*\"]','2025-07-07 20:02:50',NULL,'2025-07-07 20:02:29','2025-07-07 20:02:50'),(181,'App\\Models\\User',3,'auth_token','7805d4e4a758b3ef152cfad4d8c56ec83d4c9b3150d402ca981aa5d2f1fdaf19','[\"*\"]','2025-07-08 10:56:08',NULL,'2025-07-08 10:55:59','2025-07-08 10:56:08'),(182,'App\\Models\\User',2,'auth_token','60b6688978705057159c4007820a9d32985ee8f4045f3d975d4e079ad193fd7a','[\"*\"]','2025-07-08 15:29:25',NULL,'2025-07-08 15:29:22','2025-07-08 15:29:25'),(183,'App\\Models\\User',6,'auth_token','22cc87c577dbe32a75e6dbfc7f15f9ce6f67e2507383a966c442485a5f916067','[\"*\"]','2025-07-09 10:50:37',NULL,'2025-07-08 15:29:59','2025-07-09 10:50:37'),(184,'App\\Models\\User',4,'auth_token','3fcd1dd1682bd6c999ccde189870c670f494a424499032b5b5db3353b9d4d483','[\"*\"]','2025-07-09 11:17:20',NULL,'2025-07-09 10:06:50','2025-07-09 11:17:20'),(185,'App\\Models\\User',2,'auth_token','d104e091b666ebfebcbf4808c9a714e1eea827e02a7097eb8da73340b13e4a9f','[\"*\"]',NULL,NULL,'2025-07-09 10:47:29','2025-07-09 10:47:29'),(186,'App\\Models\\User',2,'auth_token','9e087b170e02d33c5ad352f498bbaf4200310359b7e408c73313d6939b98c36d','[\"*\"]','2025-07-09 10:51:34',NULL,'2025-07-09 10:47:37','2025-07-09 10:51:34'),(187,'App\\Models\\User',1,'auth_token','ca6536a5f51dc3f88ff46c83e678de6361617b8ca77058f827b6f52a0fc673a7','[\"*\"]','2025-07-09 11:16:26',NULL,'2025-07-09 11:16:22','2025-07-09 11:16:26'),(188,'App\\Models\\User',6,'auth_token','1197d1280c21f88f452965f27c92de9832697b03c280a8e41ce44ce2a66de519','[\"*\"]','2025-07-17 02:04:27',NULL,'2025-07-17 02:04:15','2025-07-17 02:04:27'),(189,'App\\Models\\User',1,'auth_token','573708e112f883111ed9395b502b2f278a3a76b9215842ace4a65614906af6fb','[\"*\"]','2025-07-17 02:05:30',NULL,'2025-07-17 02:04:40','2025-07-17 02:05:30');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('4wHaubiUuNx7UbpEc3Y4XzBTc0Tp2JgK7HCdSrOw',NULL,'47.79.219.237','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzRxTHVyMmExdHNESW1aWEZpYnRNRG1vYThpaklLSFN6R3NCcG42NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756605932),('5JaPgqFPY8c9qv3keFobhepBTk6TRSl7N6OXJZwF',NULL,'17.241.227.168','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFNweGQ1dFBiZjJZVXFJbmkwQTNJM3RjNkVodEhSQ0dYMDBUdk5uTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753805824),('5pPLNItuTxkzMOUGmpaAKXpvXmIcrj9awsYftS3t',NULL,'116.203.182.210','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM200TXRzbHRpMXhrVXd4MTk1SHd3N2RpZ25RaGlMS295NVBGU0lhQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756057487),('6Ck994teWngpSKpJBb83sBL1lhLIOXWyfykKkPAv',NULL,'34.209.91.22','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoialFvbTlYNWtMd1hERGd3eWI1Y1NCQlBtWWR0OUJpanJCczBwN3J4WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LnBheXZhbHVlLmNvbS5uZy9jbG91ZGJhbmsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1752072964),('7UqmhPWDhF37YyNbxErVWOBWwNzplOuYhpg9buBc',NULL,'52.167.144.219','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVBuSGY4VDJ5MlpFN29UVnVuNE9Ja1AyY1UzaGdYeW1wa0lpc3YyaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LnBheXZhbHVlLmNvbS5uZy9jbG91ZGJhbmsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1752287979),('AEVCaJDwvvURf3xIpJFb49alBhqKHR4vNFaiNAVN',NULL,'17.241.227.57','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFE4bFdqVUJiYTFWdGpwZmkwUUtzUjBId2lpTzhZR0lGQ3ZBbUZPUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wYXl2YWx1ZS5jb20ubmcvY2xvdWRiYW5rIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1754185712),('BOzjMrEDWqYztzVjHDD76FgaGXZQm0VuTeJykVFu',NULL,'167.235.135.87','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicjNRZThKYVkwQkR1eHcyU0tmN0psQW8zaFdUU0ZWcVhBUVZTdmk0bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753634711),('DmDD2poaTN5fnhoqDnCXvEoEWOMZlLh6aKrrGBKy',NULL,'116.203.239.26','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3U5SlZXUGxKZURiWEdpdHhxQzhINHM1WDVXQURrS05EQlpzQXlDMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1754239666),('DQqwaYrOxMLU8PAoLoBbgD98mek8twLln7eWcpZs',NULL,'167.94.138.46','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUFUendDcUE1RkhReUpNUURObTB0bVhpdHlxUGdLTTBVNVRrZVpZRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cucGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752301790),('fLrAupqllyseWJEo5KWDkDd9nQdkVaUBvbRxJi9D',NULL,'212.108.150.239','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid1diUVpMbktyUVJJZEN5QkxXa0VPeEVXSHYxeGZmWmZ3NVJSTkpySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753434873),('igUAzv6k2W3RwvkUNmnzXuuRjHzCiYC2KMEOaTIh',NULL,'159.69.182.208','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieThtVFdDYXB5eTM3bWdycVlVV1dBajhYampnQkx5RWM2SW1TU2tzcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752422184),('IidA7bF6KAOJzmb6Fedv6a2sejD7mBKYk9Ke8auO',NULL,'71.61.49.97','Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/138.0.7204.156 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1VCM2E0MjlZRGpnaWVRaFRTT21KT1U5NjZ2VzlsZEQxYjZSOXFuTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vcml6b2JpbGx3YXkucGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756133736),('il1k7lIwEIOhybWHNp4wMnVsqE6SuasGXh2BFurI',NULL,'102.135.203.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnRkMzRCUzJkNEZjbFFwdUhPR29QWWFHSkZsYVRCMWNRWlppWUllTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753169492),('ioQ3a28gYzlkbOEPm5VwsxOCcV8dmY1soLiDOMi4',NULL,'103.196.9.227','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDRhTkgwdWVKYzVyWHQycUZ6TmNVZzI4ZkFZc1lPZWhnYlRCUWp3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756131138),('je5SpmLk7oLw062mjY0ABUZnpIhbYruBkAxGMatU',NULL,'66.249.74.160','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkhVenltUWIzVmRYZEZWdXczRFpyWVQ2YnBoYTFZWXdiQnRla3lDeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cucGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752040962),('jHIUWyydYxbvS0JmZuzBfb1W2KRBgUx1yyj7mXDR',NULL,'102.88.113.201','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVOc3FLb1REdlJTbTZxUHZmQ1JPQ0w4bVV3VzBaTjkwUk9oVUJuYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wYXl2YWx1ZS5jb20ubmcvY2xvdWRiYW5rIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1752613986),('lU1dgqErrlind5kJ3jT5hcSUOIqUtRLssoZYr9kP',NULL,'104.252.191.223','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXo0SWdNM2VnYU80a2twZ21qOWU5MGxRSERDVHVkTVFIaTZFSVFsUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756132563),('Np5l9oeORmhyg34arz9ljqKfrgyJeicIYZ5Ziq4U',NULL,'149.18.168.93','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.199 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmU1V29kdFgzQVZTcUtRQ3hDN1pqSVZLWEZzTVBoWFNjNnh6aEV3SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wYXl2YWx1ZS5jb20ubmcvY2xvdWRiYW5rIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1752166634),('or5HG7fuQd2O0cHAIDNEI65vEGkfC4Ym1OUYQBen',NULL,'154.28.229.245','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWhRamZWd2xXRDRDcnFuZDZteEdGNTNFNWNQUWk3T1V3ems0RDhsZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752453533),('P0X1yFCrc6sJcfKjgzSQx6n42D4D1PYJzKxceH5K',NULL,'157.55.39.63','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWJjZE8xam8yUDhIUVJ3TUJLVzIwTzlTdmd6N3FUVjVXQ3dUNm0xUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LnBheXZhbHVlLmNvbS5uZy9jbG91ZGJhbmsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1752028862),('PTrpo6qh4W1LcuwoSCFSkcyoCavOQ8zo2FKUQHiY',NULL,'177.72.93.95','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE9pOEIwenFwOGV2YkNBSE11cUprNE1iUG9JbEFGb2xUR2ZleUlxMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wYXl2YWx1ZS5jb20ubmcvY2xvdWRiYW5rIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1752342025),('qbpCuvF7rUrHHMzC3mWHceLzcmcdoVCnKvwSTp33',NULL,'66.249.65.96','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDFIRTFkRjRoTFpBNUpidHNiUDZ5Z1Vvd3c1MElNRXZ5bzh5MmNoTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cucGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752369712),('QCYCbVxLQnr8gqgRtwery4VrmGXu4WpRzoGdMQ3b',NULL,'64.140.139.61','Mozilla/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFER0N2OXZVS3FwZ2V6RGFsUHRuY1dMNVhKZFdGd0VmUWJxNUR4ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wYXl2YWx1ZS5jb20ubmcvY2xvdWRiYW5rIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1755685123),('QGZSxihqZUls2ahVxqC4qyNFz8A8ff5uWkfq286Q',NULL,'66.249.74.161','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVhBbUZrTGFVTkt6YUJMUmRsZm5WaEZaaFlSUm8zcTA1dDI0VmZGSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LnBheXZhbHVlLmNvbS5uZy9jbG91ZGJhbmsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1752039685),('RAov6W7c8xGsrDBR24SdbCjA5Yfs8L3Gryz9S8r0',NULL,'154.28.229.203','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGdXZVdJdDE3ajlwWnJEdUlPYUpvVTZkVmhhWkpqTkpXdll4c0JDRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752501001),('rGYlYWR4dUeLjJJ4Aogb91iBLDbux085oLTFb7yb',NULL,'103.196.9.226','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVhZMWJMZlJGdWhIVElMMTdjMzhpSm9DTkwxS1pFSnBZZkRjdzc1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756269978),('smfmK7PouUQpdQ8Jhi9MfRdixeZmXdf73SQ2LMdg',NULL,'102.135.203.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE05NjhYY2NLdk5nYUU5MWNGMWhGeEN5b2pobk9rbWFTb3pVS1pmMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753772935),('Ss9V0OF9u4bMSJeybRvQme7PbOPSRLrV17NSgIdp',NULL,'116.203.198.39','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXpCMEhRR0tSbWRzM1l2Vk1aTFVmMnhSMTdUc0Q2M0t6dWtueUFzWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753028961),('tPWQaecyKVtW5AP8sSMXKpTAp3bTScWk2xoPhszn',NULL,'207.46.13.54','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGNrZDZkT1UwdFV4bGd6NElsQUR3dHFZNlp4SE45S1lmeGNCZ0dwOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vd3d3LnBheXZhbHVlLmNvbS5uZy9jbG91ZGJhbmsiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1751942590),('UDHjoCgw04QDA5aTqazeDLoU7kZFAd9UM3WBjG1f',NULL,'23.80.147.125','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2JqdEhDd1p3elFtemVzbFFBVkg3S0VGeGx0Mkg1ejM0dTgyMVpXbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753346235),('v2erWuoo6Jci37RC4LIbWfYIE79ef4StpsMPEP70',NULL,'104.164.126.233','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm1mTll3SXV4cjdmZHVGRW5scnFWSlVtV2Q2QnRmdnZFd0JrbDdiUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752364741),('VlmLsZ98mOb0VtEf2Ib2yBaEKP387wjiXUKhROAU',NULL,'85.208.96.210','Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0E2RWFDQlgyTWVwV3F1d3JXaTZ2V3BBR0RuRW13bnNYRU50Wm5IRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753071174),('xXRxTAREyrUszWLzoXutxgmgmOtx2qidJHPqz1F0',NULL,'5.75.132.49','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEdwVmRoN3JHRlE2TzBIbTN6dm9TSXY5elFRVjFKVVUxQURZcFVmYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1755449839),('YKDgQVSL9xyhwgUMlrIals7PXXNPs2LdnHUzj1ZR',NULL,'102.135.203.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHE5RU93SzVWNHkyelJIN0NqcTNTVEt3UDdrWld5R2dDaTBUZDFudCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1753109555),('yl8s8DiKnxxAutAXK2giWke75IVDUcXRrNYa4Or1',NULL,'104.164.173.227','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1RnMGVKeDgxTENka2daU2JobGNib0hnMG5IaW9IcmNCWWprYUk0NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752361796),('YPqM8Uwb1PLsWngJqGbFvr67rAoXTU9A61dFr84V',NULL,'66.249.65.71','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.103 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTozOntzOjY6Il90b2tlbiI7czo0MDoieUVzMm9WSDB6RzJ1dlVZM0lEazB6aTBlM2ZVckVYSUNONVFzQ1FTTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1752054765),('zQOMXdiEuj08RTPFAloWIwVzSFkN9Pyi4K2nvP4D',NULL,'116.203.239.26','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZ2TkhzZmpHWUowTmFkOUdvOWVDc214R1dsY0FnSHRvWEltbmhiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vcGF5dmFsdWUuY29tLm5nL2Nsb3VkYmFuayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1756664817);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `response` text COLLATE utf8mb4_unicode_ci,
  `admin_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_tickets_user_id_foreign` (`user_id`),
  KEY `support_tickets_admin_id_foreign` (`admin_id`),
  CONSTRAINT `support_tickets_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recipient_account_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_reference_unique` (`reference`),
  KEY `transactions_account_id_foreign` (`account_id`),
  KEY `transactions_admin_id_foreign` (`admin_id`),
  KEY `transactions_recipient_account_id_foreign` (`recipient_account_id`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_recipient_account_id_foreign` FOREIGN KEY (`recipient_account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (27,33,1000000.00,'credit','completed',NULL,'Transfer from Admin','cloudbank1751529029',1,'2025-07-03 07:50:29','2025-07-03 07:50:29','2025-07-03 07:50:29',NULL),(28,34,20000.00,'credit','completed',NULL,'Transfer from Admin','cloudbank1751529924',1,'2025-07-03 08:05:24','2025-07-03 08:05:24','2025-07-03 08:05:24',NULL),(29,34,5000.00,'debit','completed','Donny','Transfer to 1873749930','DB-TRF1751530108',NULL,'2025-07-03 08:08:28','2025-07-03 08:08:28','2025-07-03 08:08:28',NULL),(30,33,5000.00,'credit','completed','Donny','Transfer from 6134176661','CR-TRF1751530108',NULL,'2025-07-03 08:08:28','2025-07-03 08:08:28','2025-07-03 08:08:28',NULL),(31,34,5000.00,'debit','completed',NULL,'Transfer to 1873749930','DB-TRF1751533060',NULL,'2025-07-03 08:57:40','2025-07-03 08:57:40','2025-07-03 08:57:40',NULL),(32,33,5000.00,'credit','completed',NULL,'Transfer from 6134176661','CR-TRF1751533060',NULL,'2025-07-03 08:57:40','2025-07-03 08:57:40','2025-07-03 08:57:40',NULL),(33,35,4000.00,'credit','completed','school fees','Transfer from Admin','cloudbank1751551515',1,'2025-07-03 14:05:15','2025-07-03 14:05:15','2025-07-03 14:05:15',NULL),(34,33,2000000.00,'credit','completed',NULL,'Transfer from Admin','cloudbank1751551536',1,'2025-07-03 14:05:36','2025-07-03 14:05:36','2025-07-03 14:05:36',NULL),(35,37,3120457.00,'credit','completed','Granddaughter','Transfer from Admin','cloudbank1751564613',1,'2025-07-03 17:43:33','2025-07-03 17:43:33','2025-07-03 17:43:33',NULL),(36,35,20.00,'debit','completed',NULL,'Transfer to 8672128178','DB-TRF1752059840',NULL,'2025-07-09 11:17:20','2025-07-09 11:17:20','2025-07-09 11:17:20',NULL),(37,37,20.00,'credit','completed',NULL,'Transfer from 2146707831','CR-TRF1752059840',NULL,'2025-07-09 11:17:20','2025-07-09 11:17:20','2025-07-09 11:17:20',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `err_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'You need to complete settings',
  `pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `phone_number` bigint NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `verification_otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pin_attempts` int NOT NULL DEFAULT '0',
  `pin_locked_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com','$2y$12$Xsvio2JmGEN59qlwB.Ce1OXcI.9k7XUCPsvitL2Wu5cZJlD4LKJZu',NULL,'$2y$12$Q9y9C/2xlXyZp9ZFxtWe6.7eK7A1ppLU./wADMY/tCj2eOEO2j.m6','active',0,'','','','',1,1,NULL,NULL,1,NULL,'2025-06-13 16:34:54','2025-07-02 22:27:10',6,NULL),(2,'Parker James','britcofirm6@gmail.com','$2y$12$fdENFCfPeepML5ig99dEGuc5jn4ERKKbZRsFsoq22jVQbgTC7JC8K','Refer to your email for details','$2y$12$koEEedFdBDjcsuYZ5vhzI.8TVXl2LkVBZEetvr4xPGR2BKY5UbZy.','dormant',2938373377,'2013-07-03','1234 Elbdndb','Dall','Texa',1,1,NULL,NULL,0,NULL,'2025-07-03 07:46:14','2025-07-03 17:33:31',0,NULL),(3,'James curry','cloudbankcustomerservice@gmail.com','$2y$12$fdds3ivBveMdG6v31su/eebTlQiDwOuP5hSR.nWMmXg4Aim4foJIq','Refer to email','$2y$12$L1Gjfj0ScDBT.Dv.Cd6AAOCyu7ZdAn7p.4xOz/Bw6e4UKYKsqza/i','dormant',8165885724,'2010-05-03','Guvy','Yui','Yul',1,1,NULL,NULL,0,NULL,'2025-07-03 08:00:18','2025-07-03 17:12:14',0,NULL),(4,'Damilare Ridwan','damyridwan@gmail.com','$2y$12$/mlgq5JT8/uXjVup1qq9eeuUSURVtbKzjRRr6gQKynrH75X18zyC2','You need to complete settings','$2y$12$YtCfuOxqUKtrhgYA/tzNTORwD1ActL2y.TJ59pQfiv9XWgWKJNp6m','active',7033149596,'2001-08-04','1, Oloke Boluwaji Area Lagos Ibadan Expressway Ibadan Oyo 3','Ibadan','Oyo',1,1,NULL,NULL,0,NULL,'2025-07-03 13:58:42','2025-07-03 13:59:50',0,NULL),(5,'tomiwa','abdulsalambadmus955@gmail.com','$2y$12$BbFvTikHOF3FQpj.PQXEdOUNuZGGKo5Ua1AN4WsH9RtKgOZi9m2sC','You need to complete settings',NULL,'dormant',70418910322,'2003-10-05','Olomi Omiyale','Ibadan','Oyo state',0,1,'411749','2025-07-03 15:45:39',0,NULL,'2025-07-03 15:40:39','2025-07-03 15:42:18',0,NULL),(6,'Parker Christiana','parkerchristiana46@gmail.com','$2y$12$q5diE6dGvOiZVN6EBeJRiO5F0fA2sCNf6gLQpUdTbvuXgvVjCgRwq','You need to complete settings','$2y$12$JZEXzoEQispkmfX.J2lbNeVV8xtmfjS67NkjArxQDG.KDu7dcpIZm','dormant',1355406742,'2025-07-03','1234 Eim Street 75201','Dalas','Texas',1,1,'354391','2025-07-07 15:23:20',0,NULL,'2025-07-03 17:36:45','2025-07-07 15:18:20',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24  7:42:36
