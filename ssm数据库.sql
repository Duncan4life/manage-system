/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - mimissm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mimissm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mimissm`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `cnee` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `FK_Reference_1` (`uid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`addressId`,`uid`,`cnee`,`phone`,`address`) values (1,1,'zar','15266676667','北京海淀甲骨文'),(2,1,'oracle','15266678888','北京朝阳科技文化一条街'),(3,2,'张三','15290888162','北京大兴西红门');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) DEFAULT NULL,
  `a_pass` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`a_id`,`a_name`,`a_pass`) values (1,'admin','c984aed014aec7623a54f0591da07a85fd4b762d');

/*Table structure for table `carshop` */

DROP TABLE IF EXISTS `carshop`;

CREATE TABLE `carshop` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `numbers` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_Reference_3` (`uid`),
  KEY `FK_Reference_4` (`pid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`pid`) REFERENCES `product_info` (`p_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `carshop` */

insert  into `carshop`(`cid`,`uid`,`pid`,`numbers`) values (1,1,1,2);

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `odid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` char(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pnumber` int(11) DEFAULT NULL,
  `ptotal` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`odid`),
  KEY `FK_Reference_7` (`oid`),
  KEY `FK_Reference_8` (`pid`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`pid`) REFERENCES `product_info` (`p_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`oid`) REFERENCES `xmorder` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`odid`,`oid`,`pid`,`pnumber`,`ptotal`) values (1,'abcd111222333444777888999000wwww',1,2,9996.00);

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) DEFAULT NULL,
  `p_content` varchar(200) DEFAULT NULL,
  `p_price` int(11) DEFAULT NULL,
  `p_image` varchar(200) DEFAULT NULL,
  `p_number` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `product_info` */

insert  into `product_info`(`p_id`,`p_name`,`p_content`,`p_price`,`p_image`,`p_number`,`type_id`,`p_date`) values (1,'基于SSM框架的商城开发','本文基于ssm框架开发',20000,'xmNote2.jpg',500,1,'2018-01-04'),(2,'红米Note5A','5.5英寸 粉色 2GB内存 16GB闪存',699,'hmNote5A.jpg',500,1,'2018-01-05'),(3,'红米Note4X','5.5英寸 绿色 4GB内存 64GB闪存',1299,'hmNote4X.jpg',500,1,'2018-01-06'),(4,'红米4','5英寸 金色 3GB内存 32GB闪存',999,'hm4.jpg',500,1,'2018-01-07'),(5,'红米4X','5英寸 黑色 3GB内存 32GB闪存',899,'hm4X.jpg',500,1,'2018-01-08'),(6,'小米平板3','7.9英寸 金色 4GB内存 64GB闪存',1499,'xmPad3.jpg',500,2,'2018-01-09'),(7,'小米Air12','12.5英寸 银色 4GB内存 128GB闪存',3599,'xmAir12.jpg',500,2,'2018-01-18'),(8,'小米Air13','13.3英寸 银色 8GB内存 256GB闪存',4999,'xmAir13.jpg',500,2,'2018-01-17'),(9,'小米Pro','15.6英寸 灰色 16GB内存 256GB闪存',6999,'xmPro.jpg',500,2,'2018-01-16'),(10,'小米电视4','49英寸 原装LG屏 3840×2160 真4K',3299,'xmTV4-49.jpg',500,3,'2018-01-15'),(11,'小米电视4','55英寸 原装三星屏 3840×2160 真4K',3999,'xmTV4-55.jpg',500,3,'2018-01-13'),(12,'小米电视4','65英寸 原装三星屏 3840×2160 真4K',8999,'xmTV4-65.jpg',500,3,'2018-01-22'),(13,'小米电视4A','43英寸 FHD全高清屏 1920*1080',1999,'xmTV4A-43.jpg',500,3,'2018-01-11'),(14,'小米电视4A','49英寸 FHD全高清屏 1920*1080',2299,'xmTV4A-49.jpg',500,3,'2018-01-21'),(15,'小米MIX2','全陶瓷 黑色 8GB内存 128GB闪存',4699,'xmMIX2.jpg',500,1,'2018-04-01'),(16,'小米Note3','全网通 蓝色 6GB内存 64GB闪存',2499,'xmNote3.jpg',500,1,'2018-03-01'),(17,'小米6','玻璃金属 白色 6GB内存 128GB闪存',2899,'xm6.jpg',500,1,'2018-02-01'),(18,'小米MAX2','全金属 金色 4GB内存 64GB闪存',1599,'xmMAX2.jpg',500,1,'2018-01-02'),(19,'小米5X','全金属 金色 4GB内存 64GB闪存',1499,'xm5X.jpg',500,1,'2018-01-03');

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `product_type` */

insert  into `product_type`(`type_id`,`type_name`) values (1,'学术型论文'),(2,'专业型论文'),(3,'顶会文章');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `upass` varbinary(50) DEFAULT NULL,
  `ustatus` int(11) DEFAULT NULL,
  `ulevel` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`uid`,`uname`,`upass`,`ustatus`,`ulevel`,`score`) values (1,'zar','123456',0,0,0),(2,'zhangsan','123456',1,0,0);

/*Table structure for table `xmorder` */

DROP TABLE IF EXISTS `xmorder`;

CREATE TABLE `xmorder` (
  `oid` char(32) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `totalprice` double(10,2) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `odate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `FK_Reference_5` (`uid`),
  KEY `FK_Reference_6` (`addressId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xmorder` */

insert  into `xmorder`(`oid`,`uid`,`addressId`,`totalprice`,`remarks`,`status`,`odate`) values ('abcd111222333444777888999000wwww',1,1,9996.00,'尽快送到','待发货','2022-03-22 22:23:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
