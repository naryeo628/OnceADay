007-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: o3
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `content_list`
--

DROP TABLE IF EXISTS `content_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_list` (
  `owner_auth` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `content` text,
  `date` int(20) DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`owner_auth`,`number`),
  CONSTRAINT `fk_content` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_list`
--

LOCK TABLES `content_list` WRITE;
/*!40000 ALTER TABLE `content_list` DISABLE KEYS */;
INSERT INTO `content_list` VALUES
('local:chen0921',1,'머리고기 설농탕',180511171730,NULL),
('local:chen0921',2,'돈까스',180512171730,NULL),
('local:chen0921',3,'함박스택',180513171730,NULL),
('local:chen0921',4,'생선까스',180514171730,NULL),
('local:do12',1,'짜장면',180511171731,NULL),
('local:do12',2,'차돌양지짬뽕',180512171731,NULL),
('local:do12',3,'중화비빔면',180513171731,NULL),
('local:do12',4,'해물볶음밥',180514171731,NULL),
('local:dongdae1',1,'통 삼겹살',180511171731,NULL),
('local:dongdae1',2,'통 목 살',180512171732,NULL),
('local:dongdae1',3,'통 항정살',180513171732,NULL),
('local:dongdae1',4,'통 껍데기',180514171732,NULL);
/*!40000 ALTER TABLE `content_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `owner_auth` varchar(20) NOT NULL,
  `user_auth` varchar(20) NOT NULL,
  PRIMARY KEY (`owner_auth`,`user_auth`),
  KEY `fk_follow2` (`user_auth`),
  CONSTRAINT `fk_follow` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`),
  CONSTRAINT `fk_follow2` FOREIGN KEY (`user_auth`) REFERENCES `user` (`user_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('local:wook','local:jhkdie'),('local:wook','local:ldhfall'),('local:wook','local:hscthsh3306'),('local:wook','local:emmaoh26'),('local:wook','local:jwkasa'),('local:wook','local:nsj888'),('local:wook','local:ujjang93'),('local:wook','local:1155'),('local:chen0921','local:1155'),('local:do12','local:1155'),('local:dongdae1','local:1155'),('local:grandma123','local:1155'),('local:hansung','local:1155');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `owner_auth` varchar(20) NOT NULL,
  `owner_id` varchar(10) DEFAULT NULL,
  `owner_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `store` varchar(100) DEFAULT NULL,
  `address1` varchar(10) DEFAULT NULL,
  `address2` varchar(10) DEFAULT NULL,
  `address3` varchar(10) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `time` text,
  `image_url` text,
  PRIMARY KEY (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('local:wook','wook','K5GodcbNAVbsuboELouoiY8a0+0s/kw78xyttrM4VlsEbop3E+ElK/M/guAYqSrn8ijVakXm+lihjurUQC6V+8PsCtc6DU7ZIt2L0EHPurLppUuiSDWSdGLzmTXMIkR9AmUSqmIBlpdIVixdZ7AwlPGtx6CMRNv+h7163FMfe1M=','UzuUXd8itQsNYsSj7vx4zuyOT97MA/y8riJFB5P5kXWxL7kh8Z31OdaNpgA6VHh6YzMSbWpYrnUm56RckGP3ug==','수동에서 온 순대국','서울시','성북구','삼선동','한성대학교 근처','010-7577-4937','아침 9시부터 저녁 7시까지',NULL),
('local:chen0921','chen0921','chen',NULL,'장안정','서울특별시','동대문구','장안동','334-3','02-2246-6574','24시간',NULL),
('local:do12','do12','dodo12',NULL,'예지현','서울특별시','동대문구','휘경동','192-5','02-3395-8805','연중무휴',NULL),
('local:dongdae1','dongdae1','dong1',NULL,'퐈이야','서울특별시','동대문구','전농동','602-5','02-960-1541','9:30-22:30',NULL),
('local:grandma123','grandma123','grand123',NULL,'나정순할매주꾸미','서울특별시','동대문구','용신동','119-20','02-928-0231','오전9:00-오후11:00',NULL),
('local:hansung','hansung1','hello',NULL,'마카나이','서울특별시','동대문구','전농동','602-11','02-969-2972','오전8:00~오후11:00',NULL),
('local:kai88','kai88','kimkai88',NULL,'크치치킨','서울특별시','동대문구','제기동','122-373','02-962-9285','오후1:30-새벽2:30',NULL),
('local:korea1','korea1','korea11',NULL,'대한곱창','서울특별시','동대문구','장안동','433-20','02-2214-5207','연중무휴',NULL),
('local:lay4570','laylay4570','lay10',NULL,'감초식당','서울특별시','동대문구','제기동','122-373','02-962-4570','9시~23시',NULL),
('local:mama010','mama010','mama111',NULL,'어머니대성집','서울특별시','동대문구','용신동','754-9','02-923-1718','24시간영업',NULL),
('local:rain21','rain21','rain1031',NULL,'낙서파전','서울특별시','동대문구','휘경동','319-32','02-968-6019','pm2:00-am3:00',NULL),
('local:sky1004','sky1004','skysky',NULL,'은하곱창','서울특별시','동대문구','전농동','295-48','02-2247-0254','오후5:00~새벽2시',NULL),
('local:suho01','suho01','suho0101',NULL,'라온9','서울특별시','동대문구','제기동','892-71','02-969-0244','24시',NULL),
('local:xiu99','xiu99','xiumin99',NULL,'봉이만두','서울특별시','동대문구','휘경동','261-3','02-2215-1122','오전9:00-오후11:00',NULL),
('local:xo0408','xo0408','exo0408',NULL,'일미간장게장','서울특별시','동대문구','장안동','367-3','02-2242-4338','10:00-22:00',NULL),
('local:ykha1031','ykha1031','yk1031',NULL,'개성집','서울특별시','동대문구','용신동','201-2','02-923-6779','am11:00-pm11:00',NULL),
('local:hyehwa2','hyehwa2','V3rrJhYiTiiSITL92IydDgSDEFhMucJ/tlZiXeGAFKMwYAjwCjFbv3mFtf6hU1oNFf4EoGy2wyy0F2QjUtMITdWiV1gqdE2BLKP2zPPsn687HN+0olmTIIPxEJsfnRi8mMQxmPyJTbeFOWRYuBQnpgM9h4EEZD7qi4GKrN+FthQ=','40d/yitAOCqBD8gEUn0rtLT32sqLvprZBQevsHStPMxD35eHZLBKNIYPW6Q3s0DrLMlkl1W/WrzbCUjHFX9Q2w==','정돈','서울특별시','종로구','혜화동','107지층','02-987-0924','11:30-14:00, 17:00-21:00(last order 21시 시)',NULL);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `owner_auth` varchar(20) NOT NULL,
  `product` varchar(15) NOT NULL,
  `price` mediumtext,
  `sale` text,
  PRIMARY KEY (`owner_auth`,`product`),
  CONSTRAINT `fk_product` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `owner_auth` varchar(20) NOT NULL,
  `user_auth` varchar(20) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `good` text,
  `bad` text,
  PRIMARY KEY (`owner_auth`,`user_auth`),
  KEY `fk_reivew2` (`user_auth`),
  CONSTRAINT `fk_reivew2` FOREIGN KEY (`user_auth`) REFERENCES `user` (`user_auth`),
  CONSTRAINT `fk_review` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('local:wook','local:jwl628',2,'맛있어요!','좀 비싸네요'),('local:wook','local:ujjang93',4,'메뉴가 다양합니다.','단점은 없어요!'),('local:wook','local:emmaoh26',5,'남친이랑 오기 좋아요.','혼자 오기에는 좋지 않아요.'),('local:wook','local:jwkasa',1,'인테리어 예쁨','불친절'),('local:wook','local:ldhfall',3,'먹을만하다','양이 적다'),('local:wook','local:hscthsh3306',3,'음악이 좋음','맛은 그럭저럭');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_auth` varchar(20) NOT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address1` varchar(10) DEFAULT NULL,
  `address2` varchar(10) DEFAULT NULL,
  `address3` varchar(10) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('local:1155','1155','WZba4CB9EhTZhG32lm/GnajMN+4R3GnutBjxDvqHNWKihZ64TQGeggPp6uKcTA1ZNvBftmojUTRyEntRVRvFi1KXDpe89gSSkgKg2DM8bteNCsdFJVP8fG4lA3DYAn6/REy4GAz+0hOr0lO0cLX1eYy3lJwV5MvkaR5VbtbH6n4=','sbQdcc6RsMPqs/MMO1zTk7yUAxuZ7t1J6tGw/Te6cFD9B6/6PhZiKJSFKbYz/S/cDEVOCuRu70GbxwC4hyhMjg==','노트북',NULL,NULL,NULL,NULL),('local:1222','1222','yPyGG6i5UhY9b70XygLElbwg0TrfFDf7nB2dAHDkq6SGcuwgJOCqJZrGTvC6rjdZiDptVRynG3qPGEfzUm+2DKuyreGvdDhRzZ+TssUdamXUswufxKkGxY3upmaaf2Xhj1sfTMu+Hz3X2JRaRv0mRCwXZtc14+dQAqPB3SEGqd0=','gIvPMiImzsW8fIiinALZcAdahABYLa9wk6tTA618oHBxmeAAJJuDoJ+76PiuGA1URjVMLJ7+El+ue0sKj9Or8Q==','1222',NULL,NULL,NULL,NULL),('local:jhkdie','jhkdie','111111','g2','김정호',NULL,NULL,NULL,NULL),('local:ldhfall','ldhfall','111111','g2','이동현',NULL,NULL,NULL,NULL),('local:hscthsh3306','hscthsh3306','111111','g2','장희수',NULL,NULL,NULL,NULL),('local:emmaoh26','emmaoh26','111111','g2','오지은',NULL,NULL,NULL,NULL),('local:jwkasa','jwkasa','111111','g2','박진우',NULL,NULL,NULL,NULL),('local:nsj888','nsj888','111111','g2','조남수',NULL,NULL,NULL,NULL),('local:ujjang93','ujjang93','111111','g2','유광형',NULL,NULL,NULL,NULL),('local:jwl628','jwl628','111111','111111','이정욱',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_province` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `state` VALUES
