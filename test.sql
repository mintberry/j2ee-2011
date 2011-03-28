# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: test
# ------------------------------------------------------
# Server version 5.0.67-community-nt

#
# Source for table commentary
#

DROP TABLE IF EXISTS `commentary`;
CREATE TABLE `commentary` (
  `id` char(32) NOT NULL,
  `content` text,
  `createDate` date default NULL,
  `updateDate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table commentary
#

LOCK TABLES `commentary` WRITE;
/*!40000 ALTER TABLE `commentary` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentary` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table course
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` char(10) NOT NULL,
  `name` char(20) NOT NULL,
  `credit` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table course
#

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table document
#

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` char(32) NOT NULL,
  `name` varchar(200) NOT NULL,
  `filesize` int(11) default NULL,
  `location` varchar(200) default NULL,
  `createDate` date default NULL,
  `updateDate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table document
#

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table studentinfo
#

DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `id` varchar(6) NOT NULL,
  `name` char(10) NOT NULL,
  `sex` char(2) NOT NULL default '男',
  `birthday` date NOT NULL,
  `nation` char(20) default NULL,
  `pinCode` char(18) NOT NULL,
  `email` char(50) NOT NULL,
  `address` char(50) default NULL,
  `phoneNumber` char(25) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table studentinfo
#

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table teacherinfo
#

DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo` (
  `id` varchar(10) NOT NULL,
  `name` char(10) NOT NULL,
  `sex` char(2) NOT NULL default '男',
  `birthday` date NOT NULL,
  `nation` char(20) default NULL,
  `pinCode` char(18) NOT NULL,
  `title` char(10) NOT NULL default '讲师',
  `email` char(50) NOT NULL,
  `address` char(50) default NULL,
  `phoneNumber` char(25) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table teacherinfo
#

LOCK TABLES `teacherinfo` WRITE;
/*!40000 ALTER TABLE `teacherinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacherinfo` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
