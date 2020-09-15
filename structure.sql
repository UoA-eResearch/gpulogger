-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: gpu
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Temporary table structure for view `active_hours`
--

DROP TABLE IF EXISTS `active_hours`;
/*!50001 DROP VIEW IF EXISTS `active_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `active_hours` AS SELECT 
 1 AS `ip`,
 1 AS `day`,
 1 AS `active_hours`,
 1 AS `fraction_of_day`,
 1 AS `MIN(``utilization.gpu [%]``)`,
 1 AS `MAX(``utilization.gpu [%]``)`,
 1 AS `AVG(``utilization.gpu [%]``)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gpu_booking`
--

DROP TABLE IF EXISTS `gpu_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `project_uuid` varchar(255) DEFAULT NULL,
  `booking_start_date` date DEFAULT NULL,
  `booking_end_date` date DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `gpu_type` char(16) NOT NULL,
  `count` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_uuid` (`project_uuid`,`gpu_type`,`booking_start_date`,`booking_end_date`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27844 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpu_booking_ip2project`
--

DROP TABLE IF EXISTS `gpu_booking_ip2project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu_booking_ip2project` (
  `gpu_booking_id` int(11) DEFAULT NULL,
  `ip2project_id` int(11) DEFAULT NULL,
  UNIQUE KEY `gpu_booking_id` (`gpu_booking_id`,`ip2project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpu_log`
--

DROP TABLE IF EXISTS `gpu_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `pci.bus_id` varchar(64) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `fan.speed [%]` int(11) DEFAULT NULL,
  `power.draw [W]` float DEFAULT NULL,
  `driver_version` float DEFAULT NULL,
  `pstate` varchar(64) DEFAULT NULL,
  `pcie.link.gen.max` int(11) DEFAULT NULL,
  `pcie.link.gen.current` int(11) DEFAULT NULL,
  `pcie.link.width.current` int(11) DEFAULT NULL,
  `pcie.link.width.max` int(11) DEFAULT NULL,
  `temperature.gpu` int(11) DEFAULT NULL,
  `utilization.gpu [%]` int(11) DEFAULT NULL,
  `utilization.memory [%]` int(11) DEFAULT NULL,
  `memory.total [MiB]` int(11) DEFAULT NULL,
  `memory.free [MiB]` int(11) DEFAULT NULL,
  `memory.used [MiB]` int(11) DEFAULT NULL,
  `insertedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`insertedAt`),
  UNIQUE KEY `insertedAt` (`insertedAt`,`ip`,`pci.bus_id`),
  KEY `ip` (`ip`),
  KEY `pci.bus_id` (`pci.bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6887476 DEFAULT CHARSET=latin1
/*!50100 PARTITION BY RANGE (UNIX_TIMESTAMP(`insertedAt`))
(PARTITION p2018_01 VALUES LESS THAN (1517443200) ENGINE = InnoDB,
 PARTITION p2018_02 VALUES LESS THAN (1519862400) ENGINE = InnoDB,
 PARTITION p2018_03 VALUES LESS THAN (1522540800) ENGINE = InnoDB,
 PARTITION p2018_04 VALUES LESS THAN (1525132800) ENGINE = InnoDB,
 PARTITION p2018_05 VALUES LESS THAN (1527811200) ENGINE = InnoDB,
 PARTITION p2018_06 VALUES LESS THAN (1530403200) ENGINE = InnoDB,
 PARTITION p2018_07 VALUES LESS THAN (1533081600) ENGINE = InnoDB,
 PARTITION p2018_08 VALUES LESS THAN (1535760000) ENGINE = InnoDB,
 PARTITION p2018_09 VALUES LESS THAN (1538352000) ENGINE = InnoDB,
 PARTITION p2018_10 VALUES LESS THAN (1541030400) ENGINE = InnoDB,
 PARTITION p2018_11 VALUES LESS THAN (1543622400) ENGINE = InnoDB,
 PARTITION p2018_12 VALUES LESS THAN (1546300800) ENGINE = InnoDB,
 PARTITION p2019_01 VALUES LESS THAN (1548979200) ENGINE = InnoDB,
 PARTITION p2019_02 VALUES LESS THAN (1551398400) ENGINE = InnoDB,
 PARTITION p2019_03 VALUES LESS THAN (1554076800) ENGINE = InnoDB,
 PARTITION p2019_04 VALUES LESS THAN (1556668800) ENGINE = InnoDB,
 PARTITION p2019_05 VALUES LESS THAN (1559347200) ENGINE = InnoDB,
 PARTITION p2019_06 VALUES LESS THAN (1561939200) ENGINE = InnoDB,
 PARTITION p2019_07 VALUES LESS THAN (1564617600) ENGINE = InnoDB,
 PARTITION p2019_08 VALUES LESS THAN (1567296000) ENGINE = InnoDB,
 PARTITION p2019_09 VALUES LESS THAN (1569888000) ENGINE = InnoDB,
 PARTITION p2019_10 VALUES LESS THAN (1572566400) ENGINE = InnoDB,
 PARTITION p2019_11 VALUES LESS THAN (1575158400) ENGINE = InnoDB,
 PARTITION p2019_12 VALUES LESS THAN (1577836800) ENGINE = InnoDB,
 PARTITION p2020_01 VALUES LESS THAN (1580515200) ENGINE = InnoDB,
 PARTITION p2020_02 VALUES LESS THAN (1583020800) ENGINE = InnoDB,
 PARTITION p2020_03 VALUES LESS THAN (1585699200) ENGINE = InnoDB,
 PARTITION p2020_04 VALUES LESS THAN (1588291200) ENGINE = InnoDB,
 PARTITION p2020_05 VALUES LESS THAN (1590969600) ENGINE = InnoDB,
 PARTITION p2020_06 VALUES LESS THAN (1593561600) ENGINE = InnoDB,
 PARTITION p2020_07 VALUES LESS THAN (1596240000) ENGINE = InnoDB,
 PARTITION p2020_08 VALUES LESS THAN (1598918400) ENGINE = InnoDB,
 PARTITION p2020_09 VALUES LESS THAN (1601510400) ENGINE = InnoDB,
 PARTITION p2020_10 VALUES LESS THAN (1604188800) ENGINE = InnoDB,
 PARTITION p2020_11 VALUES LESS THAN (1606780800) ENGINE = InnoDB,
 PARTITION p2020_12 VALUES LESS THAN (1609459200) ENGINE = InnoDB,
 PARTITION p2021_01 VALUES LESS THAN (1612137600) ENGINE = InnoDB,
 PARTITION p2021_02 VALUES LESS THAN (1614556800) ENGINE = InnoDB,
 PARTITION p2021_03 VALUES LESS THAN (1617235200) ENGINE = InnoDB,
 PARTITION p2021_04 VALUES LESS THAN (1619827200) ENGINE = InnoDB,
 PARTITION p2021_05 VALUES LESS THAN (1622505600) ENGINE = InnoDB,
 PARTITION p2021_06 VALUES LESS THAN (1625097600) ENGINE = InnoDB,
 PARTITION p2021_07 VALUES LESS THAN (1627776000) ENGINE = InnoDB,
 PARTITION p2021_08 VALUES LESS THAN (1630454400) ENGINE = InnoDB,
 PARTITION p2021_09 VALUES LESS THAN (1633046400) ENGINE = InnoDB,
 PARTITION p2021_10 VALUES LESS THAN (1635724800) ENGINE = InnoDB,
 PARTITION p2021_11 VALUES LESS THAN (1638316800) ENGINE = InnoDB,
 PARTITION p2021_12 VALUES LESS THAN (1640995200) ENGINE = InnoDB,
 PARTITION p2022_01 VALUES LESS THAN (1643673600) ENGINE = InnoDB,
 PARTITION p2022_02 VALUES LESS THAN (1646092800) ENGINE = InnoDB,
 PARTITION p2022_03 VALUES LESS THAN (1648771200) ENGINE = InnoDB,
 PARTITION p2022_04 VALUES LESS THAN (1651363200) ENGINE = InnoDB,
 PARTITION p2022_05 VALUES LESS THAN (1654041600) ENGINE = InnoDB,
 PARTITION p2022_06 VALUES LESS THAN (1656633600) ENGINE = InnoDB,
 PARTITION p2022_07 VALUES LESS THAN (1659312000) ENGINE = InnoDB,
 PARTITION p2022_08 VALUES LESS THAN (1661990400) ENGINE = InnoDB,
 PARTITION p2022_09 VALUES LESS THAN (1664582400) ENGINE = InnoDB,
 PARTITION p2022_10 VALUES LESS THAN (1667260800) ENGINE = InnoDB,
 PARTITION p2022_11 VALUES LESS THAN (1669852800) ENGINE = InnoDB,
 PARTITION p9999 VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpu_nodes`
--

DROP TABLE IF EXISTS `gpu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hypervisor` varchar(64) NOT NULL,
  `gpu_type` char(16) NOT NULL,
  `pci_id` varchar(32) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `tmp_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hypervisor_pci_id` (`hypervisor`,`pci_id`),
  KEY `hypervisor` (`hypervisor`),
  KEY `gpu_type` (`gpu_type`)
) ENGINE=InnoDB AUTO_INCREMENT=90358 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip2project`
--

DROP TABLE IF EXISTS `ip2project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip2project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(64) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_uuid` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `instance_uuid` varchar(255) DEFAULT NULL,
  `instance_name` varchar(255) DEFAULT NULL,
  `instance_launched_at` datetime DEFAULT NULL,
  `instance_terminated_at` datetime DEFAULT NULL,
  `final` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_uuid_triple` (`ip`,`project_uuid`,`instance_uuid`),
  KEY `ip` (`ip`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=88277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip2project_gpu_nodes`
--

DROP TABLE IF EXISTS `ip2project_gpu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip2project_gpu_nodes` (
  `ip2project_id` int(11) NOT NULL,
  `gpu_node_id` int(11) NOT NULL,
  PRIMARY KEY (`ip2project_id`,`gpu_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `test_active_hours`
--

DROP TABLE IF EXISTS `test_active_hours`;
/*!50001 DROP VIEW IF EXISTS `test_active_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `test_active_hours` AS SELECT 
 1 AS `ip`,
 1 AS `day`,
 1 AS `time`,
 1 AS `dow`,
 1 AS `utilization.gpu [%]`,
 1 AS `utilization.memory [%]`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `active_hours`
--

/*!50001 DROP VIEW IF EXISTS `active_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gpu`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_hours` AS select `gpu_log`.`ip` AS `ip`,cast(`gpu_log`.`insertedAt` as date) AS `day`,(count(0) / 60) AS `active_hours`,((count(0) / 60) / 24) AS `fraction_of_day`,min(`gpu_log`.`utilization.gpu [%]`) AS `MIN(``utilization.gpu [%]``)`,max(`gpu_log`.`utilization.gpu [%]`) AS `MAX(``utilization.gpu [%]``)`,avg(`gpu_log`.`utilization.gpu [%]`) AS `AVG(``utilization.gpu [%]``)` from `gpu_log` where (`gpu_log`.`utilization.gpu [%]` > 0) group by `gpu_log`.`ip`,`day` order by `day` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test_active_hours`
--

/*!50001 DROP VIEW IF EXISTS `test_active_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gpu`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test_active_hours` AS select `gpu_log`.`ip` AS `ip`,cast(`gpu_log`.`insertedAt` as date) AS `day`,cast(`gpu_log`.`insertedAt` as time) AS `time`,dayname(cast(`gpu_log`.`insertedAt` as date)) AS `dow`,`gpu_log`.`utilization.gpu [%]` AS `utilization.gpu [%]`,`gpu_log`.`utilization.memory [%]` AS `utilization.memory [%]` from `gpu_log` where (`gpu_log`.`utilization.gpu [%]` > 0) order by cast(`gpu_log`.`insertedAt` as date),cast(`gpu_log`.`insertedAt` as time) desc */;
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

-- Dump completed on 2020-09-16 11:22:59