(02,'서울특별시');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_county_gu`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_gu_county` (
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `city_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`,`city_id`),
  CONSTRAINT `fk_city` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `city` VALUES
(02,001,종로구),(02,002,중구),(02,003,용산구),(02,004,성동구),(02,005,광진구),(02,006,동대문구),(02,007,중랑구),(02,008,성북구),(02,009,강북구),(02,010,도봉구),(02,011,노원구),(02,012,은평구),(02,013,서대문구),(02,014,마포구),(02,015,양천구),(02,016,강서구),(02,017,구로구),(02,018,금천구),(02,019,영등포구),(02,020,동작구),(02,021,관악구),(02,022,서초구),(02,023,강남구),(02,024,송파구),(02,025,강동구);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `town`
--

DROP TABLE IF EXISTS `town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `town` (
  `city_id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `town_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`city_id`,`town_id`),
  CONSTRAINT `fk_town` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eup_myeon_dong`
--

LOCK TABLES `town` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `town` VALUES
(001,001,'청운효자동' ),(001,002,'사직동'),(001,003,'삼청동'),(001,004,'부암동'),(001,005,'평창동'),(001,006,'무악동'),(001,007,'교남동'),(001,008,'가회동'),(001,009,'종로1·2·3·4가동'),(001,010,'종로5·6가동'),(001,011,'이화동'),(001,012,'혜화동'),(001,013,'창신1동'),(001,014,'창신2동'),(001,015,'창신3동'),(001,016,'숭인1동'),(001,017,'숭인2동'),

