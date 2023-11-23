-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: empoweringhr
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `SPRING_SESSION`
--

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
DELETE FROM mysql.user WHERE User='' OR User='anonymous';
FLUSH PRIVILEGES;
CREATE USER 'empower'@'%' IDENTIFIED BY 'test123';
GRANT ALL PRIVILEGES ON *.* TO 'empower'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS empoweringhr;

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION` (
                                  `PRIMARY_ID` char(36) NOT NULL,
                                  `SESSION_ID` char(36) NOT NULL,
                                  `CREATION_TIME` bigint NOT NULL,
                                  `LAST_ACCESS_TIME` bigint NOT NULL,
                                  `MAX_INACTIVE_INTERVAL` int NOT NULL,
                                  `EXPIRY_TIME` bigint NOT NULL,
                                  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
                                  PRIMARY KEY (`PRIMARY_ID`),
                                  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
                                  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
                                  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
                                             `SESSION_PRIMARY_ID` char(36) NOT NULL,
                                             `ATTRIBUTE_NAME` varchar(200) NOT NULL,
                                             `ATTRIBUTE_BYTES` blob NOT NULL,
                                             PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
                                             CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emploee`
--

DROP TABLE IF EXISTS `emploee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `emploee` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `created_at` datetime(6) NOT NULL,
                           `last_modified_at` datetime(6) DEFAULT NULL,
                           `date_of_birth` datetime(6) NOT NULL,
                           `email` varchar(255) NOT NULL,
                           `first_name` varchar(255) NOT NULL,
                           `last_name` varchar(255) DEFAULT NULL,
                           `location` varchar(255) NOT NULL,
                           `phone_number` varchar(255) NOT NULL,
                           `picture` varchar(255) DEFAULT NULL,
                           `pto` int DEFAULT '20',
                           `role_name` varchar(255) NOT NULL,
                           `start_date` datetime(6) NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emploee`
--

