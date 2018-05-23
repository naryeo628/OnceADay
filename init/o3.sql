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
INSERT INTO `follow` VALUES ('local:chen0921','local:1155'),
('local:do12','local:1155'),
('local:dongdae1','local:1155'),
('local:grandma123','local:1155'),
('local:hansung','local:1155'),
('local:wook','local:1155'),
('local:wook','local:emmaoh26'),
('local:wook','local:hscthsh3306'),
('local:wook','local:jhkdie'),
('local:wook','local:jwkasa'),
('local:wook','local:ldhfall'),
('local:wook','local:nsj888'),
('local:wook','local:ujjang93');
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
INSERT INTO `owner` VALUES
('local:chen0921','chen0921','chen',NULL,'장안정','서울특별시','동대문구','장안동','334-3','02-2246-6574','24시간',
'https://post-phinf.pstatic.net/20150522_200/gohappylife_1432253022454mFaRY_JPEG/mug_obj_201505220903431570.jpg?type=w1080'),
('local:do12','do12','dodo12',NULL,'예지현','서울특별시','동대문구','휘경동','192-5','02-3395-8805','연중무휴',
'http://imgnews.naver.net/image/215/2017/03/16/A201703160297_1_20170316162916651.jpg?type=w647'),
('local:dongdae1','dongdae1','dong1',NULL,'퐈이야','서울특별시','동대문구','전농동','602-5','02-960-1541','9:30-22:30',
'https://postfiles.pstatic.net/20140109_23/gayoun0728_1389240448458xwJX0_JPEG/20140103_195355.jpg?type=w2'),
('local:grandma123','grandma123','grand123',NULL,'나정순할매주꾸미','서울특별시','동대문구','용신동','119-20','02-928-0231','오전9:00-오후11:00',
'http://blogfiles2.naver.net/MjAxODAzMjJfMTgx/MDAxNTIxNjkzODE4NDQ2.4iA-mDq8ASQDkNMOjOLWC9ehWGE8Z5XM7VwTYQE4L8Yg.TS8Bvw2w4K2o6YonFr--JgxzzoQiw_RKCo6vZQK_JRsg.JPEG.a0119754/4.jpg'),
('local:hansung','hansung1','hello',NULL,'마카나이','서울특별시','동대문구','전농동','602-11','02-969-2972','오전8:00~오후11:00',
'https://postfiles.pstatic.net/MjAxODA0MjVfMTY1/MDAxNTI0NjM1MzQxMDgx.w-JZKSUQnDJstU5Od_hX9-fylHO6612QBSWoK-PSAE0g.fLM36a-E4JsXp4ZwQ-S7UWt0jh9fYlNH3Sa2G-a_Lqwg.JPEG.winterplay76/20180425_123748.jpg?type=w773'),
('local:hyehwa2','hyehwa2','V3rrJhYiTiiSITL92IydDgSDEFhMucJ/tlZiXeGAFKMwYAjwCjFbv3mFtf6hU1oNFf4EoGy2wyy0F2QjUtMITdWiV1gqdE2BLKP2zPPsn687HN+0olmTIIPxEJsfnRi8mMQxmPyJTbeFOWRYuBQnpgM9h4EEZD7qi4GKrN+FthQ=','40d/yitAOCqBD8gEUn0rtLT32sqLvprZBQevsHStPMxD35eHZLBKNIYPW6Q3s0DrLMlkl1W/WrzbCUjHFX9Q2w==','정돈','서울특별시','종로구','혜화동','107지층','02-987-0924','11:30-14:00, 17:00-21:00(last order 21시 시)',
'http://blogfiles9.naver.net/MjAxNzEyMjJfMjM3/MDAxNTEzOTQ3Mjk5MjIy.8YUVLcAEtGLCvE538plFcnZqoNdeoO4rl-SzKd__uwcg.5m6Y5KY5AY2YlCrK2wFr1X6gymGq01LCVALAFQPalIkg.JPEG.yabes0505/0_%B3%D7%B8%F0_%C6%C1_%B8%DE%C0%CE.jpg'),
('local:kai88','kai88','kimkai88',NULL,'크치치킨','서울특별시','동대문구','제기동','122-373','02-962-9285','오후1:30-새벽2:30',
'http://blogfiles1.naver.net/20160609_246/narae8167_1465428947313BsVaH_JPEG/%C5%A9%C4%A1%C4%A1%C5%B2_160607_%2813%29.JPG'),
('local:korea1','korea1','korea11',NULL,'대한곱창','서울특별시','동대문구','장안동','433-20','02-2214-5207','연중무휴',
'https://postfiles.pstatic.net/20160821_125/sny815_1471773163978GDaUr_JPEG/KakaoTalk_20160821_183142718.jpg?type=w2'),
('local:lay4570','laylay4570','lay10',NULL,'감초식당','서울특별시','동대문구','제기동','122-373','02-962-4570','9시~23시',
'https://post-phinf.pstatic.net/MjAxNjEyMDZfMjI0/MDAxNDgwOTkwNTE0MTQz.h8J5deaXre2yKpifJKuyqlZxdTPGRrA9Hg5i3f1tnvUg.y-VDZN4dSKzCFyhW2tj_7Cf35UJWiuBaF3UmO44rx5Ag.JPEG/mug_obj_201612061115181327.jpg?type=w1080'),
('local:mama010','mama010','mama111',NULL,'어머니대성집','서울특별시','동대문구','용신동','754-9','02-923-1718','24시간영업','http://blogfiles1.naver.net/MjAxNzAyMDFfMTky/MDAxNDg1ODc5OTY5NDEy.ObP9rrBvhKYkS2k36FVjzcezE0fPwgyDX4Wm18mcuTUg.X5irO0u5NqLgGzguyVBG2Li1yS_FvRsr4BBddIngDS8g.JPEG.ajrtkska/20160524_223105.jpg'),
('local:rain21','rain21','rain1031',NULL,'낙서파전','서울특별시','동대문구','휘경동','319-32','02-968-6019','pm2:00-am3:00','https://postfiles.pstatic.net/20150210_7/uule2_14235659322551tbUP_PNG/2015-02-10_19%3B52%3B36.PNG?type=w2'),
('local:sky1004','sky1004','skysky',NULL,'은하곱창','서울특별시','동대문구','전농동','295-48','02-2247-0254','오후5:00~새벽2시','http://blogfiles14.naver.net/MjAxODA0MTNfMTkw/MDAxNTIzNTgzMjQ4MzAw.WFsXibBs2yWmHLl4FlN0BdPaGSp2TMuKIL-Vv2fJkwgg.KyQLY8-9h99TK0igcsnMtLHrmMdSkVHSgfJ8R88kNPcg.JPEG.heyey_1109/%C7%A5%C1%F62.jpg'),
('local:suho01','suho01','suho0101',NULL,'라온9','서울특별시','동대문구','제기동','892-71','02-969-0244','24시','http://blogfiles1.naver.net/MjAxODA1MTFfMjMx/MDAxNTI1OTg4MTE4MDE2.q6hWlKe3NviEMFrYpeARVNqbmkhjBp0s6VDq7qqduQcg.Ks3j5_M8T8qCdglk9SesK73S5A7NnzJ8TlVczyRmCTEg.JPEG.lyonil/DSC_1453.JPG'),
('local:wook','wook','K5GodcbNAVbsuboELouoiY8a0+0s/kw78xyttrM4VlsEbop3E+ElK/M/guAYqSrn8ijVakXm+lihjurUQC6V+8PsCtc6DU7ZIt2L0EHPurLppUuiSDWSdGLzmTXMIkR9AmUSqmIBlpdIVixdZ7AwlPGtx6CMRNv+h7163FMfe1M=','UzuUXd8itQsNYsSj7vx4zuyOT97MA/y8riJFB5P5kXWxL7kh8Z31OdaNpgA6VHh6YzMSbWpYrnUm56RckGP3ug==','수동에서 온 순대국','서울시','성북구','삼선동','한성대학교 근처','010-7577-4937','아침 9시부터 저녁 7시까지',NULL),
('local:xiu99','xiu99','xiumin99',NULL,'봉이만두','서울특별시','동대문구','휘경동','261-3','02-2215-1122','오전9:00-오후11:00','http://postfiles14.naver.net/MjAxODAzMjlfMTMx/MDAxNTIyMzMzMTI5MjIx.G959lCMi_9UIn60hJLpFstQVWcmYdJKbkPzPouiTDjog.w1cTRJ07Eqw6nrHBS46hQLUJJN7JmJldQHuv_SqXbJwg.JPEG.since861015/IMG_6449.jpg?type=w580'),
('local:xo0408','xo0408','exo0408',NULL,'일미간장게장','서울특별시','동대문구','장안동','367-3','02-2242-4338','10:00-22:00','https://postfiles.pstatic.net/MjAxODA0MDlfMTk4/MDAxNTIzMjQxMDYwNDk0.J4sTc6F459s4_DeXgTCvH_hL8B9ThjAQtHqVRgs6AFwg.pzdyl0RzMJ00hJUhhBCW9YvRKSHmnxswlha9JQuTkIMg.JPEG.gellysook/2_kag.jpg?type=w966'),
('local:ykha1031','ykha1031','yk1031',NULL,'개성집','서울특별시','동대문구','용신동','201-2','02-923-6779','am11:00-pm11:00','http://post.phinf.naver.net/20150324_247/oskin671022_1427183449539fO20e_JPEG/mug_obj_201503241650538131.jpg?type=w1080'),

