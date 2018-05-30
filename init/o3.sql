-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
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
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES
(2,1,'종로구'),
(2,2,'중구'),
(2,3,'용산구'),
(2,4,'성동구'),
(2,5,'광진구'),
(2,6,'동대문구'),
(2,7,'중랑구'),
(2,8,'성북구'),
(2,9,'강북구'),
(2,10,'도봉구'),
(2,11,'노원구'),
(2,12,'은평구'),
(2,13,'서대문구'),
(2,14,'마포구'),
(2,15,'양천구'),
(2,16,'강서구'),
(2,17,'구로구'),
(2,18,'금천구'),
(2,19,'영등포구'),
(2,20,'동작구'),
(2,21,'관악구'),
(2,22,'서초구'),
(2,23,'강남구'),
(2,24,'송파구'),
(2,25,'강동구');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_province`
--

DROP TABLE IF EXISTS `city_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_province` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_province`
--

LOCK TABLES `city_province` WRITE;
/*!40000 ALTER TABLE `city_province` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_list`
--

DROP TABLE IF EXISTS `comment_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_list` (
  `owner_auth` varchar(60) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `user_auth` varchar(60) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_list`
--

LOCK TABLES `comment_list` WRITE;
/*!40000 ALTER TABLE `comment_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_list`
--

DROP TABLE IF EXISTS `content_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_list` (
  `owner_auth` varchar(60) NOT NULL,
  `number` int(11) NOT NULL,
  `content` text,
  `date` bigint(20) DEFAULT NULL,
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
('local:andong107',1,'직접 면을 뽑아 만드는 짜장면! 가격은 단돈 5000원이랍니다~',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:andong107',2,'우동: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%9A%B0%EB%8F%99.PNG'),
('local:andong107',3,'짬뽕: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%A7%AC%EB%BD%95.PNG'),
('local:andong107',4,'간짜장 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B0%84%EC%A7%9C%EC%9E%A5.PNG'),
('local:andong107',5,' 볶음밥: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:andong107',6,'군만두 : 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B5%B0%EB%A7%8C%EB%91%90.PNG'),
('local:andong107',7,'삼선짜장: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%82%BC%EC%84%A0%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:andong107',8,'탕수육: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:andong107',9,'깐풍기: 27000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B9%90%ED%92%8D%EA%B8%B0.PNG'),
('local:baek310',1,'짬뽕: 5500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%AC%EB%BD%95.PNG'),
('local:baek310',2,'짜장면: 4500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%9C%EC%9E%A5.PNG'),
('local:baek310',3,'탕수육: 11000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:baek310',4,' 짬뽕밥: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:baek310',5,' 짜장밥: 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%9C%EC%9E%A5%EB%B0%A5.PNG'),
('local:baek310',6,'볶음짬뽕 : 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EB%B3%B6%EC%9D%8C%EC%A7%AC%EB%BD%95.PNG'),
('local:baek310',7,'군만두: 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EA%B5%B0%EB%A7%8C%EB%91%90.PNG'),
('local:baek310',8,'쟁반짜장: 12000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%9F%81%EB%B0%98%EC%A7%9C%EC%A7%B1.PNG'),
('local:baek310',9,'차가면: 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%B0%A8%EA%B0%80%EB%A9%B4.PNG'),
('local:bailey233',1,'알리오올리오: 19000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EC%95%8C%EB%A6%AC%EC%98%A4.PNG'),
('local:bailey233',2,'봉골레 : 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B4%89%EA%B3%A8%EB%A0%88.PNG'),
('local:bailey233',3,'해산물토마토스파게티: 23000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%ED%95%B4%EC%82%B0%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:bailey233',4,' 까르보나라: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EA%B9%8C%EB%A5%B4%EB%B3%B4.PNG'),
('local:bailey233',5,' 바질페스토: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B0%94%EC%A7%88%ED%8E%98%EC%8A%A4%ED%86%A0.PNG'),
('local:bailey233',6,' 버섯크림리조또: 19000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B2%84%EC%84%AF%ED%81%AC%EB%A6%BC%EB%A6%AC%EC%A1%B0.PNG'),
('local:bailey233',7,'소고기 리조또: 21000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:bailey233',8,'해산물토마토리조또: 23000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%B4%EC%82%B0%EB%AC%BC+%ED%86%A0%EB%A7%88%ED%86%A0+%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:bailey233',9,'꽃등심 스테이크: 45000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EA%BD%83%EB%93%B1%EC%8B%AC+%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:best742',1,'수타짜장: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%9C%EC%9E%A5.jpg'),
('local:best742',2,'짬뽕: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%AC%EB%BD%95.jpg'),
('local:best742',3,'우동: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9A%B0%EB%8F%99.jpg'),
('local:best742',4,' 볶음밥: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:best742',5,' 울면: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9A%B8%EB%A9%B4.PNG'),
('local:best742',6,' 잡채밥: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:best742',7,'짜장밥: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%9C%EC%9E%A5%EB%B0%A5.PNG'),
('local:best742',8,'짬뽕밥: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:best742',9,'오향장육: 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%98%A4%ED%96%A5%EC%9E%A5%EC%9C%A1.PNG'),
('local:blackme37',1,'흑미김밥: 2300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%ED%9D%91%EB%AF%B8%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',2,'김치김밥: 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EA%B9%80%EC%B9%98%EA%B9%80%EB%B0%A5.PNG '),
('local:blackme37',3,'치즈김밥: 2800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B9%98%EC%A6%88%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',4,'참치김밥 : 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B0%B8%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',5,'일반라면 : 2800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',6,'치즈라면 : 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B9%98%EC%A6%88%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',7,'김치라면: 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EA%B9%80%EC%B9%98%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',8,'쌀떡라면: 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%96%A1%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',9,'만두라면: 3300원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%A7%8C%EB%91%90%EB%9D%BC%EB%A9%B4.PNG'),
('local:chsun237',1,'돼지갈비: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%8F%BC%EC%A7%80%EA%B0%88%EB%B9%84.PNG'),
('local:chsun237',2,'공기밥: 1000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:chsun237',3,'물냉면: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%AC%BC%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',4,'비빔냉면 : 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',5,' 회냉면: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%ED%9A%8C%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',6,' 물만두: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%AC%BC%EB%A7%8C%EB%91%90.PNG'),
('local:chsun237',7,'막걸리: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%A7%89%EA%B1%B8%EB%A6%AC.PNG'),
('local:chsun237',8,'복분자: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%B3%B5%EB%B6%84%EC%9E%90.PNG'),
('local:chsun237',9,'산사춘: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EC%82%B0%EC%82%AC%EC%B6%98.PNG'),
('local:domino801',1,'치즈케이크롤: 27000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%B9%98%EC%A6%88%EC%BC%80%EC%9D%B4%ED%81%AC%EB%A1%A4.PNG'),
('local:domino801',2,'직화스테이크: 28000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%A7%81%ED%99%94%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:domino801',3,'슈퍼슈프림: 27000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%8A%88%ED%8D%BC%EC%8A%88%ED%94%84%EB%A6%BC.PNG'),
('local:domino801',4,'베이컨체다치즈 : 26000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EB%B2%A0%EC%9D%B4%EC%BB%A8%EC%B2%B4%EB%8B%A4%EC%B9%98%EC%A6%88.PNG'),
('local:domino801',5,'리얼바비큐 : 27000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EB%A6%AC%EC%96%BC%EB%B0%94%EB%B9%84%ED%81%90.PNG'),
('local:domino801',6,'치즈러버 : 26000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%B9%98%EC%A6%88%EB%9F%AC%EB%B2%84.PNG'),
('local:domino801',8,'포테이토: 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%ED%8F%AC%ED%85%8C%EC%9D%B4%ED%86%A0.PNG'),
('local:domino801',9,'갈릭 스모크 치킨: 28000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EA%B0%88%EB%A6%AD%EC%8A%A4%EB%AA%A8%ED%81%AC%EC%B9%98%ED%82%A8.PNG'),
('local:everest148',1,'치킨머커니: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EB%A8%B8%EC%BB%A4%EB%8B%88.PNG'),
('local:everest148',2,'치킨커리: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',3,'치킨 머설라: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EB%A8%B8%EC%84%A4%EB%9D%BC.PNG'),
('local:everest148',4,'스페셜 커리: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%8A%A4%ED%8E%98%EC%85%98%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',5,'머턴커리: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%ED%84%B4%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',6,'머턴 머설라 : 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%ED%84%B4%EB%A8%B8%EC%84%A4%EB%9D%BC.PNG'),
('local:everest148',7,'머라이 코프다: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%EB%9D%BC%EC%9D%B4%EC%BD%94%ED%94%84%EB%8B%A4.PNG'),
('local:everest148',8,'알루 고비: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%95%8C%EB%A3%A8%EA%B3%A0%EB%B9%84.PNG'),
('local:everest148',9,'더히: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%8D%94%ED%9E%88.PNG'),
('local:fire998',1,'통갈매기살: 14000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%ED%86%B5%EA%B0%88%EB%A7%A4%EA%B8%B0%EC%82%B4.PNG'),
('local:fire998',2,'목살: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EB%AA%A9%EC%82%B4.PNG'),
('local:fire998',3,'삼겹살: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%82%BC%EA%B2%B9%EC%82%B4.PNG'),
('local:fire998',4,'통가브리살 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%ED%86%B5%EA%B0%80%EB%B8%8C%EB%A6%AC%EC%82%B4.PNG'),
('local:fire998',5,' 양념돼지갈비 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%96%91%EB%85%90%EB%8F%BC%EC%A7%80%EA%B0%88%EB%B9%84.PNG'),
('local:fire998',6,'아삭냉면 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%95%84%EC%82%AD%EB%83%89%EB%A9%B4.PNG'),
('local:fire998',7,'계란찜: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EA%B3%84%EB%9E%80%EC%B0%9C.PNG'),
('local:fire998',8,'전투라면: 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EB%9D%BC%EB%A9%B4.PNG'),
('local:fire998',9,'김치찌개: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EA%B9%80%EC%B9%98%EC%B0%8C%EA%B0%9C.PNG'),
('local:garden352',1,'해물토마토 파스타: 19000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%B4%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:garden352',2,'아라비아따: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EC%95%84%EB%9D%BC%EB%B9%84%EC%95%84%EB%94%B0.PNG'),
('local:garden352',3,'해물 크림파스타: 18000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%B4%EB%AC%BC%ED%81%AC%EB%A6%BC.PNG'),
('local:garden352',4,'버섯 크림파스타 : 18000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%B2%84%EC%84%AF%ED%81%AC%EB%A6%BC.PNG'),
('local:garden352',5,'봉골레 오일파스타 : 18000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%B4%89%EA%B3%A8%EB%A0%88%EC%98%A4%EC%9D%BC.PNG'),
('local:garden352',6,'고르곤졸라 피자 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EA%B3%A0%EB%A5%B4%EA%B3%A4.PNG'),
('local:garden352',7,'한우 꽃등심 스테이크: 65000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%9C%EC%9A%B0%EA%BD%83%EB%93%B1%EC%8B%AC.PNG'),
('local:garden352',8,'채끝스테이크: 29900원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EC%B1%84%EB%81%9D.PNG'),
('local:garden352',9,'리코타치즈 샐러드: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%A6%AC%EC%BD%94%ED%83%80.PNG'),
('local:goldK256',1,'함박스테이크: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:goldK256',2,'안심돈까스: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%95%88%EC%8B%AC%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',3,'금왕정식: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EA%B8%88%EC%99%95%EC%A0%95%EC%8B%9D.PNG'),
('local:goldK256',4,'생선까스: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%83%9D%EC%84%A0%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',5,'등심돈까스: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EB%93%B1%EC%8B%AC%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',6,'공기밥: 1000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:goldK256',7,'맥주: 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EB%A7%A5%EC%A3%BC.PNG'),
('local:goldK256',8,'음료: 1000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%9D%8C%EB%A3%8C.PNG'),
('local:gosun147',1,'원조김밥: 1500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%9B%90%EC%A1%B0%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',2,'참치김밥: 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B0%B8%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',3,'치즈김밥: 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B9%98%EC%A6%88%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',4,'김치김밥 : 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EA%B9%80%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',5,' 제육김밥: 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%A0%9C%EC%9C%A1%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',6,' 쌀떡볶이: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%8C%80%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:gosun147',7,'찹쌀순대: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B0%B9%EC%8C%80%EC%88%9C%EB%8C%80.PNG'),
('local:gosun147',8,'부산어묵: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EB%B6%80%EC%82%B0%EC%96%B4%EB%AC%B5.PNG'),
('local:gosun147',9,'라면: 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EB%9D%BC%EB%A9%B4.PNG'),
('local:gwangju773',1,'청국장: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EC%B2%AD%EA%B5%AD%EC%9E%A5.PNG'),
('local:gwangju773',2,'된장찌개: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EB%90%9C%EC%9E%A5.PNG'),
('local:gwangju773',3,'김치찌개: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EA%B9%80%EC%B9%98.PNG'),
('local:gwangju773',4,'순두부찌개 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%88%9C%EB%91%90%EB%B6%80.PNG'),
('local:gwangju773',5,'통태찌개 : 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EB%8F%99%ED%83%9C.PNG'),
('local:gwangju773',6,'조기찌개 : 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%A1%B0%EA%B8%B0%EC%B0%8C%EA%B0%9C.PNG'),
('local:gwangju773',7,'갈치조림: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EA%B0%88%EC%B9%98%EC%A1%B0%EB%A6%BC.PNG'),
('local:gwangju773',8,'제육볶음: 11000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EC%A0%9C%EC%9C%A1.PNG'),
('local:gwangju773',9,'오징어볶음: 11000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%98%A4%EC%A7%95%EC%96%B4.PNG'),
('local:hong192',1,'왕돈까스: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EC%99%95%EB%8F%88.PNG'),
('local:hong192',2,'돈까스정식: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EB%8F%88%EA%B9%8C%EC%8A%A4%EC%A0%95%EC%8B%9D.PNG'),
('local:hong192',3,'생선까스: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EC%83%9D%EC%84%A0.PNG'),
('local:hong192',4,' 고구마치즈롤까스: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EA%B3%A0%EA%B5%AC%EB%A7%88%EC%B9%98%EC%A6%88.PNG'),
('local:hong192',5,' 해물볶음우동: 9200원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C.PNG'),
('local:hong192',6,' 가쓰오우동: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EA%B0%80%EC%93%B0%EC%98%A4.PNG'),
('local:hong192',7,'샐러드파스타: 9900원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EC%83%90%EB%9F%AC%EB%93%9C%ED%8C%8C%EC%8A%A4%ED%83%80.PNG'),
('local:hong192',8,'베이컨볶음우동: 9200원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EB%B2%A0%EC%9D%B4%EC%BB%A8.PNG'),
('local:hong192',9,'돈까스필라프: 11000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EB%8F%88%EA%B9%8C%EC%8A%A4%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:italy331',1,'연어스테이크: 29800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%97%B0%EC%96%B4%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:italy331',2,'안심스테이크: 29800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94+%EC%95%88%EC%8B%AC%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:italy331',3,'닭고기스테이크: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EB%8B%AD%EA%B3%A0%EA%B8%B0.PNG'),
('local:italy331',4,' 연어샐러드: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%97%B0%EC%96%B4%EC%83%90%EB%9F%AC%EB%93%9C.PNG'),
('local:italy331',5,'치킨샐러드 : 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%B9%98%ED%82%A8%EC%83%90%EB%9F%AC%EB%93%9C.PNG'),
('local:italy331',6,' 칠리치킨피자: 24000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%B9%A0%EB%A6%AC%EC%B9%98%ED%82%A8.PNG'),
('local:italy331',7,'까르보나라: 14800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EA%B9%8C%EB%A5%B4%EB%B3%B4.PNG'),
('local:italy331',8,'해산물토마토스파게티: 16800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%ED%95%B4%EC%82%B0%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:italy331',9,'새우로제크림스파게티: 15800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94+%EC%83%88%EC%9A%B0%EB%A1%9C%EC%A0%9C.PNG'),
('local:jangsu489',1,'감자탕: 29000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',2,'등뼈찜: 33000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%93%B1%EB%BC%88%EC%B0%9C.PNG'),
('local:jangsu489',3,'한방감자탕: 33000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%ED%95%9C%EB%B0%A9%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',4,' 부대감자탕: 33000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%B6%80%EB%8C%80%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',5,' 뼈해장국: 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%BC%88%ED%95%B4%EC%9E%A5%EA%B5%AD.PNG'),
('local:jangsu489',6,'등뼈한방탕 : 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%93%B1%EB%BC%88%ED%95%9C%EB%B0%A9%ED%83%95.PNG'),
('local:jangsu489',7,'탑등뼈찜: 28000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%ED%83%91%EB%93%B1%EB%BC%88%EC%B0%9C.PNG'),
('local:jangsu489',8,'볶음밥: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:jangsu489',9,'공기밥: 1000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:jesun85',1,'오제볶음: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C%EC%98%A4%EC%A0%9C%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',2,'쭈삼볶음: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%AD%88%EC%82%BC%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',3,'직화간장돼지불고기: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EA%B0%84%EC%9E%A5%EB%8F%BC%EC%A7%80%EB%B6%88%EA%B3%A0%EA%B8%B0.PNG'),
('local:jesun85',4,' 찍화쭈꾸미볶음: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%AD%88%EA%BE%B8%EB%AF%B8%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',5,'차돌된장찌개: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%B0%A8%EB%8F%8C%EB%90%9C%EC%9E%A5%EC%B0%8C%EA%B0%9C.PNG'),
('local:jesun85',6,'간장오불: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EA%B0%84%EC%9E%A5%EC%98%A4%EB%B6%88.PNG'),
('local:jesun85',7,'직화제육볶음: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',8,'직화오징어볶음: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%98%A4%EC%A7%95%EC%96%B4%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',9,' 순두부찌개: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%88%9C%EB%91%90%EB%B6%80%EC%B0%8C%EA%B0%9C.PNG'),
('local:jesun85',10,' 통돼지김치찜: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%ED%86%B5%EB%8F%BC%EC%A7%80%EA%B9%80%EC%B9%98%EC%B0%9C.PNG'),
('local:kan316',1,'양장피: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%96%91%EC%9E%A5%ED%94%BC.PNG'),
('local:kan316',2,'사천탕수육: 23000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%82%AC%EC%B2%9C%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:kan316',3,'볶음 짜장: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EB%B3%B6%EC%9D%8C%EC%A7%9C%EC%9E%A5.PNG'),
('local:kan316',4,'우동 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%9A%B0%EB%8F%99.PNG'),
('local:kan316',5,'짜장 : 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%9C%EC%9E%A5.PNG'),
('local:kan316',6,'짬뽕밥 : 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:kan316',7,'날치알 볶음밥: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EB%82%A0%EC%B9%98%EC%95%8C%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:kan316',8,'해물누룽지탕: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%ED%95%B4%EB%AC%BC%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.PNG'),
('local:kan316',9,'얼큰 짬뽕 : 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%AC%EB%BD%95.PNG'),
('local:ktw118',1,'오늘초밥(10개): 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%98%A4%EB%8A%98%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',2,'연어초밥: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%97%B0%EC%96%B4%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',3,'참치초밥: 15000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%B0%B8%EC%B9%98%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',4,' 광어초밥: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EA%B4%91%EC%96%B4%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',5,'왕새우초밥: 15000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%99%95%EC%83%88%EC%9A%B0%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',6,'참치불초밥: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%B0%B8%EC%B9%98%EB%B6%88%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',7,'눈다랑어초밥: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EB%88%88%EB%8B%A4%EB%9E%91%EC%96%B4%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',8,'꽃등심초밥: 15000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EA%BD%83%EB%93%B1%EC%8B%AC%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',9,' 캘리포니아롤: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%BC%88%EB%A6%AC%ED%8F%AC%EB%8B%88%EC%95%84%EB%A1%A4.PNG'),
('local:ktw118',10,' 연어롤: 17000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%97%B0%EC%96%B4%EB%A1%A4.PNG'),
('local:may501',1,'메이탄짜장: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:may501',2,'해물우동: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%ED%95%B4%EB%AC%BC%EC%9A%B0%EB%8F%99.PNG'),
('local:may501',3,'해물 볶음짜장: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C%EC%A7%9C%EC%9E%A5.PNG'),
('local:may501',4,' 메이탄짬뽕: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%AC%EB%BD%95.PNG'),
('local:may501',5,' 게살새우볶음밥: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B2%8C%EC%82%B4%EC%83%88%EC%9A%B0.PNG'),
('local:may501',6,' 고추잡채밥: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%A0%EC%B6%94%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:may501',7,'짬뽕밥 : 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:may501',8,'잡탕밥: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%9E%A1%ED%83%95%EB%B0%A5.PNG'),
('local:may501',9,'울면: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%9A%B8%EB%A9%B4.PNG'),
('local:mok330',1,'회냉면: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%ED%9A%8C%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',2,'물냉면: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%AC%BC%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',3,'비빔냉면: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',4,'사골만둣국: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%82%AC%EA%B3%A8%EB%A7%8C%EB%91%90%EA%B5%AD.PNG'),
('local:mok330',5,'떡만두국: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%96%A1%EB%A7%8C%EB%91%90%EA%B5%AD.PNG'),
('local:mok330',6,'갈비찜: 45000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EA%B0%88%EB%B9%84%EC%B0%9C.PNG'),
('local:mok330',7,'오색만두: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%98%A4%EC%83%89%EB%A7%8C%EB%91%90.PNG'),
('local:mok330',8,'사리추가: 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%82%AC%EB%A6%AC%EC%B6%94%EA%B0%80.PNG'),
('local:mok330',9,'모듬전: 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%AA%A8%EB%93%AC%EC%A0%84.PNG'),
('local:myeon1013',1,'물냉면: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%AC%BC%EB%83%89%EB%A9%B4.png'),
('local:myeon1013',2,'비빔냉면: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.jpg'),
('local:myeon1013',3,'회냉면: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%9A%8C%EB%83%89%EB%A9%B4.png'),
('local:myeon1013',4,'온면 : 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EC%98%A8%EB%A9%B4.jpg'),
('local:myeon1013',5,'평양만두 : 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%8F%89%EC%96%91%EB%A7%8C%EB%91%90.jpg'),
('local:myeon1013',6,'만둣국 : 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%A7%8C%EB%91%A3%EA%B5%AD.jpg'),
('local:myeon1013',7,'녹두지짐: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%85%B9%EB%91%90%EC%A7%80%EC%A7%90.png'),
('local:myeon1013',8,'돼지수육: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%8F%BC%EC%A7%80%EC%88%98%EC%9C%A1.jpg'),
('local:myeon1013',9,'홍어회: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%99%8D%EC%96%B4%ED%9A%8C.jpg'),
('local:north114',1,'생갈비: 47000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%83%9D%EA%B0%88%EB%B9%84.PNG'),
('local:north114',2,'북악정이동갈비: 31000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%9D%B4%EB%8F%99%EA%B0%88%EB%B9%84.PNG'),
('local:north114',3,'한우 꽃등심: 47000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%BD%83%EB%93%B1%EC%8B%AC.PNG'),
('local:north114',4,'북악정궁중갈비 : 39000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%B6%81%EC%A4%91%EA%B0%88%EB%B9%84.PNG'),
('local:north114',5,'한우살치살 : 60000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%82%B4%EC%B9%98%EC%82%B4.PNG'),
('local:north114',6,' 한우주물럭: 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%9C%EC%9A%B0%EC%A3%BC%EB%AC%BC%EB%9F%AD.PNG'),
('local:north114',7,'한우갈비살: 40000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%B0%88%EB%B9%97%EC%82%B4.PNG'),
('local:north114',8,'한우육회: 32000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%9C%A1%ED%9A%8C.PNG'),
('local:north114',9,'식사냉면: 9000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EB%83%89%EB%A9%B4.PNG'),
('local:one243',1,'짜장면: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%A7%9C%EC%9E%A5%EB%A9%B4.jpg'),
('local:one243',2,'간짜장: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EA%B0%84%EC%A7%9C%EC%9E%A5.jpg'),
('local:one243',3,'짬뽕: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%A7%AC%EB%BD%95.jpg'),
('local:one243',4,'우동 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%9A%B0%EB%8F%99.jpg'),
('local:one243',5,'볶음밥 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:one243',6,' 오므라이스: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%98%A4%EB%AF%80%EB%9D%BC%EC%9D%B4%EC%8A%A4.PNG'),
('local:one243',7,'잡탕밥: 12000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%9E%A1%ED%83%95%EB%B0%A5.PNG'),
('local:one243',8,'군만두: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EA%B5%B0%EB%A7%8C%EB%91%90.jpg'),
('local:one243',9,'물만두: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EB%AC%BC%EB%A7%8C%EB%91%90.PNG'),
('local:oneday972',1,'직화제육덮밥: 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',2,'메밀(소바): 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%A9%94%EB%B0%80%EC%86%8C%EB%B0%94.jpg'),
('local:oneday972',3,'직화오징어덮밥: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%A7%81%ED%99%94%EC%98%A4%EC%A7%95%EC%96%B4%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',4,' 수제돈까스: 6500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%8F%88%EA%B0%80%EC%8A%A4.jpg'),
('local:oneday972',5,'하루우동 : 7500원',NULL,' https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%9A%B0%EB%8F%99.jpg'),
('local:oneday972',6,'해물볶음우동 : 7500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C%EC%9A%B0%EB%8F%99.jpg'),
('local:oneday972',7,'날치알덮밥: 7500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%82%A0%EC%B9%98%EC%95%8C%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',8,'회덮밥: 7500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%ED%9A%8C%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',9,'라면: 3500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%9D%BC%EB%A9%B4.jpg'),
('local:park451',1,'수제돈가스 : 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%8F%88%EA%B0%80%EC%8A%A4.PNG'),
('local:park451',2,'새우볶음밥: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%83%88%EC%9A%B0%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:park451',3,'낚지볶음 : 18000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%82%9A%EC%A7%80%EB%B3%B5%EC%9D%8C.PNG'),
('local:park451',4,'함박스테이크 : 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%ED%95%A8%EB%B0%95.PNG'),
('local:park451',5,'치즈오므라이스 : 7500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%B9%98%EC%A6%88%EC%98%A4%EB%AF%80.PNG'),
('local:park451',6,'메밀국수 : 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%A9%94%EB%B0%80%EA%B5%AD%EC%88%98.PNG'),
('local:park451',7,'수제생선가스: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%83%9D%EC%84%A0%EA%B0%80%EC%8A%A4.PNG'),
('local:park451',8,'회덮밥: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%ED%9A%8C%EB%8D%AE%EB%B0%A5.PNG'),
('local:park451',9,'우동: 6000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%9A%B0%EB%8F%99.PNG'),
('local:pot341',1,'새우오일파스타: 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%B2%84%EC%84%AF%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:pot341',2,'호두까르보나라: 23000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EA%B0%80%EB%A5%B4%EB%B3%B4%EB%82%98%EB%9D%BC.PNG'),
('local:pot341',3,'로제파스타: 23000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%A1%9C%EC%A0%9C%ED%8C%8C%EC%8A%A4%ED%83%80.PNG'),
('local:pot341',4,' 양갈비 스테이크: 55000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EC%96%91%EA%B0%88%EB%B9%84%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',5,'안심 스테이크 : 68000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EC%95%88%EC%8B%AC%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',6,'한우스테이크 : 85000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%ED%95%9C%EC%9A%B0%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',7,'고르곤졸라피자: 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC.PNG'),
('local:pot341',8,'버섯 리조또 : 33000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%B2%84%EC%84%AF%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:pot341',9,'해산물리조또 : 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%ED%95%B4%EC%82%B0%EB%AC%BC%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:rabbit132',1,'크림카레우동: 11000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%ED%81%AC%EB%A6%BC%EC%B9%B4%EB%9E%98%EC%9A%B0%EB%8F%99.PNG'),
('local:rabbit132',2,'함박스테끼밥: 12600원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%ED%82%A4%EB%B0%A5.PNG'),
('local:rabbit132',3,'잔칫상: 18000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95+%EC%9E%94%EC%B9%AB%EC%83%81.PNG'),
('local:rabbit132',4,'카레나베: 11500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%B9%B4%EB%A0%88%EB%82%98%EB%B2%A0.PNG'),
('local:rabbit132',5,'숯불구이 반판 : 13200원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%88%AF%EB%B6%88%EA%B5%AC%EC%9D%B4.PNG'),
('local:rabbit132',6,'일본식 소고기 찌개 : 13800원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%9D%BC%EB%B3%B8%EC%8B%9D%EC%86%8C%EA%B3%A0%EA%B8%B0.PNG'),
('local:rabbit132',7,'돈까스 카레우동: 10500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EB%8F%88%EA%B9%8C%EC%8A%A4%EC%B9%B4%EB%A0%88%EC%9A%B0%EB%8F%99.PNG'),
('local:rabbit132',8,'양념닭튀김: 5500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%96%91%EB%85%90%EB%8B%AD%ED%8A%80%EA%B9%80.PNG'),
('local:rabbit132',9,'오무카레밥: 9500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%98%A4%EB%AC%B4%EC%B9%B4%EB%A0%88%EB%B0%A5.PNG'),
('local:sa258',1,'후라이드치킨: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%ED%9B%84%EB%9D%BC%EC%9D%B4%EB%93%9C.PNG'),
('local:sa258',2,'골뱅이국수: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%A8%EB%B1%85%EC%9D%B4.PNG'),
('local:sa258',3,'생굴: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EC%83%9D%EA%B5%B4.PNG'),
('local:sa258',4,'닭도리탕 : 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EB%8B%AD%EB%8F%8C%ED%83%95.PNG'),
('local:sa258',5,' 오뎅탕: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EC%98%A4%EB%8E%85%ED%83%95.PNG'),
('local:sa258',6,'뼈없는 닭발 : 15000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EB%8B%AD%EB%B0%9C.PNG'),
('local:sa258',7,'구룡포과메기: 30000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%BC%EB%A9%94%EA%B8%B0.PNG'),
('local:sa258',8,'꽁치김치찌개: 20000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%BD%81%EC%B9%98%EA%B9%80%EC%B9%98.PNG'),
('local:sa258',9,'황도: 7000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%A9%EB%8F%84.PNG'),
('local:sam102',1,'수제비: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%88%98%EC%A0%9C%EB%B9%84.PNG'),
('local:sam102',2,'파전: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8C%8C%EC%A0%84.PNG'),
('local:sam102',3,'감자전: 8000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B0%90%EC%9E%90%EC%A0%84.PNG'),
('local:sam102',4,'해물파전 : 14000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%ED%95%B4%EB%AC%BC%ED%8C%8C%EC%A0%84.PNG'),
('local:sam102',5,'녹두전 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%85%B9%EB%91%90%EC%A0%84.PNG'),
('local:sam102',6,' 쭈꾸미: 16000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%AD%88%EA%BE%B8%EB%AF%B8.PNG'),
('local:sam102',7,'동동주: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%8F%99%EB%8F%99%EC%A3%BC.PNG'),
('local:sam102',8,'소주: 3500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%86%8C%EC%A3%BC.PNG'),
('local:sam102',9,'맥주: 4000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%A7%A5%EC%A3%BC.PNG'),
('local:sea133',1,'돌멍게:25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%8F%8C%EB%A9%8D%EA%B2%8C.PNG'),
('local:sea133',2,'돌멍게 대자: 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%8F%8C%EB%A9%8D%EA%B2%8C2.PNG'),
('local:sea133',3,'생선통구이1: 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%83%9D%EC%84%A0%ED%86%B5%EA%B5%AC%EC%9D%B4.PNG'),
('local:sea133',4,' 생선통구이2: 35000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%83%9D%EC%84%A0%ED%86%B5%EA%B5%AC%EC%9D%B42.PNG'),
('local:sea133',5,' 문어숙회 중: 2500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%AC%B8%EC%96%B4%EC%88%99%ED%9A%8C.PNG'),
('local:sea133',6,' 문어숙회 대: 30000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%AC%B8%EC%96%B4%EC%88%99%ED%9A%8C2.PNG'),
('local:sea133',7,'석화 중: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%84%9D%ED%99%94.PNG'),
('local:sea133',8,'석화 대: 25000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%84%9D%ED%99%942.PNG'),
('local:suyeon248',1,'대추차: 11500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8C%80%EC%B6%94%EC%B0%A8.PNG'),
('local:suyeon248',2,'생강차: 10500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EC%83%9D%EA%B0%95%EC%B0%A8.PNG'),
('local:suyeon248',3,'단호박빙수(2인분): 21500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8B%A8%ED%98%B8%EB%B0%952%EC%9D%B8.PNG'),
('local:suyeon248',4,'엄마손 순 단호박 범벅: 12500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8B%A8%ED%98%B8%EB%B0%95%EB%B2%94%EB%B2%85.PNG'),
('local:suyeon248',5,'단호박빙수(1인분): 11500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9.PNG'),
('local:table338',1,'새우필라프: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%83%88%EC%9A%B0%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:table338',2,'비프필라프: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%B9%84%EC%96%B4%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:table338',3,'날치알크림파스타: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%82%A0%EC%B9%98%EC%95%8C%ED%81%AC%EB%A6%BC.PNG'),
('local:table338',4,'해산물크림파스타 : 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%ED%95%B4%EC%82%B0%EB%AC%BC%EB%B0%94%EC%A7%88.PNG'),
('local:table338',5,' 에그베네딕트: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%97%90%EA%B7%B8%EB%B2%A0%EB%84%A4%EB%94%95%ED%8A%B8.PNG'),
('local:table338',6,' 스크렘블에그소세지: 10000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%8A%A4%ED%81%AC%EB%A0%98%EB%B8%94%EC%97%90%EA%B7%B8.PNG'),
('local:table338',7,'고르곤졸라크림파스타: 13000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC%ED%81%AC%EB%A6%BC.PNG'),
('local:table338',8,'자몽에이드: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%9E%90%EB%AA%BD%EC%97%90%EC%9D%B4%EB%93%9C.PNG'),
('local:table338',9,'레몬에이드: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%A0%88%EB%AA%AC%EC%97%90%EC%9D%B4%EB%93%9C.PNG'),
('local:wonbin423',1,'김치볶음밥: 4900원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B9%80%EC%B9%98%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:wonbin423',2,'치즈떡볶이: 6100원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%B9%98%EC%A6%88%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:wonbin423',3,'고르곤졸라: 15500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC.PNG'),
('local:wonbin423',4,' 수제돈까스: 5000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:wonbin423',5,'마르게리따 : 13700원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EB%A7%88%EB%A5%B4%EA%B2%8C%EB%A6%AC%EB%94%B0.PNG'),
('local:wonbin423',6,' 김밥: 3500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B9%80%EB%B0%A5.PNG'),
('local:wonbin423',7,'웰치스: 1500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%9B%B0%EC%B9%98%EC%8A%A4.PNG'),
('local:wonbin423',8,'사이다: 1500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%82%AC%EC%9D%B4%EB%8B%A4.PNG'),
('local:wonbin423',9,'콜라: 1500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%BD%9C%EB%9D%BC.PNG'),
('local:yeak103',1,'떡볶이: 3500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:yeak103',2,'순대: 3500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%88%9C%EB%8C%80.PNG'),
('local:yeak103',3,'삶은 계란: 500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%82%B6%EC%9D%80+%EA%B3%84%EB%9E%80.PNG'),
('local:yeak103',4,'오뎅: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%98%A4%EB%8E%85.PNG'),
('local:yeak103',5,' 콘샐러드: 1000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%BD%98%EC%83%90%EB%9F%AC%EB%93%9C.PNG'),
('local:yeak103',6,' 콜라: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%BD%9C%EB%9D%BC.PNG'),
('local:yeak103',7,'사이다: 2000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EC%82%AC%EC%9D%B4%EB%8B%A4.PNG'),
('local:yeak103',8,'튀김: 500~700원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%ED%8A%80%EA%B9%80.PNG'),
('local:yeak103',9,'고기만두: 700원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EA%B3%A0%EA%B8%B0%EB%A7%8C%EB%91%90.PNG'),
('local:young185',1,'차돌떡볶이: 17500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B0%A8%EB%8F%8C.PNG'),
('local:young185',2,'통큰오짱떡볶이: 17500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%98%A4%EC%A7%B1.PNG'),
('local:young185',3,'깻잎순대떡볶이: 16500원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EA%B9%BB%EC%9E%8E.PNG'),
('local:young185',4,' 치믈렛떡볶이: 15000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B9%98%EB%AF%88.PNG'),
('local:young185',5,' 빨간크림떡볶이: 14000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%B9%A8%EA%B0%84%ED%81%AC%EB%A6%BC.PNG'),
('local:young185',6,' 날치알볶음밥: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%82%A0%EC%B9%98%EC%95%8C.PNG'),
('local:young185',7,'레몬에이드: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%A0%88%EB%AA%AC.PNG'),
('local:young185',8,'자몽에이드: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%9E%90%EB%AA%BD.PNG'),
('local:young185',9,'청포도에이드: 3000원',NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B2%AD%ED%8F%AC%EB%8F%84.PNG');
/*!40000 ALTER TABLE `content_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `owner_auth` varchar(60) NOT NULL,
  `user_auth` varchar(60) NOT NULL,
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
INSERT INTO `follow` VALUES
('local:everest148','local:1155'),
('local:goldK256','local:1155'),
('local:italy331','local:1155'),
('local:mok330','local:1155'),
('local:suyeon248','local:1155'),
('local:table338','local:1155'),
('local:wook','local:1155'),
('local:andong107','local:2ub'),
('local:blackme37','local:2ub'),
('local:chsun237','local:2ub'),
('local:fire998','local:2ub'),
('local:goldK256','local:2ub'),
('local:gosun147','local:2ub'),
('local:suyeon248','local:2ub'),
('local:andong107','local:A153'),
('local:bailey233','local:A153'),
('local:blackme37','local:A153'),
('local:fire998','local:A153'),
('local:may501','local:A153'),
('local:myeon1013','local:A153'),
('local:andong107','local:chanyeol'),
('local:baek310','local:chanyeol'),
('local:bailey233','local:chanyeol'),
('local:best742','local:chanyeol'),
('local:fire998','local:chanyeol'),
('local:garden352','local:chanyeol'),
('local:suyeon248','local:chanyeol'),
('local:table338','local:chanyeol'),
('local:wonbin423','local:chanyeol'),
('local:yeak103','local:chanyeol'),
('local:young185','local:chanyeol'),
('local:rabbit132','local:chen0921'),
('local:sam102','local:chen0921'),
('local:suyeon248','local:chen0921'),
('local:table338','local:chen0921'),
('local:wonbin423','local:chen0921'),
('local:yeak103','local:chen0921'),
('local:young185','local:chen0921'),
('local:bailey233','local:dy1202'),
('local:garden352','local:dy1202'),
('local:gwangju773','local:dy1202'),
('local:ktw118','local:dy1202'),
('local:may501','local:dy1202'),
('local:north114','local:dy1202'),
('local:pot341','local:dy1202'),
('local:rabbit132','local:dy1202'),
('local:table338','local:dy1202'),
('local:young185','local:dy1202'),
('local:wook','local:emmaoh26'),
('local:baek310','local:god1031'),
('local:bailey233','local:god1031'),
('local:best742','local:god1031'),
('local:everest148','local:god1031'),
('local:garden352','local:god1031'),
('local:may501','local:god1031'),
('local:north114','local:god1031'),
('local:park451','local:god1031'),
('local:pot341','local:god1031'),
('local:rabbit132','local:god1031'),
('local:sa258','local:god1031'),
('local:sam102','local:god1031'),
('local:wonbin423','local:god1031'),
('local:baek310','local:gogo90'),
('local:everest148','local:gogo90'),
('local:fire998','local:gogo90'),
('local:garden352','local:gogo90'),
('local:goldK256','local:gogo90'),
('local:garden352','local:ha0610'),
('local:goldK256','local:ha0610'),
('local:hong192','local:hansung'),
('local:italy331','local:hansung'),
('local:myeon1013','local:hansung'),
('local:one243','local:hansung'),
('local:table338','local:hansung'),
('local:young185','local:hansung'),
('local:domino801','local:hoon0222'),
('local:gwangju773','local:hoon0222'),
('local:hong192','local:hoon0222'),
('local:italy331','local:hoon0222'),
('local:myeon1013','local:hoon0222'),
('local:one243','local:hoon0222'),
('local:oneday972','local:hoon0222'),
('local:table338','local:hoon0222'),
('local:young185','local:hoon0222'),
('local:wook','local:hscthsh3306'),
('local:bailey233','local:hyk'),
('local:ktw118','local:hyk'),
('local:rabbit132','local:hyk'),
('local:young185','local:hyk'),
('local:wook','local:jhkdie'),
('local:baek310','local:jin96'),
('local:bailey233','local:jin96'),
('local:may501','local:jin96'),
('local:mok330','local:jin96'),
('local:north114','local:jin96'),
('local:one243','local:jin96'),
('local:pot341','local:jin96'),
('local:wonbin423','local:jin96'),
('local:yeak103','local:jin96'),
('local:domino801','local:jw0628'),
('local:wook','local:jwkasa'),
('local:andong107','local:korea1'),
('local:baek310','local:korea1'),
('local:garden352','local:korea1'),
('local:hong192','local:korea1'),
('local:mok330','local:korea1'),
('local:myeon1013','local:korea1'),
('local:sa258','local:korea1'),
('local:sam102','local:korea1'),
('local:sea133','local:korea1'),
('local:suyeon248','local:korea1'),
('local:table338','local:korea1'),
('local:wonbin423','local:korea1'),
('local:yeak103','local:korea1'),
('local:young185','local:korea1'),
('local:andong107','local:ksj828'),
('local:blackme37','local:ksj828'),
('local:chsun237','local:ksj828'),
('local:fire998','local:ksj828'),
('local:goldK256','local:ksj828'),
('local:gwangju773','local:ksj828'),
('local:kan316','local:ksj828'),
('local:ktw118','local:ksj828'),
('local:mok330','local:ksj828'),
('local:sea133','local:ksj828'),
('local:suyeon248','local:ksj828'),
('local:yeak103','local:ksj828'),
('local:wook','local:ldhfall'),
('local:andong107','local:moomin'),
('local:baek310','local:moomin'),
('local:bailey233','local:moomin'),
('local:best742','local:moomin'),
('local:blackme37','local:moomin'),
('local:chsun237','local:moomin'),
('local:domino801','local:moomin'),
('local:everest148','local:moomin'),
('local:fire998','local:moomin'),
('local:garden352','local:moomin'),
('local:goldK256','local:moomin'),
('local:gosun147','local:moomin'),
('local:gwangju773','local:moomin'),
('local:hong192','local:moomin'),
('local:italy331','local:moomin'),
('local:jangsu489','local:moomin'),
('local:jesun85','local:moomin'),
('local:kan316','local:moomin'),
('local:ktw118','local:moomin'),
('local:may501','local:moomin'),
('local:myeon1013','local:moomin'),
('local:north114','local:moomin'),
('local:one243','local:moomin'),
('local:oneday972','local:moomin'),
('local:pot341','local:moomin'),
('local:rabbit132','local:moomin'),
('local:sa258','local:moomin'),
('local:sam102','local:moomin'),
('local:sea133','local:moomin'),
('local:suyeon248','local:moomin'),
('local:table338','local:moomin'),
('local:wonbin423','local:moomin'),
('local:wook','local:moomin'),
('local:yeak103','local:moomin'),
('local:young185','local:moomin'),
('local:wook','local:nsj888'),
('local:andong107','local:sehun'),
('local:bailey233','local:sehun'),
('local:blackme37','local:sehun'),
('local:domino801','local:sehun'),
('local:fire998','local:sehun'),
('local:goldK256','local:sehun'),
('local:gosun147','local:sehun'),
('local:hong192','local:sehun'),
('local:italy331','local:sehun'),
('local:jangsu489','local:sehun'),
('local:north114','local:sehun'),
('local:one243','local:sehun'),
('local:oneday972','local:sehun'),
('local:andong107','local:skeleton'),
('local:baek310','local:skeleton'),
('local:bailey233','local:skeleton'),
('local:best742','local:skeleton'),
('local:domino801','local:skeleton'),
('local:everest148','local:skeleton'),
('local:garden352','local:skeleton'),
('local:goldK256','local:skeleton'),
('local:gosun147','local:skeleton'),
('local:ktw118','local:skeleton'),
('local:may501','local:skeleton'),
('local:myeon1013','local:skeleton'),
('local:pot341','local:skeleton'),
('local:rabbit132','local:skeleton'),
('local:suyeon248','local:skeleton'),
('local:wonbin423','local:skeleton'),
('local:yeak103','local:skeleton'),
('local:young185','local:skeleton'),
('local:baek310','local:suho1'),
('local:andong107','local:twice501'),
('local:baek310','local:twice501'),
('local:bailey233','local:twice501'),
('local:best742','local:twice501'),
('local:blackme37','local:twice501'),
('local:gwangju773','local:twice501'),
('local:hong192','local:twice501'),
('local:italy331','local:twice501'),
('local:jangsu489','local:twice501'),
('local:myeon1013','local:twice501'),
('local:north114','local:twice501'),
('local:oneday972','local:twice501'),
('local:sea133','local:twice501'),
('local:suyeon248','local:twice501'),
('local:table338','local:twice501'),
('local:wook','local:ujjang93'),
('local:andong107','local:xiumin'),
('local:baek310','local:xiumin'),
('local:best742','local:xiumin'),
('local:hong192','local:xiumin'),
('local:kan316','local:xiumin'),
('local:wonbin423','local:xiumin'),
('local:yeak103','local:xiumin'),
('local:young185','local:xiumin'),
('local:andong107','local:yj0309'),
('local:bailey233','local:yj0309'),
('local:chsun237','local:yj0309');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `owner_auth` varchar(60) NOT NULL,
  `owner_id` varchar(50) DEFAULT NULL,
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
INSERT INTO `owner` VALUES
('local:andong107','andong107','FSDFcf7+Hs7KuNBa9MYnpoStqZkuYNFx5+1m0RIrlwGl4WGt0/D7mp2gOnm+VgsV538vlZ1glF1WcbJoVzXlDv0Lv01c2J98YC1rniiKNLCGa0CtuFLRml+XLOJlps3yQF3+UU5eubKImhLU5OxDXH9wzrIPC/lJHRYUfC98Rq0=','fxXXccyuG3HQDO3tHVatcRR5z7WfWA0CLDm+QBqCCfKCj5D0X+Bkifa5dZL0MwIfqcYQKBEemu3H1c4Uxwik4A==','안동반점','서울특별시','성북구','보문동','1가 107','02-923-4448','11:30-21:00 b.t 15:00-17:00 수 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B0%84%EC%A7%9C%EC%9E%A5.PNG'),
('local:baek310','baek310','3qidcIE1j8EoMs/lzWePNG3mhtInVdf3NzQrg4FFe6GScHQ5eV12J3GWfed7ZD1tqcCj09VbDiG2PHoH/OFfS1QijRh8UIZBRMHhYtenQ1C9kqhoupJOoNnXSphMoi10Pr3y+rYd8fOpAVqlSY07WHLS5cFiKELx/oDDuMBU3PM=','WqFj0KN361xQJjAcvz8ws6Obl2MTUnZqD4mep1nhrC5aZVbhrEyD+53ZQLt/awofhxOYA+L75ls1OOnROuMobg==','홍콩반점','서울특별시','종로구','숭인동','310 대우디오빌','02-2233-0858','11:30-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EB%B3%B6%EC%9D%8C%EC%A7%AC%EB%BD%95.PNG'),
('local:bailey233','bailey233','jst7jC9zX1azGOMLNSgrsDkMcBr+0KRGUpC4QYkh9mGrWXTNhaofOj/eOVFtuKIhbRT3Th3qI14VHOLMUZF5TeodmgdIEZ/r1nDZw+Px76MlGILwQEr62Due/uCEajhgTSlwsGp8xvHvx4IKp39lLwH/WZy9gRoG1aqyymruekI=','oqOg6gftrlG75y2q4GkYw8QAHBnoch4ripE4xw1OX19czSwHpaqk7uhr0iD5KrdpB7HHLS/ui0rSF4UosuZU8A==','아델라베일리','서울특별시','종로구','부암동','23-3','02-3217-0707','11:30-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EA%BD%83%EB%93%B1%EC%8B%AC+%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:best742','best742','1YrGRe8zqSbQknlwa5N/dxhtbyn+wzrPThyAdt4WhIlbEuLnDawBs5axNCe54E0FxhVQextIKnE4MuMMsxErxIb5D7aMFb53wJk2dwr80HE4zJlcZ4tV98EsBnUGQsDWVG3h6PZ7rbwSwQXiVwAF5mKkV1d6fBQUN0rp1UwLSV8=','nn6cM6WtKCiyQzavUA01hA7R0e8H7XhJSh5zNH/uJAHbHO+da3722EAwI4HGe4LE81O0tCH8RjxurKQUgxQhuw==','일품향','서울특별시','종로구','종로동','종로4가 8','02-742-7488','10:30-21:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%9C%EC%9E%A5.jpg'),
('local:blackme37','blackme37','9cm3WPoNGee1TpGUZAOsLJZyIfQZCamHMcf1wkOlWOCSLILpgAVRtXYlenHq0HNy6aV+V4yegvBk+IIdy3V8MxeU5jXNL1bPmEc5P65SG3Z7V7PD5UBcBSEtXbSY8Zl+da/X6uyDIb/bkH4G/N/LsPuz2rGEg+nsmm1eTFUZQWI=','GbSANA/sRo2gFyE79L1xFqFu7GQtDrKvoneGKhj/1G1pt/BQZ2nVqbu7V6gTdZRLdZQHlb2CvqTkjDCmgcYG3Q==','흑미김밥','서울특별시','성북구','월곡동','37-31','02-941-8337','7:30-20:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%ED%9D%91%EB%AF%B8%EA%B9%80%EB%B0%A5.PNG'),
('local:chsun237','chsun237','Usl7NYr5465wPFkBllcc/SjlmSDkUX5d8pp2jBJn+PdmlgFPxV4cHYj2A6eF2ZYfuBS0jqSNp2PTRAsA7VQ74ujlqicUfUSeFScV3mvYwmNewmA3dsU0rJusBaBlIrPXVn30NUea0/2j94iwuMfefyDdaGky2yJpESfxdUjHHqA=','4vaSx/y0bJFGvN9wPLKuvr3Aipgo3bVUvAqm6bRxOB3gvbzmXJDOd0dy6Kwzb2OG1Jl0Dx5nQksEHk41rK4Sjg==','청수장','서울특별시','성북구','정릉동','416-27','02-913-6176','11:00-10:00 명절 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%8F%BC%EC%A7%80%EA%B0%88%EB%B9%84.PNG'),
('local:domino801','domino801','fOjWNgHV3e65kfqlMTvC2W9ahgChCrCz4NSjmSAcCPT1VTD4XKJyx6vlgkFHAWcsFZ32loggegr4ztqdwmB54bKT9bzHZCLOS0xOqfBCFGMB1XXeVMhn8Jg1y/4AJeJfyH6amCnPwb2MFtIHSBihvvVML7K7lQVFjTiBcvA49GA=','rpVnHSRqSfs/5X/jyvVpNXD7x5FY2atiqbxTTiAfyYQHp5cJ0ntsg1+hQhIIz1cOyXEJxU2Apm2pOr+xh07hGA==','도미노피자','서울특별시','동대문구','답십리동','801','02-1577-3082','11:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%8A%88%ED%8D%BC%EC%8A%88%ED%94%84%EB%A6%BC.PNG'),
('local:everest148','everest148','zVL6tATAsPDSLmHC/WDAEhwLN8QddErpUNNvN8gKKUA+dHImnToZH+QLvVBxzBn9EO8OYtC07VZazWZoPZ5l41ZdIc1hGlZmpmaztHkT/EqhXOF10US2ouS9RfJn95YWCTykd5JwaMH5mwX0/BAUTixAGWpi2eSmQqqXIa2w0O4=','Tfx2c2bUyhkJK+KboNP9rZs4I/JzGaSNeurmAMwVkKaDS/HwT/jXC0z584KGXkIYiTHXAHU5keoycZTERwmnTQ==','에베레스트레스토랑 ','서울특별시','종로구','창신동','148-1','02-766-8850','매일 11:00-23:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EB%A8%B8%EC%BB%A4%EB%8B%88.PNG'),
('local:fire998','fire998','+l7+1iq0FjjXNtptY52/Ade97o09oy9blEcGIAT6m0gwLbE2sKmyK+gGTL6nPqBguRxUqHwTP5KtaDduvhT3b4IpRfL522J6hh7GJzYTUHWMS25krNCmXqnKUjqLi0a9uqVa92HbU2ZRggfUaVRIPXEqezg9Mcn1VeKngdtPzss=','PaAjlnHLZbFj5mI93FW3viquwqAfkvm5fqMdCRIP9ZT5r7jKCJQLJ/cWnuByKP87RrT1JcXkR5yBkNX5vwM7Lg==','화야','서울특별시','성북구','종암동',' 3-998','02-943-9285','11:30-23:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EB%AA%A9%EC%82%B4.PNG'),
('local:garden352','garden352','0A5tEm7VexGM14vSQRANo1wctpjCNm7VJYp7fmW5JCkNRTLW16TNcNQEeLMTjH5TIeuNxY06CWydrGYTT8ieGIW+M8IUNFw/jGKwUC7ThPTDth4EmFG6G6s52wagKQ4vqdBfURwpqFuSVAdE6O035lNX1uoLoLMyJGBjMzk+Kes=','lv/tvW+kedzKGotXtzTh1IHX/sL9yPwd3Fd8orKhNFlxyokZFxstRP0pUe9/j3rd0bwUq8GHGpCoplqu3v6y0Q==','올리바가든','서울특별시','종로구','사직동','35-28','02-733-3056','11:30-22:00 bt 15:00-17:00 일휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%B4%EB%AC%BC%ED%81%AC%EB%A6%BC.PNG'),
('local:goldK256','goldK256','vrRw4lUe8ni1hPMJ98wcYv6EmelyPmYScjMw+ZhtMpMGB6JGdpmMXYXV0hQ/CF33vJyczSz7mKoLJ848UIOufk+yzx6OsZyjWLFXniD696FsQRE9PZB706DBzvqnQfSKdLJoSF1WeGyNeCY/7NLYXy9KlpdHzc+AsakHxzJOe6Q=','aFiKIJs86JJcZOjGsy4uJvLAyRvdJtCsadFhIKTuWZ9/CLGkXueOGyq9s3Nt4VM2fCRx1aIaK3tpbRJ98l6Nkg==','금왕돈까스','서울특별시','성북구','성북동','256-2','02-763-9366','10:00-21:00',' https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:gosun147','gosun147','Qfo9D/szM8Gr/+5oqF77XtRmmrG2EP/9wB9BFDE6GD0JbomjatuUsRabd7q+smp4wxVwB0zkMZ3N8WpdYKhH5kQjg/THVbH1TCjwyjh+CdOnr2HkyDEd7vg787u9C4gmWdoptR2/QTCgZIC7ex/ITJ6i8rjcmTYeevwEP0VY5BU=','2feUxHUXN0DzI03N1DO1OHUxK/dW9d5W7ngzWvVQeBCVNbvPUy4F8eY6PfxbsskInR2yYGruaQII/rw/3gIUWw==','고른햇살','서울특별시','성북구','안암동','5가 147-5원영스위트 ','02-953-3394','6:00-23:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%9B%90%EC%A1%B0%EA%B9%80%EB%B0%A5.PNG'),
('local:gwangju773','gwangju773','+IbRHskRu4ng6FVRQ3j2k9DGBN8cfMpZKiRcPCRo3Ugt0o3cQuLLK20mrzlb+a1PPMWF4AiNKwkCLFFVL4tB4WKKPIsOdv+DSO1GGaMmPZTtDMK/oggf3Gil9LfbWzcC4FlN8txBvt+l9+ECqYDqW3cgt2PXi9ZaCLKCZQBYdLU=','QgVJ/CYo5ossuBItribKMyTOnajzR+quE1UsHB7ceP9wXFc5ukeg7ilZ+TnJpf9c8cW//RSWWJGfND8paYJQmg==','광주식당','서울특별시','동대문구','청량리동','773','02-969-4403','7:00-22:00 월 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EA%B9%80%EC%B9%98.PNG'),
('local:hong192','hong192','iJQ/vP1GsktG8N+aeG1m8F9YPPw4DiUugyKLVo9t4W7d36/ieRj5Ezpgm6dhseZ3/1GDmsJTRcQKyU/AcYT7AmH7T2A/ttjxLFZAc4ApruR4Rk/QAmVrXJ92k1GrtuJjLtYaRdVt1xi++tvcSFhxr3a58N5dG12Bdhx95rT0uRU=','h5utCKyUEMz6IlLnyoRcVIpiP74iPaHBe76UADSTRVUq/lVKqBm9qm2t7rq6WVmq+m4z+FILtzk0sAQv9WU4bQ==','홍익돈까스','서울특별시','동대문구','휘경동','192-5','02-2242-9604','11:30-21:30 bt 14:30-16:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EA%B3%A0%EA%B5%AC%EB%A7%88%EC%B9%98%EC%A6%88.PNG'),
('local:italy331','italy331','47MUZmX+quEu4vCYz8rXR7+UywBEpMkjizMVWIQoRtu3jIhClKVcjpOgpoT1mbTOsLLC0D3aBGW7/xZ3lglfhbkbG5zQcTlRtP49gqqwi4qiKsyoSH89NOWrcKM+u5M+U6gJ3baRNP21Xr91tNAaaBXy+Nffnf87nkdWlEeO4pg=','OfpwAHdVoYtNciHBo6BE4wFm+mbQ5ZlQm6t6hDWlmZgNG4BA1E8KL8smvIx1eMZNWBNv8fJdpcINnyI7m6f66w==','노바 이탈리아노','서울특별시','동대문구','회기동','33-1','02-966-1652','11:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%97%B0%EC%96%B4%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:jangsu489','jangsu489','nMIyIIQWuRUX3r2OQ6b8t8n02VQY106Ja8V+7rF2G+VHWe5PDzDfedU6cutYbz2Hkvae5hF8HrtaHdAf8ONhAUgZA502EZGytjTZI3ps7fWmbbhv8E1C/vVo1fNCtpCIdcO5Ab+TsSXABs8YiRpMg20kjdjmEd10Q0ezItOdo+k=','7Fw7hSbnbskcVpSZzR/o0cTQADfj1PS3aZt/rga0e9KWda9ADAkZglmfmh304O1nOGV4SaXgJGwJdzYlc1AwBw==','장수감자탕','서울특별시','성북구','길음동','489-58','02-980-1003','11:00-24:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jesun85','jesun85','whGDYnpzh0vHkEXMIBmWXX89rm6l1aEbBtH9yF0CeLt+X2x/LALpDyAi5g/qAgHuIWRUPLKuU7aSDb8058WBi3MLy/WytHk0W1evGgdxSEBS+7NA0gOwLnzSqfnha2pKJj4Wnzu5185nMzjJdzr8kMwhnV5GXZ5y6MerFoPxZwA=','kJsoe6P98VPRNM68hJ5xYKRFQ28+Iuq/Nv50IZkd9RzSatQ8lvp/9VQunXBLfbH5dxJbMt48XX4yaT6R744W8g==','제순식당','서울특별시','성북구','동선동','85-94','02-927-2007','09:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%AD%88%EC%82%BC%EB%B3%B6%EC%9D%8C.PNG'),
('local:kan316','kan316','Y0QQ+c71e/DV8+n+7yWo+qierRrmEpBeujOXX2VaKctGW7RHMWpTa+0VH8OIenaKFBzt3AiIqMr5hycgFQN3YmDTpyTFR4uXrVYsS2dRQFBletHok+w1pi6fX1Dw+9HObzGHpu/xKzbH8uOGCMm4Qxn96XeuXT31UV+OLSHabx4=','bDIfOxi18GOKvHKkbpyq+e3JbqU+dyWIr+KipG0PpJBnQT5IKiEqBj9uxV61SatKDyybo8XZfQwEFlWkwcg6Ig==','차이나칸','서울특별시','성북구','장위동','316-3 센트럴타운근린 생활시설','02-909-2246','11:30-21:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%82%AC%EC%B2%9C%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:ktw118','ktw118','cbmfHZX1ZfFeKj6WU8EW9kAfIUEHjT2cW17jIG/GBl129KU+b+WTdzMme1aXH2DZpCgPiwuDU/4zVGeVmedYqjx5fMVbMuJGK41lYb+JGgUDUpq6d5QduEycH9nG8HX3fJdpEqAcuzsA5NqPZlJTnGyqLQFTSsGAgdDapgUl8Ww=','q68J9hStD/sGBIg6pltRij8yybUnPhdsv1/3J5tYK4SuPZwlnzSNSx4P3wrBVuvZIS2T4AESvELo3Xzli1arqA==','김태완 초밥좋은날','서울특별시','성북구','삼선동','118-15','02-924-0933','11:30-24:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%98%A4%EB%8A%98%EC%B4%88%EB%B0%A5.PNG\n'),
('local:may501','may501','U3adXcnBTUlvpiL9EQ2L4azwpXPQnLtuv8/ufAUZZzqXC2OzHV6CqA1u1KashNTxt2soZXq9YHluB9AgaN28UKBBKwK7ydxm2VAGnlQX/MnT8J/gxoCkAqL1xG+iKP8nbumcJo0zggUQ2jZaFy2+DzX2hMcPwaOLWhSJm6OqYLg=','3TXXZ3y9GR4c+zQ4QBzfFzMfYYOPkKw6/w2NdFKyc5YI0d0p8FRZLEdTEcVjETdk3YC95IQVIQJ5Ku1LAHsG9Q==','메이탄','서울특별시','종로구','교남동','50-1','02-738-6686','11:00-21:30 bt 15:00-16:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:mok330','mok330','2f5N1LJnkNpRZ9hywL0HUyW5l0QzIsR1q6PMO3xX+gHlrcKHeoR0hiGGclBkPMj3lg2QfEuqYteJqMwKSLDwCSlGASOopuDCB5c2J/3TGKMXW6M6RBZVhWLJkee2xV1i13SpaCt1jp/BX+sB+JSuHvUAeulJNBSUs5t2nPJtbNQ=','pzmVfJ6If7A9RoA74ZLBPIB0X+eXJGK/5mT4Y39ugZQozdpz0qxPegKRcPvxmfFN/RD0nTUxjFOr93GwtON0Pw==','성북동면옥집','서울특별시','성북구','성북동','330-105','02-765-3450','11:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.PNG'),
('local:myeon1013','myeon1013','0C1dCqnmUvP/knYCJTz13Za8qA4qpyniHHcSz8ekCDQPUuLE6KL2HuKpcy83CYGYU6zNi3K+QNdrYSh6sHBuZmOdvHjNgBCuKt9ilGgURwmGPE6fRNcVkiiKPzEJk8iUnbRZum+61iZWKCdqYelmznCZm93tIQtjxiWKuqG+YDE=','oyY3kNnOHFL36mJqUuoae2kJfxUge+NbZQrP2HiTDZAQYgP6OZOX9ZsL+MTOTIRbyelqTciJnfa+K5n+Teq91Q==','평양냉면','서울특별시','동대문구','제기동','1013','02-965-8254','11:00~20:00 월휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%AC%BC%EB%83%89%EB%A9%B4.png'),
('local:north114','north114','mjD8Y3Wep0Ho6RtTY9hQwhgzwAnCUbTgizU+dy7GVHWOz3jLD6Gl9QJlRN/apC5yxolW4QJ05xx5Yv+srPp/rHXww0V23pAbaS7jsA+JdxezMG7m8aMPmeNLDMhCn8y/caJY0I9LErsCkurdBVV3mmjGuKp0On9gnfdrY9BDGEk=','halY5e6YsB5mOMP1Y2/rldwxPvNwsQscUN4bD44LLMcDwhI+13c/aguV/SxMtbvOf/KcmOLd7Zqikxfzrsa0Yw==','북악정','서울특별시','종로구','평창동','114-12','02-394-2340','11:30-22:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%BD%83%EB%93%B1%EC%8B%AC.PNG'),
('local:one243','one243','bRzftvnwP+QHaL+9IEO8fPw78X2pEMNke9gyFGX7mfhz1wJjzoWpA7BEvY9hO5U7kE60UMTvPhRYz9Tw228p2MvFBOJb6+ycMbVduZPVsLQGmmJ2Bx2b1okvWno9oTaxBgBl0DzMvQUqvYL0otdTewnTZ4t99fEgmfznl3LD/qs=','kEXJ6KEz7bW3XBdNKNFe5bASF6RmPvWkNLV7nZGYcYjGNuqDc150KP4+EZoNesEfu/8LrhEmCZDHn5clKiH22A==','태원','서울특별시','동대문구','전농동','2-43','02-2244-3343','10:30~20:30','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%A7%AC%EB%BD%95.jpg'),
('local:oneday972','oneday972','yWbdyvTVk2y+oqPcKbr1EzD1q2EwM+5802z6cJt1nLItP8WAtFMYLuYRlQVgrpC3DHW3IV16XEw6xfS0+Kl45vstrFwoz01mk3Da1QotOPp78QNQujzyjOaVztI+30/az53jnV2KsxkdiWM0oTZGcIUuiohBM5UUz2qs8sYCFSA=','/H3JkIUnCUKs5HuK1aZd1d03GLmKRKxDVjwnrYFvWUWwRVhDOMUDS1a+NTfAa3EtnMCY53utg1ylwZ8YWTCurw==','하루','서울특별시','동대문구','용신동','97-22 1층','02-922-0091','10:00 - 20:00 일 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%8D%AE%EB%B0%A5.jpg'),
('local:park451','park451','Bw/9WzBPB0x68aQcJDFVHqLyTre/jDt/MTy/pSnVQ6/zqVaWksxYLVwqzV0Mm7eSXiWoAYzaeB3SAwWpq45IM5rRb9B8/T5vbla1fjUylxEzpr2m9+K6zv6eajVmzU2HNvY/l9UIhIcxKXJWch0XtbqOjy5PO/nh3gR/29jHYjE=','FGav3hZSF9no77D9ReeqjPBIr0IVFvV7nqT4tuEPHqrZtRyEaGtE/zhTUzr9v2cS867xeGg8iKhJekTvPe/NIA==','돈박','서울특별시','종로구','무악동','45-19 1층','02-720-2999','11:00-22:00 일휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%8F%88%EA%B0%80%EC%8A%A4.PNG'),
('local:pot341','pot341','QDlqvYiX04aslUxNhtqOxiohemQVO7t1nsGpvlWHGTcgRni0Ulo9FXvaQg7910wwTJByBPEfBRysal4fScAk/aPcdeLTKb0pqz6wpxHSgmYDl1kB2gZ0FYKmfWO3e6NZNR4Gjf6xzjZoiGyXFIkRSXkXxLg5OKGYp8rIGTD/EOw=','DPEqf1+V4KslC4kxcgwpZBjiXlEFmpg03DflvKG8BPsTusXo/NschnbxKsY3dyoRjBRRa/pPetsTXTIfW68hKA==','콩지POT지','서울특별시','종로구','가회동','34-1','02-745-2203','11:30-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EC%95%88%EC%8B%AC%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:rabbit132','rabbit132','UCd/tyBRgg4XmY5GZ9oRIk/RrzBLHo4EpNglG0izSjCLboyAwfmms+ZGAtQ5DU9ZdUcwoE3UafFemAJ3YF6COKpY3/qqU7g9S/rMzCjD1sMg6yH2q1Vg7b0+jaZS3VeHHMpM4/0NjkaTow626amELzC5a1K52cBS1nA/gsHcVaA=','eq8V/ZI6rdWPCJb7jwMl90L64RjBDsuriqSQETv9Yh3oj6fVMbuOSfua7M5GLfC9Ixc+WEj0aKWAFkZxs4KoWg==','토끼정','서울특별시','종로구','이화동','1-132','02-762-1030','11:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%ED%82%A4%EB%B0%A5.PNG'),
('local:sa258','sa258','k8VSfTq99Kmi84cKC1RMn4f83Gx2QYDr0H4eYFRyIYy/7CZ19qO0kAYbu9QA3KQ2R9opm1NTKfAfH7fGf8BoHgF7yYxMnM4d0tsYGkRvZs1FcgHStDlLCk2LkxvcjucOOx1Jcvtj2zxoxO1GssBTlGwg8/ChD/W+WefUkmCg63E=','m4bUH95zW6ut2zw22zEANQYQldFIG+mBVVnHJs7MlTZOBJ3P4z5t3/55i5bYDlIieomzakl/2OMAyYXS8wQa9w==','계열사','서울특별시','종로구','청운효자동','258-3','02-391-3566','12:00-23:30 월 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%ED%9B%84%EB%9D%BC%EC%9D%B4%EB%93%9C.PNG'),
('local:sam102','sam102','kXH8ivFq//zTTCzdgtAJvXIAl3Ea7b9DO2sCWcm1JobAEd8TEpeQhBwtdYQLFsqeJfM1IfjZjlxq4vDlu79UU6H8wdJp/MbD9Bhcj4oE7tl6p5UEkS5+jIuGOQnbV/VSTQ/Qo1xNraVdXL4Jtm1qKnz1bInVQZrdtOp+VvX8JZU=','MZ4QCzVM6/s/IDGSdH82YTHDC3w36MLvMN7P0rYS0A9hRlHEdhe/DfkIAARUEsdit+/azdUT/ScajZwf45rdjQ==','삼청동수제비','서울특별시','종로구','삼청동','102-2','02-735-2965','11:00-21:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%88%98%EC%A0%9C%EB%B9%84.PNG'),
('local:sea133','sea133','OnQBr//1+PsH4xhGMp6ypt/EdTuuTEPku08cvNDR7QS+E6NN/20lQYb18lktbTwRwS8bVoThfTBUOLOhCwmStcObewwdamjaM+odfKuMaVrrSOq/npOP+Cd54KM6X50yf2s8x2wKERhTYcXDkX/fxVlElGl0WrZTWvJQZ/M84CI=','uiDLMUCFgtBgyy84AgYpOV2A9Y1L3yf8OxIohH8Wz8kgmYbACkwtap/cBG9pYj511ScDsU2dvaaheUM9Wq86yA==','남해바다마차','서울특별시','성북구','석관동','133-62 선우빌딩','02-966-5036','17:00-24:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%83%9D%EC%84%A0%ED%86%B5%EA%B5%AC%EC%9D%B4.PNG'),
('local:suyeon248','suyeon248','TmKfVhNXYxDRTbfbEPC9GApHc6ugbQLl8qAeHm2SiJGb2+nZ2EBsOx3mDqI5neO2OhSSzZeft5eJGEnm/hgkUQFyKtn/Jp22uUTos/w9dA2VK/b0oYDhj3oRRjcDB2wEu9I+wI0nMs/43y62TDn7lqwGEXH+KnxrFU3D0E/XiIo=','A3e2Cvp6hhfhPjzWt1Y2u+bt8i6yuwzU43+OaWUnHJQA1PLw+eCb3VQEN6vkMnjRFDGL9+kPa2ggWpWwQyBuKQ==','수연산방','서울특별시','성북구','성북동','248','02-764-1736','11:30-22:00 월요일 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9.PNG'),
('local:table338','table338','qYp1CYmJYNrejkIafCeHTDWLn7N+/s3DM7QnYQLLTy2pThNSUSm1rEWrzDM7fkJfrBnDVT9ltF/cyP/g80BToILkhEfWjbhoj6DiWDODwJFtsi1ZsinJcQE+bzO7D99VISSY4TJorfjCPuEFNE+4uzkEXDNrcJPOKaFvTFNYJg8=','Awz8vU7tOljLnPa1Hq20IpwsJIvA1VOcKz7N26nij/5Clo6mis+Qy275HnJ3YULU1jjaRzAGvLiRwP9NYIkkJw==','디어테이블','서울특별시','동대문구','장안동','338-8','070-4224-0021','11:00-21:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%B9%84%EC%96%B4%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:wonbin423','wonbin423','lA27Tsj6VPTUWuIWItFNXN7Oe3nrkiVsVjLRZPu3USt+jlzL3A5gQSz1y9bG365ANrWNlf1Mj+rDfSH3tKOB+wdN6VYbhRxRziGrUdpzYGTYOaaB8gP2zoOEx8y78k0+qyKYSr1+MH/owiXom2Jt9JfPNJEn8H9tzc3yve7LXqM=','+65qzr67PdODmrZlw3daLpDVksnf/YVc5YdVynTdB5o8h15PmxJPlsGnkg/rLhy1ZNW1SAXSacYOvm/5bW9Ieg==','혜화돌쇠아저씨 ','서울특별시','종로구','혜화동','명륜4가 23','02-765-7399','매일12:00-21:00 월요일 휴무','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B9%80%EC%B9%98%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:wook','wook','K5GodcbNAVbsuboELouoiY8a0+0s/kw78xyttrM4VlsEbop3E+ElK/M/guAYqSrn8ijVakXm+lihjurUQC6V+8PsCtc6DU7ZIt2L0EHPurLppUuiSDWSdGLzmTXMIkR9AmUSqmIBlpdIVixdZ7AwlPGtx6CMRNv+h7163FMfe1M=','UzuUXd8itQsNYsSj7vx4zuyOT97MA/y8riJFB5P5kXWxL7kh8Z31OdaNpgA6VHh6YzMSbWpYrnUm56RckGP3ug==','수동에서 온 순대국','서울시','성북구','삼선동','한성대학교 근처','010-7577-4937','아침 9시부터 저녁 7시까지','https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-shop-13.png'),
('local:yeak103','yeak103','qhKSSb2HqWHzp9EiVDVEjrI8Q72Cz7TfUrzcuEhHdkf8BCU9mL00f5uVELAeFN2kNE7klKN7sLMffJ5u35VHOizpuX94T4A0duWNknPx7vCvX0pSxAQTl4y//t4br+V0kw4femMqE1IXS4sjLYiFqypVGbK08OJcDuLYCbsOkVs=','PlLin5Hzm7tRbsgIWs/SP7HNjcyXfEvWRmHS0aV08O2uM7UrZBipZadV75ni3MWIv8a0aDXKMe5nhMxkVcl9MA==','추억의 옛날떡볶이','서울특별시','성북구','돈암동','85-103','02-921-4108','4:30-10:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%9B%EB%96%A1+%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:young185','young185','1hT8WieNFouQ9+HCyS3YXJYPqhh2scgxq9am0Zr/OeaMNmilsLJX74I9C3JOxSNd5HwXoIzKku7SizDZRnEXWOFg2rrA7lihNcIS+3RWvZIJyL096gxCcrx4raw5V5URbhyFNmCSEobJ/vWZo7sZj/4DUJW5/XzAlu2QcDWQ658=','DKxWAVxCgStxo5xdlXOXbFdkQHg43hBlPY4EC+XABpgtQR8knXlkcwH3FhRMZtubQJwkiktjmBp6o30y4XH3MA==','청년다방','서울특별시','동대문구','이문동','292-185 1층','02-963-9838','11:00-22:00','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B0%A8%EB%8F%8C.PNG');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `owner_auth` varchar(60) NOT NULL,
  `number` int(11) NOT NULL,
  `product` varchar(30) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sale` text,
  `product_imgUrl` text,
  PRIMARY KEY (`owner_auth`,`number`),
  CONSTRAINT `fk_product` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES
('local:andong107',1,'짜장',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:andong107',2,'우동',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%9A%B0%EB%8F%99.PNG'),
('local:andong107',3,'짬뽕',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%A7%AC%EB%BD%95.PNG'),
('local:andong107',4,'간짜장',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B0%84%EC%A7%9C%EC%9E%A5.PNG'),
('local:andong107',5,' 볶음밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:andong107',6,'군만두',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B5%B0%EB%A7%8C%EB%91%90.PNG'),
('local:andong107',7,'삼선 짜장',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EC%82%BC%EC%84%A0%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:andong107',8,'탕수육',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:andong107',9,'깐풍기',27000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%88%EB%8F%99+%EA%B9%90%ED%92%8D%EA%B8%B0.PNG'),
('local:baek310',1,'짬뽕',5500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%AC%EB%BD%95.PNG'),
('local:baek310',2,'짜장면',4500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%9C%EC%9E%A5.PNG'),
('local:baek310',3,'탕수육',11000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:baek310',4,' 짬뽕밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:baek310',5,' 짜장밥',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%A7%9C%EC%9E%A5%EB%B0%A5.PNG'),
('local:baek310',6,'볶음짬뽕',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EB%B3%B6%EC%9D%8C%EC%A7%AC%EB%BD%95.PNG'),
('local:baek310',7,'군만두',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EA%B5%B0%EB%A7%8C%EB%91%90.PNG'),
('local:baek310',8,'쟁반짜장',12000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%9F%81%EB%B0%98%EC%A7%9C%EC%A7%B1.PNG'),
('local:baek310',9,'차가면',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%BD%A9%EB%B0%98%EC%A0%90-%EC%B0%A8%EA%B0%80%EB%A9%B4.PNG'),
('local:bailey233',1,'알리오 올리오',19000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EC%95%8C%EB%A6%AC%EC%98%A4.PNG'),
('local:bailey233',2,'봉골레',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B4%89%EA%B3%A8%EB%A0%88.PNG'),
('local:bailey233',3,'해산물 토마토스파게티',23000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%ED%95%B4%EC%82%B0%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:bailey233',4,' 까르보나라',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EA%B9%8C%EB%A5%B4%EB%B3%B4.PNG'),
('local:bailey233',5,' 바질 페스토',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B0%94%EC%A7%88%ED%8E%98%EC%8A%A4%ED%86%A0.PNG'),
('local:bailey233',6,' 버섯크림 리조또',19000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EB%B2%84%EC%84%AF%ED%81%AC%EB%A6%BC%EB%A6%AC%EC%A1%B0.PNG'),
('local:bailey233',7,'소고기 리조또',21000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EC%86%8C%EA%B3%A0%EA%B8%B0%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:bailey233',8,'해산물 토마토리조또',23000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%B4%EC%82%B0%EB%AC%BC+%ED%86%A0%EB%A7%88%ED%86%A0+%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:bailey233',9,'꽃등심 스테이크',45000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%95%84%EB%8D%B8%EB%9D%BC%EB%B2%A0%EC%9D%BC%EB%A6%AC%EA%BD%83%EB%93%B1%EC%8B%AC+%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:best742',1,'수타짜장',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%9C%EC%9E%A5.jpg'),
('local:best742',2,'짬뽕',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%AC%EB%BD%95.jpg'),
('local:best742',3,'우동',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9A%B0%EB%8F%99.jpg'),
('local:best742',4,' 볶음밥',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:best742',5,' 울면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9A%B8%EB%A9%B4.PNG'),
('local:best742',6,' 잡채밥',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:best742',7,'짜장밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%A7%9C%EC%9E%A5%EB%B0%A5.PNG'),
('local:best742',8,'짬뽕밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:best742',9,'오향 장육',35000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9D%BC%ED%92%88%ED%96%A5-%EC%98%A4%ED%96%A5%EC%9E%A5%EC%9C%A1.PNG'),
('local:blackme37',1,'흑미 김밥',2300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%ED%9D%91%EB%AF%B8%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',2,'김치 김밥',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EA%B9%80%EC%B9%98%EA%B9%80%EB%B0%A5.PNG '),
('local:blackme37',3,'치즈 김밥',2800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B9%98%EC%A6%88%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',4,'참치 김밥',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B0%B8%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:blackme37',5,'일반 라면',2800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',6,'치즈 라면',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EC%B9%98%EC%A6%88%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',7,'김치 라면',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EA%B9%80%EC%B9%98%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',8,'쌀 떡라면',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%96%A1%EB%9D%BC%EB%A9%B4.PNG'),
('local:blackme37',9,'만두 라면',3300,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%9D%91%EB%AF%B8+%EB%A7%8C%EB%91%90%EB%9D%BC%EB%A9%B4.PNG'),
('local:chsun237',1,'돼지 갈비',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%8F%BC%EC%A7%80%EA%B0%88%EB%B9%84.PNG'),
('local:chsun237',2,'공기밥',1000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:chsun237',3,'물냉면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%AC%BC%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',4,'비빔 냉면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',5,' 회냉면',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%ED%9A%8C%EB%83%89%EB%A9%B4.PNG'),
('local:chsun237',6,' 물만두',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%AC%BC%EB%A7%8C%EB%91%90.PNG'),
('local:chsun237',7,'막걸리',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%A7%89%EA%B1%B8%EB%A6%AC.PNG'),
('local:chsun237',8,'복분자',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EB%B3%B5%EB%B6%84%EC%9E%90.PNG'),
('local:chsun237',9,'산사춘',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EC%88%98+%EC%82%B0%EC%82%AC%EC%B6%98.PNG'),
('local:domino801',1,'치즈 케이크롤피자',27000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%B9%98%EC%A6%88%EC%BC%80%EC%9D%B4%ED%81%AC%EB%A1%A4.PNG'),
('local:domino801',2,'직화 스테이크피자',28000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%A7%81%ED%99%94%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:domino801',3,'슈퍼 슈프림피자',27000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%8A%88%ED%8D%BC%EC%8A%88%ED%94%84%EB%A6%BC.PNG'),
('local:domino801',4,'베이컨 체다치즈피자',26000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EB%B2%A0%EC%9D%B4%EC%BB%A8%EC%B2%B4%EB%8B%A4%EC%B9%98%EC%A6%88.PNG'),
('local:domino801',5,'리얼 바비큐피자',27000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EB%A6%AC%EC%96%BC%EB%B0%94%EB%B9%84%ED%81%90.PNG'),
('local:domino801',6,'치즈 러버피자',26000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%B9%98%EC%A6%88%EB%9F%AC%EB%B2%84.PNG'),
('local:domino801',7,'슈퍼 디럭스피자',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EC%8A%88%ED%8D%BC%EB%94%94%EB%9F%AD%EC%8A%A4.PNG'),
('local:domino801',8,'포테이토 피자',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%ED%8F%AC%ED%85%8C%EC%9D%B4%ED%86%A0.PNG'),
('local:domino801',9,'갈릭 스모크 치킨피자',28000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%84%EB%AF%B8%EB%85%B8-%EA%B0%88%EB%A6%AD%EC%8A%A4%EB%AA%A8%ED%81%AC%EC%B9%98%ED%82%A8.PNG'),
('local:everest148',1,'치킨 머커니',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EB%A8%B8%EC%BB%A4%EB%8B%88.PNG'),
('local:everest148',2,'치킨 커리',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',3,'치킨 머설라',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%B9%98%ED%82%A8%EB%A8%B8%EC%84%A4%EB%9D%BC.PNG'),
('local:everest148',4,'스페셜 커리',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%8A%A4%ED%8E%98%EC%85%98%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',5,'머턴커리',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%ED%84%B4%EC%BB%A4%EB%A6%AC.PNG'),
('local:everest148',6,'머턴 머설라',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%ED%84%B4%EB%A8%B8%EC%84%A4%EB%9D%BC.PNG'),
('local:everest148',7,'머라이 코프다',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%A8%B8%EB%9D%BC%EC%9D%B4%EC%BD%94%ED%94%84%EB%8B%A4.PNG'),
('local:everest148',8,'알루 고비',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%95%8C%EB%A3%A8%EA%B3%A0%EB%B9%84.PNG'),
('local:everest148',9,'더히',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%97%90%EB%B2%A0%EB%A0%88%EC%8A%A4%ED%8A%B8%EB%8D%94%ED%9E%88.PNG'),
('local:fire998',1,'통 갈매기살',14000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%ED%86%B5%EA%B0%88%EB%A7%A4%EA%B8%B0%EC%82%B4.PNG'),
('local:fire998',2,'목살',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EB%AA%A9%EC%82%B4.PNG'),
('local:fire998',3,'삼겹살',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%82%BC%EA%B2%B9%EC%82%B4.PNG'),
('local:fire998',4,'통 가브리살',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%ED%86%B5%EA%B0%80%EB%B8%8C%EB%A6%AC%EC%82%B4.PNG'),
('local:fire998',5,' 양념 돼지갈비',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%96%91%EB%85%90%EB%8F%BC%EC%A7%80%EA%B0%88%EB%B9%84.PNG'),
('local:fire998',6,'아삭 냉면',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EC%95%84%EC%82%AD%EB%83%89%EB%A9%B4.PNG'),
('local:fire998',7,'계란찜',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EA%B3%84%EB%9E%80%EC%B0%9C.PNG'),
('local:fire998',8,'전투 라면',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EB%9D%BC%EB%A9%B4.PNG'),
('local:fire998',9,'김치 찌개',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%94%EC%95%BC+%EA%B9%80%EC%B9%98%EC%B0%8C%EA%B0%9C.PNG'),
('local:garden352',1,'해물토마토 파스타',19000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%B4%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:garden352',2,'아라비아따',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EC%95%84%EB%9D%BC%EB%B9%84%EC%95%84%EB%94%B0.PNG'),
('local:garden352',3,'해물 크림파스타',18000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%B4%EB%AC%BC%ED%81%AC%EB%A6%BC.PNG'),
('local:garden352',4,'버섯 크림파스타',18000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%B2%84%EC%84%AF%ED%81%AC%EB%A6%BC.PNG'),
('local:garden352',5,'봉골레 오일파스타',18000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%B4%89%EA%B3%A8%EB%A0%88%EC%98%A4%EC%9D%BC.PNG'),
('local:garden352',6,'고르곤졸라 피자',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EA%B3%A0%EB%A5%B4%EA%B3%A4.PNG'),
('local:garden352',7,'한우 꽃등심 스테이크',65000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%ED%95%9C%EC%9A%B0%EA%BD%83%EB%93%B1%EC%8B%AC.PNG'),
('local:garden352',8,'채끝 스테이크',29900,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EC%B1%84%EB%81%9D.PNG'),
('local:garden352',9,'리코타치즈 샐러드',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%98%AC%EB%A6%AC%EB%B0%94%EB%A6%AC%EC%BD%94%ED%83%80.PNG'),
('local:goldK256',1,'함박스테이크',9500,'5%','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:goldK256',2,'안심돈까스',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%95%88%EC%8B%AC%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',3,'금왕정식',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EA%B8%88%EC%99%95%EC%A0%95%EC%8B%9D.PNG'),
('local:goldK256',4,'생선까스',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%83%9D%EC%84%A0%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',5,'등심돈까스',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EB%93%B1%EC%8B%AC%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:goldK256',6,'공기밥',1000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:goldK256',7,'맥주',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EB%A7%A5%EC%A3%BC.PNG'),
('local:goldK256',8,'음료',1000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B8%88%EC%99%95%EB%8F%88%EA%B9%8C%EC%8A%A4+%EC%9D%8C%EB%A3%8C.PNG'),
('local:gosun147',1,'원조 김밥',1500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%9B%90%EC%A1%B0%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',2,'참치 김밥',2500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B0%B8%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',3,'치즈 김밥',2500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B9%98%EC%A6%88%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',4,'김치 김밥',2500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EA%B9%80%EC%B9%98%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',5,' 제육 김밥',2500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%A0%9C%EC%9C%A1%EA%B9%80%EB%B0%A5.PNG'),
('local:gosun147',6,' 쌀 떡볶이',2000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%8C%80%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:gosun147',7,'찹쌀 순대',2000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EC%B0%B9%EC%8C%80%EC%88%9C%EB%8C%80.PNG'),
('local:gosun147',8,'부산 어묵',2000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EB%B6%80%EC%82%B0%EC%96%B4%EB%AC%B5.PNG'),
('local:gosun147',9,'라면',2500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%96%87%EC%82%B4+%EB%9D%BC%EB%A9%B4.PNG'),
('local:gwangju773',1,'청국장',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EC%B2%AD%EA%B5%AD%EC%9E%A5.PNG'),
('local:gwangju773',2,'된장찌개',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EB%90%9C%EC%9E%A5.PNG'),
('local:gwangju773',3,'김치찌개',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EA%B9%80%EC%B9%98.PNG'),
('local:gwangju773',4,'순두부찌개',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%88%9C%EB%91%90%EB%B6%80.PNG'),
('local:gwangju773',5,'통태찌개',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EB%8F%99%ED%83%9C.PNG'),
('local:gwangju773',6,'조기찌개',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%A1%B0%EA%B8%B0%EC%B0%8C%EA%B0%9C.PNG'),
('local:gwangju773',7,'갈치조림',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EA%B0%88%EC%B9%98%EC%A1%B0%EB%A6%BC.PNG'),
('local:gwangju773',8,'제육 볶음',11000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC%EC%A0%9C%EC%9C%A1.PNG'),
('local:gwangju773',9,'오징어 볶음',11000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B4%91%EC%A3%BC+%EC%98%A4%EC%A7%95%EC%96%B4.PNG'),
('local:hong192',1,'왕 돈까스',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EC%99%95%EB%8F%88.PNG'),
('local:hong192',2,'돈까스 정식',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EB%8F%88%EA%B9%8C%EC%8A%A4%EC%A0%95%EC%8B%9D.PNG'),
('local:hong192',3,'생선 까스',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EC%83%9D%EC%84%A0.PNG'),
('local:hong192',4,' 고구마 치즈롤까스',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EA%B3%A0%EA%B5%AC%EB%A7%88%EC%B9%98%EC%A6%88.PNG'),
('local:hong192',5,' 해물 볶음우동',9200,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C.PNG'),
('local:hong192',6,' 가쓰오 우동',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EA%B0%80%EC%93%B0%EC%98%A4.PNG'),
('local:hong192',7,'샐러드 파스타',9900,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EC%83%90%EB%9F%AC%EB%93%9C%ED%8C%8C%EC%8A%A4%ED%83%80.PNG'),
('local:hong192',8,'베이컨 볶음우동',9200,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5%EB%B2%A0%EC%9D%B4%EC%BB%A8.PNG'),
('local:hong192',9,'돈까스 필라프',11000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%8D%EC%9D%B5+%EB%8F%88%EA%B9%8C%EC%8A%A4%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:italy331',1,'연어 스테이크',29800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%97%B0%EC%96%B4%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:italy331',2,'안심 스테이크',29800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94+%EC%95%88%EC%8B%AC%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:italy331',3,'닭고기 스테이크',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EB%8B%AD%EA%B3%A0%EA%B8%B0.PNG'),
('local:italy331',4,' 연어 샐러드',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%97%B0%EC%96%B4%EC%83%90%EB%9F%AC%EB%93%9C.PNG'),
('local:italy331',5,'치킨 샐러드',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%B9%98%ED%82%A8%EC%83%90%EB%9F%AC%EB%93%9C.PNG'),
('local:italy331',6,' 칠리 치킨피자',24000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EC%B9%A0%EB%A6%AC%EC%B9%98%ED%82%A8.PNG'),
('local:italy331',7,'까르보나라',14800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%EA%B9%8C%EB%A5%B4%EB%B3%B4.PNG'),
('local:italy331',8,'해산물 토마토스파게티',16800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94%ED%95%B4%EC%82%B0%EB%AC%BC%ED%86%A0%EB%A7%88%ED%86%A0.PNG'),
('local:italy331',9,'새우 로제 크림스파게티',15800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%85%B8%EB%B0%94+%EC%83%88%EC%9A%B0%EB%A1%9C%EC%A0%9C.PNG'),
('local:jangsu489',1,'감자탕',29000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',2,'등뼈찜',33000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%93%B1%EB%BC%88%EC%B0%9C.PNG'),
('local:jangsu489',3,'한방 감자탕',33000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%ED%95%9C%EB%B0%A9%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',4,' 부대 감자탕',33000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%B6%80%EB%8C%80%EA%B0%90%EC%9E%90%ED%83%95.PNG'),
('local:jangsu489',5,' 뼈 해장국',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%BC%88%ED%95%B4%EC%9E%A5%EA%B5%AD.PNG'),
('local:jangsu489',6,'등뼈 한방탕',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%93%B1%EB%BC%88%ED%95%9C%EB%B0%A9%ED%83%95.PNG'),
('local:jangsu489',7,'탑 등뼈찜',28000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%ED%83%91%EB%93%B1%EB%BC%88%EC%B0%9C.PNG'),
('local:jangsu489',8,'볶음밥',2000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:jangsu489',9,'공기밥',1000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%9E%A5%EC%88%98+%EA%B3%B5%EA%B8%B0%EB%B0%A5.PNG'),
('local:jesun85',1,'오제 볶음',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C%EC%98%A4%EC%A0%9C%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',2,'쭈삼 볶음',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%AD%88%EC%82%BC%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',3,'직화 간장돼지 불고기',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EA%B0%84%EC%9E%A5%EB%8F%BC%EC%A7%80%EB%B6%88%EA%B3%A0%EA%B8%B0.PNG'),
('local:jesun85',4,' 찍화 쭈꾸미볶음',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%AD%88%EA%BE%B8%EB%AF%B8%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',5,'차돌 된장찌개',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%B0%A8%EB%8F%8C%EB%90%9C%EC%9E%A5%EC%B0%8C%EA%B0%9C.PNG'),
('local:jesun85',6,'간장 오불',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EA%B0%84%EC%9E%A5%EC%98%A4%EB%B6%88.PNG'),
('local:jesun85',7,'직화 제육볶음',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',8,'직화 오징어볶음',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%A7%81%ED%99%94%EC%98%A4%EC%A7%95%EC%96%B4%EB%B3%B6%EC%9D%8C.PNG'),
('local:jesun85',9,' 순두부찌개',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%EC%88%9C%EB%91%90%EB%B6%80%EC%B0%8C%EA%B0%9C.PNG'),
('local:jesun85',10,' 통돼지 김치찜',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%A0%9C%EC%88%9C+%ED%86%B5%EB%8F%BC%EC%A7%80%EA%B9%80%EC%B9%98%EC%B0%9C.PNG'),
('local:kan316',1,'양장피',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%96%91%EC%9E%A5%ED%94%BC.PNG'),
('local:kan316',2,'사천 탕수육',23000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%82%AC%EC%B2%9C%ED%83%95%EC%88%98%EC%9C%A1.PNG'),
('local:kan316',3,'볶음 짜장',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EB%B3%B6%EC%9D%8C%EC%A7%9C%EC%9E%A5.PNG'),
('local:kan316',4,'우동',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%9A%B0%EB%8F%99.PNG'),
('local:kan316',5,'짜장',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%9C%EC%9E%A5.PNG'),
('local:kan316',6,'짬뽕밥',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:kan316',7,'날치알 볶음밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EB%82%A0%EC%B9%98%EC%95%8C%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:kan316',8,'해물 누룽지탕',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%ED%95%B4%EB%AC%BC%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.PNG'),
('local:kan316',9,'얼큰 짬뽕',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B0%A8%EC%9D%B4%EB%82%98%EC%B9%B8+%EC%A7%AC%EB%BD%95.PNG'),
('local:ktw118',1,'오늘초밥 (10개)',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%98%A4%EB%8A%98%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',3,'참치 초밥',15000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%B0%B8%EC%B9%98%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',4,' 광어 초밥',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EA%B4%91%EC%96%B4%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',5,'왕새우 초밥',15000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%99%95%EC%83%88%EC%9A%B0%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',6,'참치 불초밥',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%B0%B8%EC%B9%98%EB%B6%88%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',7,'눈다랑어 초밥',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EB%88%88%EB%8B%A4%EB%9E%91%EC%96%B4%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',8,'꽃등심 초밥',15000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EA%BD%83%EB%93%B1%EC%8B%AC%EC%B4%88%EB%B0%A5.PNG'),
('local:ktw118',9,' 캘리포니아 롤',17000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B9%80%ED%83%9C%EC%99%84+%EC%BC%88%EB%A6%AC%ED%8F%AC%EB%8B%88%EC%95%84%EB%A1%A4.PNG'),
('local:may501',1,'메이탄 짜장',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%9C%EC%9E%A5%EB%A9%B4.PNG'),
('local:may501',2,'해물 우동',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%ED%95%B4%EB%AC%BC%EC%9A%B0%EB%8F%99.PNG'),
('local:may501',3,'해물볶음 짜장',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C%EC%A7%9C%EC%9E%A5.PNG'),
('local:may501',4,' 메이탄 짬뽕',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%AC%EB%BD%95.PNG'),
('local:may501',5,' 게살새우 볶음밥',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B2%8C%EC%82%B4%EC%83%88%EC%9A%B0.PNG'),
('local:may501',6,' 고추 잡채밥',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%A0%EC%B6%94%EC%9E%A1%EC%B1%84%EB%B0%A5.PNG'),
('local:may501',7,'짬뽕밥',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%A7%AC%EB%BD%95%EB%B0%A5.PNG'),
('local:may501',8,'잡탕밥',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%9E%A1%ED%83%95%EB%B0%A5.PNG'),
('local:may501',9,'울면',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%A9%94%EC%9D%B4%ED%83%84-%EC%9A%B8%EB%A9%B4.PNG'),
('local:mok330',1,'회냉면',10000,'3+1','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%ED%9A%8C%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',2,'물냉면',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%AC%BC%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',3,'비빔냉면',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.PNG'),
('local:mok330',4,'사골만둣국',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%82%AC%EA%B3%A8%EB%A7%8C%EB%91%90%EA%B5%AD.PNG'),
('local:mok330',5,'떡만두국',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%96%A1%EB%A7%8C%EB%91%90%EA%B5%AD.PNG'),
('local:mok330',6,'갈비찜',45000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EA%B0%88%EB%B9%84%EC%B0%9C.PNG'),
('local:mok330',7,'오색만두',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%98%A4%EC%83%89%EB%A7%8C%EB%91%90.PNG'),
('local:mok330',8,'사리추가',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EC%82%AC%EB%A6%AC%EC%B6%94%EA%B0%80.PNG'),
('local:mok330',9,'모듬전',25000,'15%','https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%84%B1%EB%B6%81%EB%8F%99+%EB%A9%B4%EC%98%A5%EC%A7%91+%EB%AA%A8%EB%93%AC%EC%A0%84.PNG'),
('local:myeon1013',1,'물냉면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%AC%BC%EB%83%89%EB%A9%B4.png'),
('local:myeon1013',2,'비빔 냉면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%B9%84%EB%B9%94%EB%83%89%EB%A9%B4.jpg'),
('local:myeon1013',3,'회냉면',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%9A%8C%EB%83%89%EB%A9%B4.png'),
('local:myeon1013',4,'온면',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EC%98%A8%EB%A9%B4.jpg'),
('local:myeon1013',5,'평양 만두',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%8F%89%EC%96%91%EB%A7%8C%EB%91%90.jpg'),
('local:myeon1013',6,'만둣국',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%A7%8C%EB%91%A3%EA%B5%AD.jpg'),
('local:myeon1013',7,'녹두 지짐',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%85%B9%EB%91%90%EC%A7%80%EC%A7%90.png'),
('local:myeon1013',8,'돼지 수육',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%EB%8F%BC%EC%A7%80%EC%88%98%EC%9C%A1.jpg'),
('local:myeon1013',9,'홍어회',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8F%89%EC%96%91%EB%83%89%EB%A9%B4-%ED%99%8D%EC%96%B4%ED%9A%8C.jpg'),
('local:north114',1,'생갈비',47000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%83%9D%EA%B0%88%EB%B9%84.PNG'),
('local:north114',2,'북악정 이동갈비',31000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%9D%B4%EB%8F%99%EA%B0%88%EB%B9%84.PNG'),
('local:north114',3,'한우 꽃등심',47000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%BD%83%EB%93%B1%EC%8B%AC.PNG'),
('local:north114',4,'북악정 궁중갈비',39000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%B6%81%EC%A4%91%EA%B0%88%EB%B9%84.PNG'),
('local:north114',5,'한우 살치살',60000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%82%B4%EC%B9%98%EC%82%B4.PNG'),
('local:north114',6,' 한우 주물럭',35000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%9C%EC%9A%B0%EC%A3%BC%EB%AC%BC%EB%9F%AD.PNG'),
('local:north114',7,'한우 갈비살',40000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EA%B0%88%EB%B9%97%EC%82%B4.PNG'),
('local:north114',8,'한우 육회',32000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EC%9C%A1%ED%9A%8C.PNG'),
('local:north114',9,'식사 냉면',9000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%B6%81%EC%95%85%EC%A0%95-%EB%83%89%EB%A9%B4.PNG'),
('local:one243',1,'짜장면',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%A7%9C%EC%9E%A5%EB%A9%B4.jpg'),
('local:one243',2,'간짜장',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EA%B0%84%EC%A7%9C%EC%9E%A5.jpg'),
('local:one243',3,'짬뽕',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%A7%AC%EB%BD%95.jpg'),
('local:one243',4,'우동',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%9A%B0%EB%8F%99.jpg'),
('local:one243',5,'볶음밥',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:one243',6,' 오므라이스',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%98%A4%EB%AF%80%EB%9D%BC%EC%9D%B4%EC%8A%A4.PNG'),
('local:one243',7,'잡탕밥',12000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EC%9E%A1%ED%83%95%EB%B0%A5.PNG'),
('local:one243',8,'군만두',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EA%B5%B0%EB%A7%8C%EB%91%90.jpg'),
('local:one243',9,'물만두',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%83%9C%EC%9B%90-%EB%AC%BC%EB%A7%8C%EB%91%90.PNG'),
('local:oneday972',1,'직화 제육덮밥',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%A7%81%ED%99%94%EC%A0%9C%EC%9C%A1%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',2,'메밀 (소바)',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%A9%94%EB%B0%80%EC%86%8C%EB%B0%94.jpg'),
('local:oneday972',3,'직화 오징어덮밥',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%A7%81%ED%99%94%EC%98%A4%EC%A7%95%EC%96%B4%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',4,' 수제 돈까스',6500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%8F%88%EA%B0%80%EC%8A%A4.jpg'),
('local:oneday972',5,'하루 우동',7500,NULL,' https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EC%9A%B0%EB%8F%99.jpg'),
('local:oneday972',6,'해물 볶음우동',7500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%ED%95%B4%EB%AC%BC%EB%B3%B6%EC%9D%8C%EC%9A%B0%EB%8F%99.jpg'),
('local:oneday972',7,'날치알 덮밥',7500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%82%A0%EC%B9%98%EC%95%8C%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',8,'회 덮밥',7500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%ED%9A%8C%EB%8D%AE%EB%B0%A5.jpg'),
('local:oneday972',9,'라면',3500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%95%98%EB%A3%A8-%EB%9D%BC%EB%A9%B4.jpg'),
('local:park451',1,'수제돈까스',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%8F%88%EA%B0%80%EC%8A%A4.PNG'),
('local:park451',2,'새우 볶음밥',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%83%88%EC%9A%B0%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:park451',3,'낚지 볶음',18000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%82%9A%EC%A7%80%EB%B3%B5%EC%9D%8C.PNG'),
('local:park451',4,'함박 스테이크',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%ED%95%A8%EB%B0%95.PNG'),
('local:park451',5,'치즈 오므라이스',7500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%B9%98%EC%A6%88%EC%98%A4%EB%AF%80.PNG'),
('local:park451',6,'메밀 국수',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EB%A9%94%EB%B0%80%EA%B5%AD%EC%88%98.PNG'),
('local:park451',7,'수제 생선가스',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%83%9D%EC%84%A0%EA%B0%80%EC%8A%A4.PNG'),
('local:park451',8,'회덮밥',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%ED%9A%8C%EB%8D%AE%EB%B0%A5.PNG'),
('local:park451',9,'우동',6000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%8F%88%EB%B0%95-%EC%9A%B0%EB%8F%99.PNG'),
('local:pot341',1,'새우 오일파스타',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%B2%84%EC%84%AF%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:pot341',2,'호두 까르보나라',23000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EA%B0%80%EB%A5%B4%EB%B3%B4%EB%82%98%EB%9D%BC.PNG'),
('local:pot341',3,'로제 파스타',23000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%A1%9C%EC%A0%9C%ED%8C%8C%EC%8A%A4%ED%83%80.PNG'),
('local:pot341',4,' 양갈비 스테이크',55000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EC%96%91%EA%B0%88%EB%B9%84%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',5,'안심 스테이크',68000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EC%95%88%EC%8B%AC%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',6,'한우 스테이크',85000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%ED%95%9C%EC%9A%B0%EC%8A%A4%ED%85%8C%EC%9D%B4%ED%81%AC.PNG'),
('local:pot341',7,'고르곤 졸라피자',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC.PNG'),
('local:pot341',8,'버섯 리조또',33000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%EB%B2%84%EC%84%AF%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:pot341',9,'해산물 리조또',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%BD%A9%EC%A7%80%ED%8C%9F%EC%A7%80-%ED%95%B4%EC%82%B0%EB%AC%BC%EB%A6%AC%EC%A1%B0%EB%98%90.PNG'),
('local:rabbit132',1,'크림 카레우동',11000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%ED%81%AC%EB%A6%BC%EC%B9%B4%EB%9E%98%EC%9A%B0%EB%8F%99.PNG'),
('local:rabbit132',2,'함박 스테끼밥',12600,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%ED%95%A8%EB%B0%95%EC%8A%A4%ED%85%8C%ED%82%A4%EB%B0%A5.PNG'),
('local:rabbit132',3,'잔칫상',18000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95+%EC%9E%94%EC%B9%AB%EC%83%81.PNG'),
('local:rabbit132',4,'카레 나베',11500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%B9%B4%EB%A0%88%EB%82%98%EB%B2%A0.PNG'),
('local:rabbit132',5,'숯불구이 반판',13200,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%88%AF%EB%B6%88%EA%B5%AC%EC%9D%B4.PNG'),
('local:rabbit132',6,'일본식 소고기 찌개',13800,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%9D%BC%EB%B3%B8%EC%8B%9D%EC%86%8C%EA%B3%A0%EA%B8%B0.PNG'),
('local:rabbit132',7,'돈까스 카레우동',10500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EB%8F%88%EA%B9%8C%EC%8A%A4%EC%B9%B4%EB%A0%88%EC%9A%B0%EB%8F%99.PNG'),
('local:rabbit132',8,'양념 닭튀김',5500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%96%91%EB%85%90%EB%8B%AD%ED%8A%80%EA%B9%80.PNG'),
('local:rabbit132',9,'오무카레밥',9500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%86%A0%EB%81%BC%EC%A0%95-%EC%98%A4%EB%AC%B4%EC%B9%B4%EB%A0%88%EB%B0%A5.PNG'),
('local:sa258',1,'후라이드 치킨',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%ED%9B%84%EB%9D%BC%EC%9D%B4%EB%93%9C.PNG'),
('local:sa258',2,'골뱅이 국수',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%A8%EB%B1%85%EC%9D%B4.PNG'),
('local:sa258',3,'생 굴',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EC%83%9D%EA%B5%B4.PNG'),
('local:sa258',4,'닭도리탕',35000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EB%8B%AD%EB%8F%8C%ED%83%95.PNG'),
('local:sa258',5,' 오뎅탕',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EC%98%A4%EB%8E%85%ED%83%95.PNG'),
('local:sa258',6,'뼈없는 닭발',15000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%84%EC%97%B4%EC%82%AC-%EB%8B%AD%EB%B0%9C.PNG'),
('local:sa258',7,'구룡포 과메기',30000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B3%BC%EB%A9%94%EA%B8%B0.PNG'),
('local:sa258',8,'꽁치 김치찌개',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%BD%81%EC%B9%98%EA%B9%80%EC%B9%98.PNG'),
('local:sa258',9,'황도',7000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%99%A9%EB%8F%84.PNG'),
('local:sam102',1,'수제비',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%88%98%EC%A0%9C%EB%B9%84.PNG'),
('local:sam102',2,'파전',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%8C%8C%EC%A0%84.PNG'),
('local:sam102',3,'감자전',8000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EA%B0%90%EC%9E%90%EC%A0%84.PNG'),
('local:sam102',4,'해물 파전',14000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%ED%95%B4%EB%AC%BC%ED%8C%8C%EC%A0%84.PNG'),
('local:sam102',5,'녹두전',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%85%B9%EB%91%90%EC%A0%84.PNG'),
('local:sam102',6,' 쭈꾸미',16000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%AD%88%EA%BE%B8%EB%AF%B8.PNG'),
('local:sam102',7,'동동주',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%8F%99%EB%8F%99%EC%A3%BC.PNG'),
('local:sam102',8,'소주',3500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EC%86%8C%EC%A3%BC.PNG'),
('local:sam102',9,'맥주',4000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%82%BC%EC%B2%AD%EB%8F%99%EB%A7%A5%EC%A3%BC.PNG'),
('local:sea133',1,'돌멍게 (중)',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%8F%8C%EB%A9%8D%EA%B2%8C.PNG'),
('local:sea133',2,'돌멍게 (대)',35000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%8F%8C%EB%A9%8D%EA%B2%8C2.PNG'),
('local:sea133',4,' 생선 통구이',35000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%83%9D%EC%84%A0%ED%86%B5%EA%B5%AC%EC%9D%B42.PNG'),
('local:sea133',5,' 문어숙회 (중)',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%AC%B8%EC%96%B4%EC%88%99%ED%9A%8C.PNG'),
('local:sea133',6,' 문어숙회 (대)',30000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EB%AC%B8%EC%96%B4%EC%88%99%ED%9A%8C2.PNG'),
('local:sea133',7,'석화 (중)',20000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%84%9D%ED%99%94.PNG'),
('local:sea133',8,'석화 (대)',25000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%82%A8%ED%95%B4+%EC%84%9D%ED%99%942.PNG'),
('local:suyeon248',1,'대추차',11500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8C%80%EC%B6%94%EC%B0%A8.PNG'),
('local:suyeon248',2,'생강차',10500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EC%83%9D%EA%B0%95%EC%B0%A8.PNG'),
('local:suyeon248',3,'단호박빙수(2인분)',21500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8B%A8%ED%98%B8%EB%B0%952%EC%9D%B8.PNG'),
('local:suyeon248',4,'엄마손 순 단호박 범벅',12500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9+%EB%8B%A8%ED%98%B8%EB%B0%95%EB%B2%94%EB%B2%85.PNG'),
('local:suyeon248',5,'단호박빙수(1인분)',11500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%88%98%EC%97%B0%EC%82%B0%EB%B0%A9.PNG'),
('local:table338',1,'새우 필라프',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%83%88%EC%9A%B0%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:table338',2,'비프 필라프',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%B9%84%EC%96%B4%ED%95%84%EB%9D%BC%ED%94%84.PNG'),
('local:table338',3,'날치알 크림파스타',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%82%A0%EC%B9%98%EC%95%8C%ED%81%AC%EB%A6%BC.PNG'),
('local:table338',4,'해산물 크림파스타',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%ED%95%B4%EC%82%B0%EB%AC%BC%EB%B0%94%EC%A7%88.PNG'),
('local:table338',5,' 에그베네딕트',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%97%90%EA%B7%B8%EB%B2%A0%EB%84%A4%EB%94%95%ED%8A%B8.PNG'),
('local:table338',6,' 스크렘블 에그소세지',10000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%8A%A4%ED%81%AC%EB%A0%98%EB%B8%94%EC%97%90%EA%B7%B8.PNG'),
('local:table338',7,'고르곤졸라 크림파스타',13000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC%ED%81%AC%EB%A6%BC.PNG'),
('local:table338',8,'자몽에이드',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EC%9E%90%EB%AA%BD%EC%97%90%EC%9D%B4%EB%93%9C.PNG'),
('local:table338',9,'레몬에이드',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EB%94%94%EC%96%B4-%EB%A0%88%EB%AA%AC%EC%97%90%EC%9D%B4%EB%93%9C.PNG'),
('local:wonbin423',1,'김치 볶음밥',4900,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B9%80%EC%B9%98%EB%B3%B6%EC%9D%8C%EB%B0%A5.PNG'),
('local:wonbin423',2,'치즈 떡볶이',6100,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%B9%98%EC%A6%88%EB%96%A1%EB%B3%B6%EC%9D%B4.PNG'),
('local:wonbin423',3,'고르곤 졸라',15500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B3%A0%EB%A5%B4%EA%B3%A4%EC%A1%B8%EB%9D%BC.PNG'),
('local:wonbin423',4,' 수제돈까스',5000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EB%8F%88%EA%B9%8C%EC%8A%A4.PNG'),
('local:wonbin423',5,'마르게리따',13700,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EB%A7%88%EB%A5%B4%EA%B2%8C%EB%A6%AC%EB%94%B0.PNG'),
('local:wonbin423',6,' 김밥',3500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EA%B9%80%EB%B0%A5.PNG'),
('local:wonbin423',7,'웰치스',1500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%9B%B0%EC%B9%98%EC%8A%A4.PNG'),
('local:wonbin423',8,'사이다',1500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%82%AC%EC%9D%B4%EB%8B%A4.PNG'),
('local:wonbin423',9,'콜라',1500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%ED%98%9C%ED%99%94%EB%8F%8C%EC%87%A0-%EC%BD%9C%EB%9D%BC.PNG'),
('local:young185',1,'차돌 떡볶이',17500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B0%A8%EB%8F%8C.PNG'),
('local:young185',2,'통큰 오짱떡볶이',17500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%98%A4%EC%A7%B1.PNG'),
('local:young185',3,'깻잎 순대떡볶이',16500,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EA%B9%BB%EC%9E%8E.PNG'),
('local:young185',4,' 치믈렛 떡볶이',15000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B9%98%EB%AF%88.PNG'),
('local:young185',5,' 빨간크림 떡볶이',14000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%B9%A8%EA%B0%84%ED%81%AC%EB%A6%BC.PNG'),
('local:young185',6,' 날치알 볶음밥',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%82%A0%EC%B9%98%EC%95%8C.PNG'),
('local:young185',7,'레몬에이드',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EB%A0%88%EB%AA%AC.PNG'),
('local:young185',8,'자몽에이드',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%9E%90%EB%AA%BD.PNG'),
('local:young185',9,'청포도에이드',3000,NULL,'https://s3.ap-northeast-2.amazonaws.com/nodeeverybody/test/%EC%B2%AD%EB%85%84+%EC%B2%AD%ED%8F%AC%EB%8F%84.PNG');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `owner_auth` varchar(60) NOT NULL,
  `user_auth` varchar(60) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `good` text,
  `bad` text,
  `image` text DEFAULT NULL,
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
INSERT INTO `review` VALUES
('local:andong107','local:2ub',5,'중국집중에 여기가 최고!','배달이 안된다는 게 단점ㅜㅜ',null),
('local:andong107','local:ksj828',4,'사장님이 친절하셨다.','음식회전속도가 너무 느렸다.',null),
('local:andong107','local:sehun',5,'서비스로 주신 군만두 맛있었어요~','주문이 밀려 늦게 나올 때가 있어요',null),
('local:andong107','local:xiumin',4,'사장님이 친절해요!','탕수육은 좀 별로...',null),
('local:baek310','local:jin96',4,'탕수육이 부드럽고 맛있어요~','짜장면이 좀 별로인 것 같아요',null),
('local:baek310','local:ksj828',5,'홍콩반점 탕수육 너무 맛있어요.','대기할 때도 있어요.',null),
('local:bailey233','local:jin96',4,'리조또가 최고!!','직원이 조금만 더 친절했으면 좋겠어요~',null),
('local:bailey233','local:ksj828',5,'리조또가 있어서 어린아이 먹기에도 좋아요','없어요.',null),
('local:bailey233','local:moomin',5,'파스타 맛있어요~','비싸요ㅠㅠ',null),
('local:bailey233','local:sehun',3,'맛으로는 최고','양은 적고 가격은 비쌈',null),
('local:bailey233','local:xiumin',2,'분위기가 좋아요','너무 비싸고, 종업원도 불친절해요.',null),
('local:best742','local:ksj828',4,'오향장육이 끝내줘요.','짜장면은 별로네요.',null),
('local:blackme37','local:2ub',4,'한끼 든든하게 먹을 수 있어요','비싸요',null),
('local:blackme37','local:ksj828',4,'흑미를 이용해 특색이 있다.','교통편이 안좋았다.',null),
('local:blackme37','local:moomin',5,'흑미를 사용해서 좋아요','없어요',null),
('local:blackme37','local:sehun',2,'사장님이 친절하심.','김밥도 그렇고 라면도 그렇고 전체적으로 가격이 높은 편.',null),
('local:chsun237','local:2ub',5,'돼지갈비 꼭 드세요 꼭 꼭','포장이 되면 더 좋을 것 같아요~',null),
('local:chsun237','local:ksj828',4,'고기의 질이 매우 좋다.','포장이 안된다. 찌개류가 없다.',null),
('local:domino801','local:2ub',4,'고구마피자 맛있어요ㅠㅠㅠ','시끄러워서 입으로 들어가는지 코로 들어가는지...',null),
('local:domino801','local:ksj828',5,'피자는 역시 도미노','배달시간 50분....',null),
('local:domino801','local:moomin',4,'당연히 맛있습니다.','애들이 많아서 정신없었어요.',null),
('local:domino801','local:sehun',5,'배달시켜서 먹었는데 30분도 안걸렸어요~','배달오면서 흔들렸는지 피자 모양이 좀 망가져있었어요~',null),
('local:everest148','local:1155',4,'맛있다','비싸다',null),
('local:everest148','local:2ub',3,'가격도 싸고 맛있어요.','분위기가 우중충해요.',null),
('local:everest148','local:ksj828',4,'진정한 인도의 맛이에요.','향신료 적응이 힘들어요.',null),
('local:fire998','local:2ub',4,'짱맛있음!다음주에 또 먹으러 갈거예요~','직원들이 무뚝뚝해요',null),
('local:fire998','local:ksj828',4,'고기의 질이 좋다.','직원서비스가 안좋다.',null),
('local:garden352','local:ksj828',5,'데이트장소로 좋아요','없다.',null),
('local:goldK256','local:1155',4,'돈까스 엄청 두꺼워요~','사람이 많아 시끄러워요',null),
('local:goldK256','local:2ub',5,'왕돈까스 짱짱!♥♥♥','x',null),
('local:goldK256','local:chanyeol',4,'할인이벤트가 많아요','할인하지 않을 땐 좀 비싼편이에요',null),
('local:goldK256','local:ksj828',3,'대부분의 돈까스는 맛있다.','생선까스는 좀비린내가 났다.',null),
('local:goldK256','local:sehun',3,'맛있어요 양도 많고~','사장님이 반말을 쓰십니다.',null),
('local:gosun147','local:ksj828',4,'가격이 매우싸요.','엄청 맛있지는 않았어요.',null),
('local:gosun147','local:sehun',4,'간단히 먹기 좋은 식당이에요.','부산어묵 국물이 맹탕이었어요.',null),
('local:gosun147','local:xiumin',3,'착한가격','부실한 재료',null),
('local:gwangju773','local:ksj828',5,'음식이 칼칼하고 해장에 좋아요.','없어요.',null),
('local:hong192','local:ksj828',4,'고구마 치즈롤 돈까스 최고에요','배달도 됬으면 좋겠어요.',null),
('local:hong192','local:moomin',5,'자꾸 생각나는 맛♡','없어요♡',null),
('local:italy331','local:ksj828',5,'진정한 이태리음식!!','아기 엄마 너무 많음..',null),
('local:jangsu489','local:ksj828',5,'감자탕의 종류가 매우 많다.','대기시간이 너무 길다.',null),
('local:jangsu489','local:sehun',5,'국물 죽입니다.','tv나오기 전까지도 단골이었는데 이제 사람 많아서 못가겠어요ㅠㅠ',null),
('local:jesun85','local:ksj828',3,'집밥과 같이 정성스러워요.','집반찬과 크게 다르지 않아요.',null),
('local:kan316','local:ksj828',3,'중화요리인데 너무 느끼지하지 않았다.','우동은 맛이 없었다.',null),
('local:ktw118','local:ksj828',5,'스시가 너무신선해요.','가게가 작아서 자리가 없어요.',null),
('local:may501','local:ksj828',4,'짬뽕이 일품이네요!','배달이 느려요.',null),
('local:mok330','local:1155',5,'면이 탱탱해요','좀 비싸요',null),
('local:mok330','local:ksj828',4,'오색면과 오색만두가 특색있어요.','가격이 너무 비싸요.',null),
('local:myeon1013','local:ksj828',5,'냉면이 땡길땐 여기로~!!','없다.',null),
('local:north114','local:jin96',5,'고기가 입에서 녹아요.','직원들이 바빠서 불러도 잘 안와요...',null),
('local:north114','local:ksj828',5,'고기의 질이 최고에요.','가격이 너무 부담되요.',null),
('local:north114','local:sehun',5,'북악정 고기는 진리.','x',null),
('local:one243','local:jin96',4,'메뉴가 진짜 다양해요ㅎㅎ','음식 나오는데 30분 걸려요...ㅎ',null),
('local:one243','local:ksj828',2,'맛은있다.','전체적으로 조금 짰다.',null),
('local:one243','local:sehun',5,'군만두 드세요 두 번 드세요','x',null),
('local:oneday972','local:ksj828',3,'서비스가 좋다.','평범한 맛이다.',null),
('local:park451','local:ksj828',3,'음식이 빨리 나와요','직원이 너무 없어요.',null),
('local:pot341','local:jin96',5,'너무 맛있어서 매일 먹고싶어요~!','오래기다려야해요. 맛있으니까요.',null),
('local:pot341','local:ksj828',5,'데이트 장소로 딱이에요.','가격대가 조금 높아요.',null),
('local:rabbit132','local:chen0921',4,'크림카레우동 매일 먹고싶다...','좀 시끄러워요',null),
('local:rabbit132','local:hyk',4,'크림카레우동 최고b','오래 대기해야해요ㅠㅠ',null),
('local:rabbit132','local:ksj828',NULL,'데이트하기 좋아요.','대기시간이 너~무 길어요.',null),
('local:rabbit132','local:moomin',5,'양이 많아요~','사람이 많아요~',null),
('local:sa258','local:ksj828',3,'소주안주로 딱이에요.','오래됬어요.',null),
('local:sam102','local:chen0921',4,'국물까지 다 비우게 되는 맛이에요.','단점 없어요~',null),
('local:sam102','local:ksj828',5,'진한 국물이 일품이에요.','없어요.',null),
('local:sea133','local:chanyeol',3,'사장님이 서비스를 잘주십니다.','신선하지 않아서 아쉽습니다.',null),
('local:sea133','local:chen0921',3,'종업원은 다들 친절합니다.','신선도가 떨어지네요.',null),
('local:sea133','local:ksj828',3,'바다의 맛을 느낄수 있었다.','해산물이 싱싱하지 않을때도 있다.',null),
('local:suyeon248','local:2ub',5,'여름에도 겨울에도 먹고싶어요~','없어요',null),
('local:suyeon248','local:chen0921',5,'매일 먹어도 안질려요bbbbb','품절돼서 못사먹을 때가 있어요ㅜㅜ',null),
('local:suyeon248','local:ksj828',4,'자연의 맛을 느낄수 있어요','종류가 다양하지 않아요',null),
('local:table338','local:chen0921',5,'이렇게 맛있는 필라프 처음 먹어봐요.','매장이 좀 좁아요.',null),
('local:table338','local:ksj828',5,'음식이 너무너무 맛있다.','가게가 좀 더 넓었으면 좋겠다.',null),
('local:wonbin423','local:chanyeol',5,'치즈 떡볶이 왜이렇게 맛있나요?♡','x',null),
('local:wonbin423','local:jin96',5,'사장님 친절하시고 양도 엄청 많이 주십니다!','단점 없음',null),
('local:wonbin423','local:ksj828',5,'역시 혜화 대표 맛집!!!!','단점없음!!!!',null),
('local:yeak103','local:jin96',5,'초등학생때 학교 앞에서 사먹던 그 맛','x',null),
('local:yeak103','local:ksj828',4,'튀김의 종류가 매우 많아요.','사람이 많아 대기가 길어요.',null),
('local:young185','local:chanyeol',5,'good 맛있어요~','시끄러워요~',null),
('local:young185','local:hyk',5,'청년다방 사랑해요','없어요♥',null),
('local:young185','local:ksj828',5,'역시 떡볶이는 청년다방!!','살찔거 같아여.',null),
('local:young185','local:moomin',4,'떡이 말랑말랑해서 좋아요~','양이 좀 적은듯 해요~',null),
('local:young185','local:sehun',5,'떡볶이도 맛있는데 감자튀김까지 맛있어요ㅠㅠㅠ','비싸긴 한데 그래도 괜찮아요!ㅎㅎ',null);
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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES
(2,'서울특별시');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `number` text,
  `tag` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_auth` varchar(60) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address1` varchar(10) DEFAULT NULL,
  `address2` varchar(10) DEFAULT NULL,
  `address3` varchar(10) DEFAULT NULL,
  `address4` varchar(100) DEFAULT NULL,
  `image_url` text,
  PRIMARY KEY (`user_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
 ('local:111','111','gszzjiLPee2oY/1OkLzTpWgC+FmxSFJlGnMvC5kO7l26cSQXuolsGpASMFF4fS/PPRLMcFo8SaIGkyBXVqwcWxduFkuGB6wtxtUnfetPuV053IPty7P70s3L6cIQBhmtXxKT1tbcv800rWL90mv/CakaFq3vmf5XusYqtmTXSuM=','yJXKAt+fqi1W2qPf2OV7s5SGkOdTs2fnDkcwjmPaRVjn9oETCjnAhZgSnfli8pOgMGfhq5ZHWKAIGPnkTYI2cA==','이현아',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:1111','1111','C+0yozIK/uTZ9PxBqE6nlXzngvTF9QeRCNiPJRvilUtx3/LHJGcrl80C7d29TnsRykgq0vFY/wp92W2cWYDLt7oxzpHgtDtR5sPg3iKoN3fPdjl6lkVKXhAhuv/3joNNd8/uyraaz2WA+M4sp46mFLSEz2UbDdj5learMlCQNRg=','X42q+bsqhwKCggitPbcXmtBLcIx2p4Rswghp6yP58YlAf+hWTTqVa4LS9QPcuCIfJ/uSj46CHaXMOEPwrcJClA==','1번',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:1155','1155','WZba4CB9EhTZhG32lm/GnajMN+4R3GnutBjxDvqHNWKihZ64TQGeggPp6uKcTA1ZNvBftmojUTRyEntRVRvFi1KXDpe89gSSkgKg2DM8bteNCsdFJVP8fG4lA3DYAn6/REy4GAz+0hOr0lO0cLX1eYy3lJwV5MvkaR5VbtbH6n4=','sbQdcc6RsMPqs/MMO1zTk7yUAxuZ7t1J6tGw/Te6cFD9B6/6PhZiKJSFKbYz/S/cDEVOCuRu70GbxwC4hyhMjg==','노트북','','','','',NULL),
('local:1222','1222','yPyGG6i5UhY9b70XygLElbwg0TrfFDf7nB2dAHDkq6SGcuwgJOCqJZrGTvC6rjdZiDptVRynG3qPGEfzUm+2DKuyreGvdDhRzZ+TssUdamXUswufxKkGxY3upmaaf2Xhj1sfTMu+Hz3X2JRaRv0mRCwXZtc14+dQAqPB3SEGqd0=','gIvPMiImzsW8fIiinALZcAdahABYLa9wk6tTA618oHBxmeAAJJuDoJ+76PiuGA1URjVMLJ7+El+ue0sKj9Or8Q==','1222',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:2ub','2ub','RU/EJMj22FJUGLLXaVn/VssG7s109rjnDolYLuHVYBvtjacl9p5dyHOLNpZjTb8hba9blJtYJkfwQa3+/SGks1UpNTRQawjsqlVQt+AyceFy9MP9FpkMbBHFGTxYc6a0JS0xOe17BCyg97WC7ib7hmFE5CwARDE5wh7l4MjbMo4=','oZqGbVJnD/BSTdxHXOpEKY9qeW5e9WBmVlz8v6qZJKn9Zsyi0tBBTXlNtqH8Bz58aTKFITILirpOb1A4XjRqHw==','이유비',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/ub.JPG'),
('local:A153','A153','JraPeqwcyWLYOgTITezmkcYslmj3HvAPfC8TheHkf43Q/7MWc6k86GgIJKYabcTvDVNasn7Vsl1djpOT4T76eIJt9tqY/fzpb3cfQNPDpPyQqsGmIoaqR3YWn7+TTp+W8mXUmxPHILxgVNLJPkaGxJH3o4ReLQJ+l9SRiIBStTs=','fBa51/rHwI9vhve3/wojPGVtTmzdG6AbKJJh5Iyq/KWTjTZ/SwXPBdZBViKi6T87hlBAiArfZJXVTblH1kjJFQ==','A153',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:baekhyun','baekhyun','rxXowXZ+Ezb9Px37VRr7hrzzlvpcVzF2ex2PtXWAlvT2WGDoBOCcCH3waPLdH22cnUlScBy2+bouKTjoClnvuQiOyWAc2dadswBVi+FXz1krHF3kGAf6osHxwMipBBYe+F5mELeJ1thPWReThbh3HPqg2jwY9iEgpDH8p8783bY=','ywgwEAIP6wj1kjuUMxHBoYXRVSrhppFjl4s+Og7fSwqev8cV4w+GseInAWL9P+vXuBUG8ElOQEVwOxW1UUvnTQ==','변백현',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_20171127_201150.jpg'),
('local:chanyeol','chanyeol','PGKDImbTiye55CwM9S1lh3lh9tnIgRoD8HFYebphyWgOUDeN9RLuHqI+6rQ+rIx2e8TeSKaKzMStBjyPRSMfrC/KhtHa2c78RYi9xjOImXzUvDbZB3xoxA7ljFolSvtzrM1Pmhm9FW2nzYVPoeR9DMW+yjj6LvtoYQl1rGH2whg=','XSLFzf4PWaW4murRLrYCGdS/8QG+s57aTxXYMPWB+AQUOzyy/eR7iVY6EMA9F8+LI3QY9cDGFlDx+Vt/M9gSFw==','박찬열',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_20180304_161413.jpg'),
('local:chen0921','chen0921','wVAWob8JBq91YG9s7/GL+RLHbXcoZg56p9GCBn3PJNKvdm6up3snTf9/i3QzDtELN8btMQNzWpgkamyJ0CGNA7ubzjAe2ELa9KYc4Og/1woWRBnE1gJDquqk2B3zF3mOlUH4qAcw6blalSzkrdyAfcQ/YjkmVFtU0Ar7CGN6pB8=','W5CiHGydC4Lx7NEzIldYtvNdeipSAQzEoNmVx8v7WdwA/8V4ZBEqGBIXYzdLOMcahc1DYWrd0ggL+A6DLuPeWQ==','김종대',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_20180424_142447.jpg'),
('local:do12','do12','B22ZcRc28zLRpnMmYZdBRdgbD1UaqWiA/DGH+7amDe4ptKHpGgF6YLbiabpTlhXavDJZllWr161xpJzqK6zLhYF4cpJti4wkyaHcxxWcWLDuGmWXlUpLa/S0Jz+FCiLZuMwqiQJEeCxy5azyVxa1CvsPuw/7JnFdZZO8xvAo4tE=','rJ8IT9sM0Qb4pFFcR+2ty96CFdk1s0+raE+lFOayIY0RoXt0qlITiohUJIRkU9/h7VH6RAWaRDzXDuf0dXE+2Q==','도경수',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:dy1202','dy1202','w5Xq/hifJ/hZnzb+KywACV3ghNzNHNqQdo1Miywn3yRGmXAXn+2hJEkqXj8ntV2KNCEjbKk9iVjiE8gyBivgRKWRP+0KeYdhjFVskaErfYJ5agQoXZI7q8BSuNFGyeyaOeGwnf5iykkzNOn6N6uLiKI8FGgBPQ+i98Np2zByIWM=','F18ZgsjLO+92lCJ2KB9cPjepQeBb+6QyF6A+rbOzIX79479+LsLaHB+1C/vb3ZEDWPu+5gI9oioY9xAMFpMV6Q==','황다영','서울특별시','성북구','삼선동','','https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/KakaoTalk_20180529_190814528.jpg'),
('local:emmaoh26','emmaoh26','111111','g2','오지은',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:god1031','god1031','VFD3wQaBa4IwQdLzcCmiiLzV6hRVtDYpX1oVMmZuV4JSK7rixToOchKyXGTOQJBAtCrbwvy9I0QqYdZEcPhQ+P5KvRJb/s7ymiwCTW14R7f3Cb5JOc1DysjIAteUUX6QiWDsIn0iElPo2H9Dy+pMFWuSfqaQeEd6not34Qawhig=','QMePKvuR7cyiZV6BKHR9mdWPT3FPIpMzaidDc7/uycwla+MaqURKVFMa0EzJBr+/Krz+zdd8IlisCkVYY/Ztwg==','김태우',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Chrysanthemum.jpg'),
('local:gogo90','gogo90','nZYrRXyjj/Qg2BHgWv7gdSRT5AwxAa2BkrykXzxz1l+e+GdYR79yxLHzXTDMxETU1umqNUbBXQc59Da0/aHOlCiZDm7brIvUMg3Fm4OCKzgDLRFMt80vIFrLCVNTktOTLDmwJxu7LI17iOV0751dHUWXYV7EnF3o9iGIixR6WTY=','1Hh5nIxQyMaNqd5fPON6nl5mjiqV0N4VtKzu0X35qRNq7vsm5Uy/7JGQb7hLWhlAlNapqTw8Q/+9ElrwQ7ri4Q==','고아라',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/%EC%BA%A1%EC%B2%98.JPG'),
('local:ha0610','ha0610','+kNVpalBV7MhzekixZhI0dTUyAFTqOExwPiywaFx7khWYZbrhg+Xp/GmdCyht9OB+TDM6vYPpmjbdISCCEvpn9mBbghOWpjz93uZuokxjneF1hGFlWb9gFyYUAU7/3+GY5BtfmkZwdIp9nlyGlOC8x3S0U0d3gF9uF+s/YY45mU=','8I2gpDdyuozEgn2hDVvEdfRADditMwZA7YJRm5GEnP5JAMfnnRrxEED1Xap9eSN2HlyCikrLh1W7vWUKAOIVMQ==','이현아',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:hansung','hansung','vZBr1uyBMicDEd9TGP6bMIQHwq2x/5KlosXcrsI5vjOFISFnzJLrciz39KvzQtURSuKRiQNFC4LHH3AZCJ7lJWSpKb230zlV7HWr0ZbNrlUB+2oOaOzc2THbT3q1Z9fYKucPMNxR6C1CgNBZtXhg6Te4WZThflO/bG2fPefBp0E=','zTGEjGHsNNWH/CdGu8uAFKmmR2rNKoqsD3lnbmUEEyaetMDCKqREzqHgVlBxQZpouWiSc++uhmDSgeiFPlO4nw==','한 성',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/QRCodeImg.jpg'),
('local:hoon0222','hoon0222','o2kGQOuqB67McXNlZYT1SlQwBAL/BQGKtR897gCPqZs3Kq9k8S2gsmYH6CxveUhNl+lwR1hvY+ztMrdoPqIEvYLJvYKuhNP6hQaKtZTEIWiOOIxWnEOhlsxXC/L7glhWzK+HrH0zU+kn2Gv1O55rKC/UQCk4TTyUvKJstbfGJdc=','GHadRFNlLYfykiI2NpfBvIuObdeOXkUhbIxJf5vygptntizprlDHMCYhXzwthS4BPyRgy2nir3DOfHw8mDhi4g==','강성훈',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Hydrangeas.jpg'),
('local:hscthsh3306','hscthsh330','111111','g2','장희수',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:hyk','hyk','uZoe4KnRozUqYZMo1qNJz/e5MkKiGC7+GohOscPVHEg0QT7BfLOMY6ckLBjYdd3Uhf02Dq90+KNe5fpbwKST5uw4EtY7iWZOZOmX1BmZsLdrmo1UYszF0X+491/vlRQegJQm9Pt3e4xpTr84pTsWKN0hUgpSGyYXGQbVtX1pyFY=','qSf+BGQ1oiVT5AZB3OzuGDGqrBvl6VKIiAJJI0N0XRPnJgvYHOb79HMEnL16vlPhycB4nKDCeMt8SOLr289ZkA==','하유경','','','','','https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/%EC%B2%B8.JPG'),
('local:jhkdie','jhkdie','111111','g2','김정호',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:jin96','jin96','qJJ+4vhgDBEC8gxS4Rm9UNDmqw+nHBsmh7n8cMWtQNVq+WxnKgSlgJueLxr/y+tvfBQ2yzQwtwPu5XbCbT12mapBbqnGmSaD07zpOE9nm8ppya1HXaVfC10RZUh9nkAy3ysXqaCIMfntp0QYLT+B5RzREZIVIiaTxk6hMq8jpCE=','aOb4v7W+kMwxdR3qeMZgB1/1cahL3wo0tfr+T27pY+dCrkDNZvPS+e3t2YuUR5FJwf6RVzhELDv9l6nAjT2Kqg==','박영진',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Penguins.jpg'),
('local:jw0628','jw0628','nzw5VJp98IZcESQQPUWnR+ImavUZh/G3zy66McJihklQ1A0kZNoIB0rTX1S7f40LYi0KLQmD2ctbkSKMzwOpbqCtRaRh4LwN/x6a2wfVFEemnhSUJdSVzGQCcaPuo02mLfW1jjs/wApQLkrXoytfUHXYFltcYbv0dcwrwRgUZDY=','10ipOPLdnr2LcWqJ8LNJ4LEcs+f1Ki+WAr1YLeTRsd2/UC5DqlCLWvnMe6M+pqNQkkvknMnk8Zfwpqm3st1eiw==','이정욱',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:jwkasa','jwkasa','111111','g2','박진우',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:jwl628','jwl628','111111','111111','이정욱',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:kai88','kai88','O2WvSMBi88imrUIkPj1HgrLrcNzMAmmd6uezsKwQ8+TXc6TrGKzXyRhjnZeBZXUvSCt15I7ZQqmvAehmKfjHyZvQq930HcHmK/K3JVBvUxfYo8YiCrjMv+YjMQwusH58aagMlcI9FwbXt8NhcTOgOOjOOfH2BtjBFvIL82l0njE=','vpzei2/52K5+X2l54Tnw8n0QiXXciiiSZS2NQXGi/ToT/NsE0thIv0iLO8vBxtFEtsdfekg62wpWGidCaRq8Zg==','김종인',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_6774.JPG'),
('local:korea1','korea1','QCJoVvAqXqG9KtnUElFRKfAjFN67/a6U9ZlcYw+PTBiG0xBiML9WPvwQ/pxawBeIBHnVJAp5EwQ+KCn3FSWaLNivwVZ1Ucmgfp3IzUfIuyvIIDArPxmR//xHbN1eBIBHXVZgSLyLfl5aNr8mbHb6C6G4qC0l8hAapvACFILreaM=','xMHhUOmt7weoQVAzIdAgzGq7rn5bT2J3K/fx5IbchU6nB7sfCXKb6pUlaajCtCigU+AmO0igpRqfCgfpc/V20w==','송대한',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Tulips.jpg'),
('local:ksj828','ksj828','UTx081W34X/8PtIWAHPoD0mw9KRpW+Knv4W2FpDVpfIyLIJzXINMq+c8M9+TnPCghtGNFZVSgt6BQdhSMDu8tqId1cvUu97rzSBPYLbJWVYxN8hkUMTvrRVDeeXzKDcbZXEdJERqicmdAh8xdDsz4csLesjgEFzCbK7Qgzmk/KE=','8vGStv2kZhJNsKgLHjZY/bBH3GApPJGbMy1EXf9PET62PUPKuxYDyP/C/8lpNEckvk3Lf7fTqoJbrBI34e8f9g==','김세정',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/%EC%A2%85%EB%8C%80.jpg'),
('local:lay76','lay76','qdzU+QtEF9duyjx/z0L8Z1KdqLX2TebLNIa9nhERYzC92Gye+vXah9aFUFzy9Rpe79sBgV0IOTcCM9EFNIEJnlNpIQb9/cvbt/kXMdULyvr46N6Abei44uNz6YZAuwDPBSVh8Owrc7QZwfqiIYvsna0vgFVYM+iTtgz3+ZwVFo0=','vkkIYERmwtzjnZPxWLMGLOckHoQLjoIooNqJFVPuxMGksSe+BWahrwScPRfxrRZ83HQF+ak5u6REyaE7+7FxLw==','강윤서',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:ldhfall','ldhfall','111111','g2','이동현',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:lef56','lef56','ZfA1/1Qu9nb0lhlEtG8Xx9KD3oHdhaagWsSduhRm7zYq3xZPZWbbjqFKYgEXE6EVuRIH01N5eQgYVV/71EVLqKP03wFhP57dmnjz6uQMvM5ojpk2gHEMYQuDyTUJWQorgmB/Kf6TKY8uAq9az6dqIjP+Pf6a/MPiKXHWsctvYQ0=','6grH29prGSKfY8DgL6ScXZYyhaz2nKDShAK1MzohaZFZpODmCAQfNo4kSKAmCPcTKt1eEFo++CKXSzqzXJEpgw==','강동원',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:lha58','lha58','pvTtbLKCLf4I7ivvhk7onGOZzEdoqGMOI3YkSuZ9pen/VRQPdQZu8fraUulhzMcaxRqVXtuRRmnWf7gSgtcJlzUQramnWnd8fnMQxOwpGmQle+rX74rYAoyF+dk2a7f/KWNj+0km5ANCDLKKhylsnsc4u2O7NfWnJ7u7HJwwEvU=','h9IT/J1maLDTfeU7rDDiOt9KK6gVlrPgCSpFaoctqHShMVGmvJxYSOX/2rwfYzvZundPXeA+LjudsBI/a7axmA==','이현아',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:moomin','moomin','j5BoZ/LgFsrycjHzlzE3KnQ5Wiu3x0ZKpXf9TvNpmOjUdXbOnSxeWEr1CgRVQDTvGb1po2AU6s4GDxQw1ebrSpK2dGdVHrppTEGyw9AmYyFlE7aeQBmTw76Av2BqTK3FtSQ92IH0zUzQHzyKKS4y+G4cg2redyzF9TXyd7lfAGI=','oetaTGcc+m1d0Ksjlw7UATmsMCKYEQpQ54Gy3JS3+AFsq4OkxBYR+OPEVTCsa25S2NS9w4OJ9FwwjfUEoBXZWw==','강무민',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_0159.JPG'),
('local:nsj888','nsj888','111111','g2','조남수',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:park','park','/9YxQc9WnZoAgvlsd8GhJinKpHTz1HdP7g28VstzTXMdUtpzLPUEE+JsuK/0vLGfT21GSN6VSHoBenIZ+9CkFwqjh0C2FZemDLNRqZr3FeG8ybtlK6W+yYKS1Ff4JIV8rcnpMg+YAUVENhz7ZSnaJkVlHRG1xhxbymjEq6Vu7J4=','5mUiNZzMDkYYjzmBQASdPCQ9qZYtya+SWe/kG+lj7QIaEgY3P7NvKDRZQzvpoW3IA6MCcyeWPr8WO9Xl8vEgzA==','박찬영',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:pha8282','pha8282','ZkCdiVj39PoAAFc2lAObus1AyMcp4+/oeToM5oJhzhQMJn2UaXtR9HDioRyU0mfH8mGmEBmiYDUXd8W2gQiRYDzwCDRjbOij+hyZRJxxkMZhQ7FnzCQOdW0W4MJ6RXiyxr68P4LyTsj1LDb5xNAIEUmXDf0fn4ZcTexzgeAAPwg=','MEJ7YrMyN1j2vMjioJZFwPc5RsjCwbXEvBFpRcp9SsflSzOJ/fBwRQu7IlmQKJW2UT9L5SnKd2YaYu0+5BTKkg==','임기훈',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:sehun','sehun','hECcys5Z/pGHy8rDfcaFVXRVI5CiNTcoZH2ZEX4+hrlEG2kbEXG994jLCpAsKnVYLM3plDgO1dti93txfLZ2yIuWLCCqx0y1JAod7OtRRzTUwvNIDWA0MqUmzV6+7FafMY9ozfyckEu2lWkn1brcGjkznPSvOLig9+A6usCsb4A=','5EJg+gH5lHLJ2IrUatsywX1uj0rePVBJInp9zupQbcO6tJX+q4TKd2WAN1R1W/Ol4cqSXpaGypWrBns1U0P3vA==','오세훈',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_6630.JPG'),
('local:skeleton','skeleton','cphVlE3Y2qo0u6U52hi+iPOhCu+U+IcrWvBnPYfsDegqjqyz2CfcvraY5waqaCoQ8x9roQ3sv0l+Ir7RVZxfmhSJHcoYo+VEbLFILs7vZAb/RDeamffAnJnIZmKbPTIC8e9T0+OgPCxWGX5oM9uGHhcmU4Hn/UgOd/aeo+i487o=','BVUgZAoP9mP8m557xfiHibclOGp7ZW0hE6nO+8c0uMJFlmU3h7Iw8XDTM2XlqNVPQrFJMtWx9hp0HylHyG9s3g==','윤성빈',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Koala.jpg'),
('local:suho1','suho1','40zKOYUTvUGr5qIozE4j2caL5TyBE2W+i0cXdMiGxvR8OJvtjuAcXpD8fiDQuh7rMzfV/LtIzG21zLGF1PRc3jc+yZVKj70X1GVTocqb+f3JKQDKRK5ZMWvjDeIXEwnaFXMpX5z+OobBAyJICwZKhQUJJ4TfzNL2kYXnE4SAtjE=','JUMDjfS19hfBRF8khn9FWKChuz2BY66+CSruAXtvfcZWUurBy0e+p8On9fX1/v2jv8uOfYILsOfnrF8pfyihSQ==','김준면',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_20171230_125819.jpg'),
('local:twice501','twice501','Xf4oSOXByNJHx8Dg0pVHYcmI87B9AoPFADfGS//XdaSZcoNxS1umQmtcLtBNHN4/Fi+eH5/X8Zd5Vgc6tI8oAVK7kCRMx5J2HlJWRAPeys0lzujTjx83FpgyYJhGWQ+0EXzJBviivsf+XxMGmBbz+DUkRKTIgpO3jD1yqkYtH4U=','3EgihEwjeNH+xC7ClWO9PXqpUvu/8WQJPh4a/tnc7GWPN8idc7n1pPiNW0YRT9XuuHJFBRt1a7tLGpo8xnNADg==','임나연',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/Lighthouse.jpg'),
('local:ujjang93','ujjang93','111111','g2','유광형',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:xiumin','xiumin','mGNSZXSAJRODDzfVmlKrjDCjdFAIkCWN8lrfQfkUqGV/rD3p0zyjQHJHAyfyR/6/2R+y9srEGBYv7LQrqe0YcixStJdWqSg4D5k+136neg11MtaknAj29A9sxB5Dj5oNWfjNox2AlfKANikU1vzd/e/zAaScVbuCvdI8qMrYJRY=','oZrNx62m8XikRuPWwaE1LxfBGKA0LmYKfi6INn2+dKXLh4whz6m2MaviJZNvHA28ajZUT0lgj52HkqYl/mFQ4A==','김민석',NULL,NULL,NULL,NULL,'https://nodeeverybody.s3.ap-northeast-2.amazonaws.com/test/IMG_20180109_133318.jpg'),
('local:y111','y111','Si0hqE/nrY/a5FhFsy8/1vW/hRgmr2909LTXeZQejdVfnM4oBZ+0eSweBrY4heGujuKyBYEkB7FTpZpN8k/JMN6CCacFiVc4Vf+G3VbithV5CjoT6FOf8JoXfCfhgU+MbHJ+UC4LzoDazp9K0elIBjSdD0XHc8CiCMwUl9Sxuj8=','Ctokbo/8MLqCn9RkuzfiN7iXvhBJyUYIt99U+ge8YdJot51X4XJ5hjyw8lSw36R4fs0r+utVmzc0T3il2C5T1A==','y',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:y113','y113','2DqAzAsu4BFYdIk7hkUGTi7WjVzgxaEeMe1cqdivgYEJuEikNE1zjSIsUQ9auYvdRYHA27xWl86HLatMDKJzsfk0nPlHq/9l7R9o/OxlGyp2ks2RpW2XjEkAq9DdUxY+gwuQn0j0DHD5DXRsQf8jl24OOddKqoqpfYLGAlQLHyQ=','kQHBM0Cv1ZSu+VVzrepDwC7eoD62FNxn49dsUb+bXoMS06LRYaU2oA5pQJgX4ZW6sxrpwHoEnqMAlU5i/qVdhQ==','y',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'),
('local:yj0309','yj0309','vcYdQXeUQUruWnOYhrOSnMYOTjC/GLMXPX9wqESnKl2gnEEMoYTFlev0q7SgDAaa6DMvJeJf9YM54BIEBURND+Vi6SMellvBOwpR/sbhHYjfn0lZyvO/SeL/5SU7hVwuZdkORqPNFDoGi7q7aylA1QzUm6y2wbLuIEK2FVDYFG4=','66wF1XbTVDsHzJnJ18CzjIsx3eASiL1TOrmfcyOoO3q3VjJlh/l8preVTCYpAqiKCXySKeCqKT53I12G8RC5pg==','박영진',NULL,NULL,NULL,NULL,'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-29 12:57:04
