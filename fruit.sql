-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: fruit
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `CartInfo`
--

DROP TABLE IF EXISTS `CartInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CartInfo_goods_id_32036da9_fk_Goods_id` (`goods_id`),
  KEY `CartInfo_user_id_9bef19e0_fk_user_id` (`user_id`),
  CONSTRAINT `CartInfo_goods_id_32036da9_fk_Goods_id` FOREIGN KEY (`goods_id`) REFERENCES `Goods` (`id`),
  CONSTRAINT `CartInfo_user_id_9bef19e0_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartInfo`
--

LOCK TABLES `CartInfo` WRITE;
/*!40000 ALTER TABLE `CartInfo` DISABLE KEYS */;
INSERT INTO `CartInfo` VALUES (1,2,6,8),(2,2,8,8),(3,1,9,8),(4,1,6,6),(5,1,4,6),(6,1,4,5),(7,1,2,5),(8,1,3,5),(9,1,4,9),(10,1,3,9),(11,3,4,7),(12,1,3,7),(14,2,4,16),(24,6,2,15),(25,2,6,15),(26,1,4,15);
/*!40000 ALTER TABLE `CartInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goods`
--

DROP TABLE IF EXISTS `Goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `spec` varchar(30) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `goodsType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Goods_goodsType_id_90c82256_fk_GoodsType_id` (`goodsType_id`),
  CONSTRAINT `Goods_goodsType_id_90c82256_fk_GoodsType_id` FOREIGN KEY (`goodsType_id`) REFERENCES `GoodsType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods`
--

LOCK TABLES `Goods` WRITE;
/*!40000 ALTER TABLE `Goods` DISABLE KEYS */;
INSERT INTO `Goods` VALUES (1,'欢乐时光水果礼篮',188.00,'1份','static/upload/goods/1-270x270-3877-BXDY6KCU.jpg',1,1),(2,'真心祝福水果礼篮',358.00,'1份','static/upload/goods/1-270x270-2109-SDK5WUW8.jpg',1,1),(3,'深情厚谊水果礼篮',580.00,'1盒','static/upload/goods/1-270x270-2109-SDK5WUW8_mr8ioSE.jpg',1,1),(4,'天天果园500元充值卡',500.00,'1张','static/upload/goods/1-270x270-701-CB41CHUW.jpg',1,1),(5,'天天果园100元充值卡',100.00,'1张','static/upload/goods/1-270x270-695-F2BSB4DC.jpg',1,1),(6,'万事如意礼盒',199.00,'1盒','static/upload/goods/1-270x270-435-8829CP99.jpg',1,1),(7,'模拟商品1',999.99,'1顿','static/upload/goods/1-270x270-2163-8PBW628F.jpg',1,4),(8,'模拟商品2',666.66,'1盒','static/upload/goods/1-270x270-430-9RBRWTU9.jpg',1,2),(9,'模拟商品3',888.88,'1份','static/upload/goods/1-270x270-3877-BXDY6KCU_sXneBWj.jpg',1,3);
/*!40000 ALTER TABLE `Goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GoodsType`
--

DROP TABLE IF EXISTS `GoodsType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoodsType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GoodsType`
--

LOCK TABLES `GoodsType` WRITE;
/*!40000 ALTER TABLE `GoodsType` DISABLE KEYS */;
INSERT INTO `GoodsType` VALUES (1,'礼品卡券','static/upload/goodsType/t4.png','有关礼品卡券的所有内容'),(2,'家庭量贩','static/upload/goodsType/t1.png','有关家庭量贩的所有内容'),(3,'全球鲜果','static/upload/goodsType/t2.png','有关全球鲜果的所有内容'),(4,'生鲜美食','static/upload/goodsType/t3.png','有关生鲜美食的所有内容');
/*!40000 ALTER TABLE `GoodsType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL,
  `aname` varchar(20) NOT NULL,
  `aphone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_id_c030de7d_fk_user_id` (`user_id`),
  CONSTRAINT `address_user_id_c030de7d_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户表',7,'add_users'),(20,'Can change 用户表',7,'change_users'),(21,'Can delete 用户表',7,'delete_users'),(22,'Can add 商品类型',8,'add_goodstype'),(23,'Can change 商品类型',8,'change_goodstype'),(24,'Can delete 商品类型',8,'delete_goodstype'),(25,'Can add 商品',9,'add_goods'),(26,'Can change 商品',9,'change_goods'),(27,'Can delete 商品',9,'delete_goods'),(28,'Can add cart info',10,'add_cartinfo'),(29,'Can change cart info',10,'change_cartinfo'),(30,'Can delete cart info',10,'delete_cartinfo'),(31,'Can add address',11,'add_address'),(32,'Can change address',11,'change_address'),(33,'Can delete address',11,'delete_address'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$9niabPEVkYIW$RIJyFHSdOXp4E8gtz1KSkpHz+MWx2t40wJ0j1xYIwCw=','2018-09-07 09:01:21.626134',1,'xdl','','','',1,1,'2018-09-05 09:27:04.800398');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-05 09:28:10.892868','1','13333759329',1,'[{\"added\": {}}]',7,1),(2,'2018-09-06 09:58:26.905992','1','礼品卡券',1,'[{\"added\": {}}]',8,1),(3,'2018-09-07 00:49:23.511640','2','家庭量贩',1,'[{\"added\": {}}]',8,1),(4,'2018-09-07 00:50:02.500021','3','全球鲜果',1,'[{\"added\": {}}]',8,1),(5,'2018-09-07 00:50:52.126446','4','生鲜美食',1,'[{\"added\": {}}]',8,1),(6,'2018-09-07 01:26:16.985857','1','欢乐时光水果礼篮',1,'[{\"added\": {}}]',9,1),(7,'2018-09-07 01:28:55.908366','2','真心祝福水果礼篮',1,'[{\"added\": {}}]',9,1),(8,'2018-09-07 01:30:59.989773','3','深情厚谊水果礼篮',1,'[{\"added\": {}}]',9,1),(9,'2018-09-07 01:32:17.201740','4','天天果园500元充值卡',1,'[{\"added\": {}}]',9,1),(10,'2018-09-07 01:33:35.076651','5','天天果园100元充值卡',1,'[{\"added\": {}}]',9,1),(11,'2018-09-07 01:34:43.843997','6','万事如意礼盒',1,'[{\"added\": {}}]',9,1),(12,'2018-09-07 01:37:05.769701','7','模拟商品1',1,'[{\"added\": {}}]',9,1),(13,'2018-09-07 01:38:07.121030','8','模拟商品2',1,'[{\"added\": {}}]',9,1),(14,'2018-09-07 01:39:03.190054','9','模拟商品3',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'index','address'),(10,'index','cartinfo'),(9,'index','goods'),(8,'index','goodstype'),(12,'index','order'),(7,'index','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-05 07:12:18.834021'),(2,'auth','0001_initial','2018-09-05 07:12:20.474889'),(3,'admin','0001_initial','2018-09-05 07:12:20.746351'),(4,'admin','0002_logentry_remove_auto_add','2018-09-05 07:12:20.805647'),(5,'contenttypes','0002_remove_content_type_name','2018-09-05 07:12:21.061719'),(6,'auth','0002_alter_permission_name_max_length','2018-09-05 07:12:21.339704'),(7,'auth','0003_alter_user_email_max_length','2018-09-05 07:12:21.443483'),(8,'auth','0004_alter_user_username_opts','2018-09-05 07:12:21.475647'),(9,'auth','0005_alter_user_last_login_null','2018-09-05 07:12:21.549545'),(10,'auth','0006_require_contenttypes_0002','2018-09-05 07:12:21.566405'),(11,'auth','0007_alter_validators_add_error_messages','2018-09-05 07:12:21.588924'),(12,'auth','0008_alter_user_username_max_length','2018-09-05 07:12:21.832643'),(13,'index','0001_initial','2018-09-05 07:12:21.932828'),(14,'sessions','0001_initial','2018-09-05 07:12:22.076066'),(15,'index','0002_goodstype','2018-09-06 09:52:56.005646'),(16,'index','0003_goods','2018-09-07 01:17:04.746444'),(17,'index','0004_cartinfo','2018-09-07 07:40:30.652110'),(18,'index','0005_auto_20180925_0022','2018-09-25 00:23:07.763927'),(19,'index','0006_auto_20180925_0050','2018-09-25 00:50:28.047971');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0jek4btb0uvsxllsdctcgw9m7m5ol82e','NGQ4NzZkYjk4MTQ2ZWMzNjk2NzdmNmY0ODgxYmU4NGFkMGZmNDk3ZDp7InVuYW1lIjoiXHU1MjE4XHU1OTA3IiwidWlkIjoiOCJ9','2018-09-07 08:57:17.589068'),('0rm9rg6h19qccefh2etmasrsx6tbcy4h','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:16:35.551365'),('0vv19dayyas16lmx0ez788f8xxruylda','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:46:33.816680'),('22o9ne3t7j27seog1k576nq8p014kn7h','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 06:28:49.348505'),('284y6eyowpvnqk25trk5eg44nz3gmhlb','MGM4NTVlYWU4ODUxNDM1ZjgwZGRkOGEyZjU0MDk2ZWI3MmMwNmYyMzp7InVuYW1lIjoiXHU4YmY4XHU4NDViXHU0ZWFlIiwidWlkIjoiNyJ9','2018-09-13 06:32:58.672722'),('2gpwnzs94sbrrn4tx00gsb5im19i0jm1','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 03:43:43.867691'),('2skzoxverq1wtrmvako0qv5wagjo2tv9','MjI2YjRiNTlhYWY2MTkzZDBiYjIxZTMzYzY5YTYxNjVmNDVmZGZjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTJmMDkzNWEzMDFjOWVjYTIyMGJlNTI5YTZhOGVjNmVjNTlhZDdjNCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-07 09:43:27.891569'),('2uew3ejujcmos8s8u8aiqli1006his40','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 08:07:06.545418'),('32pjr0xj0fez5gfkn6jv9n25e0bsnc44','N2I4ZWQxYzk4NTlhYjM3YzNkZWVlZDkyZjdjN2UwYjRkYmM0NDNhZTp7InVuYW1lIjoiXHU4ZDc1XHU0ZTkxIiwidWlkIjoiNSJ9','2018-09-13 01:05:59.444850'),('3a9bkormpsk5z48kmg9ptaobo9y76d64','N2I4ZWQxYzk4NTlhYjM3YzNkZWVlZDkyZjdjN2UwYjRkYmM0NDNhZTp7InVuYW1lIjoiXHU4ZDc1XHU0ZTkxIiwidWlkIjoiNSJ9','2018-09-13 01:36:12.562503'),('3alsi24hxrwme4u3zkc9dhhs1dxyat66','NmFmYmE4NDViMmZjM2U3OTgxYzQ2ZmRkMDNjNjQ4Njk1MDU3OWI0OTp7InVuYW1lIjoiXHU4MzQwXHU1ZjY3IiwidWlkIjoiMTUifQ==','2018-09-26 01:19:38.738142'),('3inq7jzt0uww2f4twom7kj1bpaxtu5t7','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:10:02.229652'),('3q4ahqm7f1pa0r3u9439lhxgicduwll6','YmQyZTg0OWY2MzQ5MGI4ODdjNGE1N2IwMDczNmE2NzEzYmQzOTlhZTp7InVpZCI6MTUsInVuYW1lIjoiXHU4MzQwXHU1ZjY3In0=','2018-09-26 10:12:17.813998'),('495carr84yib49iu84yh4aoti2r56p3m','NzNlMmI1MjliMDgyMTgyNzI4YzUyZmM3Y2FmNjk4ZjkyOTAxOTU4Yjp7InVpZCI6NiwidW5hbWUiOiJcdTkwZWRcdTU2MDkifQ==','2018-09-06 11:55:30.470090'),('4avohghcy80xy8dvwt8qfned6zthq8w4','YjE1MThhNGM5MjYxZmY4NmFiYThiMDJhMzkyM2M4MWIzMWYzY2QzZDp7InVuYW1lIjoiXHU1ZjIwXHU4ZmJkIiwidWlkIjoiMTIifQ==','2018-09-06 11:23:56.047950'),('4qs4lkq046enkex4pp5zhslopdeul2bg','OGFmOWMyYjg5OGUyYzdlYjM0OWU0MThlZDJkZDMwYjFiYmEzNGI5Yjp7InVuYW1lIjoiXHU4MzQwXHU1ZjY3IiwidWlkIjoxNX0=','2018-09-26 05:53:41.308807'),('4qyvj1bcrv9uiu87c9jnx8ezu3259t0t','ZTUwOGQ5MzY3MDg4ZTAyOTA1MGFmOTdlNDc0MzYxMTEzMjZmYjEzODp7InVpZCI6IjEiLCJ1bmFtZSI6Ilx1NWY5MFx1NGUxY1x1Njc5NyJ9','2018-09-06 05:26:30.990218'),('5do8rciz6g9shig19t92s84mgkv9y9fm','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 11:07:48.408065'),('5jfc2csju8ii2sdtu79vozemrmc5u76g','Y2U5NDdmMTg0YTY5NmE5ODA1MTI1MzllNWE2ZGUyNTg5NzhlNjgxNDp7InVuYW1lIjoiXHU1ZjIwXHU4ZmJkIn0=','2018-09-06 11:27:58.429477'),('5zn9tld9ka803y8kisng7m4czg47zn83','NzNlMmI1MjliMDgyMTgyNzI4YzUyZmM3Y2FmNjk4ZjkyOTAxOTU4Yjp7InVpZCI6NiwidW5hbWUiOiJcdTkwZWRcdTU2MDkifQ==','2018-09-06 08:32:50.838395'),('6dlnth0ud6lhfptbogjibizdl407r8be','YWMwZjEwMmIzZjRiNGE4ZjE2NDFjODU4MzRlNDMxZDMxYzViMTdkODp7fQ==','2018-09-06 09:25:59.836467'),('6vwryzuvgscgv4up088d9v0ho9jxfi8r','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:00:04.768327'),('6wgoedcntqitciul6977vjceijgp8g2v','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:07:03.854613'),('7tzihs7dzptecm0k5zxdkhwejm1vfm0e','MzJmZjY4MTZkNTUwZmUzZjg0OTU0N2U5ZDZjZGRkYzQwMDdjNzU3NTp7InVuYW1lIjoiXHU1ZjkwXHU1ZWI2IiwidWlkIjoiMTYifQ==','2018-09-25 03:32:22.548515'),('8kfuwbvpu554v9p5s26uhk6rd9uzxgql','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:56:55.331179'),('8mn61bvppqczo5l4vm8l0l6ea3jx8a5e','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-25 13:07:42.170597'),('8okbge174zy6patf9nx9oqeu9y6sq6rz','OTc5NTgzZjIyYjBhZWQ4NzYyODc1OTlkNmRhZWE3YWI3M2I0MDU3MTp7InVuYW1lIjoiXHU4YmY4XHU4NDViXHU0ZWFlIiwidWlkIjo3fQ==','2018-09-13 05:16:01.566644'),('90zybuq9b6bq4do4k5vv997r89iuv3mq','OGFkOTAzNDk1ZTFiZmI2NmQ2YTMwZGQ3YWI2MzkwMGQ4OTU0ZjJhYTp7InVuYW1lIjoiXHU1NDY4XHU3NDVjIn0=','2018-09-05 13:21:29.759174'),('9kopvgmknhea26etdpw7uz9snpw9oaoy','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:18:38.704111'),('9lrlmcqey8mk2qpjlng9i7ni54kh434k','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:09:44.213776'),('9ri1ey5wz2mr6aeofo16x9n2hcnn2clv','MTdhNTQ0YjI2ZTE4ZmNmMGVjZjY3YTc5YTQwODdhNTdhODVjZjMxMDp7InVpZCI6NSwidW5hbWUiOiJcdThkNzVcdTRlOTEifQ==','2018-09-21 07:16:24.081268'),('9twd4sp2xad73j4lsilcxit4aq3vd6xr','YWMwZjEwMmIzZjRiNGE4ZjE2NDFjODU4MzRlNDMxZDMxYzViMTdkODp7fQ==','2018-09-07 10:51:02.466872'),('ae64lqujl7mfyd82xi05cwhwr8lb3lus','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 09:19:52.940845'),('ahb6ic07r8uu5ey1191nyxyt4hx8yw6i','YWMwZjEwMmIzZjRiNGE4ZjE2NDFjODU4MzRlNDMxZDMxYzViMTdkODp7fQ==','2018-09-07 06:14:06.032134'),('ap4z6zjfuohrh2j6tochapiaj4kso344','ZTgzM2FkM2Q3ZDI2ZTljYjE3NDQyNzYzMjVlYTMyYmRhZmM4ZjM3MTp7InVpZCI6NywidW5hbWUiOiJcdThiZjhcdTg0NWJcdTRlYWUifQ==','2018-09-06 11:52:25.452904'),('aqgbedxb6a2nob3w4dfflls4lh0jqz05','ODVlZGFhOTEzZmVkMzE4MzgzNDkxZmU2ZDZmNzAyYWQ3OWE2NDcyMzp7InVpZCI6MTEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmYwOTM1YTMwMWM5ZWNhMjIwYmU1MjlhNmE4ZWM2ZWM1OWFkN2M0IiwidW5hbWUiOiJcdTY2ZjlcdTY0Y2QifQ==','2018-09-06 10:33:36.927895'),('bmwylkjf73bmg8gbssoxx6lubarx2gx2','MzJmZjY4MTZkNTUwZmUzZjg0OTU0N2U5ZDZjZGRkYzQwMDdjNzU3NTp7InVuYW1lIjoiXHU1ZjkwXHU1ZWI2IiwidWlkIjoiMTYifQ==','2018-09-26 05:47:30.582516'),('d8fg3hvbksgg96y29un98aum1hp5h637','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:42:44.203187'),('dfaqkr8veylnkucqjajspq05nsc3ak3z','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:58:19.609741'),('di2p0lfsy2h0469mmee1b0ywsl8ju3b4','NGU3NjE4ZGJjYmFkYzgzMTcxYjIzZjgzNjI2MDA4YTUwMGVjZGFhNzp7InVpZCI6IjYiLCJ1bmFtZSI6Ilx1OTBlZFx1NTYwOSJ9','2018-09-06 08:38:10.025411'),('dzhbv1olcrhwn174lhq0c3t6w2ja27ko','OGFkOTAzNDk1ZTFiZmI2NmQ2YTMwZGQ3YWI2MzkwMGQ4OTU0ZjJhYTp7InVuYW1lIjoiXHU1NDY4XHU3NDVjIn0=','2018-09-06 11:36:29.125484'),('esvwqid5eq40awhtxz971a9pbw1vy804','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 08:37:46.754856'),('fimscppevsgipzkgal6pfs55rqncth0v','YjU3NjExZDExNWI3MzdiYjAxNDFjZDA5ODA2ZDhlMmU2ZTM3NDBkMDp7InVuYW1lIjoiXHU1ZjkwXHU0ZTFjXHU2Nzk3IiwidWlkIjoiMSJ9','2018-09-06 06:32:25.971179'),('gcqlkb2o7as0luplrxtqja230i43sn9v','YjhkNWUxNGQ1NTBlYzMwMjMwY2Y3YjBkZWQ0ZDBhNjA1ODczMTFjZDp7InVpZCI6MTAsInVuYW1lIjoiXHU1NDY4XHU3NDVjIn0=','2018-09-06 11:33:37.631734'),('ggya2nnx7yio9ep3ihabxcq3py74foga','Y2RkMGE5NDVmM2RhZTg1MzM4MjU2OWMyNTU3MTZlZjg1OTg5YTNkMzp7InVpZCI6OCwidW5hbWUiOiJcdTUyMThcdTU5MDcifQ==','2018-09-07 06:32:24.736768'),('h18yxcvkpby5m6eujrfztztmuzvdjxc0','NjA3YjNhNzFhOTY1MzU0MDJlNThlN2QwYWJhZTgwNmNjMmFmMDA3ODp7InVpZCI6IjExIiwidW5hbWUiOiJcdTY2ZjlcdTY0Y2QifQ==','2018-09-06 11:07:12.490047'),('h1gn484v0izsyizh3dxe1wlr3zhiicn2','Mjk1Y2RlMzRmMzg5ZTc0MWQxM2YwMTYyMzMyNjRhMmM0OWY3MTQzMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidW5hbWUiOiJcdTVmMjBcdThmYmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmYwOTM1YTMwMWM5ZWNhMjIwYmU1MjlhNmE4ZWM2ZWM1OWFkN2M0IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-09-06 02:36:59.268091'),('h44p40dfly2cs36t5ogw6bz7dsahsm9e','YjM2MGU2YzFhYmMzYzc1NGYyNzM3YjE5ZjhhMWRlZTdjZjk1N2M5Zjp7InVuYW1lIjoiXHU1MjE4XHU1OTA3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyZjA5MzVhMzAxYzllY2EyMjBiZTUyOWE2YThlYzZlYzU5YWQ3YzQifQ==','2018-09-19 12:14:04.025287'),('h4dpubi5xbo3c4az0bslukhfiev7scse','ZTgzM2FkM2Q3ZDI2ZTljYjE3NDQyNzYzMjVlYTMyYmRhZmM4ZjM3MTp7InVpZCI6NywidW5hbWUiOiJcdThiZjhcdTg0NWJcdTRlYWUifQ==','2018-09-07 10:51:26.434847'),('hmgk4ej54fu52y87mflkr9h9o7rh9rjg','OTkzZjVlNGE2Mjg2YjIzMmJkNGM5OTI5ZjI5MTZkMjJjOTFiYmYyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyZjA5MzVhMzAxYzllY2EyMjBiZTUyOWE2YThlYzZlYzU5YWQ3YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImVyck1zZyI6Ilx1NzUyOFx1NjIzN1x1NTQwZFx1NjIxNlx1NWJjNlx1NzgwMVx1NGUwZFx1NmI2M1x1Nzg2ZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-06 04:40:35.977797'),('hq71n8of4wuo7y1izzna3mktm7xplgk4','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:18:16.185367'),('htekjt94gbkmy9mk29s8r5eoof8fhvr1','NWMxNDc1ZDUzYjcwYjI0ZjllODNiNDUyM2VkNDU4ZGQzNWNmNzc2Nzp7InVuYW1lIjoiXHU4MmRmXHU1YTY3IiwiZXJyTXNnIjoiXHU3NTI4XHU2MjM3XHU1NDBkXHU2MjE2XHU1YmM2XHU3ODAxXHU0ZTBkXHU2YjYzXHU3ODZlIn0=','2018-09-06 11:43:01.442147'),('hw5murbj0w4wxt0nmy7nnu3f750tuiid','NzNlMmI1MjliMDgyMTgyNzI4YzUyZmM3Y2FmNjk4ZjkyOTAxOTU4Yjp7InVpZCI6NiwidW5hbWUiOiJcdTkwZWRcdTU2MDkifQ==','2018-09-06 04:48:26.553721'),('hykb7y74huphiyxatzgrojnnog45k01s','Y2RkMGE5NDVmM2RhZTg1MzM4MjU2OWMyNTU3MTZlZjg1OTg5YTNkMzp7InVpZCI6OCwidW5hbWUiOiJcdTUyMThcdTU5MDcifQ==','2018-09-06 09:22:58.080434'),('i7ihwirief4mkpajsyjl629w4m5arg04','MjE2Nzg2ZmNkNzYzODM3NWNjZTBiOTdkZGJmMWFlNGMzNmQ0MTZkYjp7InVuYW1lIjoiXHU1ZjIwXHU4ZmJkIiwidWlkIjoxMn0=','2018-09-06 11:22:26.780816'),('isv39448ifp5u94ucnr7nrfaw0gowc7d','MzJmZjY4MTZkNTUwZmUzZjg0OTU0N2U5ZDZjZGRkYzQwMDdjNzU3NTp7InVuYW1lIjoiXHU1ZjkwXHU1ZWI2IiwidWlkIjoiMTYifQ==','2018-09-25 04:10:12.956970'),('jkf6pb6ba4fam9jlhmvho8xo0ihrs4en','ODBhMDZhYWYzZjkxMmRhNDY2MzY0NzRiMmM4NjA5ODE1Y2ZiNDg4MTp7InVuYW1lIjoiXHU4ZDc1XHU0ZTkxIiwidWlkIjo1fQ==','2018-09-12 13:13:35.518230'),('k3yymlyklynqj8c2ntp9as0kvxaj0u6o','NzJlYTY4Y2U5MGQxMmM1MzdhMGFmYzBlNzc4M2UxMDg3MzUzZDE3Nzp7InVuYW1lIjoiXCJcXHU1ZjkwXFx1NGUxY1xcdTY3OTdcIiIsInVpZCI6IjEifQ==','2018-09-06 05:24:31.589124'),('k6qwi8eczzbvkzdsac1dk4gw0o0mht7i','MDczNTYwNTJkMWE4NTgwOGEzNGU2ODhkMjdhMjU3ZDMyOGUwN2RjYTp7InVuYW1lIjoiXHU1ZjkwXHU0ZTFjXHU2Nzk3IiwidWlkIjoxfQ==','2018-09-06 05:12:53.715712'),('kkxdhf0wvo9y2bspfdn1x9463z4k7ae3','YjJhM2Y3OTM2ZmI4NzMwZWM5OTdiNGRhODc3N2Y2MTk1ODljYjI3YTp7InVpZCI6MSwiZXJyTXNnIjoiXHU3NTI4XHU2MjM3XHU1NDBkXHU2MjE2XHU1YmM2XHU3ODAxXHU0ZTBkXHU2YjYzXHU3ODZlIiwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:51:14.519747'),('knj2uzk0a3hbcqexnue89q3gwrtpol5k','ZTUwOGQ5MzY3MDg4ZTAyOTA1MGFmOTdlNDc0MzYxMTEzMjZmYjEzODp7InVpZCI6IjEiLCJ1bmFtZSI6Ilx1NWY5MFx1NGUxY1x1Njc5NyJ9','2018-09-06 11:08:47.129745'),('krdtnww3cetll2h925dc9xlfplx0fzxq','MzJmZjY4MTZkNTUwZmUzZjg0OTU0N2U5ZDZjZGRkYzQwMDdjNzU3NTp7InVuYW1lIjoiXHU1ZjkwXHU1ZWI2IiwidWlkIjoiMTYifQ==','2018-09-25 04:49:32.306959'),('lcx3zy05jp956ox4ed4hm9gl0o7ahzif','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 04:59:07.555019'),('ldmt21jhsgb0ki4yg0ppeeokhu0y9ajp','MGQ3NWFhMTM4MGQ3NmFmOWFlNzAzMWY3Yzk4MjdjMDAxMjY0ZDNiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyZjA5MzVhMzAxYzllY2EyMjBiZTUyOWE2YThlYzZlYzU5YWQ3YzQiLCJ1aWQiOjksIl9hdXRoX3VzZXJfaWQiOiIxIiwidW5hbWUiOiJcdTVmMjBcdTk4ZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2018-09-07 01:17:01.868164'),('lhk2tf4pgiikg1wc445c83doui1ot0kn','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:29:13.048683'),('ll4qgw6t9shp16znskjy5g8o9wcn3312','OTViMjkzOTRkNGQ2NTQwYWMyMDkzZDI5NjQ3NWI4ODI2YmRjMGRmYjp7InVpZCI6MSwidW5hbWUiOiJcIlxcdTVmOTBcXHU0ZTFjXFx1Njc5N1wiIn0=','2018-09-06 11:13:49.627247'),('lsoatjvmqicc4z4hmefcqbi8utwdct2y','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 07:34:13.321687'),('m4ywt1e7uzja2w89twj17fbq6j6xhfu0','Y2U5NDdmMTg0YTY5NmE5ODA1MTI1MzllNWE2ZGUyNTg5NzhlNjgxNDp7InVuYW1lIjoiXHU1ZjIwXHU4ZmJkIn0=','2018-09-06 11:25:12.989047'),('mbjnlv6f7iivo7lihgidrrxg9yoyj41t','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:21:49.210383'),('mbnc3xw3u4l5lsddvyjfr26xdkdg6k8v','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:03:36.646611'),('mek09slk4mg8ey84e4hl4jtgui6o4stz','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:09:33.031452'),('meo3bjonz6vdcc6zmjte7qpwmx7apm5y','OTU0NWY0ODFmNjQ5ZTdlYzdlYmYzMWU1ZWI1MzM3MDFlNTI4Mzc0Mjp7InVpZCI6IjE2IiwidW5hbWUiOiJcdTVmOTBcdTVlYjYifQ==','2018-09-26 04:19:55.066827'),('mq7q99pjgspo1ipidqarg1tmq0lzd4ns','ZDQ3NTQxZjdlODIzMmFiYjZmNzRmNGQ0NjgyNmY0OTY5MjUwMjljMTp7InVpZCI6IjUiLCJ1bmFtZSI6Ilx1OGQ3NVx1NGU5MSJ9','2018-09-12 13:22:18.042167'),('mwx2d4v47afe4np2f67rg9o9obiyny51','NGQ4NzZkYjk4MTQ2ZWMzNjk2NzdmNmY0ODgxYmU4NGFkMGZmNDk3ZDp7InVuYW1lIjoiXHU1MjE4XHU1OTA3IiwidWlkIjoiOCJ9','2018-09-07 08:57:07.784522'),('nel2b6m4b6npc7lii3juwr7eis5a8acn','ZjQyMDI1OWYzYzM5NzhhMTA2NGMxNTAzM2UxN2MzYTlkOGNjOWM3OTp7InVuYW1lIjoiXHU5MGVkXHU1NjA5IiwidWlkIjo2fQ==','2018-09-06 08:02:33.291153'),('ngiu3kc0a53f044x32k1t6qlh4tcq03u','MTdhNTQ0YjI2ZTE4ZmNmMGVjZjY3YTc5YTQwODdhNTdhODVjZjMxMDp7InVpZCI6NSwidW5hbWUiOiJcdThkNzVcdTRlOTEifQ==','2018-09-06 04:49:35.828603'),('nmp83oxy8njd09c8z1tg0rgyuv0m1mt8','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-25 11:35:56.613874'),('nxig18tbkuxwo5nz1pepm8qjarm8g8zq','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:41:01.051209'),('nzquehgtp8prixn73lqqyb8hkx2qtmzq','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 09:08:26.724415'),('o3tmsfqq907lzsghybxamyafgn27p4rf','ZTUwOGQ5MzY3MDg4ZTAyOTA1MGFmOTdlNDc0MzYxMTEzMjZmYjEzODp7InVpZCI6IjEiLCJ1bmFtZSI6Ilx1NWY5MFx1NGUxY1x1Njc5NyJ9','2018-09-06 11:20:37.635887'),('o4se103nzoj5i9u2a20f8q5s6lhv1qau','ZTgzM2FkM2Q3ZDI2ZTljYjE3NDQyNzYzMjVlYTMyYmRhZmM4ZjM3MTp7InVpZCI6NywidW5hbWUiOiJcdThiZjhcdTg0NWJcdTRlYWUifQ==','2018-09-06 11:33:13.098891'),('oe7c9bcux88ygsk41do566vw1mku7v5o','YTlhNjc2ZjI0ZGUwMDgzYTA5MTZhYjA4MjY1Y2ZmMmEzYzUyYTBjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyZjA5MzVhMzAxYzllY2EyMjBiZTUyOWE2YThlYzZlYzU5YWQ3YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-07 01:52:38.658450'),('osaq2q9gaz1tw2xdgxbiuaiz5axkcb5a','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:10:48.700127'),('ota6umc1j88l0oy1nabbx1lozutfimrs','YWMwZjEwMmIzZjRiNGE4ZjE2NDFjODU4MzRlNDMxZDMxYzViMTdkODp7fQ==','2018-09-13 01:54:01.660810'),('pcki8u6s34nbw9rpdtgm1wij55yozt3r','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 10:11:12.932933'),('pjhrfqxtmfzptnah5hc2p2uiwepxn94g','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 09:38:52.927265'),('pqsq5y5262hp5pdh5hshn6axj608z2xd','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 02:57:54.542213'),('ps3kou33xs94x7w80ae4n9ekvacplvct','Y2U5NDdmMTg0YTY5NmE5ODA1MTI1MzllNWE2ZGUyNTg5NzhlNjgxNDp7InVuYW1lIjoiXHU1ZjIwXHU4ZmJkIn0=','2018-09-06 11:27:08.479455'),('pyqwhzg4lud21uhq9cmod5nrfnb4ap4j','OTU0NWY0ODFmNjQ5ZTdlYzdlYmYzMWU1ZWI1MzM3MDFlNTI4Mzc0Mjp7InVpZCI6IjE2IiwidW5hbWUiOiJcdTVmOTBcdTVlYjYifQ==','2018-09-26 04:57:38.210844'),('q546869p8j5ex3gddr8bbuxg1kwzjd1e','ZWIxNWQxN2ZiZWQ0MDQ3MWRlNzRkMGQxYzJhZjQzYzYyNDY4ZGEwYjp7InVpZCI6MSwidW5hbWUiOiJcdTVmOTBcdTRlMWNcdTY3OTcifQ==','2018-09-06 05:04:50.085712'),('q62nd02in1xkw9knjzo8beaxzjo7qcne','ODUxMzYzNmQzYjdjMTYyZGQyZjg1MDgzMDNkMWNhMzMyNmZlODZlMDp7InVpZCI6MTYsInVuYW1lIjoiXHU1ZjkwXHU1ZWI2In0=','2018-09-25 02:46:44.189513'),('qr0ak2ghb407jdwjizhnz3aoecalmw4q','ZGMwMzIyMzg4ZWMyM2ExYjhhOWNjZTJmNWZmOWQ3OTU0OTU2ODQ0Zjp7InVuYW1lIjoiXHU2NmY5XHU2NGNkIn0=','2018-09-06 02:31:34.028805'),('r80m7ypfzrerbg7bclm0lxpno7jks7wl','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-25 12:07:18.748974'),('rr6mc7qnv89tnmm8cnhre005sexpadym','OTU0NWY0ODFmNjQ5ZTdlYzdlYmYzMWU1ZWI1MzM3MDFlNTI4Mzc0Mjp7InVpZCI6IjE2IiwidW5hbWUiOiJcdTVmOTBcdTVlYjYifQ==','2018-09-25 05:20:06.593821'),('s1owqan3da1knqrqhva5a14b224hghwp','ZTUwOGQ5MzY3MDg4ZTAyOTA1MGFmOTdlNDc0MzYxMTEzMjZmYjEzODp7InVpZCI6IjEiLCJ1bmFtZSI6Ilx1NWY5MFx1NGUxY1x1Njc5NyJ9','2018-09-06 05:28:49.020019'),('tabyg6l12w9cgaa66cwe9kxwtnno9zzn','ZTgzM2FkM2Q3ZDI2ZTljYjE3NDQyNzYzMjVlYTMyYmRhZmM4ZjM3MTp7InVpZCI6NywidW5hbWUiOiJcdThiZjhcdTg0NWJcdTRlYWUifQ==','2018-09-06 11:57:38.083462'),('u7nf8ngjueutjn6skjxs4r57ge7iajt3','NTNiZTExZjU2NDY3Nzg3MzEzNzgyMjc2MDg1NmQ2ODViZjMzYjVmNTp7ImVyck1zZyI6Ilx1NzUyOFx1NjIzN1x1NTQwZFx1NjIxNlx1NWJjNlx1NzgwMVx1NGUwZFx1NmI2M1x1Nzg2ZSJ9','2018-09-06 04:19:51.213965'),('umlnq3tu5i6113xrp9cut43xi7fi02kj','MDczNTYwNTJkMWE4NTgwOGEzNGU2ODhkMjdhMjU3ZDMyOGUwN2RjYTp7InVuYW1lIjoiXHU1ZjkwXHU0ZTFjXHU2Nzk3IiwidWlkIjoxfQ==','2018-09-06 06:34:02.408461'),('v7ffu2xusxvw5iskyuvty84x7zgyz9ob','YmQyZTg0OWY2MzQ5MGI4ODdjNGE1N2IwMDczNmE2NzEzYmQzOTlhZTp7InVpZCI6MTUsInVuYW1lIjoiXHU4MzQwXHU1ZjY3In0=','2018-09-25 10:41:45.578667'),('vb3gy3n3ee8eom07k80lgi0ap2n7ccyw','OGQwYWZlMDljYTcxNWRkYzk2ZDEwY2ZhNWY3MTZlZTllY2JiM2E3NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI5MmYwOTM1YTMwMWM5ZWNhMjIwYmU1MjlhNmE4ZWM2ZWM1OWFkN2M0In0=','2018-09-07 08:11:32.505827'),('vfgg4zlh6tm4w932vmlvzpe5tuwifr7e','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-26 07:00:38.432914'),('vorgfoxveya0byjxvho5e3y1r2zluyym','MDczNTYwNTJkMWE4NTgwOGEzNGU2ODhkMjdhMjU3ZDMyOGUwN2RjYTp7InVuYW1lIjoiXHU1ZjkwXHU0ZTFjXHU2Nzk3IiwidWlkIjoxfQ==','2018-09-06 05:14:55.505339'),('w3nrxjexvlad1mcqs9mk1vtkvm9yu2aj','ZDQ3NTQxZjdlODIzMmFiYjZmNzRmNGQ0NjgyNmY0OTY5MjUwMjljMTp7InVpZCI6IjUiLCJ1bmFtZSI6Ilx1OGQ3NVx1NGU5MSJ9','2018-09-12 13:29:39.164028'),('x18lkxk1xjrb4klkkcpwdtbu642hr9r8','NGUxNmQyNjcxM2RhYTNjZGFiZmRjOThhMzQ2ZGZmNDQ0MmM0NTQ4YTp7InVpZCI6IjciLCJ1bmFtZSI6Ilx1OGJmOFx1ODQ1Ylx1NGVhZSJ9','2018-09-07 10:51:51.222091'),('xvvd6bq34fxe1f4n2rkfb4dp5trdo6r3','N2I4ZWQxYzk4NTlhYjM3YzNkZWVlZDkyZjdjN2UwYjRkYmM0NDNhZTp7InVuYW1lIjoiXHU4ZDc1XHU0ZTkxIiwidWlkIjoiNSJ9','2018-09-12 13:14:21.550789'),('xzo2kmitffrtj4h1f83qtc0roawoets0','MjQxZjliOTg0MGQwZmE5MGU2NDZjMWIyNGE1MjcwZDFjOGI5NGQ5Mzp7InVuYW1lIjoiXHU1ZjkwXHU0ZTFjXHU2Nzk3IiwidWlkIjoxLCJlcnJNc2ciOiJcdTc1MjhcdTYyMzdcdTU0MGRcdTYyMTZcdTViYzZcdTc4MDFcdTRlMGRcdTZiNjNcdTc4NmUifQ==','2018-09-06 07:28:09.768257'),('y4py9t7ivmvjc1nb9q5if8e9r5irru0o','OTU0NWY0ODFmNjQ5ZTdlYzdlYmYzMWU1ZWI1MzM3MDFlNTI4Mzc0Mjp7InVpZCI6IjE2IiwidW5hbWUiOiJcdTVmOTBcdTVlYjYifQ==','2018-09-26 03:49:16.051711'),('y8a6flsvhii29on4cmtmmuf8a203eoxm','NjJhNGU4ZmM5NGRiN2JiOGRjYjNjZjNlMTk4NGM4ZTUyOGYzYjE3Mzp7InVpZCI6IjE1IiwidW5hbWUiOiJcdTgzNDBcdTVmNjcifQ==','2018-09-25 12:37:38.579759'),('zzehu6whmg6bnmcy0163v1k8wpldt4p4','MmM1ZDgzNTdiN2I2MGY2ODNhMjJhNzc4Y2ZhMjhkOWJlMTZiZDc5ZDp7InVuYW1lIjoiXHU1ZjIwXHU5OGRlIn0=','2018-09-05 12:18:07.641033');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_order`
--

DROP TABLE IF EXISTS `index_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(50) NOT NULL,
  `cals` longtext NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_user_id_82fd391d_fk_user_id` (`user_id`),
  CONSTRAINT `index_order_user_id_82fd391d_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_order`
--

LOCK TABLES `index_order` WRITE;
/*!40000 ALTER TABLE `index_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uphone` varchar(20) NOT NULL,
  `upwd` varchar(200) NOT NULL,
  `uemail` varchar(254) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'13333759329','123456789','xdl@163.com','徐东林',1),(2,'54545','','','',1),(3,'1333375932','12','','',1),(4,'','','13333759329@163.com','',1),(5,'13333759321','123456','zhaoyun@163.com','赵云',1),(6,'13333759322','123456','guojia@163.com','郭嘉',1),(7,'13333759323','123456','zhugeliang@163.com','诸葛亮',1),(8,'13333759324','123456','liubei@163.com','刘备',1),(9,'13333759325','123456','zhangwei@163.com','张飞',1),(10,'13333759326','123456','zhouyu@163.com','周瑜',1),(11,'13333759327','123456','caocao@163.com','曹操',1),(12,'13333759328','123456','zhaoliao@163.com','张辽',1),(13,'19983373196','123456','gj@163.com','苟婧',1),(14,'19983373195','pbkdf2_sha1$36000$ehfcyzQdaloQ$5s6UWFyJpAJ4B7tYgvixfbG0Sss=','123@163.com','孙策',1),(15,'13939955755','pbkdf2_sha1$36000$8l4LlGxnnVSt$M8x0MkEvrqXAwpeOCzvLhp0JB88=','123@163.com','荀彧',1),(16,'13939955756','pbkdf2_sha1$36000$MarcelArhut$iVp5OWkGluKgtje9aFZs1bophnY=','123@163.com','徐庶',1),(17,'13939955757','pbkdf2_sha1$36000$MarcelArhut$iVp5OWkGluKgtje9aFZs1bophnY=','123@163.com','黄忠',1),(18,'13939955758','pbkdf2_sha1$36000$MarcelArhut$iVp5OWkGluKgtje9aFZs1bophnY=','123@163.com','司马懿',1);
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

-- Dump completed on 2018-09-26 18:08:41