('local:1poom','1poom','+gETtX37hgF+17my9xlGCBX3SdeN6eL6enSFb+AqeJMidKbDaCLSvQrZw56xY/X9bDS397V/nPZ9k790LztelxqH++CiQZMbJjuXCtdJXhxzTFbsbxabwhuZyeTDW+iQm0ElO4rS0oI7aCJGWACeWhvakqz+sR8nrfR/5CVi/24=','y+srACJ/nlIfDX4rBfvK9cmnS8rhxii5QzpTdxjmu5fd3XWShOaKowXKVNomC/Wg2I3Ah6pFT3VnVKTgGR2RdQ==','일품향','서울특별시','종로구','종로4가동','8','02-742-7488','10:30-21:30',NULL),
('local:2mone334','2mone334','tB1yTtz5RxA5skBSEIdQ4uhiDTdFcbJc4HafLZJPpFwnmdUiOEfn85aPuX1776uNy9dC/Ah0TdbcssdiHZOPA/fXuur+nOOdyDpEfxh9tqo242nxJPsPqDQvZcEeSIQ7KnP+F1BxiCT4YC+cEKcJgFvfWwVWvz7Y1M+hd2cpPzk=','zmpcJknoQ5u/8sQU/ml7Yv9WvnmX2M9mU8g6RHB9G1SDg4TJCk3cFYg9mOb8gdRzNY1wx8idXBuuDRmU3nyLBg==','이모네 파전','서울특별시','동대문구','휘경동','334-13','02-959-8318','16:00-05:00 명절 연휴 휴무',NULL),
('local:andong107','andong107','Mwx5ccMAHKKP3KfGAjzUfHVqw5rQvOW9MvYwz9dF801ut+N+p+KE22724pg0YZ/ibaCHnTbnjpOJH0lvOSPmZevuge9OrwEfIhPSU0DnRPBPWKIkReohbKS+wUmFHO4D0MFyRYpw9bfoV3rqQSl6ZHbROIFe3CiAInlj3dOWMug=','qfWfW+/UQsQXs0TPpOw0Tc9gmiapDFd8Zps0t1TjaV5EVycRC0ALvxy/JnuL/Da0FVOwJzXh3zyOQ0mV4F0o+g==','안동반점','서울특별시','성북구','보문동','1가 107','02-923-4448','11:30-21:30 break- 15:00-17:00',NULL),
('local:arirang535','arirang535','yZIxTQtYIorBH76hjdauHstHhSCfUPM6t6up1NXEYtczAi6ajJV59OGaMUhtCiR1kKhR7QP0679GgbdCuf1lKg4M0cDw5b4yE47cJzykw1PuzAQVuyWoW72OqE2Qq7B//BATl8FHbi5MTJAYU+fszmqVTm5eRtuheYW2H5/719E=','HI/jolFJjbCz6nH6UOxtfAxqUm73YyXDnmo8OaLMFcCO3TcgrEkVew50VkAa2Z4lJn/EMufSVTrdk8hETjmk0A==','더아리랑위드그릴','서울특별시','성북구','돈암동','535-1','02-926-3111','11:00-23:00 월요일 휴무',NULL),
('local:ashelyjg6','ashelyjg6','G3rnSBmWFtLkgIecx91+4RYtp0FBEnIwSAeFqsX7hgCR5e4BrfyRjLZ0AZLKv6VhzRHPiasCaPsOVtR4jNJw86/9gWxOZS1MHGCPzXSUPUWASQY7scs48LO/vJqAyjMT95oK4TDRVb+mpAuS4zt6FtahfYwIVbPmjVfX4+ex7Ws=','jurA+jL5WNJpKj18LXt8Rwvfui3L+FRelWXP4yt6KeIXw7PhP8McG16HDlGU9Spz2wp48WgbSXqGaqHPKBvOGg==','애슐리','서울특별시','종로구','종로2가동','종로타워 지하1층','02-720-1031','11:00-22:00',NULL),
('local:bandal23','bandal23','4qIMwd4ZuBkmacaO8VhuX3aTpwqGkwZ7CplM6AuXO389wwFVxU3+g9cHrl8X8A7YIJAJfVjnPwRN1DlhYA/uZBelfAP/YqealLZ+C5XwwAArTfmcvMqZPK77tkiVu9FogBRsrnNM0yHfRG8HuoayYQTKGMalMyD1+XLaaG4kaRs=','TZQedXk7/+3PKrzEvSowOPOau/TcTZbtbXmx+aIk+zjbP/nMfVyp80Zrepve0Ka2Ur/AqLmczma9abQpM07h3g==','커피하우스반달','서울특별시','성북구','장위동','238-425 1층','010-9047-6250','11:00-21:30',NULL),
('local:bbong2','bbong2','StBylvPmGh2CcNH9e8SQAP9ToJ5R9NPq1K36RM46agvX/lAw9XAR5FKDIIX+4LkVwLbSd1CKo8RhEjUvJvlXZYC8q9ffsBTFiqSQ8NXITUdD6GmhhYG2yANUSLYINbmpW5rOgT5MY8bmCyVbiTOHKmTjD6Z8H85kT02AIVDIcc4=','jLO5FxuprXlAg1Vf0Y4iO5N+yHvSTZ823FXCJEWlZ+R6390RnPeUmIoxyCu5PxScCZmcvSip+WZjMJalIbm0WA==','봉이만두','서울특별시','동대문구','휘경동','261-3','02-2215-1122','12:00-22:00 만두소진시 마감',NULL),
('local:benares102','benares102','uNdNXCNsCGKBFWvyrFOg7rHM64AeRkf8k+GuaKibuG8BtF/UUPY1ywLZ6qHqYBLZwM1y5cgVWvZQ4z26iFvn7BMQNwhmNI9Y74ubC7HTZXdXIclTPWqkasiRgqjrX/40zA3rmvdr4fBaGenndi7cmhcO2EnlQYlrNis581BbB+w=','thYbKk3rzLNfoxAjBAqrwiEQ2YlSsKy5Nj+H8RFysdMl3PKfiDfgcA6LjxJLAVyzIZinCDIsGVlHzd95GMGhUw==','베나레스','서울특별시','성북구','안암동','5가 102-59','02-921-9982','11:00-21:30 b.t 15-17시',NULL),
('local:benu76','benu76','naIFb5orPv4/IWyUH2q6Aug1R6r9jiD240xVQcIoZfqOgpK5q3nejesIiacZe70lPoI10JbANwdcrRIWkgmekoA98JtRCYjcvDvs4CYSEw/AzVdJd9mbMTdBuBZaYk8mYNjmkOo1YtYsA0VI/7Rsbohb8DCprlszV8raiXrBt6k=','OEcO65E0c7NqmdNUO/Tnp4UPsSyjY/H/URBjKFG8nU+8EdwKfg4Ay0tLCrJQgEKKmXXapSyQ8TN8jQqH4OIMQg==','베누스타76','서울특별시','성북구','길음동','22-1 장안웨딩프라자','02-988-1031','11:30-22:00',NULL),
('local:bhindme','bhindme','iuif4wOGawk3lSWgiVHcs1TZ3duBS8NGuGSq1dJYxswGXDZaCZjxzeHVEDiRvLlxTBR01IKJMAyJfAKomFcA+kFn/lp0tA2tyTGSz2a1wxpdpanqgXMSJUH8noLNvfSbS04+8KXQkKW7m7zCVDJYY8UtBrcPXxSI9krh/J3+xXc=','ATai7t/oV/0NWUHymVUEaNWpqDMGiPbYyZF603dsm+wAAUcylhdAUm5nU7FXMmlRdRUL2LdVQz4rhtFuyixc/w==','비하인드미','서울특별시','동대문구','회기동','60-96','0507-1408-0890','10:00-22:00(일요일은 12:00부터)',NULL),
('local:bigdoor10','bigdoor10','pdGyDCxoMHuulLkN5R6LIxrX4HXy1Of1udrLSqhd6fXCggM16/CWgSiqYWpGE0mzXvTdhKLV7Y8Ka1tgS42ZNZRH/I6aAmY56iOThArDctU6ctnErsJMkX/X9/WyV6JNpPNK7lJjz3rLcg4GrcIAOZdeSBX/GagiJ6le1+Ae3XQ=','LT+ywJwEFRL51L2xYWjAr5DY5fvFxX7/2wLMhM0wIChL00c7+AOhGaNxRCmfNnW65JZg2OrD14uzYeNGXOzs8g==','큰대문집','서울특별시','성북구','종암동','10-60','02-913-0902','11:30-21:30 명절휴무',NULL),
('local:binggo665','binggo665','A73LXC7jS23oaZNNvImZd3LB02hSCoJS6uvEAb4IDDxGACuJyMOoUHaAGDAUPpNTQZFr2HyA93326Srtd4rGE4UK9itF7yp0ptigTQLfwqV7HVWPFvoDM5p+krS4jRWTSIe24Oty0EsliqfhZ24gZ9qUdzcAsMMqqrHgP4foGGM=','IU80jo5D//7OiEcep6lP9mx2cvQTJuPXoo2H6GPjJxwuTptyS39og6wDJG/bBmvP25j5B4TlNf2sMBklbo5eZg==','빙고앤쿡','서울특별시','종로구','교남동','66-5','02-722-9244','11:00-21:00',NULL),
('local:blackme37','blackme37','NxRQezArZjU1H6PkCizEcpmaNY2OVh+gK+x2MAc0jiPvw31Q9gKdyA6sgTneJyzhPl3cqhFivvDh9qogHOxUitPavH70lP++KgcsYVq7nG9SgP7riAmXWQ2R32HATslW40Q9aiqZXDYO2+7rO6M2w3lqAWA+/0YGMWusJsVe0Ew=','39gQrDGYh/XUJYC+HymQL7kG0BGSbrZ8AgCnKpC7x5ZKPHfidPf3d2JX52sZXdOlxja3+XCBgHIR4v2ZsMZmMA==','흑미김밥','서울특별시 ','성북구','월곡동','37-37','02-941-9337','07:30-20:30 일요일은 예약만',NULL),
('local:blt2893','blt2893','bIoWlfgRR6IQkJfmP0VA+AqQMG42cRJv9RhpXrWh8Ti3X9t0Xr4uZz735LEAf19PSSpxwbPxQQV17CK38/xk6sYLQtkUa4dPHyjLUTRLz4jJjSMYViWUZqWTjKbbjSiIYd2a0JdELBflf3qCRmr8EVvCs26UKIEUFtwV7CMDBI4=','O4qq3qMC16bHbzPoMi0qnlTaiAt1ylY31nOqI7ztHL1AUzNYCLj0iYvfSEL50nUSPVwPy9YjMCs1VlP2B7fRxQ==','BLT스테이크','서울특별시','종로구','종로6가동','289-3 2층','02-2276-3330','12:00(주말 11:30)-22:00 ',NULL),
('local:bokak114','bokak114','zXetQYGxKEWnn83oiHMWM2lW6rhIzkcwvQBcegtzj2d3srQVzlSu6mwGYnCSF18rVwbknNuKa5hK3rUNTOUzzJ7C2kmklJCfKDUxF3VtFGsn1auY0m+aNfB5rRqsnlSyBRfBAriTJNMjh2x8z4QkNJ2FgiTSlU8KVS0ide6/24k=','3cqh8823Yzgk2YNb2mB3zLvrwizv1MdG4HvHTwpcdx9w+QSOymhB18AoiH4HXDHb31QSBzjhcgNw+OngcdymVg==','북악정','서울특별시','종로구','평창동','114-12','02-394-2340','11:30-22:30',NULL),
('local:boldhead75','boldhead75','G2wF6X67XHYy5pchY/LyCMOq9bLM7hiV6m9nEv0mPNkgtzn5eAFgNFClvu1FR4lSwiZ/wzo60AYFLNh2odsGdFzIDvdpN6vYhYnjhZfbHVbo8Ek6NHTkczpAKoh/KsbDa4QDVVG6RL1vc/UuHoPojYrQ52qoosGujAqCm8Z7t00=','M/f1oRPcIIkXs/mEdihfo4Grfipv2/IcevK+asZEPtBlHDx329tgFVm4jiojl4D37ipPWL014sRqayUq0UVJdQ==','대머리식당','서울특별시','성북구','장위동','75-1','02-915-9233','09:00-22:00 일 휴무',NULL),
('local:bomon62','bomon62','lK7vaGouskdUNdBa8t+thyATsdXA7Qcw+f92FrbZQd5hwOHeZAGOvhVpQDiId/7albGfHPl3kuNJH19XgzZsoDYIrYGY33p8cdAZi75AheDMb/zOWk3G+4mAvLwJzRf4LBOxyrXOv9n3vRCYNG6peQm0ZY3fXMPyI2WSAZZwCtA=','8Hx2XIDCrLBImtnI0QFZQ8EyPX2mwSaYagu9WmFGwtfgMirA5SzcIudwVIPry/JJN1J9wuCfCN9c2Pa0cbtupA==','보문골 한옥집','서울특별시','성북구','보문동','4가 62','02-922-1538','10:00-22:00',NULL),
('local:bonfish374','bonfish374','NR19FTG+dcA4wOH1ahoKrL88rH7COLnmHGU5+JzAjbEMUx4iJFp7x34N2AjxB4juVlcUEs4+psw0rsiQQfenucz1rS+q+lIFm/CuzPhwwdZ62RqzgRX+mPGeU/tUgNKaU3UOnyFdY+msBFyyUX7nel7OSiFYaGLok09Gqf4nq3Y=','2nv72TfBuXvwDkCZOIVEOQ81RwHJj/zgspwM4i1KGyrFEG70JNRFzCbFZIBcVa/n5+R0GZD49dfgatgtLzjA4Q==','본참치','서울특별시','동대문구','장안동','374-3','02-3394-6664','16:00-03:00',NULL),
('local:cafe902','cafe902','z9RGdJXSZlhabsQLsdJX+s1R9CnVvavDfEwvA4eNGBaVpe+15c1etn6sbGZYPCJLrqOl8U8vlcjMMV9B5HoaX3c5T+pXa4PFG/8eNN4eUomKyiWTn+5uAazouqE0leJL8oJOXMdCN1wRwG2AjoNb7i7yRUpngIgUNjAX1YaWVvQ=','In6NFfkSUkJ7GxHveYnJkY7zT2p5z7Q2rMxloxB1JTKU8w1uBmQH1N9bwjOOOACuGr9CT4XebtEhUDVu0BayNg==','카페902','서울특별시','성북구','돈암동','625-2','070-8828-0902','09:00-11:00',NULL),
('local:cchi122','cchi122','xdn0mEow3A5bGuO3jSyIGeJBpVCtUGWjCbyIjDxzCZGFwXGHe3fNw7dDQcu9LrALgJvUACjK7RNt52K7ecIe4g8FomseHExr8iv7cBO49d1Rqxd8ygIqQXZS6joUKhgd4pvnRu3f3+sxtF6h11bNOIVKnzJJApPja3xknOmeR8E=','CDN6NDw2cFilm7XYt54mj1oAsdB5BulfepxpXkFd+FV8RUPn1g15p1WO/+evehvCDaOqiiMnDy1UxfubolFNtg==','크치치킨','서울특별시','동대문구','제기동','122-373','02-957-9285','13:00-01:00 일요일은 15:30부터',NULL),
('local:changsin','changsin','LRwqlSPMO3cj9W9/+wpXJKP10toMuJwkHe5Mql6xqUVdvdgYg/EGwL4k9MRNVd25h2972+857ehdzro1XDpX7Ix6k7KyzIt4JAl+f5b0rwdyd55T8cugy+02+Igr8xYpu/1X14kcQlqsI4rbiIbt3RJM4cISviEAplqcIyje6lo=','lOXGiJRURlcG0wo8EuIvPOh7x22ZDLFmt6UobqrFB+BbHdhdJT5M6Dt18FdpqsueNwn6UyYjMGyE57jXqJLoTw==','창신육회','서울특별시','종로구','종로4가동','165-5','02-2266-6727','10:00-23:00',NULL),
('local:cheongjin','cheongjin','lSHdOGSk+4rBGlQhFvsaoRFUQv3ZnwtzIoiEkxVdItmhpARSHWvu4jBHIJ2hAk18rLZsKizGYEpjatjlsk3KCT1YI3Od2i0Jl4pYzNv5dueB5EgA6EO9MAhHvlznsENZzK+u32vj7EGcqmQGasHkX7HqmGdBP3dx/I2Ylm1FMmg=','MZ0IePgpv0ytsPas1KXAJge5jDu/d9hEnArONWz4QxVP8bwgHUo6oYZ2g4J9Sh2F6B/AQw7E4bhKYddDWKTxGw==','청진옥','서울특별시','종로구','종로1가동','24 르메이에르종로타운 1 218호','02-735-1690','11:00-22:00 break 15:00-17:00 일요일 휴무',NULL),
('local:chinakan3','chinakan3','S3dYMACfeIVnoLNPvr2h86n7a3wXST7jF3D82IHMTJ49MOxosLuHPnaZNpB58KErN4442UCN0b3vOG6W8trSEOydmVk+7A5krG9Yba8oLxL8FIFzcrTyoOVOnV6WpDuawnNoUKjz6joc5WSsqzydP+96oPdiaVY8ZyPj1SIv4dU=','OS5Xf5S6w6N9+CR/LxlVxgyXhiukJheBvl9RqSAUtmSZf0XtU62OHJ8imqc5BX88m/vHmY/wCzaNF4tm+i/6CQ==',' 차이나칸','서울특별시','성북구','장위동','316-3','02-909-2246','11:30-21:30 ',NULL),
('local:cholim48','cholim48','UgZIyiItmfjgYidBdECPUdp8KoaMpjcfWnW3gFKVOKzn3oxWrAb0ZHWavKrRH/MfXUvqG0RDV+2Hp3BS4/z/nu5Q6SvhmTCrnUyvUmuy4AazuNF8AZqwT4sTcKG6ws45lXZRAP9kU2UVlw+J4NCBr2573SnbCyIjjfy5jospBDw=','BwSF9wi6zm1GvPCPkAPF32pNC66pn1mQBkrfwV0mzvQrtroL5QoekaoqLe4zGuQwL1XXiIgnPD4o8aeBY075/A==','초림정','서울특별시','성북구','돈암동','48-4','02-953-8808','11:00-21:30 b.t 15-17시',NULL),
('local:dabata212','dabata212','LRHMad+RDseD7vJ7zx8Sy8BE1dIuRo3q0gkeKKO0QmmG6RA3k6sAZAsZXmofszEGEyHlg4aUgSxIldBigp06cqgNd/PNoUKe9sRK69EgBCqQaeu/kRWSam4pK4Fdp+TSXCXTMf1380AudDDGQyyt2Ucx/pw6zV/pl08pv01STg0=','8ytjvVE+OT204ZEAf7Bo5IByJZ2WaC17Ly/AfhK9JATfd+n39hieO7kEioQ5gmt50Re9Nt/5ffhMa9okgJwsLw==','다바타식당','서울특별시','성북구','삼선동','2가 212-5','번호없음','11:30-21:30',NULL),
('local:daesung35','daesung35','3oMg/15l7S+y+BybiBBTsRoHQ8ml2WV6F+gyz+lBfxMBEZCF3T3EcHAhiHjiCU+Sq5hcItvBSIhDRnTLAsN1F42PVtOAdjYdUqhDLFvMSmsT+0xy/ZS7RdqyX8BZBqSxD6wVM5h9UZSm2krzpAAJZH0d5npL+zq8AFiKGB35oas=','3GfXp5qMNTeYoR1oA3bK/s5JSZDz7goOu8JlTVJzwJn5GJ1gobcLiUynLfxC43C7UWHY4yxPsoXjnTv9yrN63Q==','대성집','서울특별시','종로구','교남동','209-35','02-735-4259','9:00-21:30 일요일 휴무',NULL),
('local:daomi76','daomi76','oQ1zUKAuZlq2iUP94r7vMkLE3GyE3z8prfBBW85h4CulAxO8SWrkOxfJzhvjh+AVxVg+Oq0Ytz6TmLYJA9bTtliRQ15zIaZJOIHjNcg/VD0BCV0j70hnNChgvTzseNiwaYhbVzGHfxhgLv9rww3nJmp1XIFYvENlO3p/YhdLUXQ=','QycmSXRXAvKKR7DDCq7gCiWMkQ1VEqzDFFbsJmdfc7svJDj9xgXkieoM/XZ/1kK9mpQy9J7af1zrZK3iyCDuew==','다오미김밥','서울특별시','성북구','월곡동','76-7 1층','02-941-0700','06:00-22:00',NULL),
('local:dasom672','dasom672','yWdn3UPKKZyr7VEznlIUMTLDxQkMj7G8MS3Ko28cQMH7JTtPilUG1+Uk5L7Z00Ct17SA8qV9dTdh+7IpvPso7YgHzO25G9N4vubfX1b0eQJ4I9aACOsjvjbxWVpIfxGuWTVPsnrhl7oJszkPfiOcAEUzx7+Vxdw9qSPygaeVVCg=','SGOF0xwvIacjlkp1tpUdcWqD9ZGlmhaAqWM8bCG0r4GX9JmxKCHCiRBDP/rrn8s909bS4lWO7CSwxU5IWAggJw==','다솜 자연밥상','서울특별시','종로구','무악동','67-2','02-735-6005','11:00-21:00',NULL),
('local:ddok278','ddok278','04W44IuCK+nJMDSOwGM5KvF0lKaFQIAMVRKcNplC5j31B0ubon/qTLKkoXR1e39IeQgRVIRE31rBcUkqHqA6wvQOJcK0gRE0D+MZ7WSvpIay2S2cQwcD89L/cUFL6bGvHse4ABpH6fGIS97exUgWocX08olNWLWgdY6KfXii+j8=','KWR6MJ/XHWOcimv585pt/EoVPcjBwSqHswccWNWrOVX7fc2QAcqWzpF4LAMtnQSSaJ7m3UhmUkfGHUe/7CsRvg==','독','서울특별시','동대문구','전농1동','602-4','02-957-1116','16:00-24:00',NULL),
('local:ddonburi2','ddonburi2','D7X/bVAcEIx4YP9FlXJv/h8bvrchFEN/1KmUI2u33E5q6SSO6vRLdJgf9kyQS7GNlw+LwDXos5N8lnRGu84iHNDKTZyy2CxCb2o+Slf/Ais05Tu5XjZuls4OJLPXPFh9rJkFIZJM/6e/g/jObQw+eMAUfj5NjC2K4Z7Uc0FCa+M=','r31BA4awJMKlG0h/gTz+P0HP2IsgjJp75xa8XCCGWtCpvkXXZJegItvqNx7K1QSe+0Tvcn+w5jLPBqEjsd8K2A==',' 돈부리청년','서울특별시','동대문구','이문동','264-295','02-969-0109','11:00-20:30',NULL),
('local:dolsae23','dolsae23','yGJbwJI8GHHqxco4GJOVRfWHfOWEJ/dnU/YROKPxDdcHqv1oCyQV+a/9+P+xFWMDMGzVOWqpYPtPtQifDpZL+Hfc9uWD1QtuEyfUIq8fhd33nMDY5pozNYvdNJPF0jwGQixcu3SGQ3zMXQxrZNRUHMGzlrWQ226xzU+aKFQ6/4E=','lPPo5/KwBd1J/9tf5/VlU0P3SYuFIDTrp4QkG6BLKptQ4eevhwDtV2HJvwtTVa0WG5RwsHn1kKcO2lLGTYLZ7w==','혜화돌쇠아저씨 ','서울특별시','종로구','혜화동','명륜 4가 23','02-765-7399','12:00-21:00 월요일 휴무',NULL),
('local:donbak45','donbak45','jF+XFOtG49v2bsuRvgGtVg1U2BjdcrklywuAdfWGDzJZn2kuGDUVXlRGhkQkvdzF9b6Nn5/i0poIFqsjbB9JqdGpX1kCbRMw2eWf86D2V9mX0K/tsm7aV5tcr+2sa+Sh3sXRjoO1jtkbuf0kRif+noyyWI/Zkbw0zgCNLXuOLes=','eYI/QFAaqbuEQhsCi+jTO3csFojHFrF39jgLau2NqN04hD/CFB3b3/RnGGcEapLJQERm3Gtrbz4SH6t1eutfDw==','돈박','서울특별시','종로구','무악동','45-19 1층','02-720-2999','11:00-22:00',NULL),
('local:dorandoran','dorandoran','lP+H5uy/uZmdu+UZ9RPPf8zuV90ksE9g72KOqKsIdqQhvaNjKLuIhLyzkPZLf2zca9V9nJe09RSnjZGsR+29fFgXyKfWGIBYD33PKT7NIipJWPV5OsUgozDlvU6q3OHnS1p/04WzEnu7utlkf1Y86cZfGgoAVN2eQ2DaTMp/kWM=','zitA1PJSHUiJ9WR+CWljczXNUIXPtWuAl0W/5iikqll0DNtebTuTGwRzXVCOE5hnvhvl5NvdB89FSHQzUiVsuQ==','도란도란곱창','서울특별시','동대문구','이문동','305-78','02-960-3701','15:00-02:00',NULL),
('local:dumi316','dumi316','zZE4dXME4JaFuqIbzF+/Yg3XxTu8BgiDYgod2e9chWCWnxsK5SS2uhT++ux11PGO8/sU6Q9JQr3fQDRA7fV7mtBnlTbstpi9aVcUs6HBhDu7AXh+nMo4dHDWN+x9+c5wK9Sr2xf+3Tem/AKBXxBpJPz/41j492lbbtNNQg6NOw0=','ybDGxgEvtzH5EJarhqjt/RiAWytE5zSZgOuAghpz5QjT7WzIBFg9R456Mu+M7wH0OQ/a333bjdZOb3qrjMrcnQ==','더미 본점','서울특별시','종로구','종로1가동','24 르메이에르종로타운 1 316호','02-2075-6611','11:30-22:00 명절당일휴부',NULL),
('local:eunha295','eunha295','stwQCZ6sfzBXfxwO28/LyzzLewIOZYUphJpxdydSdB7ZjUzbetMHXkmg4vAXectQesFzqsBkZRpnnnXYWq2p61iTDFIZIRImRfYUn2oEMYJXyX+fCzBqiR+5m9ys7LGqULVxMHT4jSEpSYq/ZEE9GA02ZNgba6IM7BdtjYSEVhU=','jjsDGdwXYJeETIMKCmOiuHG65rdDK0iomKY789PBS94pO03gDwZzCNted/9555JfVFlPj3erKBqNJjmmYEvIdQ==','은하곱창','서울특별시','동대문구','전농1동','295-48 북동점포','02-2247-0254','10:00-22:30 일요일 휴무',NULL),
('local:everast148','everast148','fh9epkkC6Ff54WK+oAIRGE47XzJwFm2x8d15xCUq2mE/M4z5YUbAHsxXx/0BJAVHGjsOXsF20SGfFsTKR5989dcatMVvATEZ+igyUPIf1HDSAy80CtLDHk1gHQC9fPSN6UceWzxgpKDLtigUvjE+Ak4q5IQMJuevIAUbaN6Xc7g=','DohaSzXw6ddPieHQ/KB9q7dcxXxfr37SEqIqWUrOZpobT/3F6HXLehQU3yZ8DnvNPrKA+RilMlrmc3e19UzDgA==','에베레스트레스토랑','서울특별시','종로구','창신동','148-1','02-766-8850','11:00-23:00',NULL),
('local:fieya602','fieya602','68Z2Vzx13KOrOtPpY6zX3WAMXRL47Hkp6buy0pODSBcfpFlTGBzRzgYQXZTSYkX2kTs0MTrqZBnlb5z916XHvQSp0YK0Gt6G0rD4Zo32XBC8AtUQRfSwepHQbBvPmvELn2Hj+h+fEpgeqc73PFteCsbYiLIws8Ec7scj9l6Ch4o=','Vc98zEr/xDCKWbQwAdn4GMnrhD4gpJJPrEjq6q8TrblE3z6eH3MZaDFBhY6kMnu97XovF/fkk7TfLyQBMji87w==','퐈이야','서울특별시','동대문구','전농1동','602-5','02-960-1541','17:00-23:00 일요일 휴무',NULL),
('local:firehome85','firehome85','AbMZCOqA9BAq/WqKAQzViq4j+rnwMdVDCSTFow0Yxl7dO/L4gO3sqXhwbB+j6hajmQ6IvQEf6m00VO0ORnyTp4W1046f4315iXEnq6DBidOme7nIH0I7CkAYKPA6+O9xteGUy0MSTK3TyyX//n7VPmn5tlQ3X9rY7IXm+QkqZZM=','f7x/V6/CJPVMQuqNWyf7lQrvtpO2gE1cvyW7tbR7dGFsxNLMLg08XHiTv7w9Jj6J0jKmhzAXeajrdv76VS8wgw==','불난집','서울특별시','성북구','길음동','541-85','02-943-6983','11:00-22:00',NULL),
('local:gangchon1','gangchon1','mpmYZR1xNcNlwyaq86don5IV/9Msuix9as0x3dRvXIIBU/kmu9j9M0KBlgzEitze71ajPm36aZLpXtTz6Kv+3qIS9nz76FLTSK2xoKMCrj7JrEb+dwSFN9yg998jX4k2CeOiij0sHv+/p5Vb4M3464YJvzQI0HvgnstXbWxMlto=','wcWMtARLQ38g9MPPJ18iiI2n08VdEmlUeMGE61J7/0KMiuAjXxJEKc+ngUO7PxrnI8G15RadP53i6TWhmj5kiA==','강촌 쌈밥','서울특별시','종로구','평창동','460-1 성산가든','02-395-6467','11:30-20:00',NULL),
('local:garbi209','garbi209','nE6C8NvOpI+SEIFG0QOEr/STya8TRGt/LPj2c/Q6oje4ZsQeMA4IakfBdfgaPkyVXREJl9yLpx3Chtd06sorhr5jaCAB3JginG1sea+d3j/wOtK85+j0WzU8F5yWEhRC4teMyK9npD8szPOCEZWrFR5qt1Zqd+vOOtPGs0wuYuQ=','Vc3d3TdkP0WCm5rH6/uP8TljfaFtML2S7zF1vYqdkwY+hdcblA0vVPPndEPgempm/3icjMkMEVEVyzAdYWjl/Q==','명원숯불갈비','서울특별시','종로구','교남동','209-8','02-738-4744','09:00-22:00',NULL),
('local:garbi530','garbi530','C/31rzwCDSRtVVMh36XKCp5eLHpmHnAQfNv/666ozkJFoSrpCCCxogbWkyMtMsJA00aJafnJv2X07t8TdgiezfE3+2r0IcmAut0XnTymhvZ0KWuZjIwjfE2aTPmVIktZLIUi6dZ/JStUyby+Nob44v3JrFy+HSKCTt3PRhdohJQ=','dXzIHbPtM4HA/V1dtyJehk5AFbGGgBSECZ3YCbv08AcuJrgD6W3AHJchuKt2K2Lb/nNJW4K75V6X7ZP4SoUotw==','갈비명가 이상','서울특별시','동대문구','답십리동','530-27','02-2243-8200','11:00-23:00',NULL),
('local:gaylim167','gaylim167','K1nh/nIyj5T+HVeiY1ryn96BkKxr8EXnJyHiOCZ4qo7kYurjmBmQiRFCofdON9zL2qJtPEUS76KjwQNp/W/wRZMcV9KMvRmCCT9SLmt66ZdUZICk5DgEU7Z/227olCOUVpXy88fzGurYlDQmxB6qs9me3DbjrKfndo1pEW+6zAQ=','Z8osiCVBH2mkTel7DsPVwabYhZSmwcpBmJVibkFgS4d1yk1rm1lroIUDqwj8v8H/X9UinjdVPKlxgAfxfZoMzA==','계림','서울특별시','종로구','종로3가동','167','02-2263-6658','11:30-22:00 일요일 휴무',NULL),
('local:gitdaebong','gitdaebong','5Ps7fTnc2WdaTQ7bNkFmkEFysplWVOQd6BGCe89QKMXjuYWmoiDGNUmk6uBcgoyglosejixaeCdK0yWpP6d83EcR5CQ9iYDNWZCiWdwQs1yo8Q6lMIvGYcD8oP7OEnjoasyl+JiS5K0Cv0AU0ZZf5z5yYHJP2xAh6JT87CK0XrY=','Tz8KAzxMDHY2w8dluTu7XiMJU9j7IWB98cqy9HU7k4k7x9SqfDpwQ3I4IYwQghezBekH1UBT6P2NsvKEtqW2IQ==','깃대봉냉면','서울특별시','종로구','숭인동','56-25','02-762-4407','10:30-21:30',NULL),
('local:goldking25','goldking25','X/EUZUEi0dERLzFzAHlT1x1MSHrd8VpULKlKX18yf+lsUDZt3A1Tw7FcwRb78y6s7rZ9sgufqX7qu88R+Nq/2SiRAqHCQIn45X5Yfqezk788LTuvzQj0FrupVSC+4ub3S7QTA9W+p6ubnhQ2+AfjZgiCGptiyvupqoidp7pVV2g=','c0aFH/ifKsdIIAyRh5vrf4GoHFLYIUJ3d409bxV3jE7lPQXWBAS/da+uiErrSoKScrRWrUMRsw9QjlUFXTydaA==','금왕돈까스','서울특별시','성북구','성북동','256-2','02-763-9366','10:00-21:00',NULL),
('local:grandma470','grandma470','hNgimeSAP3ZlIYgpc3+p2nb5xcRMQxmXs4JaV6g5+hEGVwiBtBi4dog18rAQsxgDUlPD+3fySiUkkKsBg0BUs/hBe4emQcfzifZQhcFrWkeQaa2Prm1Hf+TVcrPSrKS1kPl1EGcRDZ/vv/luydV/ArwOVvMessMP5IXVBrmcagc=','Mrl3jSQ21KukbSU9m3J+LrccUPRpjpZ3VTes/jQBlUHiD9ON9eHXcZvUS/v83Z6U1ckDsmg4iBjOpsfmZVNB4g==','청량리할머니냉면','서울특별시','동대문구','제기동','470','02-963-5362','10:00-21:30',NULL),
('local:grilldm','grilldm','IIxcfTX0OUF7swNPO5eqJz9AQJCTVd3Du09AtSNk8dzePmAvDsafL1wCJzY9DUn8U+XT7oHsAU1HT1SEFw5b+3M1x9VRtm1N4ES/LmDwRiziTiGhVzBuGNRazApSDA2yZ3ycGs8WSIAjxjZJACg/jsZ/6MlJSKtZPFnC+LaF0BQ=','bFM5tzf1SgSTA9VBi0tICQwapOfmr060j0PH132SXP3kYc7kdP+JCWmaWatvheaCFUYAsdhCb9p2aTk63FAGug==','그릴데미그라스','서울특별시','종로구','삼청동','128','02-723-1233','11:30-22:00 breaktime 14:30-18:00',NULL),
('local:gwangju773','gwangju773','TaNlbBQe9yQfpuRx9otTlyUOaBUT7xK1rkFeY21kCYgg/Oc40MaRI6QbIGKEvGJ3hFH6oJV6QomHZ+iJwboGP22s3zl6fZue+a+KYsoqtl2IXC19nwq3WG0V4aXGoH9bAXkRISa1YM/S2bBoWdWKc5OTVJ+cnHRLXx60vBfnOWI=','i65dUoz0TUacNVkHwjzASapv04L1ph9dXEZaSWivz2tomWhl5BbC/JiGBz+bxQ/mP3rh5eGxHYhoMFv86I7VDQ==','광주식당','서울특별시','동대문구','청량리동','773','02-969-4403','07:00-22:00 월요일 휴무',NULL),
('local:gychicken','gychicken','v/hmGP9ehfWhdmGzNqsIe2+cobZDy+QxelX0o9LXLuNVApkAetPK5d9ZMYZ438HuwdsYKEo3OB0h8ReibUkgPMzpS63lgwfy7kGGfNqMOwWofG079YDNrsQPTzPEG+qY6kfov/uUTU7IGRSLalisE5PNh+nx1Ik09F2cxi3nyNM=','QHhvppYoDMvmvNUWlQ+t9JxqFMZyMcC/3pL9jM8cIvFIhH4H8zRcpE091EIJFirn9DuIzq36FES4kp8+4959lw==','계열사','서울특별시','종로구','부암동','97-5','02-391-3566','12:00-23:30',NULL),
('local:hanalum33','hanalum33','5OKjmgN9rfzDULqsUTPwAHzRkilUExSQR2Dq20UCNChQKAf64ANJqtKS8UHIpAHx6zV2eGOyT8G3xUGXxsy4qd10kRt68r8MUeKEuaTxF4z10/UTUOV7WoOqJ/VMxE5ULPrCPb8zAFAsRucEOlr6e85zfxr4StgSzIP+CMi5sac=','9bZogk6LGX1RC5y1CFPvbRiYRoC0JOkQkZ+HFO4OK4jo68PY59wtGbIWe0vxvUnApmTgGgIqUjcQLxrzJdHaQw==','한아름','서울특별시','성북구','삼선동','2가 330-10','02-762-2277','09:00-21:00',NULL),
('local:hanchun367','hanchun367','I4A2rSt7VBXOotyy5A7FcK9yf0SIQ4hhl1lUtU+b3xInA3JE39pBYcmpm3pLjqRxDFVzBoZSC8wgpNclYtOF6poSDiBBZsaXqZ9wdHIaVugxBho5kkRa+Rnaj3/aUytx2vyJPbzWLgww8pnC7bVNKl8BSUhNsQKQ6HTPT2q5Rx0=','+j6PZfSb5UO0Asu9eAWqeJppLGiq9mKf0dMo7M0ZLuKvw3RYosIr8eUcWcLhVtXS0RsxrN1QDhnGxbutuOmTGw==','한춘상 일미간장게장','서울특별시','동대문구','장안동','367-3','02-2242-4338','00:00-24:00',NULL),
('local:hanok112','hanok112','rUthhSlnCtIjMxhtwnfpLzxJNcxnhgJSP8zqHopKIpyd3vr1zTq0nGFDDpFxtddkEs7ygxuI6UehZ3VfQ69EAf/SJ6y8HHuOCXFUXcqodKuszBRlZ0JwUeR3k/p98aAxHDPOUA4hKYw1v4IBZgcG3mUCUOT/lu9Dnat9VsaQh8E=','VajKqyp059tjo127neG5wxOYjqKPkbflCt0Xa3knqdDb+za/wKrJ/1eJp2vTK0dktZb1xfwegG1G8SpAKKMLUA==','한옥집','서울특별시','종로구','종로5가동','112','02-742-3002','10:00-22:00',NULL),
('local:hansang34','hansang34','tpDcTQZfAyvObUTlWeSdBUMfXxZKCKI8BCbeYBCefVuA5iW61jhO1p9afV8TWzwYF9ITgko9GDcqme6QwgoIVNZ+5RHniDz8J9MAN98BOAklrnaiMdUjd6ZFCxvEg20p8mJ4Lp1+CjTHqxWK1cf9BRS5Pvxgx76x19vSJAnwcZk=','zzkMgHFg76slfquDotMNBWxlzNM7InxJ3NYGLz3TK3ogifKu0u+lmcCJy8yPnksS91aKsFCWwcTPFWSTAYiYbQ==','한상','서울특별시','성북구','석관동','349-1 장위뉴타워13층','02-962-1472','11:30-21:30 break- 15:00-16:30',NULL),
('local:hansgal91','hansgal91','X0e7zaDpm6fLg+jQTEYDuPmgncqVGM34foklk3uV0eQa3eHBK43UbQqeR1fWYlwHmp6/oZtlFDExiC6UNdQIgdLY3/+aokbpiUsPwKzDPTvSffq3GtC8icExtcgWMHcMvzMZvaBsCe42Hrg6QiH8EEX5SbePihzuDliCTgF0VJk=','WCottZRsDzojGAfeFsgChqWwgQpF1qcpiEzKT//+QWAcmyXtuJfOzcvnqvVXV7I7/rTecGpO48sY1YdarSIThg==','한스갤러리','서울특별시','성북구','정릉동','918 한스갤러리 2층','02-941-1142','11:00-22:00',NULL),
('local:hariwon24','hariwon24','Uc107JsXTYRea99+r6EE1PNYmpJLgBZruYZWd9/n2pPoMD9BXAqQMD7qruJl9QHftl3YWgYFFl6Ds1LW0ZdHUZtVffBp3qXD09FM/NsftFjmzoi34vUklUnPjHEt+JJTPlZ8+U/jsd5nxd+YrzPa9vJ0C5aQIY2B0wL3mbnTTk8=','ijw6xT7KbRzxpTU+3cB2T6wmRkBG5lF58iBvJgoCrLrx7nddSVFme+sB32BU/Dy2d3ujeGTHObg11fESRozVmQ==','하리원','서울특별시','성북구','삼선동','2가 249 태극 그린빌','02-741-2595','10:00-21:00',NULL),
('local:hhoney184','hhoney184','3MURzZssSCtrVOH2bTCJmSjuKMXUv80g0XEGpYWqMATxSYqWQ0c9ElcWKonTBMcFxxFLxBozCPM2DA2tniFJZUeLGoqHJUV752bl5mqrcnmnBawHmfY55u7p++6+3fRNEjqYubdr7QtYtXzpXPmQKW4wZZCePgdmJqb3vCQgrlk=','GJ0gihFxdwMf7Kl1S4uj36tOIJAJd4k3GCr7cUQKqSKKKsKxtD0QoCSN8do0+5zjvanIHa8nnvejPHQQwmew2w==','꿀맛식당','서울특별시','성북구','성북동','184-84','02-741-8677','11:30-22:00 break 15:30-17:30',NULL),
('local:hhong187','hhong187','FrD/vFnlbqW2FC9+ibTC6r2gjBTGv5ckIA/xoLa+JMw7tOh+gF0NWQ/0wfu/HJjqzQaqjIHRNFpO7ZOotcI48CxvU2c+H0P48tRODCHlR4/sqnU88fveVc2im9mT7H3pdA+Ubtn0ptwk8mWYNtdijlj4eJsMOrBqBo2ZFAmUUQ8=','7X2WBJu9+aKmoajnMNDguVYUyxlfV5gtI2shXh8cyWa1J+O+0HPeAraCWbc9/PP45RhXS8ZBqJ7N1R75JW8nOQ==','홍곱창','서울특별시','동대문구','휘경동','187-4','02-3295-1187','13:30-23:30 일요일 휴무',NULL),
('local:hoho143','hoho143','SEdM//Jicm3/A/z7F2Oo+D/m0bWJSLWV0lScsiLXbuYU7AnpFSVxnxZwIyvBPiv7O+sHJ4ft8jjPn20E35J48xzIbzNg9vHW8/j4I8NQpgS2rUNPjyIBZD5ohQrL2kIA6+vpOcw1n0C+a44HM9olRXkoD8VqdGMaeLOtehYoonU=','dKUpTKwtTFq6MDsIF48Ep2Gro92fBA5cGrAvE/bjZe5p2TrEVC1Qp0LLgyim2mX21I8tzmw0O0CLAgxwqRGmiQ==','호호식당','서울특별시','종로구','혜화동','143','02-741-2384','11:00-22:00 break 15:00-17:00',NULL),
('local:homtown227','homtown227','4qBQf4PEMj4qvMV6KZPSx3zXxPvF4K10jn24jEeijq2kCmL5jOV+YEo31t1wdzBf7UvvChlt+rJCwWJxC5aK2UwtCZqpKmofMYm4p9DAbgL15K535c+SzZCFngJjlnN8hHpxF7rRHoOEsX5uG5kESkHw1w/SKm2++XwoUUOUcho=','u2ew56YKW6JVPjsO0KiGgy1Jb2fxfSXk1Elj0YmySA0z76UW3RIDuiRrb71wjnrbOtMBSDKe7PFe53tmI6Xtyw==','홈타운숯불바베큐치킨','서울특별시','성북구','정릉동','227','02-914-0011','14:00-1:00 일요일 휴무',NULL),
('local:hongnung52','hongnung52','WYxMcNYqQlWwPUKhyAWcMgcHMc54pqV4yhrxhNz+rwqa5R9kR/0w+PwoPgv3TpRu3AxmcB8KGsDtQ2g8UnTMMeiOWkiBfWgGIw3KjqLbrN9bWBCNkqG8dEXmX3MynjREMyE+fou9Z+3hQmG5JsBX8+Bl2jmCnFn2ztYnoBnkhi8=','W4MSCH0QbUwxutmHGNZBhNyBOww9FOsSl0uesB8byNpPCPfu+BqvBsbVQa2ORXQ3yDD0iQEN5rvmLvrFq72ZKg==','홍능갈비집','서울특별시','동대문구','청량리동','520-14','02-965-0420','11:30-21:30 명절당일 휴무',NULL),
('local:hoya8282','hoya8282','yZuc6XFn4Thy/12DyHloAZrnPqVtM1eY/rr5tcg2sTohzEa1VS8gqW9COWpR8Xi12hwn9wtdDOTTXCzufQpHr/m4BpY7nJHtIHCesysyZoLky0srXgKH9kTBQx3XP8wyeDjrOEOoRBAyehbBh37GoFEUpm8Ol35ZfsZHJB23DeI=','cFkafpdC8gaXxxtJAHcqOUn8zSg/INo1Udmkr66D44U7RKAv57LkytKlJcWo1xAqSYhwv549gufsxy8WrU5QBA==','호야반점','서울특별시','종로구','무악동','82 린덴바움유치원','02-720-0866','11:00-22:00',NULL),
('local:hwaro71','hwaro71','/tEcTdFfxR6IX4P6/CekC7LKHOCpt3AOa6VXNQF4mBSU8co+NRZm2gCyIFwUn2FychelGswi8c0XQtTXbbaW/8tABSgfF9Os//HN+wPtp8pd7lOivZZ45qcQlnH2UEeTK3uHPSPFLU4pVZGcAVUG6U3hiyubiMjJP6+jZCiVFPw=','0VGgLk9wpt2+AYFnw6Tl2F3zsAtWuTerVuJbczrAzJXaboT89F5MzUTfqmPqHSnF6Z/gqZp1oUajNGJ8fUg8Rg==','화로상회','서울특별시','성북구','삼선동','1가 71','번호없음','14:00-1:00',NULL),
('local:hwatong123','hwatong123','AQyuUJR8K78UUjWj98rAlvj1C3map2VIgFNxBWLp41bqOGQKFyMh/TnOqkhGOlhA+VGWNomRKGh2LSw+ND0dQhcz6zl4DQ09sIsqsxqqGRASjLGQyTnA6KOq087dx2pnh0fUsez0dxfV4QrzzpBpWe3DFqsyClDYb99I2f4Y7T0=','vwv7/xBgjAh0MB/azTTOz7IXAveCmwOudNx1OYxro24IZeEQdhAJhKlLKfJ5yt2hAJXba0FZlopkNanRZBu2NQ==','화통','서울특별시','종로구','종로3가동','123-3','02-2269-8877','10:00-23:00',NULL),
('local:hyoja431','hyoja431','MhE1uvlLSiUWypfe9mDuVjZBaGCiTdqcToMuJjDSBNCVGFWsk/of1XJPMESDHTM/FB1zVl/H2OJbTckWpkHucz0kxc9bNbDO5kFBDRJ6A3GjTlc46VXlbme9geLRM+LjItp5RHBCOVKKK+sD9hr5RbiVN6vjqkZO543HyvcJHrk=','xhSx5W3IKrHP07Q3veGGigZ3l6pk3/MfOhy46NC00bwB0MemtcCcumLw15Fe/EDgXygTBZeRMl/t/ztjSmgKmQ==','효자 베이커리','서울특별시','종로구','청운효자동','43-1','02-736-7629','7:30-24:00',NULL),
('local:italy1337','italy1337','B6fKMzyd3or1YOBFA3bmvBrwxpukmONs8Bo6GS8L8PgPCGYQg/8a0FouImnFxELI4fUybml4yOBUDLjziNyEFewc7FZMp/+A6jIuFlhNcafyKhrql+0eqX8+phcWxrQLxg94Ks86/17ziSmEHhJtU9Gnm2nHDX8xzaeVteomcSA=','TXdhxyV3bR019UJzoRPx+020JEGDn+C8MRU4MtwGFs3V7fQjDRVANJJkhDXK0SdPluwLdk6qFS0eO20gV2wQcg==','이태리 총각','서울특별시','종로구','청운효자동','137-7','02-730-8893','11:30-22:00 브래이크타임 15:00-17:00',NULL),
('local:jamey177','jamey177','1Y4gd8FHq1Fz3wzgzZWOycSD7oWEAH0qj4AieW5NljAK3xbV6YNHCE7kNiX74/AIn5MPXa/NRchE5N2/ik+lW8ztsJGO1qncSP/pRxKxES4G5QO45CG4IZN8or6/jkEtXlzVeboC5OFC82T0GmPXTeL3VqzuMV0QhgH5ShC3ilk=','8IMIX6rfVlhS92KGDNYDwRaPZejdNMGcYLkRhiT03hTf8hDYtr7Azl42DVX/Y4yJtAayLwd5kBge8Hy5lkyudw==','육회자매집','서울특별시','종로구','종로4가동','177 제우빌딩','02-2272-3069','9:00-22:30 마감22:20 일요일 휴무',NULL),
('local:jangan334','jangan334','RMsWyWQhHy5jwTD7oE3SVaC/rGwH0nymTtSNxdnKH1Tg1S1nUxFAwRb4HCX0HJ3DJ7hVuyQJiNpCzxKetmrdbkFw/1U23H05d/f5bGhosRE1xviY/iayXD9/IgqrP/z3kyKnhVcbiG3BALZIFOgL7sW7g0aNVOcWaHs8pBVcVJw=','UakecR5IY7PMX0sYzDFLIekOHtkmNZhnl/f5fhmbOYiX0GhaKvNl5a01BOcBG/BETnupdqsRVV3qoGtxLH8ESQ==','장안정','서울특별시','동대문구','장안동','334-3','02-2246-6574','09:00-22:00',NULL),
('local:jangsu489','jangsu489','wAj50o8XQVSOegJD6fLUn+q0F4I6sCELm/MDEWosm29Yq7SBCYkOBAQoRpF+lH6jmM8T5TQ4IV6/DMCB5WjAXm0kra2dYBIcFChMvCfd9wdx+O/Q+bnFO8NkamgkIik3CTgi1yWf++AThzA2DLD1t2jPthIob4HaKokFBhexUOs=','rvvfyHxnf/1xYFoZBsWNJ7bP3Is2ZwnWMKnKFuos+iT3Np8FQHOCSU1RQTTD6gn9wCi27A3lRuqE4aa/r1zPwQ==','장수감자탕','서울특별시','성북구','길음동','489-58','02-980-1003','11:00-24:00',NULL),
('local:jbpasta348','jbpasta348','vMQZyePWfvWdJvXl3v6w5RMwxDYEy7qs4NbVKpMdzntgZix9cQu31LeftI+cJOtl+V5Sczfgqxfm22zEm/jlJDFkIDibqAntNumgKsLaHXyRK3e60rot1N/XBiFGSIzqU2yDVoOG3hxTKPv+J6AoRDQDbm3ABbmhi6E4oYhif1A=','Bl8egIdq1suke3xxDLFD5ZOPGnmo5pipa1VvnO29Grz7mwuBuBGMnag6tarpz8eXF9jqnSjMCunPiKUvberm1A==','JB파스타','서울특별시','동대문구','회기동','348-3','02-965-2822','11:30-22:00',NULL),
('local:jesun8594','jesun8594','UXtjLy+ItmdaOvGJTXYatEV+WkFzyjyRl4ZTpk+e+zFjsa0HTadhv/Xj4R8raY1l++CpkG2Z0rvicVXJWMeFSlxVKc70LlB3WR253u+2RgFoBfIw86S+iV8BEyM+cMYKudAEJ361Xwb70UmZXXNBew4TcQZspXgh3UP5uMoDofg=','SGYYV3gdObzMOrQkRwQ9Qw3k6ePt4hypQ6ANiJYTxvri7Qfqq81fcywlH2a3rFqHjPuLsBFhlG6y1+OLUr9GcA==','제순식당','서울특별시','성북구','동선동','1가 85-94','02-927-2007','09:00-22:00',NULL),
('local:jungdon107','jungdon107','zOOExWmQgOC0Lhye7KvrGOpT79OVJt188h5wdcaacOoB11cA4km0Fyr95e26joH45HzrLb3zSTS/px68GQI3N/evu4HwW6MPREaQzdInHTYprPe/gRixzGJErw8AXS1n5rGXhWngnGVKYVQ6Nqzn8LwSjr5S2bKj11Mkwd/vprs=','Ecpo5MrNTe9mP2JNUlfIorEekq3TRANy/8zaklQ1RnSlenMbB+E8Na0/cKbbF5McWUMlQJ3PCvWSdqzWu5sdpA==','정돈','서울특별시','종로구','혜화동','107 지층','02-987-0924','11:30-14:00, 17:00-21:00(last order 21시)',NULL),
('local:jungsoon20','jungsoon20','ojPB78gZaMDREiv6xG3ZEe4GdHN280Asgij1xAI9njyRZOzDf2AbIUDKxpPCPP4rEFZ19ksX4jQ12G7e8oi21qtfZRHMco3Hr9sybkrbcuKtDddgaVR2II+zdlfqabHY/Z93306FbbTvAOTPguEEwRGrZLQYfRiS63SWtf8QDmA=','p/7YtmsC7YyIPqwHI0wmJ2KMrogJDf5T/o7sJKmJfEsncxqdgorgt4c1oYCG0XyMtb2Po7N6xtzWBJvG9uta2w==','나정순할매주꾸미','서울특별시','동대문구','용신동','119-20','02-928-0231','11:00-22:30',NULL),
('local:junsubang','junsubang','cBq8sx1FXvB+XmjufdmK/rvOhH+EcJfcdaMsmv/5K+tf+rN3RbJUxxISmUyWt0ZgHFRabHjw1B2N/M1dgBqih/LO94EGXonsrIOeoKPRrk99tYTjjC6H+6JrFN9Jk1gJCQuEwR4zhrQPhzTS6kgg1ZRuEsLvFw4YIz3Cr3KKZZY=','g4pMGuJCMvIZ6aQd840qZSZnb/FhL2oqabUd7TEZPQ7ymZg4+MZRyChD/Gyjdp6IzpP78MfI0985bEPQRyVo+Q==','준수방 키친','서울특별시','종로구','청운효자동','122','02-725-0691','11:30-21:30 break- 15:00-17:00',NULL),
('local:kkangtong','kkangtong','dIU3UosHdKe3ITdLtS1bqWexdHctEgISTceUMdSZ3Dn53sS8fNGB2GlKVIe6xjLoHtTX/VyUOTm2ScQuKL2m/OUGz485I9zPFdtsbfQPV1FSD8577AJhm/OOMi1kifkNPeWi1VBDtJ9h8ztXjFfpMSKLj2wQ71YkyOu50r+n7Hk=','iXcWpZQRTr6iVPzkIEKg5y4GXZrTYtSH9YqterH571uCPNAAYGNkAxM1ZoPKpH9GYVS593Qf6W40AmqijlWTSQ==','깡통만두','서울특별시','종로구','가회동','84-22 1층','02-794-4243','11:30-21:30 breaktime 15:30-17:00',NULL),
('local:konggi341','konggi341','yRySU8t5Enldq60DR6eUno85YvoBn3R/uE/4lvNwZ6qsnSaLoLeevfAs1NWiNSVfFTLMS8MhfZRCvnHNL8gKyw+N42wv1nVxCb90Zt+JfyCqirXSCmRZyH72TaJw0hnCWeYAjksc6a6tTS8aWR1LJnnEu4QLgfLWw7kh/cAZ060=','+jvuONfbHm5cthmHVuwHYxWn/SMpouNXSr/59nG5NdVmxrCFLbiX6dVFK8J55kt8SDeexwxsSdJxubK/RKso2Q==','콩지POT지','서울특별시','종로구','가회동','34-1','02-745-2203','11:30-22:00(주말은 2부제로)',NULL),
('local:layered','layered','bdA3AlPQX7VsW0Lp+DTAU0VAWNJ+gZOLnlq3J4+ecmw0rzaOhOFOyp8gcfaILYw6GGW9VvWZwlgUftmMn5I5YjdVLx2O0WvNk+bkd4c7uG+QS1vhcL3LcVQjbgYcEX7gXk7Ui0dqxbnGkHSkxtRtUpgB1LBZAXYq4kwLJ8/Twy4=','ERp+wa+cB9vx/zRSuzW13sxnW5karxTPAYmfAfswZtpSIe1tc/kZP6dOoowEpeVwMTB9Bit1FD6XwAtfimyvcQ==','레이어드','서울특별시','종로구','가회동','84-14','02-747-3568','8:00-22:00 주말 10:00-22:00',NULL),
('local:loun620','loun620','8j6Kq5vGbqTX37iY3GuDqEsbwTEzUJhSYt6XlLV2c2IsdUxgYOP+8bpXGEz/x/RiNiDmCQlL+BF1TmWnqmwXS5aeKB5tsHQ0oAu/5iTiFXjrpvEvo3Z4K1NN/32tcFluF6wkV2quRJxvk6UvPSL4ad85U5Duk+OkB/hXUY+V0RU=','zwbqd3XtwbX50Sg2//pA/hIm9+Jq4+Vf6R6HQuGH52Jb4aGO+hmzHh1TPU8spQKTwjzijsidTur1nkhOhbRg3Q==','로운샤브샤브','서울특별시','동대문구','전농2동','620-69','02-6425-2015','10:30-22:00 샐러드바 21:00마감',NULL),
('local:makne202','makne202','ZfmgxXXHpGAHtRyFp5+EyGZ2onwyF+WZc12dE2lYtSpPA7kHnmBGiPyHTH7hmvwY+zChwfIxV3usiHCUfJ59fefBf/0RY+9mS9JPjXu8b/0pFjPJJHzmG2bmQih/Z7hOgc+ACbDigJnPvnUIcUer72vd7lMuITMUrjXAFouaJ1U=','pYPsTmiLMghctD4TwbDPptNnFRNCDYO0Ns8bEujVGCygSAx10VRQkjs1BspYl54vnZV9Oy+UnNbRq51G3M65wQ==','막내낙지','서울특별시','종로구','종로3가동','24 르메이에르종로타운 202호','02-736-0824','11:00-23:00',NULL),
('local:masizzim','masizzim','5sDFYt/O/DGWSSbiuvIQGScveNr3rP9clWLmg/8DmXjyRwughhq/bQqedKjUBgXp9OAPdIvA6fLPPBIwpv69Sn+a241UWEluyb/PgolhTxc3ICHe2CG+jjn8CwB6PGGXmG4e5jKcJRSC1qn1qHiwH2hVHN2WEkYpxNcAVR3q5YM=','sy0kkVoR6F1YCafWCPsPnhgStPQiMSunw65MdIP8VFM0RmUhEPNbfiXsS3AmhNQyyjDN2VapgVy/zBnBvpu+Qw==','마시찜','서울특별시 ','성북구','석관동','168-4 동성빌딩','02-964-8588','11:00-23:00 월요일 휴무',NULL),
('local:megimegi','megimegi','UtcLqR3ioJoYTDUJx4tdE8QbcSBI7GYUrxl4YeZQ4XN6xr0cPpi5BGBfog+Di0mAMezqvXK6yXxhHr+XbA6P+SV+QJyKK6hkz+RAEq+C8fJTB3EFkoRlc5ZxV3JzMM3lr//SNFRnbjT68VyDnxQL5XIsGRwXRva37MSyYAUG1Pc=','U1uFtnXU7ydJRhNzVN1m7N0zwmTiVmHn42Z89nGHWltZZK0HjgjD0aB+ZmES+06bgQ/9qr8xpQ7BfC0QJjadCw==','메기의 추억','서울특별시','성북구','종암동','88-15','02-922-8690','10:00-23:00',NULL),
('local:mesiya167','mesiya167','eLN//bPSBvFmCJgCYRWVsD+8jcdOFi76GrDjY7QppZXrPub8sET8RDpvqgAwkCVFLhqb8IkPBxSOl55nlLB1tYCb7Fqs0+eq8MHtVzA4jD7EtsE6q+vtCbjS508Q7XDb+tiuzRBm05R9vKUI2Yp8oQZWLDUciAVWE0et+ktTZjs=','VTZxbpy9V29L547cBJXs6jEopD4DUBwOAKilIAYqk7JptRGBl92LMQXDZ2JVt81p7TFnLgGoxKn5IWGRr+C4Iw==','키친메시야','서울특별시','종로구','사직동','167 대우빌딩','02-734-2480','평일 11:30-22:00 주말 11:30-21:00',NULL),
('local:mijin24','mijin24','tDkI086hi32s+wFLmxhkIgUeNU1neMW9ndaGqoD6bKJAunn5XcnLvCTJOhCVGX9eWxj9q7wQLSsQZQznHGw2LP4az5Q8pXfBHXiDednoByrmvl6yBH8rsuwZn3ABuPAMuhMzeLVGZ1BFo6aV7dH1JA5mYmGmdsg0CwXJ2B4sMqE=','WwSruJEvTlymn6gAU9l9p/CATMPwDwdc4RrSiAsuZD9Cr7yZSmCCH/cBSaEYjMsFOCF+ee2/jp0hFqrfJ5+TsA==','미진','서울특별시','종로구','종로1가동','24 르메이에르종로타운 117호','02-730-6198','10:00-22:00 명절당일휴무',NULL),
('local:miunbal97','miunbal97','HYbsKCiZk52txkw1R1uUkI8j8+Mr0WtN5LHtupo7WTcmUMFBD8CJLj7jV/bNO5Xt37+HOm16EdhHgok5mlvCwTmZo9DXMJQp8FrtIfzDfAJ8hxyYD5R3U16BNgE7dW1M7p58jnAZ+BN0Rgdv8RF3zTzXPq1ILPdvZc3e5L/PsgY=','I/O7y/R3ScbcvDl5j4tPuDf3f5J/+yuqVKZaCWvB398pP2ekKp9T9oixmcCUfmP88zjg6gB5rhN2jFjJIUzMLw==','면발','서울특별시','성북구','보문동','2가 97 1층','02-922-8223','10:00-21:00',NULL),
('local:monhwa150','monhwa150','Q4YzQcZvqHN8gJvrgAbjCZnFh2QZc4/60DQzWOcZR5Ddc22KrEJz3vr53pCMUQNdwERgiTZJDi9JlviDvS6YvMTSYDPiKLV3L8Q7Af99XREFKauQ3xIIsKEKgibTbSkdOQjW6tSPsV2GezYb4RZ2Zz82ThU/fNSkxoJBiXuFuSQ=','FEergCFJjrohEMJbNr4QEWROXnqQtTFeaj5dLKorgmFkhHtNn/eTGKNK67ml8McQQpt+wQEmldScNFqlR3ggjQ==','문화식당','서울특별시','성북구','동선동','2가 150 지하1층','02-6381-4644','11:30-24:00',NULL),
('local:moon78','moon78','8x8zSyr46zfEGaacksYnDke5s34QVIWLnF4v8sgnQ4G4ppy6wEm/gdlKtkr9zjrt/m4khaX07EMqsXzmb4hjx4d3yyWn+aRom7lS+EElKLARNz7hANa17W1BM5qVPBFb/wQDf7nWmVCoWORdQUg9WhEqACJwuKQFEGbXmGk9ygA=','SwocA07ZsMgr1aeCmhuVMRLjC86jR/DoXf546IoIesqQmdq7jgUeL5hjGgF/b/DTj850FnnLw2rjISAZgrkPMg==','헌터스문','서울특별시','종로구','종로2가동','7-8','02-738-3448','11:00-24:00 일요일 휴무',NULL),
('local:motherds44','motherds44','Ka+ZB0AKP/0YYO7RS2M+GtppoaCecnF4yMiAo209rvIazhHfrScdsDaL6QytYMYVo78stP13U/AW1nSm74Z66+doX5L1rTfn2qE/OIcTJQeQiqRtbGEkU21LRAvhSphlvObX5/p9bU/e4Ufoxo7J0bFGZJT7ShEnVbRr6u035E0=','FGPhn9r02LJF339bUdipTcXLPLBniUPeGwNZK6lRpauLKo0Sj7CmafvK3/uK5TQiLg7/lXMPbuy5FmzVIAZEbA==','어머니대성집','서울특별시','동대문구','용신동','754-9','02-923-1718','18:30-16:00 하루에2시간 30분만 문을 닫습니다.',NULL),
('local:mrmrgst92','mrmrgst92','E8Lmj4vV8D89tohdNBdpO2VrLqPHxJxp55F+EZqP3TeFKHzbd3/TBmmpTvqE9DHVrRtjTjXfMPbO4LNgOsK+Nwysvabxns1xycTVxEJ/iVaBavVRps8sQWjV6oBrMDTMxnvLmxBhlskTk1WNgS9jAJJvzZ5WPmIwwgZwpyMANM0=','oqwUzzsExFqVgerVHFPEa6UFflML1VUDD1fCip0SWSmSrHlEVjyzxWbpVRAHaNu+1Sn+0jfpR+V96oTfQgsgQQ==','무르무르드구스토','서울특별시','성북구','안암동','5가 92 4층','02-928-0683','10:00-21:30 bt 12:30-17:00',NULL),
('local:naksan81','naksan81','HDA2hw39iuvVICpdhojmyNxnzNzgGOumqTLRcaPdeko1+CZLbG3xQbd5pp/u3SaEYcb93/eLdkC/uHmrbk6F3J8wHT8kmrHxkHq20d+R64+VO/2BNrhO38WCQWe9mH7ZGuY+810z/h2GAXEWZDJZhFPq6letuC1x9zaZtwbeMBA=','IAiIm1HourXJkeZ0c+m6jU9g++5NNY5PwlimUa1nsa3KcsTj9FPGYTKTnFp+TiJCoWlqzrzR2YNRjEAKJuXkPw==','낙산냉면','서울특별시','종로구','창신동','81-8','02--743-7285','11:00-21:30',NULL),
('local:namdo228','namdo228','DQbE/asNQexdqZjagI86tEpz7jxgidwi6mvZEAmXk127Z/v9TQHdoCQ9ttDjN0ucNcP15ZukYG6lr4+65iK9qVAc04/SFXK8kU9rSjqeZNP1HfVktMGG71H0XkTJpYPleZLho8xG33S1K6Zoyc4RbwWdEbVaXRr7WiATUcr4DhQ=','PuZLUKFfjKv9JDQwploUSUhq73WgA0dqlCdDIND1PReOwoP0BfoXVLICnra6jkviyp75KnPeeJGnIg79vgEIWQ==','남도식당','서울특별시','종로구','숭인동','228-4','02-2234-5544','11:00-21:30',NULL),
('local:napoleon35','napoleon35','z/0BMb0Fd1T+ux4Ad+j7MZd4xFlyfgTO+V7eDq0i3/B7bMxYk/+vMHRggXkewaepggmQhoaHQP8Zy8fwjhgnAKCddaD44U8wEJjkm9JSsz77LGjXiAnkAfoRbvhq5K85LxQF37OPSezDUEFfudl76pDfgtfSW5/GwueTz4exi04=','xkMRNktbQ1FKkSNNeIvFMVipq62vWimAdY5F1X3G0blheZXk3gSWusU/CaGoQ6s0vGdA/MZCp1pwCiS9IdAcsQ==','나폴레옹과자점','서울특별시','성북구','성북동','1가 35-5','02-742-7421','08:30-21:30',NULL),
('local:ninja65','ninja65','xq704yziYSBS4IyjnZjCgGNy3QnIYSMQe789sT/YGs5ZbyzA58GMs4A79ItFAsM275wDyegpavZaR+fp6oiQkGhNpMdE1vQVil0bvnn/vh3SvnPNK/O56GYu5ovrhfDsNXy2HNSNzjAwL02afHTLl83DJuA+pUJq1M9TF7Meots=','/d+Vn6fu2PwkRbBbTRh2vLEzr7UD4XUdbwvCRqtUI0VrY/cM3IArGHBM+Dzu+q1L+YxIvXjKJlao3apFE0IkFA==','닌자초밥','서울특별시','종로구','숭인동','65-20','02-744-1028','11:30-22:00',NULL),
('local:nompasta13','nompasta13','T6Ys4r1CySofxsznAw2bMYyxgpJd6k4HuutsWiCauBlkVX678chY4nG0KyaU4ViRTsk5vkMGNp5vDTZ6EaaP+pKHHxhJfbs6Ay7qSYhbLrNjXp5SlobmatFQgC0M2rgnQnjlJjwVZUGePJKirb3UBgh4wyMfZa/QyG+4G0x1F7Y=','CysYR9eJv7dwGrxev10BjYJqY5wneNGYS3oyZUKTkuL4FHaUBPsbjFnCJhLDvCRGqWqmgqJfN/moOa1W0Qh4YA==','놈파스타','서울특별시','성북구','동선동','2가 135-4','02-929-1354','11:30-22:00',NULL),
('local:nullbom39','nullbom39','aSnbTad7pS1PevMJCeDgaJqJY6FzG8EKdWRwBW35AhFy4tx/FR42R+uaFuniBkD8VpY2B8s6NF6ao5rPdUatves/6/yoKgG6x/OIfJy3cOTPiaKKNIQinCnEitWD8GQsQ73V/zKm8jdL+SthiPP1wFdNKUkj3V55ENNTkfRKKGc=','6BsbSJPky3a3yJWoh3AVHVKXqhVcQc2OyVr3u9uvUyxvdB4TOFQ9euy3qH19QgbwOOTVH9BpG6fcG6dczyJ1kw==','늘봄','서울특별시','동대문구','답십리동','267-8','02-2215-5051','11:30-22:00',NULL),
('local:okhwa265','okhwa265','P+RlS5rwQUkNsDCT97wNsvm4tFQtyjOAFtBMPgOWjiMPxfRkulxLXi8YDsmq0u4dBatoypl7wXHk0zPgmQb8BGRc+pmSpiTL1hI+WRMNvv/F2idU0HZ5oYwv0wzs//+4kgIYO7LI+n0U4LAoom6j6uA3b1j8dmkRDgsItyR+28E=','bWcW6rkHKjiEUlZtdv4LPy/kgmcLpoFE9PZKyMWQozv2DKVhtzlEyul0vDbuSKdrRvCuqLmhEJmw69Pd1pCjQw==','진옥화할매 원조닭한마리','서울특별시','종로구','종로5가동','265-22','02-2275-9666','10:30-01:00 마지막 주문 23:30 명절전날,당일  휴무',NULL),
('local:pizzeri31','pizzeri31','91X+akHpInDjZ5potYjldcACTcEwBnCzQxrZt1nw9AXDvf5j09Mx6DQAdY88FprKuT0HrXvPnO8xDrVxTblo09/79C3wlf8M10sL76p7UPp42znwA9DbYFbvpdRnQC6FCdDvt8FpbUdQvsFmovyXpG/wvGGNOcu3/6e9AK7AHWw=','pBX3Db48mYLXfUoTMcOZf+1UVRj92Nes1v2xjZO0vcol/PMrg0atbOkOqGDYlLGPwB/Vigwg1CICacP2RuXGzg==','핏제리아오','서울특별시','종로구','이화동','31-19','02-3673-5005','11:30-23:00 lastorder 21:30',NULL),
('local:ppaeng106','ppaeng106','C/bj0YU5CxGh4AoVq+avci7DTv2l6v4bXDooxMDywxk4xtfzUn4MOgNkwjrRpjCG7FAH4lMPd5AHvI7dBN5HqtmICQmoivROlZ2CFsH3xl/twKci0SvZBX9T/yT0ezaAX2DNgi7Q7bftTdD1yC5Uj32dY0bowlf4OE2WmuR/Ozs=','XONoC61MbLMNgPVjolNrsi9CU6kAFDTBYJ55jA4RoXpbCcqhCSBFH7K9bQcmdDdK81FFcCx/k/8FElVXauBk5A==','팽팽닭발','서울특별시','성북구','삼선동','2가 106-1','02-741-9095','16:00-01:00',NULL),
('local:pulip587','pulip587','JaQ/9iKBCQR41Gmfpaj6ELLkcv/MZcm5z4P3VuGUyOAR0xNShzbPxZCqVbMP2RbkYI9KJakQUG89mr2FDWebqqIeqFwJdUplBwkdnParqHsQLYn24wX5pLHzbtS7aux0CJg1Ky1rx0tQC8qAijQCuBRt6HZZKsa57MtF+hX/miY=','2ly69bbxnpiqSOmazoGmkLXfqvRA7MVQ0pBfW21cawx+i05gSCm8B9f9PEek5IZhc/xSpXhGniVnwOlc7ac58A==','풀잎채','서울특별시','동대문구','전농2동','587-2','02-3707-1744','10:30-22:00',NULL),
('local:rabit1132','rabit1132','2B6B3ybuQKk326oUH7weI3HYNMjrRnEQmGbkRXAuFrYlC9VXnfJ8x87+Rx6sy9KLBjPoqE+x1m6cFA74oYfoHZqglz02/fGxJJeoUneInFKoihKRmHZp02KqVA1g4UMGkcsfbuGPCj9HRLGjoOSHp1BfSiYToUwRIVoafw3xIgk=','QyLMkTFX91JANNWivQKiweWuaxYAcgaTJBE7txWGx+SJhkVk/wodFduA8Oy2jXlByF2ukG3LO6yTWwSdcCvbPQ==','토끼정','서울특별시','종로구','이화동','1-132','02-762-1030','11:00-22:00 마지막주문 21:20',NULL),
('local:raon9','raon9','RMOYzsxzZ//6lrLmUL+hhTvwKD0DSEmPdOl7dDwZb7+sBGXY7778XpMWWIgQx5VUB/Oe8ckaUisRwxf571Is6LJjcB+CIhMBAWWn3pcrYasAUiLKAZ9x3VRyViBaLH+r9m84sZpyYazoBsbIw5Ty/vOsymLIdjDw/p9RQFHv/oA=','GsMwqW3V2VOksvc9KnCNa1RKE3eQLte4SPbSKX89vgW+sP/YzmusT8iO4OpHVk1+ni0NjuNiO0FXmstp2JsE1A==',' 라온9','서울특별시','동대문구','제기동','892-71','02-6370-2000','런치 11시 -17시 디너 17시-22시',NULL),
('local:real287','real287','NHAc5NMVBlwrTAYkkFFF7wpan9A7Ff3swg1uF13ppuUsH2IQCRIaz7X5oGd3qX0jQ4VSpo5fZdJ/WiK/nTGfp99NVFlnAwD0Es3H45B/ktrLgy5/Ql9Qtrj7MYN0n5oCMgNDWIGCzTguR9wthxeWSMtfyEhh6WSTAbb8BOPeqSQ=','9qQjoivXRDBAFOBM1x9p0nCXjow9/YLSpAzQzrqEIWFogeyNxxCV6kffksxwGp5WNZb4NtIpwvVgSoA7uUA7LA==','레알라면','서울특별시','동대문구','이문동','287-38','070-8967-4208','11:00-21:00 breaktime 15:00-17:00',NULL),
('local:samcheong','samcheong','y6h0rZOxqTizdhoqr8Va7ih2+KzYXCre4kjIiUw7tB9mYg5GW62+P2xDmyeTFWav4Wc5QCHzVR9HZlacjeuixa8W9h5mAiIgie+g5epFQZZo10bZ/sBPlcQ61/W53XSJykS6HmPPPczKPylhsWF9554Hl4LYpJuRj/VLXrK7yhw=','k2JSi5ZbjI4GweRkRAt8UGz1HDiFxAOUJXkd0iOSLw9l7AP0uzrV/G3qBrebSK22zumSJUAyFwgWF4GQ42sI5A==','삼청동수제비','서울특별시','종로구','삼청동','102-2','02-735-2965','11:00-21:00',NULL),
('local:sanmotog2','sanmotog2','L658oPCKns8Qgn5KBYoohs66+ilvc4aqgaw5GPafoPk1FezdbmlRTTeDhwHiq8uMqeEjej6JpzPAWkc9YbPzCr1VXKfUj2+hYOPc239LRFwaCTCU78AH/64VEI7N0zdU3IuO4YYwqPw5iU0UrqZX0/fniy4H6zsrSdhNEq5zX5E=','1csNzXiNwZeWDkCP+frpasCkl5K7KHtzo60U8VNSC+WkF7DLnPKit/DUvWoAzaEzuqLhAtdRn2QRNeekoQZo0A==','산모퉁이','서울특별시','종로구','부암동','94-5','02-391-4737','11:00-22:00',NULL),
('local:seafood27','seafood27','xBdhrdyf/PChOhMKUK5+JfAc8q784sgHe9TjlwwKlTsvDZiQT6rdmnK6Nwf4gT2YSQpEWs+u05HqfLlAPJ4eN9kAGTkYYOKtFAzIpmKVvO9IEu8QzOK0H/DZOLWA2ru9d9OOFjxPRxL2V/A+3GvdKoHCV4DQ50gYv7qPagkF/dQ=','GiFTJLSHtB8wIfW9q+92QILt/6f792xmIyOFZS+S9wtvflcWSBd58sb9hCMCml1D4/ZG1kV31rPc0uDnzsk4rQ==','아구와해물마을','서울특별시','성북구','월곡동','27-109','02-943-4477','11:30-22:00',NULL),
('local:seochon111','seochon111','m+8oEF0Rmgu44irdI9lajpV1rlinlwRNKVuKZbZXM7z/WMRqYrfKE0v+XAOrMd1xT0xwXxDypRCbC1EywMveZr9j0/1x3LcFDYgvd78AHwbeNNb2q7vGL0LpjOc3eR1p5fE3LBai/RjqQdrAxMpiS3AnFxeEG+eHKBwG4ZnE+sY=','pDI3sk7C6FDAEAhs5k0362sA6aeOEED3Wdt9VWLb44gnG/lqDnfzEM7zAz3rM4yltUzScCZq/J7J/KXsrZA/0w==','서촌계단집','서울특별시','종로구','사직동','11-1','02-737-8412','16:00-01:00 동절기 16:00-04:00 하철기',NULL),
('local:sinsaso13','sinsaso13','QFhAsMVGtAxIJNHmtop9VbL4Yb48tnsJAdV/cX1jTsYxWGADhp787T5SkEKLryWZChykt+hs9tijAQ42yPOOijPdli8wm8d/whwD4h9AL2s3tWlDWB02trEr4THW/0Is8Dq5nySmSVV1+W+2YyQ13HFE/5gkUvo2URPBe8GwVOk=','yz0YmwpJOxBWZOa+GUtxNeTgVHcenN7eRVdqOUlokZK8xKGfdrYNBrgK70NPkmBqwQKTz8kBWj6x13Cy4YMByw==','신사소곱창','서울특별시','성북구','석관동','133-45','02-967-0102','16:00-02:00 일요일은1시까지',NULL),
('local:snowtree','snowtree','/VUVLAOLmVys6rEVMP3YS6DAe4rJ1H0REchKeSIWiUG1elnxvYEfPuSWgz/yN+Bq/fIUOJ5a7N1ZoJhhQm4iw+28fjVs6DrM+tp+23iS50FwrFLsk85UAX3udxa5l2t8fUi+bRRJVVQ3NTKYcvsujZ/HubGD6NOwY40XVDiJnh4=','nlQs8E6zIMQoKkMbJPu9ZnkA4AwDo3CfgGYi3grj/gB7LDplHRrWzfXFQwRV2u3Ki+T0S4xIpogbHLoOwOgVTw==','눈나무집','서울특별시','종로구','삼청동','20-8','02-739-6742','11:30-21:00',NULL),
('local:so1mari','so1mari','gcwJGaY9mJCDxlH3vIQTJWdql6PrKM754H7vOBxZ7pJCv66yYioedK3oGnobCRS0tCjWd4uN3A8rYi3OTnFMBgDrmOWAV2AfauYFZqxZA6KtoZRngDXY5SejLI4YMbtdDpdx7eobzlL5bw/Eq1M5/ALLvKpuU32630Mx0NX9kHg=','NqfygD3HQZw7DNNaUAe7+cITGBMChGbzXkhiwGPsgynZ2+xx0zTPoih4VARyCogXHWrekevQSlr0aldDcpCX4w==','소한마리 정육식당','서울특별시','성북구','삼선동','2가 197','02-766-7749','1:00-22:00',NULL),
('local:sonmandu2','sonmandu2','dijTRSHdRELhhaPfuXkSjL7AqQ1BM1m5QvllgbV/C0ygrTDFEtjG5Fz/UDo3F2AQsfkTqAxswNyxN9S9p+Fqq/7qK5Dq1Jl3TkDVI1R9z/iDt66UqDbDI6c3JmCBu/BNIX0aPCyszKIKMqg13BkTyRKwoZgtrJovz5srTkFe5eU=','Uy9Y0kfqQOAAb9hKrgydDzdW+BjzyVlwT6uNuy6Wjk1R4ABKa6OZXyUq970a/H3uNqiS9tEwL0EUeFfu013TKQ==','자하손만두','서울특별시','종로구','부암동','245-5','02-379-2648','11:30-21:30 명절전날, 당일 휴무',NULL),
('local:star247','star247','/0yaKWS8VIMbuTtGS7DtcrCf7e+1s5dDk70E7eZFBYbtiVL48mnDFpHuPw5QmoMPPUJ326zeyv+rZbRwdpij5GMB38sKd+R3/pC39yJ9TDgubhKCdeANKHw/hEImBu7xyHGD7t9O/QJ3pS1fK7mQycyveGAx8KiKuRKXYOvFu/0=','yMJh/xcP7rRk6Jg1XE49lVXkFpl6U1yAJKLbscyPPBKcni6+nwufLrMmnkv5itKqBX+sJZqoj9LLVoavC0Qqmg==','혜성칼국수','서울특별시','동대문구','청량리동','50-18','02-967-6918','10:30-21:00 월 휴무',NULL),
('local:stardong17','stardong17','xdMr8Ck40GfmU9MkfoHQmJT7TZuQ7IGNJB0hsNjsSPW2/U5fcF1BcAaaZi1toF5lTGLip6/g5tQFWrxuCA2Qri1dCj6hj3+bp5ruLGJ68iSqdfBwxGImW9MTU19XRsx9ZaoDEqALGHSqM5oyGkVb0wN8Xjvk3igkXr+MUpGSppI=','1Z/Un4ulPvv67J346OoYOSrUCfxHX9rdSbgJVdDJLaRbk1CwEQVD93ubhGcxM1Hiqp6pZysjZyzwjPTKOB0fhw==','스타동','서울특별시','성북구','삼선동','2가 172','02-743-7707','11:00-21:00',NULL),
('local:sunde141','sunde141','8HY14KdRHkwhrn0QsQgd6kONKBPDkueeGmCN4nbpPGgDYx049Xu1JnY05G1f+AjM6Be0QBsAehf6yy7y6G1JlmehihFbXEhVWlg23elYP7vbXSgo15rnFAOpXOqePQfhBRUsdAYLAsdKU144VrXX1WABOPYzlTnG2l5QiZvLJIo=','qFjQeSJKOL6QzrhoOpYPuw8hAcXN1VdLZzhIeI+XdqK/47rf/DJq5o50u/WEvgPWLBPF0Rytg9QOs+TavdeeqQ==','순대실록','서울특별시','종로구','이화동','1-41 우성빌딩','02-742-5338','00:00-24:00',NULL),
('local:sungo147','sungo147','9h+ks7Z+td7bnS3/PDMJR4U07HOkhM/sW7KsltgQoHu2iQx1I/FCrsf8qBnbomOfmBimhX+tqkpYwwy8hX5fvEJ/p4EcREol2cwMHju+5GvdovWq2pAIPRSsu9N6Iyl+ZuP0cNy5apziIK0IZr3ZXc7jfI74FgVhf6IlFwFYTks=','Uk9Q77XOVhoCNv7H7TkVTJSBJJ8RylJN83hS02fTTymORlfLK21+zysYhjmnsRiLmZJkj4qSH1luOAp5s66c+g==','고른햇살','서울특별시','성북구','안암동','5가 147-5 원영스위트','02-953-3394','06:00-23:00',NULL),
('local:sunhee138','sunhee138','kQHzkw7qHZOnUyjXUR00Nd30aFQAbp0eCEE6GUj1RpyZWRm6h6VWqCIcd9KrHafRi+m7ZvmdS9AzPQDnfsHckgTQAG+r6faPgf4j19anaOtozDQTXqtSoP5o4C9EfbITUMva3LRpOyIDMTTFhiXMjBbHZW69SZltl32B/R0HsC4=','+7EtfYgNqJLsCvlvY3R/M8NkHr6ltIMtAF4v0MSaQ/JZziYyMvKxUNV988Rxqkz4VL+8LTzDOGfS5pwU2jWrcA==','순희네 빈대떡','서울특별시','종로구','종로5가동','138-9','02-2264-5057','08:00-24:00 명절당일 휴무',NULL),
('local:sushiman6','sushiman6','W2FNhEKDhxZ2mDD5CIpOwnmQETpJ6uT+4+egVHFsenmIug21spCMI7BuDpvw6HVLWLc5/ozB1om7d3PmeAWySEMjmpelvRDzgKO2Bv764NiWpkAWFRmI/xXtX4MO+O1IClLRNovBQO09b+LOmf9Ruo+Zi6eRWMiVuAYQvfTlEDc=','qeCJZdAzqykfFTi+M4cBbrs0FpE4L/bfc4FaMIbH/4++R6/Z5e1qEfm6nP6xeK+Hxaz5A6BVnTIJGE9urS58CQ==','스시만','서울특별시','성북구','종암동','69-5 1층 스시만','02-924-0771','11:30-22:00 월 휴무',NULL),
('local:sweets360','sweets360','HmnJ2SlL3f6NG/eYezfFRaEtPiLdwlbO3g8QRCpXiyhOTn3PV7btJxLyMdCVKyGexwmtH/kMEJhf6/lPN0SUDxe10gbfPRRANlzz/+lmI9UHwAUGUrpIeVGBXU8IyJUFY7HjCPP3gBMrrcTHMLl4SdIPxgcpLLkQ1VKQVVNMweQ=','G/uefG8zFSi6QM2HQMeOqY2Uc1rU3BJlvJF6fdEnGT+FvBGIqg8B5q2KEqMyd1rFvVQghOkNNRGK5Z2qiSWMdQ==','꽉까스위츠','서울특별시','성북구','삼선동','2가 360','02-2264-0188','13:00-17:00(소진시까지)',NULL),
('local:taewon243','taewon243','90eB3SqcBtPnjjmKZFtgNsWL6ZtnHAgE3GTzpXELWF+bJVqsdbBswWUu7qOI/mMB/8gLB2PacewnkrsNR65A+mlXwqQCUE/oVnPxdCWbKSs9pOiHOmLO/S6+Yz1Pobx94dazWJC36hgEac7pFzuSDc6fg+XhdWB1Fxg+5KolHc4=','A6jpdYGqYTsH9i15g8o2jVBs3kFJ/SBk0RgKjAYMH33EoEi9eSts3Gkx/Q26WHl96GYlUCzii+FxkdJACGx60A==','태원','서울특별시','동대문구','전농2동','2-43','02-2244-3343','10:30-20:30',NULL),
('local:thepiano1','thepiano1','Cg9Mi33sVWnbbHqhkVc9MYyVx3Z+7jtGhnHLZ3U8oISUBGArCv+B9/dJfPL5tKf93Ao8uclwRMWCWX1zIH/YF8BD1lZIZoT4+E+4Xoa1eOqRutOx3+swcniloERsVJqZ1egaPCMC6EdHYb5r0+2MqqtDEJen5iEHhHISc6Xzztc=','/aFoBLfAxZh+KFy/CGbD3pKQ/3Uio7B8ONCEIHzwDnxdlha7jQS8uMPxtfLhnypxHuqE3g80shaYAcAWZt4AwA==','더 피아노','서울특별시','종로구','평창동','444-1','02-395-2480','10:00-19:00 일요일 휴무',NULL),
('local:tokyo6','tokyo6','7XKlBIZEYNbt1hZtaGK1S2DawKgJYvlzJ2iUd3DYZe5BnRJn72hJHEQlcae5WHUQuMmrGXOJYCNWC2jBhCt0NBmyXCZ7TxoHzo+qtACHiniN6z/XZ+ct6jmsc4JNlPwDNEJmVhTiDmbUiwmNRM3gSz1ATuJpbP655VwZOiqvYQk=','F5+be4y+EloC0NnCEtb8mP+V/iNWNCdNqSJBPIejGEz42cbSzXDq37WTsBHoUPMH9PTqrMC5NaZh6+rTELxluA==','도쿄 스테이크','서울특별시','종로구','종로2가동','종로타워 지하2층','02-720-5097','11:00-21:30 라스트오더 20:50',NULL),
('local:tosok851','tosok851','Gbea6dxA5KcTsVh1YaKmlr6ynQAhzLEvyT/NKRvZ1+9qjBrpcatkozNwlvXw2n0EpnbhauEgHk59TlQR/hfhv4Ep+DMgZTakIq4H07DDA97sm63usuDKfSdrMWcathAgo0LeitSSlwgNerJib0CSkDUrXBtMfCAptuZ8p/8LuXw=','aPdjtfXMfXO5rOvtTLYIZMtakH/NLelDR9hTAUZX7MVtpEeh25dVJSYUvCN18lhpV/przUVz2ry7IAE0r9RpIw==','토속촌삼계탕','서울특별시','종로구','사직동','85-1','02-737-7444','10:00-22:00',NULL),
('local:under24','under24','fgT90l4uJoeQAWp8EeGRyp9IPW/etyjxjGhsPiPcOx37xeyQ/saavuufnYY8nzHjiBYOT+LzJA8a2O/qN2bQY5MiHo/JOCNx8QKm8MD+6yk868Cy1t8W00fUzOTAyPAVinbkrVf3z29vGKLCF6Qbug8svE9b/IdHMRX0Bjkf0r0=','Las+e20S57+duH0F3rHEkTFp+ttj/BwE+4wcb5lnCPd/vwpSGDjaosBFVsINqda4cuzOpTgaNMVc/sMDsKQ7xQ==','언더투에니포','서울특별시','종로구','종로6가동','261-1 동대문종합시장 은하수 빌딩 2층','02-2268-9333','08:00-24:00(토 22:00,일 20:00까지)',NULL),
('local:wagle573','wagle573','jIATu7izwp7BWb/5OldegcVifY85MlBXI5xs7UEOz2YLjpJNk7cyV9RSdaDx9ZjRb4Za6W+zYmjVBvCEWEdHHizgRwHXba+mULzs/YMtsh9hhmWS19G0aUFs5bx8Xi7Xl598EnFCv9u1wEyIEq6LxA52LusgPRjHshKMNThXUpg=','xpFCBVImk5cf1hC0CdmtCyd6ikyo9EuAjwQ6wQb7oIPR7ohu2aJx20GdPvm+yjCcSb53HtZ1d0n1Zk2VL/r1dg==','와글와글족발','서울특별시','종로구','창신동','573-1','02-765-0319','15:00-23:00',NULL),
('local:warabi347','warabi347','WHsc0/PdmU/7yAactYQC4Kt9ZfbNprbxROvhzDNhK3dmjTpOkMkQEEb58IJYmkkIcWQ1Z6/pHIk132hvgfJWIeWvnBy7kDx5peT8/eFqhJjgn11wyS+8YQzyj1ALkKDVQ39yY5JLO2xTkAOrbInf7ZVbIBiM4duxMAFAYG0oJb0=','Vt/ePXBk8YcrYmYV2rgkCsDYi0jQNi35adaUyFSWDyyV/ZR0UtodDxUwU8/EMxTTJpRA6MY6dn2FCIcYk0J/EA==','와라비키친','서울특별시','동대문구','회기동','347-6','070-7517-0710','11:30-21:00 break- 14:00-17:00',NULL),
('local:windduck76','windduck76','71TeZMxADftObnMEokXV0gPUz1SFCGqMY7YpkMi3I4uhuqt7SGuyvcVKmCIEO7lbPpcrV/uXbmmag4breL4Rm9vl5vT6aG2asnXprrfHEJEHdstlrr80sOPAj4OSwMaW87L+lTeO3+9SnED+NsCsRRpe6zaxHa3f8k84DjHTVic=','j8pvD46XR4rp5l2R0jUX7eGTJdds4pr/GWHneBZ5qn6jxhIcEo9ar+k7loYnPF+g9GvM1yvWFocYiuvPtFxfAw==','바람난오리궁뎅이','서울특별시','성북구','정릉동','767-4','02-918-5999','11:30-22 수요일 휴무',NULL),
('local:winner392','winner392','9bYTKNlZgOkSl5WzM+1ckfYuDQ3CzG2axDx4N2XF0qRolbGu5jE4M3bPmn3Diwa/OLyPjJopLXFwu4Rnqn1P0rg74yM9PxuolEgxCeawxI4TYL32gptsjb8SVf2tTx+WrzB/ypnuimobJM0zzAgfXSnSZ7w8OffpFSAywATmkI8=','OjwWETFIsxavYkhJIG8ZzNmyI/B63tBZ82c2tJem6HeXTnlpAjYkOFHzMCZUwt5R5AxFPf3bjEuo7AQa1oocvw==','승리장','서울특별시','성북구','삼선동','2가 392-6','02-765-1004','09:00-23:00',NULL),
('local:wojung155','wojung155','PVEjdPN16Z4RLmth8ZQ3wqc+CD6KcSwweQybx9bS6SvB89jE5TnbWKHmVhzgw5NKcn+ppox+4pOLwhBiCrKC26pQeWZWt2oCJvIYL9ISfNrReGTfSrI160unk2mJaV2EjzOt3FbmjnHiWRW0NHB3l0Sl1rYB1m1NMWtpntakCMI=','MwxgatkTiQ9Uj//TrLhSzUjghmgAsS0VfEvdqnnZrF6c1Jh7ChM6mqqzlLtyHZih3M8R+A9mx6LQQLAlvwPyvQ==','우정회집','서울특별시','종로구','종로6가동','155-1','전화없음','13:00-01:00',NULL),
('local:woma70','woma70','WcmcjqiWZH0C+3aGRbPw8LxUpAnWETVCO2lHYD0mZ1D3n3u35pDV98ANFn9GFpD/VPVj4njC6jdBIAXo0ltNIo+gIu1OiBkGW1qrLCEUxfVK9zUAiFmRT8H6dcIe4pdCqiQM9jGSSBQs9i/d90f68or0/RWISu768ITc0Kb4GPU=','Ox5/B6yjgeWzahSLQ4/sT4NGaPxSX2pcjMjyzYkif/v3/DwmGTrVTmVi+YRrEVwdb63j6TW8/RUY9JLEVgzPFg==','우마스시','서울특별시','동대문구','답십리동','70-19','02-2214-6533','11:00-21:00',NULL),
('local:yukjun104','yukjun104','29q4spnUgN4T2fV6JtWnSNLz6gGvecEDYr8G9yGF9AMw2xlApfaM7+pNRO6nLXjhUqm4grTtqmGKrvhq4MCpPcOpE+ed+eUhrxpA8M/TYAKcpd7iEC4LwJTvX6ahXG3x2wFCuZl0z3meEnQ81iMCsKhD380kXFKT2lFS9TsOBc0=','beS9SN8ky809U9KBZL4rJa+Y/4Es4YsrDuUtMmFKz1SznCLz7cwU0+sQLANQGaUp6gLC0oEt86iweMtYF4vAxA==','육전식당','서울특별시','동대문구','용신동','104-3','02-2253-6373','11:00-23:00 break-15:00-16:00, 명절휴무',NULL);
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
  `price` int(11) ,
  `sale` text DEFAULT NULL,
  `product_imgUrl` text,
  PRIMARY KEY (`owner_auth`,`product`),
  CONSTRAINT `fk_product` FOREIGN KEY (`owner_auth`) REFERENCES `owner` (`owner_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES
('local:chen0921', '설농탕',9000,'10%', 'http://postfiles.pstatic.net/20160615_124/fayry_1465978685029Jsglv_JPEG/%C0%E5%BE%C8%C1%A4_7.jpg?type=w3'),
('local:chen0921', '돈가스 정식',12000,NULL, 'http://blogfiles1.naver.net/MjAxNzA1MjdfMTgx/MDAxNDk1ODg0Mjg0MzYz.M1ouKAkPbV-gCUcT9DBeCJTMSza0b-VrKG0jKukvEzog.aHCmh-LD47LkmdtpmlD6u_eHBY_feYf8T63DyxiDp98g.PNG.kimmeej4989/%C0%E5%BE%C8%B5%BF_%C0%E5%BE%C8%C1%A4%B5%B7%B1%EE%BD%BA__%B4%DE%C4%DE%C7%E2%B1%E2SAM_4503-9.png'),
('local:chen0921', '돈가스',8000,NULL, 'https://postfiles.pstatic.net/MjAxODA0MTBfNTEg/MDAxNTIzMzQ0MzM0ODQz.9K4Vvt1MwbeqcS1YeXQo675UTHDoXUgo7N0DkdaG-Awg.TMRGdlKAgHk-3TRgOo7a0yW69482tXMk_3RHqSDrqsgg.JPEG.nju0424/output_2601937817.jpg?type=w580'),
('local:chen0921', '함박스텍',8000,NULL, 'http://postfiles.pstatic.net/20160615_173/fayry_1465978684755U9So7_JPEG/%C0%E5%BE%C8%C1%A4_6.jpg?type=w3'),
('local:do12', '꼬막짬뽕',8000,NULL,'http://www.suwon.com/news/photo/201709/116728_61129_4056.jpg'),
('local:do12', '짜장면',5000,'3+1', 'http://postfiles.pstatic.net/MjAxODA1MDRfMzkg/MDAxNTI1Mzk4MTU2NTQx.PeP8B6i_pzO55DRk9S5Qh6jrj3WkePLm71aTQYr4w1cg.kT_9m9eC5weZ9WvvL0oARjljWKj685UdeiykPlebP8Eg.JPEG.roomy_atelier/y10.jpg?type=w1'),
('local:do12', '차돌양지짬뽕',8000,NULL, 'http://postfiles.pstatic.net/MjAxNzAzMjVfMjI1/MDAxNDkwNDQ3ODE0NDQ4.sKdOu7Ys8sYEFdiNfpT3oLUr37Cqd6jrvkJdwapVKJog.6GUfB62uEZkdwoz9zUM3hGBdVnRRTOS8tavfCfr4uFIg.JPEG.cjswo965030/KakaoTalk_20170325_221346401.jpg?type=w773'),
('local:do12', '탕수육 소',12000,'4인분 시키면 탕수육 50%','https://postfiles.pstatic.net/MjAxNjEyMDdfMTEy/MDAxNDgxMDk0NzkzNjY4.tkyhJNenZqsq2jXPamZoWAd-ffLyzjmiy_hhRkDAiEUg.OeaK081jlMeqkF3X7VHvtrg8xflNzSeFSU1h_j9HKI8g.JPEG.ha2684/15.JPG?type=w966'),
('local:lay4570', '돼지불갈비정식',13000,'소주 한병 공짜',NULL),
('local:lay4570', '삼치구이',8000,NULL,NULL),
('local:lay4570', '육개장',7000,NULL,NULL)
;
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
INSERT INTO `review` VALUES ('local:wook','local:emmaoh26',5,'남친이랑 오기 좋아요.','혼자 오기에는 좋지 않아요.'),
('local:wook','local:hscthsh3306',3,'음악이 좋음','맛은 그럭저럭'),
('local:wook','local:jwkasa',1,'인테리어 예쁨','불친절'),
('local:wook','local:jwl628',2,'맛있어요!','좀 비싸네요'),
('local:wook','local:ldhfall',3,'먹을만하다','양이 적다'),
('local:wook','local:ujjang93',4,'메뉴가 다양합니다.','단점은 없어요!');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('local:1155','1155','WZba4CB9EhTZhG32lm/GnajMN+4R3GnutBjxDvqHNWKihZ64TQGeggPp6uKcTA1ZNvBftmojUTRyEntRVRvFi1KXDpe89gSSkgKg2DM8bteNCsdFJVP8fG4lA3DYAn6/REy4GAz+0hOr0lO0cLX1eYy3lJwV5MvkaR5VbtbH6n4=','sbQdcc6RsMPqs/MMO1zTk7yUAxuZ7t1J6tGw/Te6cFD9B6/6PhZiKJSFKbYz/S/cDEVOCuRu70GbxwC4hyhMjg==','노트북',NULL,NULL,NULL,NULL),
('local:1222','1222','yPyGG6i5UhY9b70XygLElbwg0TrfFDf7nB2dAHDkq6SGcuwgJOCqJZrGTvC6rjdZiDptVRynG3qPGEfzUm+2DKuyreGvdDhRzZ+TssUdamXUswufxKkGxY3upmaaf2Xhj1sfTMu+Hz3X2JRaRv0mRCwXZtc14+dQAqPB3SEGqd0=','gIvPMiImzsW8fIiinALZcAdahABYLa9wk6tTA618oHBxmeAAJJuDoJ+76PiuGA1URjVMLJ7+El+ue0sKj9Or8Q==','1222',NULL,NULL,NULL,NULL),
('local:emmaoh26','emmaoh26','111111','g2','오지은',NULL,NULL,NULL,NULL),
('local:hscthsh3306','hscthsh330','111111','g2','장희수',NULL,NULL,NULL,NULL),
('local:jhkdie','jhkdie','111111','g2','김정호',NULL,NULL,NULL,NULL),
('local:jwkasa','jwkasa','111111','g2','박진우',NULL,NULL,NULL,NULL),
('local:jwl628','jwl628','111111','111111','이정욱',NULL,NULL,NULL,NULL),
('local:ldhfall','ldhfall','111111','g2','이동현',NULL,NULL,NULL,NULL),
('local:nsj888','nsj888','111111','g2','조남수',NULL,NULL,NULL,NULL),
('local:ujjang93','ujjang93','111111','g2','유광형',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-22  3:50:54
