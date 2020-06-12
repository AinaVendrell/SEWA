SET GLOBAL time_zone = '-3:00';
UNLOCK TABLES;
DROP DATABASE IF EXISTS `unio`;
CREATE DATABASE IF NOT EXISTS `unio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `unio`;

-- -------------------------------------------------------

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users`(
    `name`   varchar(20) NOT NULL,
    `surname`   varchar(20) NOT NULL,
    `gender`  varchar(20) NOT NULL,
    `birthday`   varchar(20) NOT NULL,
    `uid`   varchar(20) NOT NULL,
    `email`  varchar(50) NOT NULL,
    `pwd`   varchar(20) NOT NULL,
    `avatar` varchar(20) DEFAULT NULL,
    PRIMARY KEY(`uid`),
    UNIQUE(`email`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`name`, `surname`, `gender`, `birthday`, `uid`, `email`, `pwd`, `avatar`) VALUES
('Eva', 'Martos', 'mujer', '1999-01-01', 'evamartos', 'evamartos@gmail.com', 'EvMar1999', 'avatar/user_12.png'),
('Aleix', 'Alonso', 'hombre', '1999-04-30', 'aleixalonso', 'aleixalonso@gmail.com', 'AleAlo1999', 'avatar/user_2.png'),
('Mar', 'Calafato', 'mujer', '1998-03-11', 'marcalafato', 'marcalafato@gmail.com', 'MarCala1998', 'avatar/user_15.png'),
('Aina', 'Vendrell', 'mujer', '1999-11-14', 'ainavendrell', 'ainavendrell@gmail.com', 'AiVen1999', 'avatar/user_20.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `uid` varchar(20) NOT NULL,
  `fid` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`,`fid`),
  KEY `fid_users_fk` (`fid`),
  CONSTRAINT `fid_users_fk` FOREIGN KEY (`fid`) REFERENCES `users` (`uid`),
  CONSTRAINT `uid_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES 
('evamartos','marcalafato'),
('evamartos','ainavendrell'),
('evamartos','aleixalonso'),
('aleixalonso','ainavendrell'),
('aleixalonso','marcalafato'),
('aleixalonso','evamartos'),
('ainavendrell','evamartos'),
('ainavendrell','aleixalonso'),
('ainavendrell','marcalafato'),
('marcalafato','evamartos'),
('marcalafato','aleixalonso'),
('marcalafato','ainavendrell');
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) DEFAULT NULL,
  `postdatetime` timestamp NULL DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  -- KEY `tweets_users_fk` (`uid`),
  KEY `tweets_tweets_fk` (`pid`),
  CONSTRAINT `tweets_tweets_fk` FOREIGN KEY (`pid`) REFERENCES `tweets` (`tid`)
  -- CONSTRAINT `tweets_users_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `tweets`
--
LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` (`uid`, `postdatetime`, `content`) VALUES
('evamartos','2020-05-27 15:57:21','Primer Tweet de la Eva'),
('marcalafato','2020-05-27 15:57:21','Primer Tweet de la Mar'),
('aleixalonso','2020-05-27 15:57:21','Primer Tweet de Aleix'),
('ainavendrell','2020-05-27 15:57:21','Primer Tweet de Aina');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


SELECT * FROM users;
SELECT * FROM followers;
SELECT * FROM tweets;
