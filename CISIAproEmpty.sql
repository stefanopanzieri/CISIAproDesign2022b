CREATE DATABASE  IF NOT EXISTS `CISIAproEmpty` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CISIAproEmpty`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: CISIAproEmpty
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `actual_entities`
--

DROP TABLE IF EXISTS `actual_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actual_entities` (
  `name_entity` varchar(30) NOT NULL,
  `block_handler` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_data`
--

DROP TABLE IF EXISTS `chart_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chart_data` (
  `id` int NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `global` int DEFAULT NULL,
  `building` int DEFAULT NULL,
  `mpls` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `design_flags`
--

DROP TABLE IF EXISTS `design_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `design_flags` (
  `name_flag` varchar(50) NOT NULL DEFAULT 'flag',
  `value` int unsigned DEFAULT NULL,
  PRIMARY KEY (`name_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_links`
--

DROP TABLE IF EXISTS `dynamic_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_links` (
  `id_link` int NOT NULL,
  `link_name` varchar(50) DEFAULT NULL,
  `link_val` int DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  PRIMARY KEY (`id_link`),
  KEY `link_name` (`link_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity` (
  `id_entity` int NOT NULL AUTO_INCREMENT,
  `id_project` int NOT NULL,
  `id_type` int NOT NULL,
  `name_entity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_entity`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_port`
--

DROP TABLE IF EXISTS `entity_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_port` (
  `id_port` int NOT NULL AUTO_INCREMENT,
  `id_entity` int NOT NULL,
  `type_port` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_res` int NOT NULL,
  `id_project` int DEFAULT NULL,
  PRIMARY KEY (`id_port`),
  KEY `FK_entity_port_entity` (`id_entity`),
  KEY `FK_entity_port_resources` (`id_res`)
) ENGINE=InnoDB AUTO_INCREMENT=3212 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_port_tmp`
--

DROP TABLE IF EXISTS `entity_port_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_port_tmp` (
  `id_port` int NOT NULL DEFAULT '0',
  `id_entity` int NOT NULL,
  `type_port` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_res` int NOT NULL,
  `id_project` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_type`
--

DROP TABLE IF EXISTS `entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `name_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_project` int NOT NULL,
  `color` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `step_received` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `step_computed` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dynamic_computed` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `step_sended` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_type`),
  KEY `name_type` (`name_type`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `layers`
--

DROP TABLE IF EXISTS `layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layers` (
  `id_layer` int NOT NULL AUTO_INCREMENT,
  `id_project` int NOT NULL,
  `id_res` int NOT NULL,
  `color_res` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '#000000',
  `id_dep` int NOT NULL,
  PRIMARY KEY (`id_layer`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id_project` int NOT NULL AUTO_INCREMENT,
  `name_project` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_project`),
  UNIQUE KEY `name_project` (`name_project`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radial_spread`
--

DROP TABLE IF EXISTS `radial_spread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radial_spread` (
  `id_radial` int NOT NULL,
  `radial_name` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  PRIMARY KEY (`id_radial`),
  KEY `link_name` (`radial_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id_res` int NOT NULL AUTO_INCREMENT,
  `name_res` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dim_res` int DEFAULT NULL,
  `name_dep` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '#000000',
  `id_project` int DEFAULT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_res`),
  UNIQUE KEY `name_res` (`name_res`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resources_copy`
--

DROP TABLE IF EXISTS `resources_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_copy` (
  `id_res` int NOT NULL AUTO_INCREMENT,
  `name_res` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dim_res` int DEFAULT NULL,
  `name_dep` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '#000000',
  `id_project` int DEFAULT NULL,
  PRIMARY KEY (`id_res`),
  UNIQUE KEY `name_res` (`name_res`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route_link`
--

DROP TABLE IF EXISTS `route_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_link` (
  `id_routing` int NOT NULL,
  `routing_name` varchar(50) DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_res` int DEFAULT NULL,
  PRIMARY KEY (`id_routing`),
  KEY `link_name` (`routing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routing_table`
--

DROP TABLE IF EXISTS `routing_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routing_table` (
  `id_route` int NOT NULL AUTO_INCREMENT,
  `id_routing` int DEFAULT NULL,
  `id_project` int NOT NULL DEFAULT '0',
  `name_res` varchar(50) NOT NULL DEFAULT '0',
  `res_index` int NOT NULL DEFAULT '0',
  `out_port` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_route`),
  KEY `id_routing` (`id_routing`),
  KEY `name_res` (`name_res`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run` (
  `id_run` int NOT NULL AUTO_INCREMENT,
  `currDate` datetime DEFAULT NULL,
  `milliseconds` int DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `end_of_run` int DEFAULT '0',
  PRIMARY KEY (`id_run`),
  KEY `currDate` (`currDate`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `run_output`
--

DROP TABLE IF EXISTS `run_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `run_output` (
  `id_output` int NOT NULL AUTO_INCREMENT,
  `id_run` int NOT NULL DEFAULT '0',
  `sim_time` int DEFAULT NULL,
  `name_entity` varchar(30) DEFAULT NULL,
  `name_var` varchar(50) DEFAULT NULL,
  `val_type` varchar(30) DEFAULT NULL,
  `val_status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_output`)
) ENGINE=InnoDB AUTO_INCREMENT=20313 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `runtime_flags`
--

DROP TABLE IF EXISTS `runtime_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `runtime_flags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flag_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `save2db`
--

DROP TABLE IF EXISTS `save2db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `save2db` (
  `id_save2db` int NOT NULL AUTO_INCREMENT,
  `save_name` varchar(50) NOT NULL DEFAULT '0',
  `id_res` int NOT NULL DEFAULT '0',
  `id_project` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_save2db`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_entity` int NOT NULL,
  `id_var` int NOT NULL,
  `val_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NUMERIC',
  `val_status` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_project` int DEFAULT NULL,
  KEY `FK_status_entity` (`id_entity`),
  KEY `FK_status_variables` (`id_var`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_copy`
--

DROP TABLE IF EXISTS `status_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_copy` (
  `id_entity` int NOT NULL,
  `id_var` int NOT NULL,
  `val_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NUMERIC',
  `val_status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_project` int DEFAULT NULL,
  KEY `FK_status_entity` (`id_entity`),
  KEY `FK_status_variables` (`id_var`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_copy2`
--

DROP TABLE IF EXISTS `status_copy2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_copy2` (
  `id_entity` int NOT NULL,
  `id_var` int NOT NULL,
  `val_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NUMERIC',
  `val_status` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_project` int DEFAULT NULL,
  KEY `FK_status_entity` (`id_entity`),
  KEY `FK_status_variables` (`id_var`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_saved`
--

DROP TABLE IF EXISTS `status_saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_saved` (
  `id_entity` int DEFAULT NULL,
  `id_var` int DEFAULT NULL,
  `val_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `val_status` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `name_entity` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_var` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_model` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  KEY `name_model` (`name_model`),
  KEY `name_entity` (`name_entity`),
  KEY `id_entity` (`id_entity`),
  KEY `id_var` (`id_var`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp` (
  `id` int NOT NULL,
  `id2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables` (
  `id_var` int NOT NULL AUTO_INCREMENT,
  `name_var` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `val_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `var_dim` int NOT NULL DEFAULT '0',
  `id_project` int NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_var`),
  UNIQUE KEY `name_var` (`name_var`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variables_copy`
--

DROP TABLE IF EXISTS `variables_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables_copy` (
  `id_var` int NOT NULL AUTO_INCREMENT,
  `name_var` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `val_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `var_dim` int NOT NULL DEFAULT '0',
  `id_project` int NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_var`),
  UNIQUE KEY `name_var` (`name_var`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28 10:51:18