LOCK TABLES `emploee` WRITE;
/*!40000 ALTER TABLE `emploee` DISABLE KEYS */;
INSERT INTO `emploee` VALUES (1,'2023-11-14 13:07:17.689000',NULL,'1980-09-14 09:04:35.737000','normand.wilkinson@gmail.com','Rosie Peach','Amanda Lynn','South Caitlin','1-134-483-5281','images/user/user-md-5.jpg',19,'Human','2023-11-14 13:07:17.689000'),(2,'2023-11-14 13:07:17.738000',NULL,'1977-07-29 10:55:23.524000','kevin.kuhn@yahoo.com','Moe DeLawn','Andy Gravity','Novaville','343-231-6134','images/user/user-md-01.jpg',69,'Corporate','2023-11-14 13:07:17.738000'),(3,'2023-11-14 13:07:17.758000',NULL,'2005-10-02 20:03:51.813000','adolfo.macgyver@gmail.com','Lynn Guini','Eaton Wright','Derrickland','001-661-8763','images/user/u-xl-2.jpg',32,'Future','2023-11-14 13:07:17.758000'),(4,'2023-11-14 13:07:17.774000',NULL,'2003-07-28 05:59:23.917000','gerda.ondricka@yahoo.com','Ed Venture','Hal Jalikakick','Wuckertburgh','180-933-9629','images/user/u-xl-1.jpg',61,'Chief','2023-11-14 13:07:17.775000'),(5,'2023-11-14 13:07:17.790000',NULL,'1988-11-30 12:54:47.409000','senaida.kovacek@gmail.com','Cammie Sole','Aaron Thetires','Mohammadbury','1-454-555-2104','images/user/u-xl-10.jpg',83,'Human','2023-11-14 13:07:17.791000'),(6,'2023-11-14 13:07:17.808000',NULL,'2000-12-11 11:45:56.244000','margy.prohaska@gmail.com','Harrison Fire','Charity Case','Angelside','(747) 020-4089','images/user/user-md-3.jpg',70,'Investor','2023-11-14 13:07:17.808000'),(7,'2023-11-14 13:07:17.830000',NULL,'1983-07-03 15:49:17.170000','jose.jacobs@yahoo.com','Chris Cross','Mark A. Roni','Port Aileneborough','1-926-828-8999','images/user/user-sm-06.jpg',61,'Legacy','2023-11-14 13:07:17.830000'),(8,'2023-11-14 13:07:17.878000',NULL,'2004-09-19 19:31:39.678000','bobbie.gottlieb@gmail.com','Kent Cook','Evan Keel','Fredericafort','317.066.8318','images/user/u-xl-9.jpg',64,'Customer','2023-11-14 13:07:17.878000'),(9,'2023-11-14 13:07:17.895000',NULL,'1969-01-28 23:33:10.409000','rodger.walker@hotmail.com','Jim Shorts','Tommy Hawk','Anettechester','(723) 508-7385','images/user/user-md-1.jpg',36,'National','2023-11-14 13:07:17.895000'),(10,'2023-11-14 13:07:17.909000',NULL,'1963-01-01 12:53:29.590000','elisha.nader@gmail.com','Curt N. Rodd','Nick L. Andime','South Sterling','036-675-1254','images/user/u-xl-7.jpg',58,'Central','2023-11-14 13:07:17.909000'),(11,'2023-11-14 13:07:17.925000',NULL,'1967-06-15 07:21:33.408000','hiram.thiel@gmail.com','Alec Tricity','Myles Long','Parisianstad','1-706-776-3961','images/user/user-sm-01.jpg',14,'Product','2023-11-14 13:07:17.925000'),(12,'2023-11-14 13:07:17.938000',NULL,'1997-03-26 07:41:42.769000','kevin.ferry@gmail.com','Doll R. Bill','Pearl E. Whites','West Joemouth','510.756.2778','images/user/user-md-4.jpg',33,'Principal','2023-11-14 13:07:17.938000'),(13,'2023-11-14 13:07:17.952000',NULL,'1997-03-12 22:13:26.620000','jewel.spencer@hotmail.com','Terry Achey','Bo Nessround','Veumstad','912-807-3542','images/user/user-md-5.jpg',63,'Lead','2023-11-14 13:07:17.952000'),(14,'2023-11-14 13:07:17.970000',NULL,'1980-01-15 07:22:45.316000','kareen.prosacco@gmail.com','Mary A. Richman','Nick Ovtime','South Faustino','129.537.3202','images/user/user-sm-05.jpg',64,'National','2023-11-14 13:07:17.970000'),(15,'2023-11-14 13:07:17.988000',NULL,'1997-10-01 15:24:05.010000','floyd.harber@hotmail.com','Doug Updegrave','Matt Tress','New Evelin','158.975.2886','images/user/user-sm-01.jpg',88,'Dynamic','2023-11-14 13:07:17.988000'),(16,'2023-11-14 13:07:18.004000',NULL,'1986-08-11 17:03:42.827000','jerold.waelchi@hotmail.com','Haywood Jashootmee','Jacklyn Hyde','North Fidel','795-142-5611','images/user/user-md-1.jpg',51,'National','2023-11-14 13:07:18.004000'),(17,'2023-11-14 13:07:18.021000',NULL,'1990-11-18 13:08:28.622000','stanley.goyette@gmail.com','Evan Lee Arps','Macon Paine','East Felicitas','(460) 166-5310','images/user/user-sm-02.jpg',54,'Forward','2023-11-14 13:07:18.021000'),(18,'2023-11-14 13:07:18.039000',NULL,'2005-02-07 13:47:13.808000','joan.sauer@gmail.com','Colleen Cardd','Kandi Apple','Binshaven','(309) 739-5401','images/user/user-md-5.jpg',39,'Corporate','2023-11-14 13:07:18.039000'),(19,'2023-11-14 13:07:18.057000',NULL,'1962-08-06 16:05:17.982000','lowell.mraz@yahoo.com','Holly Wood','Les Plack','Jerleneview','898.169.7131','images/user/user-xs-01.jpg',10,'Forward','2023-11-14 13:07:18.057000'),(20,'2023-11-14 13:07:18.074000',NULL,'1964-11-24 12:28:24.682000','terresa.ryan@hotmail.com','Agatha L. Outtathere','Rip Torn','West Sammy','935-852-4016','images/user/user-sm-06.jpg',79,'Corporate','2023-11-14 13:07:18.074000'),(21,'2023-11-14 13:07:18.089000',NULL,'1959-11-15 22:12:18.256000','coralee.kunze@yahoo.com','Jacques Strap','Kenney C. Strait','New Kerri','420.373.3737','images/user/user-md-01.jpg',77,'Internal','2023-11-14 13:07:18.089000'),(22,'2023-11-14 13:07:18.105000',NULL,'1982-03-02 05:42:19.499000','suzanne.kunze@gmail.com','Mark Mywords','Chad Terbocks','West Mayola','(265) 338-6596','images/user/user-md-4.jpg',61,'Regional','2023-11-14 13:07:18.105000'),(23,'2023-11-14 13:07:18.120000',NULL,'1996-06-18 20:01:18.266000','maya.bauch@hotmail.com','Mel Practiss','Al B. Tross','Port Tawanda','591.748.3632','images/user/user-md-3.jpg',52,'Forward','2023-11-14 13:07:18.120000'),(24,'2023-11-14 13:07:18.138000',NULL,'1990-11-24 21:17:28.616000','aletha.jast@hotmail.com','Carrie Oakey','Candy Barr','South Adolphburgh','105.861.3531','images/user/user-sm-06.jpg',60,'Future','2023-11-14 13:07:18.138000'),(25,'2023-11-14 13:07:18.156000',NULL,'1978-01-13 19:48:53.838000','adelina.hettinger@hotmail.com','Arch N. Emmy','Liv Long','Predovicside','(958) 479-4980','images/user/user-md-2.jpg',26,'National','2023-11-14 13:07:18.156000'),(26,'2023-11-14 13:07:18.173000',NULL,'1995-11-14 05:17:15.349000','bobbye.von@gmail.com','Rita Booke','Stan Dup','Port Robertton','(659) 457-9346','images/user/u-xl-10.jpg',76,'National','2023-11-14 13:07:18.173000'),(27,'2023-11-14 13:07:18.191000',NULL,'1993-10-02 08:46:47.240000','clifton.jakubowski@hotmail.com','Tad Moore','Emile Eaton','Connellyville','1-854-120-2100','images/user/user-sm-01.jpg',33,'Future','2023-11-14 13:07:18.191000'),(28,'2023-11-14 13:07:18.208000',NULL,'1999-04-22 14:04:31.815000','margarito.marks@hotmail.com','Brice Tagg','Rich Guy','Carlosstad','593.581.5375','images/user/u-xl-10.jpg',49,'Principal','2023-11-14 13:07:18.208000'),(29,'2023-11-14 13:07:18.222000',NULL,'2002-04-05 20:13:47.821000','sergio.hudson@gmail.com','Daisy Picking','Thor Luther','Shayneland','(935) 817-0323','images/user/u-xl-5.jpg',37,'Dynamic','2023-11-14 13:07:18.222000'),(30,'2023-11-14 13:07:18.239000',NULL,'1980-04-29 10:49:53.216000','rachal.anderson@gmail.com','Hein Noon','Rhoda Booke','Gaylordchester','(686) 004-3004','images/user/user-sm-06.jpg',41,'Senior','2023-11-14 13:07:18.239000'),(31,'2023-11-14 13:07:18.257000',NULL,'1985-03-17 11:32:51.722000','rolland.mann@hotmail.com','Al K. Seltzer','Bruce Easley','West Jaimeburgh','(547) 233-1982','images/user/user-sm-01.jpg',59,'Human','2023-11-14 13:07:18.257000'),(32,'2023-11-14 13:07:18.274000',NULL,'1981-01-27 22:40:05.708000','kittie.herzog@yahoo.com','Jane Linkfence','Mason Jarr','Baileyside','(098) 780-9527','images/user/user-sm-04.jpg',57,'National','2023-11-14 13:07:18.274000'),(33,'2023-11-14 13:07:18.291000',NULL,'1959-07-27 02:04:07.078000','sage.keeling@hotmail.com','Ty Malone','Eli Ondefloor','Mayertfurt','614-595-2259','images/user/user-sm-03.jpg',79,'National','2023-11-14 13:07:18.291000'),(34,'2023-11-14 13:07:18.309000',NULL,'1993-09-08 03:39:19.648000','merle.haag@yahoo.com','Moe DeLawn','Rusty Steele','Mosciskimouth','481-761-5026','images/user/u-xl-9.jpg',18,'Global','2023-11-14 13:07:18.309000'),(35,'2023-11-14 13:07:18.325000',NULL,'2002-04-28 11:07:23.363000','geraldine.beahan@hotmail.com','Hal E. Luya','Milly Meter','West Lashaychester','1-848-009-7712','images/user/user-sm-06.jpg',25,'Forward','2023-11-14 13:07:18.325000'),(36,'2023-11-14 13:07:18.341000',NULL,'1992-02-17 15:51:58.405000','aundrea.reichert@gmail.com','Bud Weiser','Sherman Wadd Evver','New Ahmadstad','193.715.5130','images/user/u-xl-12.jpg',10,'Future','2023-11-14 13:07:18.341000'),(37,'2023-11-14 13:07:18.358000',NULL,'2002-08-31 12:03:51.598000','darrick.barton@gmail.com','Jim Laucher','Cody Pendant','Port Joline','173-738-3056','images/user/u-xl-2.jpg',77,'Central','2023-11-14 13:07:18.358000'),(38,'2023-11-14 13:07:18.375000',NULL,'1988-02-18 03:07:27.866000','ralph.blanda@gmail.com','Harry Caray','Oliver Sutton','South Marchelle','692-954-2063','images/user/u-xl-12.jpg',41,'Customer','2023-11-14 13:07:18.375000'),(39,'2023-11-14 13:07:18.418000',NULL,'2005-04-24 06:09:07.604000','elina.renner@yahoo.com','Brock Lee','Gil T. Azell','Lindsayshire','(439) 800-4283','images/user/u-xl-4.jpg',42,'Regional','2023-11-14 13:07:18.418000'),(40,'2023-11-14 13:07:18.434000',NULL,'1997-04-16 19:49:32.866000','charles.mills@gmail.com','Gus Tofwin','Laura Norder','Blockshire','956.543.2597','images/user/u-xl-12.jpg',16,'Global','2023-11-14 13:07:18.434000'),(41,'2023-11-14 13:07:18.447000',NULL,'1979-03-20 14:46:29.935000','yuko.mayert@yahoo.com','Agatha L. Outtathere','Darrell B. Moore','Corazontown','218-931-5136','images/user/u-xl-8.jpg',82,'Regional','2023-11-14 13:07:18.447000'),(42,'2023-11-14 13:07:18.464000',NULL,'1972-06-19 08:45:37.291000','mavis.hettinger@gmail.com','Stan Dup','Sir Fin Waves','North Friedafort','581.489.7360','images/user/user-sm-02.jpg',86,'Customer','2023-11-14 13:07:18.464000'),(43,'2023-11-14 13:07:18.484000',NULL,'1992-03-26 16:40:14.539000','marcelo.oberbrunner@gmail.com','Rusty Carr','Rhoda Mule','Schulistside','(808) 040-6110','images/user/u-xl-12.jpg',58,'Legacy','2023-11-14 13:07:18.484000'),(44,'2023-11-14 13:07:18.502000',NULL,'1993-05-13 21:52:19.314000','dewey.fahey@yahoo.com','Doug Love Fitzhugh','Mark Z. Spot','South Rosena','(142) 423-8437','images/user/user-sm-04.jpg',65,'Customer','2023-11-14 13:07:18.502000'),(45,'2023-11-14 13:07:18.517000',NULL,'1962-03-01 15:04:16.112000','refugio.zboncak@gmail.com','Ben D. Fender','Brook Lynn Bridge','South Teganmouth','1-247-624-6668','images/user/u-xl-12.jpg',89,'District','2023-11-14 13:07:18.517000'),(46,'2023-11-14 13:07:18.533000',NULL,'2000-09-11 18:25:23.827000','reid.blick@gmail.com','Sandy C. Shore','Dan Deline','Alonzofort','(932) 013-8228','images/user/user-md-1.jpg',12,'Future','2023-11-14 13:07:18.533000'),(47,'2023-11-14 13:07:18.548000',NULL,'1958-11-22 10:57:33.321000','rosita.prosacco@hotmail.com','Daisy Picking','Roman Holiday','Lake Jeromy','148-132-2842','images/user/user-md-1.jpg',81,'Corporate','2023-11-14 13:07:18.548000'),(48,'2023-11-14 13:07:18.563000',NULL,'1987-08-04 17:58:20.245000','karen.monahan@yahoo.com','Zeke N. Yeshallfind','Artie Choke','Abdulmouth','545-386-5666','images/user/u-xl-10.jpg',4,'International','2023-11-14 13:07:18.563000'),(49,'2023-11-14 13:07:18.577000',NULL,'2003-05-24 05:52:46.243000','will.kessler@yahoo.com','Ed Jewcation','Tyrone Shoes','Ziemannbury','1-178-900-5633','images/user/user-sm-01.jpg',82,'Future','2023-11-14 13:07:18.577000'),(50,'2023-11-14 13:07:18.594000',NULL,'1986-04-13 07:50:47.149000','shelly.williamson@gmail.com','Jean Poole','Sue Yu','Kilbackton','906-556-8674','images/user/u-xl-8.jpg',71,'Regional','2023-11-14 13:07:18.594000'),(51,'2023-11-14 13:08:28.793000',NULL,'1978-07-18 03:14:50.359000','fredia.romaguera@hotmail.com','Zoltan Pepper','Darrell B. Moore','North Nelliechester','1-895-596-3676','images/user/user-md-2.jpg',41,'Regional','2023-11-14 13:08:28.793000'),(52,'2023-11-14 13:08:28.838000',NULL,'1995-09-08 23:50:37.757000','cyndi.smitham@hotmail.com','Adam Baum','Mason Jarr','Lake Wmhaven','1-300-512-2593','images/user/u-xl-9.jpg',47,'Central','2023-11-14 13:08:28.838000'),(53,'2023-11-14 13:08:28.862000',NULL,'1958-12-05 16:59:51.382000','eugenie.metz@yahoo.com','Jack Pott','Peg Legge','Beierhaven','1-243-041-8958','images/user/u-xl-1.jpg',16,'Human','2023-11-14 13:08:28.862000'),(54,'2023-11-14 13:08:28.898000',NULL,'1967-10-19 07:13:29.237000','melina.kuhn@hotmail.com','Wilma Leggrowbach','Justin Sane','East Aleidaland','(396) 257-1728','images/user/u-xl-3.jpg',80,'Human','2023-11-14 13:08:28.898000'),(55,'2023-11-14 13:08:28.915000',NULL,'1992-11-27 12:30:27.279000','kelle.bogisich@yahoo.com','Kat Toy','Jack Tupp','Wolffhaven','1-180-430-0429','images/user/user-sm-04.jpg',58,'International','2023-11-14 13:08:28.915000'),(56,'2023-11-14 13:08:28.939000',NULL,'1992-05-21 02:07:36.327000','kimberly.lockman@hotmail.com','Bob Frapples','Bob Inforapples','East Brent','1-422-552-0859','images/user/user-xs-01.jpg',34,'Customer','2023-11-14 13:08:28.939000'),(57,'2023-11-14 13:08:28.959000',NULL,'1977-06-09 09:40:29.262000','jane.crist@yahoo.com','Lily Pond','Bonnie Ann Clyde','Monahanfort','991.487.7014','images/user/u-xl-5.jpg',15,'Central','2023-11-14 13:08:28.959000'),(58,'2023-11-14 13:08:28.980000',NULL,'1966-11-07 17:08:04.369000','liz.runte@hotmail.com','Ulee Daway','Luke Warm','South Demetriusberg','116.755.7385','images/user/u-xl-6.jpg',24,'Regional','2023-11-14 13:08:28.980000'),(59,'2023-11-14 13:08:28.995000',NULL,'1970-07-01 22:51:45.502000','demarcus.fahey@yahoo.com','Tom Katz','Dustin D. Furniture','Jamaaltown','601.033.7443','images/user/u-xl-8.jpg',44,'Corporate','2023-11-14 13:08:28.995000'),(60,'2023-11-14 13:08:29.021000',NULL,'1965-12-12 06:36:20.941000','greg.nicolas@gmail.com','Denny Juan Heredatt','Juan Morefore DeRhode','Lake Naomi','429-924-5823','images/user/u-xl-1.jpg',43,'Investor','2023-11-14 13:08:29.021000'),(61,'2023-11-14 13:08:29.041000',NULL,'1985-05-25 11:05:07.459000','edmond.ebert@yahoo.com','Gladys Eeya','Owen Cash','Mullerton','(371) 918-4998','images/user/u-xl-6.jpg',29,'Chief','2023-11-14 13:08:29.041000'),(62,'2023-11-14 13:08:29.059000',NULL,'1986-12-10 05:36:39.868000','osvaldo.wuckert@yahoo.com','Faye Kinnitt','Matt Tress','South Mardell','1-826-114-4035','images/user/u-xl-2.jpg',52,'Corporate','2023-11-14 13:08:29.059000'),(63,'2023-11-14 13:08:29.081000',NULL,'2001-08-09 16:08:07.015000','chong.ledner@hotmail.com','Sue Ridge','Rowan Boatman','Tammyfurt','345.101.5525','images/user/u-xl-10.jpg',11,'Product','2023-11-14 13:08:29.081000'),(64,'2023-11-14 13:08:29.103000',NULL,'1971-07-26 04:07:54.990000','karly.smitham@gmail.com','Lily Pond','Juan De Hattatime','Dickensburgh','(938) 189-4758','images/user/user-xs-01.jpg',34,'Legacy','2023-11-14 13:08:29.103000'),(65,'2023-11-14 13:08:29.130000',NULL,'1977-09-27 22:46:29.178000','antoine.bahringer@hotmail.com','Sheri Cola','Stu Pitt','Irinaview','(810) 757-6818','images/user/user-sm-01.jpg',18,'Corporate','2023-11-14 13:08:29.130000'),(66,'2023-11-14 13:08:29.150000',NULL,'1961-10-04 14:58:51.876000','valda.padberg@gmail.com','Andy Structible','Tina See','Luciusmouth','769.883.7124','images/user/user-md-4.jpg',79,'National','2023-11-14 13:08:29.150000'),(67,'2023-11-14 13:08:29.163000',NULL,'1984-04-30 19:58:12.153000','jene.vonrueden@hotmail.com','Sam Pull','P. Brain','New Westonhaven','(607) 520-6632','images/user/u-xl-1.jpg',64,'District','2023-11-14 13:08:29.163000'),(68,'2023-11-14 13:08:29.180000',NULL,'1976-06-05 14:59:49.650000','hortensia.gulgowski@hotmail.com','Al K. Seltzer','Hy Lowe','East Lindaborough','1-647-077-7035','images/user/user-md-5.jpg',9,'International','2023-11-14 13:08:29.180000'),(69,'2023-11-14 13:08:29.193000',NULL,'1997-03-26 15:08:41.992000','daniel.oconner@hotmail.com','Wilma Leggrowbach','Joy Anna DeLight','East Katinaton','1-688-742-5910','images/user/user-xs-01.jpg',44,'Product','2023-11-14 13:08:29.193000'),(70,'2023-11-14 13:08:29.204000',NULL,'2002-11-11 04:08:56.035000','emory.shanahan@hotmail.com','Harmon Ikka','Clara Sabell','South Clint','1-907-368-8685','images/user/user-sm-04.jpg',61,'National','2023-11-14 13:08:29.204000'),(71,'2023-11-14 13:08:29.217000',NULL,'1997-02-25 15:03:58.127000','griselda.thompson@hotmail.com','Rhea Curran','Carl Arm','North Clay','958.112.3493','images/user/u-xl-9.jpg',6,'Lead','2023-11-14 13:08:29.217000'),(72,'2023-11-14 13:08:29.229000',NULL,'1966-09-21 05:24:34.767000','virgil.hayes@yahoo.com','Joy Anna DeLight','Rip Torn','New Luzland','1-935-145-3866','images/user/u-xl-2.jpg',11,'Chief','2023-11-14 13:08:29.229000'),(73,'2023-11-14 13:08:29.246000',NULL,'1988-02-19 23:10:25.219000','ludivina.bruen@hotmail.com','Ilene North','Phil Graves','Stuarthaven','1-159-276-4103','images/user/u-xl-10.jpg',6,'Internal','2023-11-14 13:08:29.246000'),(74,'2023-11-14 13:08:29.262000',NULL,'2001-10-12 05:40:06.883000','logan.white@hotmail.com','Leigh King','Ali Gator','New Kristen','(237) 431-9035','images/user/u-xl-2.jpg',88,'Senior','2023-11-14 13:08:29.262000'),(75,'2023-11-14 13:08:29.289000',NULL,'1968-06-04 08:59:31.225000','jeremiah.funk@yahoo.com','Art Major','Rip Tile','Roryview','1-079-784-0614','images/user/user-sm-03.jpg',13,'Human','2023-11-14 13:08:29.289000'),(76,'2023-11-14 13:08:29.315000',NULL,'1993-02-07 20:30:17.565000','valerie.becker@gmail.com','Cammie Sole','Alec Tricity','Port Lan','(984) 342-7884','images/user/u-xl-10.jpg',48,'Principal','2023-11-14 13:08:29.315000'),(77,'2023-11-14 13:08:29.364000',NULL,'1964-11-17 00:03:04.693000','emily.hegmann@yahoo.com','Len DeHande','Tom Katz','Danamouth','(517) 552-8540','images/user/user-md-1.jpg',5,'Central','2023-11-14 13:08:29.364000'),(78,'2023-11-14 13:08:29.430000',NULL,'1985-04-06 11:16:05.941000','christene.hegmann@hotmail.com','Diane Toluvia','Zoe Mudgett Hertz','Lake Scottton','179-353-3233','images/user/user-sm-02.jpg',89,'Senior','2023-11-14 13:08:29.430000'),(79,'2023-11-14 13:08:29.460000',NULL,'1977-01-22 12:12:45.795000','blythe.volkman@hotmail.com','Raynor Schein','Colin Allcars','Stehrview','1-515-341-7491','images/user/user-sm-03.jpg',68,'Direct','2023-11-14 13:08:29.460000'),(80,'2023-11-14 13:08:29.490000',NULL,'1995-01-12 10:08:10.832000','loyce.beier@gmail.com','Ira Fuse','Ima Klotz','South Bernie','(050) 867-6410','images/user/user-sm-03.jpg',12,'Direct','2023-11-14 13:08:29.490000'),(81,'2023-11-14 13:08:29.521000',NULL,'1967-08-10 05:38:32.507000','toby.friesen@gmail.com','Harry Pitts','Tyrone Shoes','Port Sidhaven','(844) 787-6553','images/user/u-xl-3.jpg',71,'Corporate','2023-11-14 13:08:29.521000'),(82,'2023-11-14 13:08:29.545000',NULL,'1982-09-27 20:38:32.386000','jeffery.blick@gmail.com','Candy Kane','Jacklyn Hyde','North Breana','(469) 651-7373','images/user/u-xl-5.jpg',74,'Dynamic','2023-11-14 13:08:29.545000'),(83,'2023-11-14 13:08:29.563000',NULL,'1977-01-31 04:17:26.676000','remedios.fay@yahoo.com','Jack Dupp','Elmer Sklue','Nienowberg','1-430-520-2399','images/user/user-sm-02.jpg',90,'Senior','2023-11-14 13:08:29.564000'),(84,'2023-11-14 13:08:29.584000',NULL,'1991-08-09 08:43:18.072000','jerome.wuckert@hotmail.com','Brandy Anne Koch','Adam Baum','Samaraside','1-398-813-7437','images/user/user-md-5.jpg',48,'Customer','2023-11-14 13:08:29.584000'),(85,'2023-11-14 13:08:29.597000',NULL,'1959-02-02 19:26:16.688000','astrid.towne@gmail.com','Oscar Ruitt','Laura Norder','Port Twila','592.535.1481','images/user/u-xl-4.jpg',28,'Human','2023-11-14 13:08:29.597000'),(86,'2023-11-14 13:08:29.611000',NULL,'1982-12-05 16:04:02.657000','kim.renner@hotmail.com','April Schauer','Tom Katz','Grimesberg','1-243-295-0070','images/user/u-xl-10.jpg',27,'Lead','2023-11-14 13:08:29.611000'),(87,'2023-11-14 13:08:29.626000',NULL,'1975-06-18 06:35:34.865000','lamont.frami@hotmail.com','Seymour Legg','Chris P. Wheatzenraisins','New Domingo','1-102-240-3338','images/user/u-xl-4.jpg',64,'Forward','2023-11-14 13:08:29.626000'),(88,'2023-11-14 13:08:29.640000',NULL,'1997-03-20 08:12:08.499000','jude.koepp@yahoo.com','Doug Updegrave','Chris P. Nugget','Solomonton','(047) 641-6506','images/user/user-md-5.jpg',10,'Regional','2023-11-14 13:08:29.640000'),(89,'2023-11-14 13:08:29.656000',NULL,'1975-05-09 20:23:01.467000','berry.prohaska@gmail.com','Ben Down','Rusty Dorr','Javiermouth','110-363-2695','images/user/user-xs-01.jpg',37,'Legacy','2023-11-14 13:08:29.656000'),(90,'2023-11-14 13:08:29.670000',NULL,'1984-08-06 23:36:05.317000','milissa.oreilly@gmail.com','Hy Marx','Al Nino','West Fredstad','335-113-1855','images/user/user-md-2.jpg',45,'Forward','2023-11-14 13:08:29.670000'),(91,'2023-11-14 13:08:29.687000',NULL,'1986-06-25 00:15:01.582000','noelia.haley@gmail.com','Sal Minella','Bo D. Satva','Morissetteshire','1-501-132-0417','images/user/user-md-3.jpg',39,'Principal','2023-11-14 13:08:29.687000'),(92,'2023-11-14 13:08:29.702000',NULL,'2004-07-19 19:57:38.025000','javier.bauch@hotmail.com','Jimmy DeLocke','Bob Inforapples','Roseanneborough','1-395-470-9077','images/user/user-md-3.jpg',45,'District','2023-11-14 13:08:29.702000'),(93,'2023-11-14 13:08:29.718000',NULL,'1973-12-09 22:07:03.351000','santiago.schmidt@hotmail.com','Sandy Banks','Penny Profit','Kovacekborough','1-481-607-6363','images/user/user-md-4.jpg',77,'Product','2023-11-14 13:08:29.718000'),(94,'2023-11-14 13:08:29.738000',NULL,'1996-06-29 23:49:43.738000','floretta.bednar@gmail.com','Will Wynn','Lance Lyde','Cedrickstad','202.487.2221','images/user/user-sm-05.jpg',64,'Product','2023-11-14 13:08:29.738000'),(95,'2023-11-14 13:08:29.768000',NULL,'1970-01-07 15:06:17.354000','bryan.fadel@hotmail.com','Howard I. No','Penny Whistler','Port Corneliusville','1-466-170-3847','images/user/user-md-2.jpg',23,'Dynamic','2023-11-14 13:08:29.769000'),(96,'2023-11-14 13:08:29.788000',NULL,'1992-03-26 09:52:59.996000','ellis.denesik@hotmail.com','Ken Oppenner','Brice Tagg','Farrellbury','(192) 995-1603','images/user/user-sm-02.jpg',23,'Chief','2023-11-14 13:08:29.788000'),(97,'2023-11-14 13:08:29.802000',NULL,'1982-06-22 04:52:51.771000','sherryl.reichel@yahoo.com','Morgan U. Canhandle','Reed Toomey','East Bartonhaven','264-221-2040','images/user/user-md-1.jpg',11,'Forward','2023-11-14 13:08:29.802000'),(98,'2023-11-14 13:08:29.818000',NULL,'1959-05-13 09:20:27.130000','dwain.marquardt@gmail.com','Evans Gayte','Darryl Likt','Gibsonville','(639) 919-0338','images/user/user-sm-03.jpg',79,'Senior','2023-11-14 13:08:29.818000'),(99,'2023-11-14 13:08:29.832000',NULL,'1966-01-30 03:54:52.669000','ezequiel.mayert@hotmail.com','Jay Walker','Jane Linkfence','Thurmanport','845.832.1866','images/user/user-sm-05.jpg',58,'District','2023-11-14 13:08:29.832000'),(100,'2023-11-14 13:08:29.848000',NULL,'1964-11-09 03:04:36.814000','doug.adams@yahoo.com','Doris Open','U. O. Money','Gertudeland','868.641.9038','images/user/user-md-4.jpg',78,'Central','2023-11-14 13:08:29.848000'),(101,'2023-11-14 13:14:01.365000',NULL,'2023-11-01 00:00:00.000000','user@gmail.com','Vasya','Straub','Жабокрич','222-33-222','images/uploads/7c5f109e-8175-4dd9-afe8-d064fa98c0b1_user-md-5.jpg',NULL,'Hipster','2023-11-14 13:14:01.365000');
/*!40000 ALTER TABLE `emploee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpa_event_publication`
--

DROP TABLE IF EXISTS `jpa_event_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `jpa_event_publication` (
                                         `id` binary(16) NOT NULL,
                                         `completion_date` datetime(6) DEFAULT NULL,
                                         `event_type` varchar(255) DEFAULT NULL,
                                         `listener_id` varchar(255) DEFAULT NULL,
                                         `publication_date` datetime(6) DEFAULT NULL,
                                         `serialized_event` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpa_event_publication`
--

LOCK TABLES `jpa_event_publication` WRITE;
/*!40000 ALTER TABLE `jpa_event_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jpa_event_publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:46:30