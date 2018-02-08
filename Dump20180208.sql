-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kb
-- ------------------------------------------------------
-- Server version	5.6.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_table`
--

DROP TABLE IF EXISTS `area_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_table` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_name_UNIQUE` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Contains sub-categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_table`
--

LOCK TABLES `area_table` WRITE;
/*!40000 ALTER TABLE `area_table` DISABLE KEYS */;
INSERT INTO `area_table` VALUES (5,'Analysis'),(8,'Analysis Method'),(3,'General query'),(1,'Installation'),(2,'Order Validation');
/*!40000 ALTER TABLE `area_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_table`
--

DROP TABLE IF EXISTS `attachment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment_table` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Contains information about attachments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_table`
--

LOCK TABLES `attachment_table` WRITE;
/*!40000 ALTER TABLE `attachment_table` DISABLE KEYS */;
INSERT INTO `attachment_table` VALUES (1,'attach1'),(2,'attach2');
/*!40000 ALTER TABLE `attachment_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_table`
--

DROP TABLE IF EXISTS `category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains product issue categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_table`
--

LOCK TABLES `category_table` WRITE;
/*!40000 ALTER TABLE `category_table` DISABLE KEYS */;
INSERT INTO `category_table` VALUES (2,'Analysis'),(1,'Installation'),(3,'Tracks');
/*!40000 ALTER TABLE `category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_table`
--

DROP TABLE IF EXISTS `issue_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_table` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_description` mediumtext CHARACTER SET latin1 NOT NULL,
  `issue_title` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `issue_resolution` mediumtext CHARACTER SET latin1 NOT NULL,
  `issue_submit_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`issue_id`),
  FULLTEXT KEY `issue_title` (`issue_title`,`issue_resolution`,`issue_description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_table`
--

LOCK TABLES `issue_table` WRITE;
/*!40000 ALTER TABLE `issue_table` DISABLE KEYS */;
INSERT INTO `issue_table` VALUES (2,'aa','bb','cc','0000-00-00 00:00:00'),(3,'nn','gg','yy','0000-00-00 00:00:00'),(4,'ghasfjdgfjg','gdlsfhgjasdghjas','sdhgsdjfgsdgxc dfg zxsdv zx ','2018-02-07 08:54:47'),(5,'ffyfu','hfhfhfh','2222','2018-02-07 09:39:33');
/*!40000 ALTER TABLE `issue_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword_mapping_table`
--

DROP TABLE IF EXISTS `keyword_mapping_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_mapping_table` (
  `issue_id` int(11) NOT NULL,
  `keyword_text` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`issue_id`,`keyword_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keyword <--> issue mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword_mapping_table`
--

LOCK TABLES `keyword_mapping_table` WRITE;
/*!40000 ALTER TABLE `keyword_mapping_table` DISABLE KEYS */;
INSERT INTO `keyword_mapping_table` VALUES (1,'rr'),(1,'ss'),(2,'rtt'),(3,'tyt'),(5,'ytju');
/*!40000 ALTER TABLE `keyword_mapping_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledgebase_table`
--

DROP TABLE IF EXISTS `knowledgebase_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledgebase_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_type` enum('OTHER','FAQ','ARTICLE','CASEBASE') CHARACTER SET latin1 NOT NULL DEFAULT 'OTHER',
  `issue_attachment_id` int(11) NOT NULL,
  `comments` mediumtext CHARACTER SET latin1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issue_id_UNIQUE` (`issue_id`),
  KEY `category_id` (`category_id`),
  KEY `area_id` (`area_id`),
  KEY `user_id` (`user_id`),
  KEY `issue_attachment_id` (`issue_attachment_id`),
  KEY `knowledgebase_table_ibfk_2` (`product_id`),
  CONSTRAINT `knowledgebase_table_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `keyword_mapping_table` (`issue_id`),
  CONSTRAINT `knowledgebase_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`product_id`),
  CONSTRAINT `knowledgebase_table_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`),
  CONSTRAINT `knowledgebase_table_ibfk_4` FOREIGN KEY (`area_id`) REFERENCES `area_table` (`area_id`),
  CONSTRAINT `knowledgebase_table_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `knowledgebase_table_ibfk_6` FOREIGN KEY (`issue_attachment_id`) REFERENCES `attachment_table` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Contains reported issue information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledgebase_table`
--

LOCK TABLES `knowledgebase_table` WRITE;
/*!40000 ALTER TABLE `knowledgebase_table` DISABLE KEYS */;
INSERT INTO `knowledgebase_table` VALUES (4,1,1,1,1,14857,'OTHER',1,'Simple'),(5,2,3,2,1,14857,'OTHER',1,'Simple');
/*!40000 ALTER TABLE `knowledgebase_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_version` varchar(10) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains Product names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'CytoGenomics',''),(2,'SureCall',''),(3,'eArray','');
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_last_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_email` varchar(200) CHARACTER SET latin1 NOT NULL,
  `user_username` varchar(300) CHARACTER SET latin1 NOT NULL,
  `user_avatar` longtext NOT NULL,
  `user_password` varchar(256) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains user information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (14857,'anand','kulkarni','anand@persistent.co.in','anand_kulkarni2','','');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-08 20:26:41
