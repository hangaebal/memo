-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: memo
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `seq` int(11) DEFAULT '1',
  `name` varchar(300) DEFAULT '',
  `shortcut` varchar(300) DEFAULT '' COMMENT '메모장 서브메뉴 단축키 표시부분',
  `url` varchar(50) DEFAULT '',
  `line_yn` enum('n','y') DEFAULT 'n' COMMENT '구분선 여부',
  `disable_yn` enum('n','y') DEFAULT 'n' COMMENT '비활성화 여부',
  `del_yn` enum('n','y') DEFAULT 'n' COMMENT '삭제 여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='메뉴 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,0,1,'파일(FFF)','','','n','n','n'),(2,0,2,'편집(E)','','','n','n','n'),(3,0,3,'서식(O)','','','n','n','n'),(4,0,4,'보기(V)','','','n','n','n'),(5,0,5,'도움말(H)','','','n','n','n'),(14,1,1,'새로 만들기(N)','Ctrl+N','/new','n','n','n'),(15,1,2,'열기(O)...','Ctrl+O','/open','n','n','n'),(16,1,3,'저장(S)','Ctrl+S','/save','n','n','n'),(17,1,4,'다른 이름으로 저장(A)...','','/a-save','n','n','n'),(18,1,5,'','','','y','n','n'),(19,1,6,'페이지 설정(U)...','','/setup','n','n','n'),(20,1,7,'인쇄(P)...','Ctrl+P','/print','n','n','n'),(21,1,8,'','','','y','n','n'),(22,1,9,'끝내기(X)','','/exit','n','n','n'),(23,2,1,'실행 취소(U)','Ctrl+Z','/undo','n','n','n'),(24,2,2,'','','','y','n','n'),(25,2,3,'잘라내기(T)','Ctrl+X','/cut','n','n','n'),(26,2,4,'복사(C)','Ctrl+C','/copy','n','n','n'),(27,2,5,'붙여넣기(P)','Ctrl+V','/paste','n','n','n'),(28,2,6,'삭제(L)','Del','/delete','n','n','n'),(29,2,7,'','','','y','n','n'),(30,2,8,'찾기(F)...','Ctrl+F','/find','n','n','n'),(31,2,9,'다음 찾기(N)','F3','/find-next','n','n','n'),(32,2,10,'바꾸기(R)...','Ctrl+H','/replace','n','n','n'),(33,2,11,'이동(G)...','Ctrl+G','/go','n','n','n'),(34,2,12,'','','','y','n','n'),(35,2,13,'모두 선택(A)','Ctrl+A','/all','n','n','n'),(36,2,14,'시간/날짜(D)...','F5','/date','n','n','n'),(37,3,1,'자동 줄바꿈(W)','','/word-break','n','n','n'),(38,3,2,'글꼴(F)...','','/font','n','n','n'),(39,4,1,'상태 표시줄(S)','','/status','n','n','n'),(40,5,1,'도움말 보기(H)','','/hep','n','n','n'),(41,5,2,'','','','y','n','n'),(42,5,3,'메모장 정보(A)','','/about','n','n','n');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-21 15:19:46
