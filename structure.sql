-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: gpu
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `gpu`
--

DROP TABLE IF EXISTS `gpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpu` (
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
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `insertedAt` (`insertedAt`)
) ENGINE=InnoDB AUTO_INCREMENT=852878 DEFAULT CHARSET=latin1;
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
/*!50001 VIEW `active_hours` AS select `gpu`.`ip` AS `ip`,cast(`gpu`.`insertedAt` as date) AS `day`,(count(0) / 60) AS `active_hours`,((count(0) / 60) / 24) AS `fraction_of_day`,min(`gpu`.`utilization.gpu [%]`) AS `MIN(``utilization.gpu [%]``)`,max(`gpu`.`utilization.gpu [%]`) AS `MAX(``utilization.gpu [%]``)`,avg(`gpu`.`utilization.gpu [%]`) AS `AVG(``utilization.gpu [%]``)` from `gpu` where (`gpu`.`utilization.gpu [%]` > 0) group by `gpu`.`ip`,`day` order by `day` */;
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
/*!50001 VIEW `test_active_hours` AS select `gpu`.`ip` AS `ip`,cast(`gpu`.`insertedAt` as date) AS `day`,cast(`gpu`.`insertedAt` as time) AS `time`,dayname(cast(`gpu`.`insertedAt` as date)) AS `dow`,`gpu`.`utilization.gpu [%]` AS `utilization.gpu [%]`,`gpu`.`utilization.memory [%]` AS `utilization.memory [%]` from `gpu` where (`gpu`.`utilization.gpu [%]` > 0) order by cast(`gpu`.`insertedAt` as date),cast(`gpu`.`insertedAt` as time) desc */;
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

-- Dump completed on 2018-12-14 11:41:45
