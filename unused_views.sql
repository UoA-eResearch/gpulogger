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
