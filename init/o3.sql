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
-- Table structure for table `content_list`
--

DROP TABLE IF EXISTS `content_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_list` (
  `owner_auth` varchar(20) NOT NULL,
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
('local:chen0921',1,'머리고기 설농탕이에요~ 아주 진하고 맛있습니다! 해장용으로도 그만!',180511171730, 'http://postfiles.pstatic.net/20160615_124/fayry_1465978685029Jsglv_JPEG/%C0%E5%BE%C8%C1%A4_7.jpg?type=w3'),
('local:chen0921',2,'돈까스 모듬 정식 대표메뉴입니다!',180512171730, 'http://blogfiles1.naver.net/MjAxNzA1MjdfMTgx/MDAxNDk1ODg0Mjg0MzYz.M1ouKAkPbV-gCUcT9DBeCJTMSza0b-VrKG0jKukvEzog.aHCmh-LD47LkmdtpmlD6u_eHBY_feYf8T63DyxiDp98g.PNG.kimmeej4989/%C0%E5%BE%C8%B5%BF_%C0%E5%BE%C8%C1%A4%B5%B7%B1%EE%BD%BA__%B4%DE%C4%DE%C7%E2%B1%E2SAM_4503-9.png'),
('local:chen0921',3,'진한 소스의 함박스택',180513171730, 'http://postfiles.pstatic.net/20160615_173/fayry_1465978684755U9So7_JPEG/%C0%E5%BE%C8%C1%A4_6.jpg?type=w3'),
('local:chen0921',4,'육류가 싫으시다면 오늘은 생선까스 어떠세요?',180514171730,'http://blogfiles1.naver.net/MjAxODAxMTNfMTI2/MDAxNTE1ODExNjUwOTA2.-CLILyuVQ0f1sDsUOfEE1i9CBgWqhjOUD5WYCHYzLDkg.6YRTpoi9fEo6OSBHWosX0OY56jf69ig3scr8pL7v0m0g.JPEG.timing0201/%C0%E5%BE%C8%C1%A4_19.JPG'),
('local:do12',1,'짜장짜짜장면~',180511171731, 'http://postfiles.pstatic.net/MjAxODA1MDRfMzkg/MDAxNTI1Mzk4MTU2NTQx.PeP8B6i_pzO55DRk9S5Qh6jrj3WkePLm71aTQYr4w1cg.kT_9m9eC5weZ9WvvL0oARjljWKj685UdeiykPlebP8Eg.JPEG.roomy_atelier/y10.jpg?type=w1'),
('local:do12',2, '짬뽕 + 고깃국물 = 차돌양지짬뽕! 해장하러 왔다가 반하는 그맛!!!',180512171731, 'http://postfiles.pstatic.net/MjAxNzAzMjVfMjI1/MDAxNDkwNDQ3ODE0NDQ4.sKdOu7Ys8sYEFdiNfpT3oLUr37Cqd6jrvkJdwapVKJog.6GUfB62uEZkdwoz9zUM3hGBdVnRRTOS8tavfCfr4uFIg.JPEG.cjswo965030/KakaoTalk_20170325_221346401.jpg?type=w773'),
('local:do12',3,'오늘은 색다른 맛의 중화비빔면! 한번 드셔보세요~',180513171731, 'http://blogfiles5.naver.net/MjAxNzExMjdfMjU5/MDAxNTExNzcxODY0NTU2.hgYZDXtDsS8KxCbRNncTR0WAoC8vVy-WbMy8DetQygIg.mFzl_qMoze2LjtVrRMzy0evY0xRGc1BgccwD4MnIP8Eg.JPEG.skin87/IMG_0444.jpg'),
('local:do12',4,'볶음밥이라고 다 같은 볶음밥이 아니죠! 해물볶음밥~!',180514171731, 'http://postfiles.pstatic.net/MjAxNzAzMjVfMTg5/MDAxNDkwNDQ3ODE0NTM4.RfFNuJBHYXRZhvXkMa96p5pZy5I-U0w6YwEHFYC1ZKsg.gcHjsIAG7WW1zuMun58PjiMh28heRqZ1Bewqrnbx1b8g.JPEG.cjswo965030/KakaoTalk_20170325_221347101.jpg?type=w773'),
('local:dongdae1',1,'큼직하고 두툼한 통 삼겹살. 새우와 햄은 옵션~',180511171731, 'http://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles1.naver.net%2FMjAxODAxMTNfMjI5%2FMDAxNTE1ODQzOTQzMzYy.RBeoMvKgfcOFPPUxC2M68WtFH3fg7TKvE6Pdv_tntAYg.V-O-geFfyliB7hTxvFzAkZEEID26G1rNPeqaq_WNeBIg.JPEG.sodamingg%2F019.JPG&type=b400'),
('local:dongdae1',2,'솔직히 고기는 목살이다 ㅇㅈ? 통! 목! 살!',180512171732, 'http://blogfiles1.naver.net/MjAxODAyMTJfMTE5/MDAxNTE4MzYzNTAxNTg4.NrPZuhmAIbt8mOupfUxlZ_7vCv6ZM6f91zt2jZkDZHIg.Dm_tzyIrMgHuwB6qwwgiOVdmaNbsr6wG9azzO9lkKUYg.JPEG.2080pigg/DSC04486.jpg');
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
INSERT INTO `follow` VALUES ('local:chen0921','local:1155'),('local:do12','local:1155'),('local:dongdae1','local:1155'),('local:grandma123','local:1155'),('local:hansung','local:1155'),('local:wook','local:1155'),('local:wook','local:emmaoh26'),('local:wook','local:hscthsh3306'),('local:wook','local:jhkdie'),('local:wook','local:jwkasa'),('local:wook','local:ldhfall'),('local:wook','local:nsj888'),('local:wook','local:ujjang93');
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
INSERT INTO `owner` VALUES ('local:chen0921','chen0921','chen',NULL,'장안정','서울특별시','동대문구','장안동','334-3','02-2246-6574','24시간','https://post-phinf.pstatic.net/20150522_200/gohappylife_1432253022454mFaRY_JPEG/mug_obj_201505220903431570.jpg?type=w1080'),('local:do12','do12','dodo12',NULL,'예지현','서울특별시','동대문구','휘경동','192-5','02-3395-8805','연중무휴','http://imgnews.naver.net/image/215/2017/03/16/A201703160297_1_20170316162916651.jpg?type=w647'),('local:dongdae1','dongdae1','dong1',NULL,'퐈이야','서울특별시','동대문구','전농동','602-5','02-960-1541','9:30-22:30','https://postfiles.pstatic.net/20140109_23/gayoun0728_1389240448458xwJX0_JPEG/20140103_195355.jpg?type=w2'),('local:grandma123','grandma123','grand123',NULL,'나정순할매주꾸미','서울특별시','동대문구','용신동','119-20','02-928-0231','오전9:00-오후11:00','http://blogfiles2.naver.net/MjAxODAzMjJfMTgx/MDAxNTIxNjkzODE4NDQ2.4iA-mDq8ASQDkNMOjOLWC9ehWGE8Z5XM7VwTYQE4L8Yg.TS8Bvw2w4K2o6YonFr--JgxzzoQiw_RKCo6vZQK_JRsg.JPEG.a0119754/4.jpg'),('local:hansung','hansung1','hello',NULL,'마카나이','서울특별시','동대문구','전농동','602-11','02-969-2972','오전8:00~오후11:00','https://postfiles.pstatic.net/MjAxODA0MjVfMTY1/MDAxNTI0NjM1MzQxMDgx.w-JZKSUQnDJstU5Od_hX9-fylHO6612QBSWoK-PSAE0g.fLM36a-E4JsXp4ZwQ-S7UWt0jh9fYlNH3Sa2G-a_Lqwg.JPEG.winterplay76/20180425_123748.jpg?type=w773'),('local:hyehwa2','hyehwa2','V3rrJhYiTiiSITL92IydDgSDEFhMucJ/tlZiXeGAFKMwYAjwCjFbv3mFtf6hU1oNFf4EoGy2wyy0F2QjUtMITdWiV1gqdE2BLKP2zPPsn687HN+0olmTIIPxEJsfnRi8mMQxmPyJTbeFOWRYuBQnpgM9h4EEZD7qi4GKrN+FthQ=','40d/yitAOCqBD8gEUn0rtLT32sqLvprZBQevsHStPMxD35eHZLBKNIYPW6Q3s0DrLMlkl1W/WrzbCUjHFX9Q2w==','정돈','서울특별시','종로구','혜화동','107지층','02-987-0924','11:30-14:00, 17:00-21:00(last order 21시 시)','http://blogfiles9.naver.net/MjAxNzEyMjJfMjM3/MDAxNTEzOTQ3Mjk5MjIy.8YUVLcAEtGLCvE538plFcnZqoNdeoO4rl-SzKd__uwcg.5m6Y5KY5AY2YlCrK2wFr1X6gymGq01LCVALAFQPalIkg.JPEG.yabes0505/0_%B3%D7%B8%F0_%C6%C1_%B8%DE%C0%CE.jpg'),('local:kai88','kai88','kimkai88',NULL,'크치치킨','서울특별시','동대문구','제기동','122-373','02-962-9285','오후1:30-새벽2:30','http://blogfiles1.naver.net/20160609_246/narae8167_1465428947313BsVaH_JPEG/%C5%A9%C4%A1%C4%A1%C5%B2_160607_%2813%29.JPG'),('local:korea1','korea1','korea11',NULL,'대한곱창','서울특별시','동대문구','장안동','433-20','02-2214-5207','연중무휴','https://postfiles.pstatic.net/20160821_125/sny815_1471773163978GDaUr_JPEG/KakaoTalk_20160821_183142718.jpg?type=w2'),('local:lay4570','laylay4570','lay10',NULL,'감초식당','서울특별시','동대문구','제기동','122-373','02-962-4570','9시~23시','https://post-phinf.pstatic.net/MjAxNjEyMDZfMjI0/MDAxNDgwOTkwNTE0MTQz.h8J5deaXre2yKpifJKuyqlZxdTPGRrA9Hg5i3f1tnvUg.y-VDZN4dSKzCFyhW2tj_7Cf35UJWiuBaF3UmO44rx5Ag.JPEG/mug_obj_201612061115181327.jpg?type=w1080'),('local:mama010','mama010','mama111',NULL,'어머니대성집','서울특별시','동대문구','용신동','754-9','02-923-1718','24시간영업','http://blogfiles1.naver.net/MjAxNzAyMDFfMTky/MDAxNDg1ODc5OTY5NDEy.ObP9rrBvhKYkS2k36FVjzcezE0fPwgyDX4Wm18mcuTUg.X5irO0u5NqLgGzguyVBG2Li1yS_FvRsr4BBddIngDS8g.JPEG.ajrtkska/20160524_223105.jpg'),('local:rain21','rain21','rain1031',NULL,'낙서파전','서울특별시','동대문구','휘경동','319-32','02-968-6019','pm2:00-am3:00','https://postfiles.pstatic.net/20150210_7/uule2_14235659322551tbUP_PNG/2015-02-10_19%3B52%3B36.PNG?type=w2'),('local:sky1004','sky1004','skysky',NULL,'은하곱창','서울특별시','동대문구','전농동','295-48','02-2247-0254','오후5:00~새벽2시','http://blogfiles14.naver.net/MjAxODA0MTNfMTkw/MDAxNTIzNTgzMjQ4MzAw.WFsXibBs2yWmHLl4FlN0BdPaGSp2TMuKIL-Vv2fJkwgg.KyQLY8-9h99TK0igcsnMtLHrmMdSkVHSgfJ8R88kNPcg.JPEG.heyey_1109/%C7%A5%C1%F62.jpg'),('local:suho01','suho01','suho0101',NULL,'라온9','서울특별시','동대문구','제기동','892-71','02-969-0244','24시','http://blogfiles1.naver.net/MjAxODA1MTFfMjMx/MDAxNTI1OTg4MTE4MDE2.q6hWlKe3NviEMFrYpeARVNqbmkhjBp0s6VDq7qqduQcg.Ks3j5_M8T8qCdglk9SesK73S5A7NnzJ8TlVczyRmCTEg.JPEG.lyonil/DSC_1453.JPG'),('local:wook','wook','K5GodcbNAVbsuboELouoiY8a0+0s/kw78xyttrM4VlsEbop3E+ElK/M/guAYqSrn8ijVakXm+lihjurUQC6V+8PsCtc6DU7ZIt2L0EHPurLppUuiSDWSdGLzmTXMIkR9AmUSqmIBlpdIVixdZ7AwlPGtx6CMRNv+h7163FMfe1M=','UzuUXd8itQsNYsSj7vx4zuyOT97MA/y8riJFB5P5kXWxL7kh8Z31OdaNpgA6VHh6YzMSbWpYrnUm56RckGP3ug==','수동에서 온 순대국','서울시','성북구','삼선동','한성대학교 근처','010-7577-4937','아침 9시부터 저녁 7시까지',NULL),('local:xiu99','xiu99','xiumin99',NULL,'봉이만두','서울특별시','동대문구','휘경동','261-3','02-2215-1122','오전9:00-오후11:00','http://postfiles14.naver.net/MjAxODAzMjlfMTMx/MDAxNTIyMzMzMTI5MjIx.G959lCMi_9UIn60hJLpFstQVWcmYdJKbkPzPouiTDjog.w1cTRJ07Eqw6nrHBS46hQLUJJN7JmJldQHuv_SqXbJwg.JPEG.since861015/IMG_6449.jpg?type=w580'),('local:xo0408','xo0408','exo0408',NULL,'일미간장게장','서울특별시','동대문구','장안동','367-3','02-2242-4338','10:00-22:00','https://postfiles.pstatic.net/MjAxODA0MDlfMTk4/MDAxNTIzMjQxMDYwNDk0.J4sTc6F459s4_DeXgTCvH_hL8B9ThjAQtHqVRgs6AFwg.pzdyl0RzMJ00hJUhhBCW9YvRKSHmnxswlha9JQuTkIMg.JPEG.gellysook/2_kag.jpg?type=w966'),('local:ykha1031','ykha1031','yk1031',NULL,'개성집','서울특별시','동대문구','용신동','201-2','02-923-6779','am11:00-pm11:00','http://post.phinf.naver.net/20150324_247/oskin671022_1427183449539fO20e_JPEG/mug_obj_201503241650538131.jpg?type=w1080');
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
INSERT INTO `review` VALUES ('local:wook','local:emmaoh26',5,'남친이랑 오기 좋아요.','혼자 오기에는 좋지 않아요.'),('local:wook','local:hscthsh3306',3,'음악이 좋음','맛은 그럭저럭'),('local:wook','local:jwkasa',1,'인테리어 예쁨','불친절'),('local:wook','local:jwl628',2,'맛있어요!','좀 비싸네요'),('local:wook','local:ldhfall',3,'먹을만하다','양이 적다'),('local:wook','local:ujjang93',4,'메뉴가 다양합니다.','단점은 없어요!');
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
INSERT INTO `sessions` VALUES ('3lIPYsnA0RzidLatoeATdhJJM-XfYDRS',1526986575,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":\"local:wook\"}}'),('PaflV3rsC4SjtCOIXQtT_NEyGx0D4s6E',1526976920,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":\"local:1155\"}}'),('cY62CrHZZhS5_XnqH2c30X-alrGmqFTG',1526936022,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":\"local:wook\"}}'),('yOSzZMIJVjZQOP929buC2WCFeAbz_aAn',1527015009,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":\"local:1155\"}}');
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
INSERT INTO `user` VALUES ('local:1155','1155','WZba4CB9EhTZhG32lm/GnajMN+4R3GnutBjxDvqHNWKihZ64TQGeggPp6uKcTA1ZNvBftmojUTRyEntRVRvFi1KXDpe89gSSkgKg2DM8bteNCsdFJVP8fG4lA3DYAn6/REy4GAz+0hOr0lO0cLX1eYy3lJwV5MvkaR5VbtbH6n4=','sbQdcc6RsMPqs/MMO1zTk7yUAxuZ7t1J6tGw/Te6cFD9B6/6PhZiKJSFKbYz/S/cDEVOCuRu70GbxwC4hyhMjg==','노트북',NULL,NULL,NULL,NULL),('local:1222','1222','yPyGG6i5UhY9b70XygLElbwg0TrfFDf7nB2dAHDkq6SGcuwgJOCqJZrGTvC6rjdZiDptVRynG3qPGEfzUm+2DKuyreGvdDhRzZ+TssUdamXUswufxKkGxY3upmaaf2Xhj1sfTMu+Hz3X2JRaRv0mRCwXZtc14+dQAqPB3SEGqd0=','gIvPMiImzsW8fIiinALZcAdahABYLa9wk6tTA618oHBxmeAAJJuDoJ+76PiuGA1URjVMLJ7+El+ue0sKj9Or8Q==','1222',NULL,NULL,NULL,NULL),('local:emmaoh26','emmaoh26','111111','g2','오지은',NULL,NULL,NULL,NULL),('local:hscthsh3306','hscthsh330','111111','g2','장희수',NULL,NULL,NULL,NULL),('local:jhkdie','jhkdie','111111','g2','김정호',NULL,NULL,NULL,NULL),('local:jwkasa','jwkasa','111111','g2','박진우',NULL,NULL,NULL,NULL),('local:jwl628','jwl628','111111','111111','이정욱',NULL,NULL,NULL,NULL),('local:ldhfall','ldhfall','111111','g2','이동현',NULL,NULL,NULL,NULL),('local:nsj888','nsj888','111111','g2','조남수',NULL,NULL,NULL,NULL),('local:ujjang93','ujjang93','111111','g2','유광형',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2018-05-22  3:50:54