(002,001,'소공동'),(002,002,'회현동'),(002,003,'명동'),(002,004,'필동'),(002,005,'장충동'),(002,006,'광희동'),(002,007,'을지로동'),(002,008,'신당동'),(002,009,'다산동'),(002,010,'약수동'),(002,011,'청구동'),(002,012,'신당5동'),(002,013,'동화동'),(002,014,'황학동'),(002,015,'중림동'),

(003,001,'후암동'),(003,002,'용산2가동'),(003,003,'남영동'),(003,004,'청파동'),(003,005,'원효로1동'),(003,006,'원효로2동'),(003,007,'효창동'),(003,008,'용문동'),(003,009,'한강로동'),(003,010,'이촌1동'),(003,011,'이촌2동'),(003,012,'이태원1동'),(003,013,'이태원2동'),(003,014,'한남동'),(003,015,'서빙고동'),(003,016,'보광동'),

(004,001,'왕십리도선동'),(004,002,'왕십리2동'),(004,003,'마장동'),(004,004,'사근동'),(004,005,'행당1동'),(004,006,'행당2동'),(004,007,'응봉동'),(004,008,'금호1가동'),(004,009,'금호2·3가동'),(004,010,'금호4가동'),(004,011,'옥수동'),(004,012,'성수1가1동'),(004,013,'성수1가2동'),(004,014,'성수2가1동'),(004,015,'성수2가3동'),(004,016,'송정동'),(004,017,'용답동'),

(005,001,'중곡1동'),(005,002,'중곡2동'),(005,003,'중곡3동'),(005,004,'중곡4동'),(005,005,'능동'),(005,006,'구의1동'),(005,007,'구의2동'),(005,008,'구의3동'),(005,009,'광장동'),(005,010,'자양1동'),(005,011,'자양2동'),(005,012,'자양3동'),(005,013,'자양4동'),(005,014,'화양동'),(005,015,'군자동'),

(006,001,'용신동'),(006,002,'제기동'),(006,003,'전농1동'),(006,004,'전농2동'),(006,005,'답십리1동'),(006,006,'답십리2동'),(006,007,'장안1동'),(006,008,'장안2동'),(006,009,'청량리동'),(006,010,'회기동'),(006,011,'휘경1동'),(006,012,'휘경2동'),(006,013,'이문1동'),(006,014,'이문2동'),
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-20 15:27:38
