-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: 127.0.0.1    Database: marywade
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `omeka_collections`
--

DROP TABLE IF EXISTS `omeka_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_collections` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`public` tinyint(4) NOT NULL,
	`featured` tinyint(4) NOT NULL,
	`added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
	`modified` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
	`owner_id` int(10) unsigned NOT NULL,
	PRIMARY KEY (`id`),
	KEY `public` (`public`),
	KEY `featured` (`featured`),
	KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_collections`
--

LOCK TABLES `omeka_collections` WRITE;
/*!40000 ALTER TABLE `omeka_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_sets`
--

DROP TABLE IF EXISTS `omeka_element_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_element_sets` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`record_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`description` text COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`name`),
	KEY `record_type` (`record_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_sets`
--

LOCK TABLES `omeka_element_sets` WRITE;
/*!40000 ALTER TABLE `omeka_element_sets` DISABLE KEYS */;
INSERT INTO `omeka_element_sets` VALUES (1,NULL,'Dublin Core','The Dublin Core metadata element set is common to all Omeka records, including items, files, and collections. For more information see, http://dublincore.org/documents/dces/.'),(3,'Item','Item Type Metadata','The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.');
/*!40000 ALTER TABLE `omeka_element_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_element_texts`
--

DROP TABLE IF EXISTS `omeka_element_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_element_texts` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`record_id` int(10) unsigned NOT NULL,
	`record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`element_id` int(10) unsigned NOT NULL,
	`html` tinyint(4) NOT NULL,
	`text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`id`),
	KEY `record_type_record_id` (`record_type`,`record_id`),
	KEY `element_id` (`element_id`),
	KEY `text` (`text`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_element_texts`
--

LOCK TABLES `omeka_element_texts` WRITE;
/*!40000 ALTER TABLE `omeka_element_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_element_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_elements`
--

DROP TABLE IF EXISTS `omeka_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_elements` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`element_set_id` int(10) unsigned NOT NULL,
	`order` int(10) unsigned DEFAULT NULL,
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`description` text COLLATE utf8_unicode_ci DEFAULT NULL,
	`comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`),
	UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`),
	KEY `element_set_id` (`element_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_elements`
--

LOCK TABLES `omeka_elements` WRITE;
/*!40000 ALTER TABLE `omeka_elements` DISABLE KEYS */;
INSERT INTO `omeka_elements` VALUES (1,3,NULL,'Text','Any textual data included in the document',NULL),(2,3,NULL,'Interviewer','The person(s) performing the interview',NULL),(3,3,NULL,'Interviewee','The person(s) being interviewed',NULL),(4,3,NULL,'Location','The location of the interview',NULL),(5,3,NULL,'Transcription','Any written text transcribed from a sound',NULL),(6,3,NULL,'Local URL','The URL of the local directory containing all assets of the website',NULL),(7,3,NULL,'Original Format','The type of object, such as painting, sculpture, paper, photo, and additional data',NULL),(10,3,NULL,'Physical Dimensions','The actual physical size of the original image',NULL),(11,3,NULL,'Duration','Length of time involved (seconds, minutes, hours, days, class periods, etc.)',NULL),(12,3,NULL,'Compression','Type/rate of compression for moving image file (i.e. MPEG-4)',NULL),(13,3,NULL,'Producer','Name (or names) of the person who produced the video',NULL),(14,3,NULL,'Director','Name (or names) of the person who produced the video',NULL),(15,3,NULL,'Bit Rate/Frequency','Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)',NULL),(16,3,NULL,'Time Summary','A summary of an interview given for different time stamps throughout the interview',NULL),(17,3,NULL,'Email Body','The main body of the email, including all replied and forwarded text and headers',NULL),(18,3,NULL,'Subject Line','The content of the subject line of the email',NULL),(19,3,NULL,'From','The name and email address of the person sending the email',NULL),(20,3,NULL,'To','The name(s) and email address(es) of the person to whom the email was sent',NULL),(21,3,NULL,'CC','The name(s) and email address(es) of the person to whom the email was carbon copied',NULL),(22,3,NULL,'BCC','The name(s) and email address(es) of the person to whom the email was blind carbon copied',NULL),(23,3,NULL,'Number of Attachments','The number of attachments to the email',NULL),(24,3,NULL,'Standards','',NULL),(25,3,NULL,'Objectives','',NULL),(26,3,NULL,'Materials','',NULL),(27,3,NULL,'Lesson Plan Text','',NULL),(28,3,NULL,'URL','',NULL),(29,3,NULL,'Event Type','',NULL),(30,3,NULL,'Participants','Names of individuals or groups participating in the event',NULL),(31,3,NULL,'Birth Date','',NULL),(32,3,NULL,'Birthplace','',NULL),(33,3,NULL,'Death Date','',NULL),(34,3,NULL,'Occupation','',NULL),(35,3,NULL,'Biographical Text','',NULL),(36,3,NULL,'Bibliography','',NULL),(37,1,8,'Contributor','An entity responsible for making contributions to the resource',NULL),(38,1,15,'Coverage','The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant',NULL),(39,1,4,'Creator','An entity primarily responsible for making the resource',NULL),(40,1,7,'Date','A point or period of time associated with an event in the lifecycle of the resource',NULL),(41,1,3,'Description','An account of the resource',NULL),(42,1,11,'Format','The file format, physical medium, or dimensions of the resource',NULL),(43,1,14,'Identifier','An unambiguous reference to the resource within a given context',NULL),(44,1,12,'Language','A language of the resource',NULL),(45,1,6,'Publisher','An entity responsible for making the resource available',NULL),(46,1,10,'Relation','A related resource',NULL),(47,1,9,'Rights','Information about rights held in and over the resource',NULL),(48,1,5,'Source','A related resource from which the described resource is derived',NULL),(49,1,2,'Subject','The topic of the resource',NULL),(50,1,1,'Title','A name given to the resource',NULL),(51,1,13,'Type','The nature or genre of the resource',NULL);
/*!40000 ALTER TABLE `omeka_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_files`
--

DROP TABLE IF EXISTS `omeka_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_files` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`item_id` int(10) unsigned NOT NULL,
	`order` int(10) unsigned DEFAULT NULL,
	`size` bigint(20) unsigned NOT NULL,
	`has_derivative_image` tinyint(1) NOT NULL,
	`authentication` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
	`mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`type_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`filename` text COLLATE utf8_unicode_ci NOT NULL,
	`original_filename` text COLLATE utf8_unicode_ci NOT NULL,
	`modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
	`stored` tinyint(1) NOT NULL DEFAULT 0,
	`metadata` mediumtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`id`),
	KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_files`
--

LOCK TABLES `omeka_files` WRITE;
/*!40000 ALTER TABLE `omeka_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types`
--

DROP TABLE IF EXISTS `omeka_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_item_types` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`description` text COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types`
--

LOCK TABLES `omeka_item_types` WRITE;
/*!40000 ALTER TABLE `omeka_item_types` DISABLE KEYS */;
INSERT INTO `omeka_item_types` VALUES (1,'Text','A resource consisting primarily of words for reading. Examples include books, letters, dissertations, poems, newspapers, articles, archives of mailing lists. Note that facsimiles or images of texts are still of the genre Text.'),(3,'Moving Image','A series of visual representations imparting an impression of motion when shown in succession. Examples include animations, movies, television programs, videos, zoetropes, or visual output from a simulation.'),(4,'Oral History','A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),(5,'Sound','A resource primarily intended to be heard. Examples include a music playback file format, an audio compact disc, and recorded speech or sounds.'),(6,'Still Image','A static visual representation. Examples include paintings, drawings, graphic designs, plans and maps. Recommended best practice is to assign the type Text to images of textual materials.'),(7,'Website','A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),(8,'Event','A non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),(9,'Email','A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),(10,'Lesson Plan','A resource that gives a detailed description of a course of instruction.'),(11,'Hyperlink','A link, or reference, to another resource on the Internet.'),(12,'Person','An individual.'),(13,'Interactive Resource','A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),(14,'Dataset','Data encoded in a defined structure. Examples include lists, tables, and databases. A dataset may be useful for direct machine processing.'),(15,'Physical Object','An inanimate, three-dimensional object or substance. Note that digital representations of, or surrogates for, these objects should use Moving Image, Still Image, Text or one of the other types.'),(16,'Service','A system that provides one or more functions. Examples include a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.'),(17,'Software','A computer program in source or compiled form. Examples include a C source file, MS-Windows .exe executable, or Perl script.');
/*!40000 ALTER TABLE `omeka_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_item_types_elements`
--

DROP TABLE IF EXISTS `omeka_item_types_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_item_types_elements` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`item_type_id` int(10) unsigned NOT NULL,
	`element_id` int(10) unsigned NOT NULL,
	`order` int(10) unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`),
	KEY `item_type_id` (`item_type_id`),
	KEY `element_id` (`element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_item_types_elements`
--

LOCK TABLES `omeka_item_types_elements` WRITE;
/*!40000 ALTER TABLE `omeka_item_types_elements` DISABLE KEYS */;
INSERT INTO `omeka_item_types_elements` VALUES (1,1,7,NULL),(2,1,1,NULL),(3,6,7,NULL),(6,6,10,NULL),(7,3,7,NULL),(8,3,11,NULL),(9,3,12,NULL),(10,3,13,NULL),(11,3,14,NULL),(12,3,5,NULL),(13,5,7,NULL),(14,5,11,NULL),(15,5,15,NULL),(16,5,5,NULL),(17,4,7,NULL),(18,4,11,NULL),(19,4,15,NULL),(20,4,5,NULL),(21,4,2,NULL),(22,4,3,NULL),(23,4,4,NULL),(24,4,16,NULL),(25,9,17,NULL),(26,9,18,NULL),(27,9,20,NULL),(28,9,19,NULL),(29,9,21,NULL),(30,9,22,NULL),(31,9,23,NULL),(32,10,24,NULL),(33,10,25,NULL),(34,10,26,NULL),(35,10,11,NULL),(36,10,27,NULL),(37,7,6,NULL),(38,11,28,NULL),(39,8,29,NULL),(40,8,30,NULL),(41,8,11,NULL),(42,12,31,NULL),(43,12,32,NULL),(44,12,33,NULL),(45,12,34,NULL),(46,12,35,NULL),(47,12,36,NULL);
/*!40000 ALTER TABLE `omeka_item_types_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_items`
--

DROP TABLE IF EXISTS `omeka_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_items` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`item_type_id` int(10) unsigned DEFAULT NULL,
	`collection_id` int(10) unsigned DEFAULT NULL,
	`featured` tinyint(4) NOT NULL,
	`public` tinyint(4) NOT NULL,
	`modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`added` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
	`owner_id` int(10) unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `item_type_id` (`item_type_id`),
	KEY `collection_id` (`collection_id`),
	KEY `public` (`public`),
	KEY `featured` (`featured`),
	KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_items`
--

LOCK TABLES `omeka_items` WRITE;
/*!40000 ALTER TABLE `omeka_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_keys`
--

DROP TABLE IF EXISTS `omeka_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_keys` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`user_id` int(11) unsigned NOT NULL,
	`label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`key` char(40) COLLATE utf8_unicode_ci NOT NULL,
	`ip` varbinary(16) DEFAULT NULL,
	`accessed` timestamp NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_keys`
--

LOCK TABLES `omeka_keys` WRITE;
/*!40000 ALTER TABLE `omeka_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_options`
--

DROP TABLE IF EXISTS `omeka_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_options` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`value` text COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_options`
--

LOCK TABLES `omeka_options` WRITE;
/*!40000 ALTER TABLE `omeka_options` DISABLE KEYS */;
INSERT INTO `omeka_options` VALUES (2,'administrator_email','test@marywadefamily.org'),(3,'copyright',''),(4,'site_title','MWF Test Site'),(5,'author',''),(6,'description',''),(7,'thumbnail_constraint','200'),(8,'square_thumbnail_constraint','200'),(9,'fullsize_constraint','800'),(10,'per_page_admin','10'),(11,'per_page_public','10'),(12,'show_empty_elements','0'),(13,'path_to_convert',''),(14,'admin_theme','default'),(15,'public_theme','default'),(16,'file_extension_whitelist','aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,m4v,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg,opus,pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt,wav,wax,webm,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),(17,'file_mime_type_whitelist','application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-m4a,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/webm,video/x-m4v,video/x-ms-wmv,video/x-msvideo'),(18,'disable_default_file_validation',''),(20,'display_system_info','1'),(21,'html_purifier_is_enabled','1'),(22,'html_purifier_allowed_html_elements','p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt'),(23,'html_purifier_allowed_html_attributes','*.style,*.class,a.href,a.title,a.target'),(24,'tag_delimiter',','),(25,'public_navigation_main','[{\"can_delete\":false,\"uid\":\"\\/items\\/browse\",\"label\":\"Browse Items\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":1,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"type\":\"Omeka_Navigation_Page_Mvc\",\"pages\":[],\"action\":\"browse\",\"controller\":\"items\",\"module\":null,\"params\":[],\"route\":\"default\",\"reset_params\":true,\"encodeUrl\":true,\"scheme\":null},{\"can_delete\":false,\"uid\":\"\\/collections\\/browse\",\"label\":\"Browse Collections\",\"fragment\":null,\"id\":null,\"class\":null,\"title\":null,\"target\":null,\"accesskey\":null,\"rel\":[],\"rev\":[],\"customHtmlAttribs\":[],\"order\":2,\"resource\":null,\"privilege\":null,\"active\":false,\"visible\":true,\"type\":\"Omeka_Navigation_Page_Mvc\",\"pages\":[],\"action\":\"browse\",\"controller\":\"collections\",\"module\":null,\"params\":[],\"route\":\"default\",\"reset_params\":true,\"encodeUrl\":true,\"scheme\":null}]'),(26,'search_record_types','a:3:{s:4:\"Item\";s:4:\"Item\";s:4:\"File\";s:4:\"File\";s:10:\"Collection\";s:10:\"Collection\";}'),(27,'api_enable',''),(28,'api_per_page','50'),(29,'show_element_set_headings','1'),(30,'use_square_thumbnail','1'),(31,'omeka_update','a:2:{s:14:\"latest_version\";s:6:\"2.6.1\n\";s:12:\"last_updated\";i:1551746535;}'),(32,'omeka_version','2.7.1');
/*!40000 ALTER TABLE `omeka_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_plugins`
--

DROP TABLE IF EXISTS `omeka_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_plugins` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`active` tinyint(4) NOT NULL,
	`version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`name`),
	KEY `active_idx` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_plugins`
--

LOCK TABLES `omeka_plugins` WRITE;
/*!40000 ALTER TABLE `omeka_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_processes`
--

DROP TABLE IF EXISTS `omeka_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_processes` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`user_id` int(10) unsigned NOT NULL,
	`pid` int(10) unsigned DEFAULT NULL,
	`status` enum('starting','in progress','completed','paused','error','stopped') COLLATE utf8_unicode_ci NOT NULL,
	`args` text COLLATE utf8_unicode_ci NOT NULL,
	`started` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
	`stopped` timestamp NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `user_id` (`user_id`),
	KEY `pid` (`pid`),
	KEY `started` (`started`),
	KEY `stopped` (`stopped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_processes`
--

LOCK TABLES `omeka_processes` WRITE;
/*!40000 ALTER TABLE `omeka_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_records_tags`
--

DROP TABLE IF EXISTS `omeka_records_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_records_tags` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`record_id` int(10) unsigned NOT NULL,
	`record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
	`tag_id` int(10) unsigned NOT NULL,
	`time` timestamp NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`),
	UNIQUE KEY `tag` (`record_type`,`record_id`,`tag_id`),
	KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_records_tags`
--

LOCK TABLES `omeka_records_tags` WRITE;
/*!40000 ALTER TABLE `omeka_records_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_records_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_schema_migrations`
--

DROP TABLE IF EXISTS `omeka_schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_schema_migrations` (
	`version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
	UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_schema_migrations`
--

LOCK TABLES `omeka_schema_migrations` WRITE;
/*!40000 ALTER TABLE `omeka_schema_migrations` DISABLE KEYS */;
INSERT INTO `omeka_schema_migrations` VALUES ('20100401000000'),('20100810120000'),('20110113000000'),('20110124000001'),('20110301103900'),('20110328192100'),('20110426181300'),('20110601112200'),('20110627223000'),('20110824110000'),('20120112100000'),('20120220000000'),('20120221000000'),('20120224000000'),('20120224000001'),('20120402000000'),('20120516000000'),('20120612112000'),('20120623095000'),('20120710000000'),('20120723000000'),('20120808000000'),('20120808000001'),('20120813000000'),('20120914000000'),('20121007000000'),('20121015000000'),('20121015000001'),('20121018000001'),('20121110000000'),('20121218000000'),('20130422000000'),('20130426000000'),('20130429000000'),('20130701000000'),('20130809000000'),('20140304131700'),('20150211000000'),('20150310141100'),('20150814155100'),('20151118214800'),('20151209103299'),('20151209103300'),('20161209171900'),('20170331084000'),('20170405125800'),('20200127165700');
/*!40000 ALTER TABLE `omeka_schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_search_texts`
--

DROP TABLE IF EXISTS `omeka_search_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_search_texts` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`record_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`record_id` int(10) unsigned NOT NULL,
	`public` tinyint(1) NOT NULL,
	`title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
	`text` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `record_name` (`record_type`,`record_id`),
	FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_search_texts`
--

LOCK TABLES `omeka_search_texts` WRITE;
/*!40000 ALTER TABLE `omeka_search_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_search_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_sessions`
--

DROP TABLE IF EXISTS `omeka_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_sessions` (
	`id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
	`modified` bigint(20) DEFAULT NULL,
	`lifetime` int(11) DEFAULT NULL,
	`data` blob DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_sessions`
--

LOCK TABLES `omeka_sessions` WRITE;
/*!40000 ALTER TABLE `omeka_sessions` DISABLE KEYS */;
INSERT INTO `omeka_sessions` VALUES ('6ebcolt2ipsmverantai8j6dtl',1551746534,1209600,''),('co415kc3mv7f4a5ar2425cv7sc',1551746535,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}'),('ek86m5sn0fkftu4fb1eh4brdpl',1551746101,1209600,''),('rlgus41f28olhin9ve7783s0fb',1612607965,1209600,'Default|a:1:{s:8:\"redirect\";s:1:\"/\";}'),('vm40u2aejkttckugtvh6e14qug',1551745975,1209600,'');
/*!40000 ALTER TABLE `omeka_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_tags`
--

DROP TABLE IF EXISTS `omeka_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_tags` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_tags`
--

LOCK TABLES `omeka_tags` WRITE;
/*!40000 ALTER TABLE `omeka_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users`
--

DROP TABLE IF EXISTS `omeka_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_users` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`name` text COLLATE utf8_unicode_ci NOT NULL,
	`email` text COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
	`salt` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
	`active` tinyint(4) NOT NULL,
	`role` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
	PRIMARY KEY (`id`),
	UNIQUE KEY `username` (`username`),
	KEY `active_idx` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users`
--

LOCK TABLES `omeka_users` WRITE;
/*!40000 ALTER TABLE `omeka_users` DISABLE KEYS */;
INSERT INTO `omeka_users` VALUES (1,'test','Super User','test@marywadefamily.org','4d3ccefc80e191ef0f14c762ff39a9f8ba20a1be','32585c2a77ef3a64',1,'super');
/*!40000 ALTER TABLE `omeka_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omeka_users_activations`
--

DROP TABLE IF EXISTS `omeka_users_activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omeka_users_activations` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`user_id` int(10) unsigned NOT NULL,
	`url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
	`added` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omeka_users_activations`
--

LOCK TABLES `omeka_users_activations` WRITE;
/*!40000 ALTER TABLE `omeka_users_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `omeka_users_activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_block`
--

DROP TABLE IF EXISTS `wt_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_block` (
	`block_id` int(11) NOT NULL AUTO_INCREMENT,
	`gedcom_id` int(11) DEFAULT NULL,
	`user_id` int(11) DEFAULT NULL,
	`xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`location` enum('main','side') COLLATE utf8_unicode_ci DEFAULT NULL,
	`block_order` int(11) NOT NULL,
	`module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`block_id`),
	KEY `wt_block_fk1` (`gedcom_id`),
	KEY `wt_block_fk2` (`user_id`),
	KEY `wt_block_fk3` (`module_name`),
	CONSTRAINT `wt_block_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
	CONSTRAINT `wt_block_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
	CONSTRAINT `wt_block_ibfk_3` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_block`
--

LOCK TABLES `wt_block` WRITE;
/*!40000 ALTER TABLE `wt_block` DISABLE KEYS */;
INSERT INTO `wt_block` VALUES (1,NULL,-1,NULL,'main',1,'todays_events'),(2,NULL,-1,NULL,'main',2,'user_messages'),(3,NULL,-1,NULL,'main',3,'user_favorites'),(4,NULL,-1,NULL,'side',1,'user_welcome'),(5,NULL,-1,NULL,'side',2,'random_media'),(6,NULL,-1,NULL,'side',3,'upcoming_events'),(7,NULL,-1,NULL,'side',4,'logged_in'),(8,-1,NULL,NULL,'main',1,'gedcom_stats'),(9,-1,NULL,NULL,'main',2,'gedcom_news'),(10,-1,NULL,NULL,'main',3,'gedcom_favorites'),(11,-1,NULL,NULL,'main',4,'review_changes'),(12,-1,NULL,NULL,'side',1,'gedcom_block'),(13,-1,NULL,NULL,'side',2,'random_media'),(14,-1,NULL,NULL,'side',3,'todays_events'),(15,-1,NULL,NULL,'side',4,'logged_in'),(16,NULL,1,NULL,'main',1,'todays_events'),(17,NULL,1,NULL,'main',2,'user_messages'),(18,NULL,1,NULL,'main',3,'user_favorites'),(19,NULL,1,NULL,'side',1,'user_welcome'),(20,NULL,1,NULL,'side',2,'random_media'),(21,NULL,1,NULL,'side',3,'upcoming_events'),(22,NULL,1,NULL,'side',4,'logged_in'),(23,1,NULL,NULL,'main',1,'gedcom_stats'),(24,1,NULL,NULL,'main',2,'gedcom_news'),(25,1,NULL,NULL,'main',3,'gedcom_favorites'),(26,1,NULL,NULL,'main',4,'review_changes'),(27,1,NULL,NULL,'side',1,'gedcom_block'),(28,1,NULL,NULL,'side',2,'random_media'),(29,1,NULL,NULL,'side',3,'todays_events'),(30,1,NULL,NULL,'side',4,'logged_in');
/*!40000 ALTER TABLE `wt_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_block_setting`
--

DROP TABLE IF EXISTS `wt_block_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_block_setting` (
	`block_id` int(11) NOT NULL,
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`block_id`,`setting_name`),
	CONSTRAINT `wt_block_setting_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `wt_block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_block_setting`
--

LOCK TABLES `wt_block_setting` WRITE;
/*!40000 ALTER TABLE `wt_block_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_block_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_change`
--

DROP TABLE IF EXISTS `wt_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_change` (
	`change_id` int(11) NOT NULL AUTO_INCREMENT,
	`change_time` timestamp NOT NULL DEFAULT current_timestamp(),
	`status` enum('accepted','pending','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
	`gedcom_id` int(11) NOT NULL,
	`xref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`old_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	`new_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	`user_id` int(11) NOT NULL,
	PRIMARY KEY (`change_id`),
	KEY `wt_change_ix1` (`gedcom_id`,`status`,`xref`),
	KEY `wt_change_fk1` (`user_id`),
	CONSTRAINT `wt_change_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
	CONSTRAINT `wt_change_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_change`
--

LOCK TABLES `wt_change` WRITE;
/*!40000 ALTER TABLE `wt_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_dates`
--

DROP TABLE IF EXISTS `wt_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_dates` (
	`d_day` tinyint(4) NOT NULL,
	`d_month` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
	`d_mon` tinyint(4) NOT NULL,
	`d_year` smallint(6) NOT NULL,
	`d_julianday1` mediumint(9) NOT NULL,
	`d_julianday2` mediumint(9) NOT NULL,
	`d_fact` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`d_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`d_file` int(11) NOT NULL,
	`d_type` enum('@#DGREGORIAN@','@#DJULIAN@','@#DHEBREW@','@#DFRENCH R@','@#DHIJRI@','@#DROMAN@','@#DJALALI@') COLLATE utf8_unicode_ci DEFAULT NULL,
	KEY `wt_dates_ix1` (`d_day`),
	KEY `wt_dates_ix2` (`d_month`),
	KEY `wt_dates_ix3` (`d_mon`),
	KEY `wt_dates_ix4` (`d_year`),
	KEY `wt_dates_ix5` (`d_julianday1`),
	KEY `wt_dates_ix6` (`d_julianday2`),
	KEY `wt_dates_ix7` (`d_gid`),
	KEY `wt_dates_ix8` (`d_file`),
	KEY `wt_dates_ix9` (`d_type`),
	KEY `wt_dates_ix10` (`d_fact`,`d_gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_dates`
--

LOCK TABLES `wt_dates` WRITE;
/*!40000 ALTER TABLE `wt_dates` DISABLE KEYS */;
INSERT INTO `wt_dates` VALUES (1,'JAN',1,1850,2396759,2396759,'BIRT','I1',1,'@#DGREGORIAN@');
/*!40000 ALTER TABLE `wt_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_default_resn`
--

DROP TABLE IF EXISTS `wt_default_resn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_default_resn` (
	`default_resn_id` int(11) NOT NULL AUTO_INCREMENT,
	`gedcom_id` int(11) NOT NULL,
	`xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`tag_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
	`resn` enum('none','privacy','confidential','hidden') COLLATE utf8_unicode_ci NOT NULL,
	`comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`default_resn_id`),
	UNIQUE KEY `wt_default_resn_ix1` (`gedcom_id`,`xref`,`tag_type`),
	CONSTRAINT `wt_default_resn_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_default_resn`
--

LOCK TABLES `wt_default_resn` WRITE;
/*!40000 ALTER TABLE `wt_default_resn` DISABLE KEYS */;
INSERT INTO `wt_default_resn` VALUES (1,-1,NULL,'SSN','confidential',NULL,'2019-03-05 00:32:09'),(2,-1,NULL,'SOUR','privacy',NULL,'2019-03-05 00:32:09'),(3,-1,NULL,'REPO','privacy',NULL,'2019-03-05 00:32:09'),(4,-1,NULL,'SUBM','confidential',NULL,'2019-03-05 00:32:09'),(5,-1,NULL,'SUBN','confidential',NULL,'2019-03-05 00:32:09'),(6,1,NULL,'SSN','confidential',NULL,'2019-03-05 00:43:02'),(7,1,NULL,'SOUR','privacy',NULL,'2019-03-05 00:43:02'),(8,1,NULL,'REPO','privacy',NULL,'2019-03-05 00:43:02'),(9,1,NULL,'SUBM','confidential',NULL,'2019-03-05 00:43:02'),(10,1,NULL,'SUBN','confidential',NULL,'2019-03-05 00:43:02');
/*!40000 ALTER TABLE `wt_default_resn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_families`
--

DROP TABLE IF EXISTS `wt_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_families` (
	`f_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`f_file` int(11) NOT NULL,
	`f_husb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`f_wife` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`f_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	`f_numchil` int(11) NOT NULL,
	PRIMARY KEY (`f_id`,`f_file`),
	UNIQUE KEY `wt_families_ix1` (`f_file`,`f_id`),
	KEY `wt_families_ix2` (`f_husb`),
	KEY `wt_families_ix3` (`f_wife`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_families`
--

LOCK TABLES `wt_families` WRITE;
/*!40000 ALTER TABLE `wt_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_favorite`
--

DROP TABLE IF EXISTS `wt_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_favorite` (
	`favorite_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`gedcom_id` int(11) NOT NULL,
	`xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
	`favorite_type` enum('INDI','FAM','SOUR','REPO','OBJE','NOTE','URL') COLLATE utf8_unicode_ci NOT NULL,
	`url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`favorite_id`),
	KEY `news_ix1` (`gedcom_id`,`user_id`),
	KEY `wt_favorite_fk1` (`user_id`),
	CONSTRAINT `wt_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
	CONSTRAINT `wt_favorite_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_favorite`
--

LOCK TABLES `wt_favorite` WRITE;
/*!40000 ALTER TABLE `wt_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom`
--

DROP TABLE IF EXISTS `wt_gedcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom` (
	`gedcom_id` int(11) NOT NULL AUTO_INCREMENT,
	`gedcom_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`sort_order` int(11) NOT NULL DEFAULT 0,
	PRIMARY KEY (`gedcom_id`),
	UNIQUE KEY `wt_gedcom_ix1` (`gedcom_name`),
	KEY `wt_gedcom_ix2` (`sort_order`),
	KEY `ix1` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom`
--

LOCK TABLES `wt_gedcom` WRITE;
/*!40000 ALTER TABLE `wt_gedcom` DISABLE KEYS */;
INSERT INTO `wt_gedcom` VALUES (-1,'DEFAULT_TREE',0),(1,'MaryWadeFamilyTest',0);
/*!40000 ALTER TABLE `wt_gedcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom_chunk`
--

DROP TABLE IF EXISTS `wt_gedcom_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom_chunk` (
	`gedcom_chunk_id` int(11) NOT NULL AUTO_INCREMENT,
	`gedcom_id` int(11) NOT NULL,
	`chunk_data` longblob NOT NULL,
	`imported` tinyint(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`gedcom_chunk_id`),
	KEY `ix1` (`gedcom_id`,`imported`),
	CONSTRAINT `wt_gedcom_chunk_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom_chunk`
--

LOCK TABLES `wt_gedcom_chunk` WRITE;
/*!40000 ALTER TABLE `wt_gedcom_chunk` DISABLE KEYS */;
INSERT INTO `wt_gedcom_chunk` VALUES (1,1,'0 HEAD\n1 CHAR UTF-8\n0 @I1@ INDI\n1 NAME Joe /BLOGGS/\n1 SEX M\n1 BIRT\n2 DATE 01 JAN 1850\n2 NOTE Edit this individual and replace their details with your own.\n0 TRLR\n',1);
/*!40000 ALTER TABLE `wt_gedcom_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom_setting`
--

DROP TABLE IF EXISTS `wt_gedcom_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom_setting` (
	`gedcom_id` int(11) NOT NULL,
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`gedcom_id`,`setting_name`),
	CONSTRAINT `wt_gedcom_setting_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom_setting`
--

LOCK TABLES `wt_gedcom_setting` WRITE;
/*!40000 ALTER TABLE `wt_gedcom_setting` DISABLE KEYS */;
INSERT INTO `wt_gedcom_setting` VALUES (-1,'ADVANCED_NAME_FACTS','NICK,_AKA'),(-1,'ADVANCED_PLAC_FACTS',''),(-1,'ALLOW_THEME_DROPDOWN','1'),(-1,'CALENDAR_FORMAT','gregorian'),(-1,'CHART_BOX_TAGS',''),(-1,'DEFAULT_PEDIGREE_GENERATIONS','4'),(-1,'EXPAND_RELATIVES_EVENTS','0'),(-1,'EXPAND_SOURCES','0'),(-1,'FAM_FACTS_ADD','CENS,MARR,RESI,SLGS,MARR_CIVIL,MARR_RELIGIOUS,MARR_PARTNERS,RESN'),(-1,'FAM_FACTS_QUICK','MARR,DIV,_NMR'),(-1,'FAM_FACTS_UNIQUE','NCHI,MARL,DIV,ANUL,DIVF,ENGA,MARB,MARC,MARS,_NMR'),(-1,'FAM_ID_PREFIX','F'),(-1,'FORMAT_TEXT','markdown'),(-1,'FULL_SOURCES','0'),(-1,'GEDCOM_ID_PREFIX','I'),(-1,'GEDCOM_MEDIA_PATH',''),(-1,'GENERATE_UIDS','0'),(-1,'HIDE_GEDCOM_ERRORS','1'),(-1,'HIDE_LIVE_PEOPLE','1'),(-1,'INDI_FACTS_ADD','AFN,BIRT,DEAT,BURI,CREM,ADOP,BAPM,BARM,BASM,BLES,CHRA,CONF,FCOM,ORDN,NATU,EMIG,IMMI,CENS,PROB,WILL,GRAD,RETI,DSCR,EDUC,IDNO,NATI,NCHI,NMR,OCCU,PROP,RELI,RESI,SSN,TITL,BAPL,CONL,ENDL,SLGC,_MILI,ASSO,RESN'),(-1,'INDI_FACTS_QUICK','BIRT,BURI,BAPM,CENS,DEAT,OCCU,RESI'),(-1,'INDI_FACTS_UNIQUE',''),(-1,'KEEP_ALIVE_YEARS_BIRTH',''),(-1,'KEEP_ALIVE_YEARS_DEATH',''),(-1,'LANGUAGE','en-US'),(-1,'MAX_ALIVE_AGE','120'),(-1,'MAX_DESCENDANCY_GENERATIONS','15'),(-1,'MAX_PEDIGREE_GENERATIONS','10'),(-1,'MEDIA_DIRECTORY','media/'),(-1,'MEDIA_ID_PREFIX','M'),(-1,'MEDIA_UPLOAD','1'),(-1,'META_DESCRIPTION',''),(-1,'META_TITLE','webtrees'),(-1,'NO_UPDATE_CHAN','0'),(-1,'NOTE_FACTS_ADD','SOUR,RESN'),(-1,'NOTE_FACTS_QUICK',''),(-1,'NOTE_FACTS_UNIQUE',''),(-1,'NOTE_ID_PREFIX','N'),(-1,'PEDIGREE_FULL_DETAILS','1'),(-1,'PEDIGREE_LAYOUT','1'),(-1,'PEDIGREE_ROOT_ID',''),(-1,'PEDIGREE_SHOW_GENDER','0'),(-1,'PREFER_LEVEL2_SOURCES','1'),(-1,'QUICK_REQUIRED_FACTS','BIRT,DEAT'),(-1,'QUICK_REQUIRED_FAMFACTS','MARR'),(-1,'REPO_FACTS_ADD','PHON,EMAIL,FAX,WWW,RESN'),(-1,'REPO_FACTS_QUICK',''),(-1,'REPO_FACTS_UNIQUE','NAME,ADDR'),(-1,'REPO_ID_PREFIX','R'),(-1,'REQUIRE_AUTHENTICATION','0'),(-1,'SAVE_WATERMARK_IMAGE','0'),(-1,'SAVE_WATERMARK_THUMB','0'),(-1,'SHOW_AGE_DIFF','0'),(-1,'SHOW_COUNTER','1'),(-1,'SHOW_DEAD_PEOPLE','2'),(-1,'SHOW_EST_LIST_DATES','0'),(-1,'SHOW_FACT_ICONS','1'),(-1,'SHOW_GEDCOM_RECORD','0'),(-1,'SHOW_HIGHLIGHT_IMAGES','1'),(-1,'SHOW_LDS_AT_GLANCE','0'),(-1,'SHOW_LEVEL2_NOTES','1'),(-1,'SHOW_LIVING_NAMES','1'),(-1,'SHOW_MEDIA_DOWNLOAD','0'),(-1,'SHOW_NO_WATERMARK','1'),(-1,'SHOW_PARENTS_AGE','1'),(-1,'SHOW_PEDIGREE_PLACES','9'),(-1,'SHOW_PEDIGREE_PLACES_SUFFIX','0'),(-1,'SHOW_PRIVATE_RELATIONSHIPS','1'),(-1,'SHOW_RELATIVES_EVENTS','_BIRT_CHIL,_BIRT_SIBL,_MARR_CHIL,_MARR_PARE,_DEAT_CHIL,_DEAT_PARE,_DEAT_GPAR,_DEAT_SIBL,_DEAT_SPOU'),(-1,'SOUR_FACTS_ADD','NOTE,REPO,SHARED_NOTE,RESN'),(-1,'SOUR_FACTS_QUICK','TEXT,NOTE,REPO'),(-1,'SOUR_FACTS_UNIQUE','AUTH,ABBR,TITL,PUBL,TEXT'),(-1,'SOURCE_ID_PREFIX','S'),(-1,'SUBLIST_TRIGGER_I','200'),(-1,'SURNAME_LIST_STYLE','style2'),(-1,'SURNAME_TRADITION','paternal'),(-1,'THUMBNAIL_WIDTH','100'),(-1,'USE_RIN','0'),(-1,'USE_SILHOUETTE','1'),(-1,'WATERMARK_THUMB','0'),(-1,'WEBTREES_EMAIL','webtrees-noreply@localhost'),(-1,'WORD_WRAPPED_NOTES','0'),(1,'ADVANCED_NAME_FACTS','NICK,_AKA'),(1,'ADVANCED_PLAC_FACTS',''),(1,'ALLOW_THEME_DROPDOWN','1'),(1,'CALENDAR_FORMAT','gregorian'),(1,'CHART_BOX_TAGS',''),(1,'CONTACT_USER_ID','1'),(1,'DEFAULT_PEDIGREE_GENERATIONS','4'),(1,'EXPAND_RELATIVES_EVENTS','0'),(1,'EXPAND_SOURCES','0'),(1,'FAM_FACTS_ADD','CENS,MARR,RESI,SLGS,MARR_CIVIL,MARR_RELIGIOUS,MARR_PARTNERS,RESN'),(1,'FAM_FACTS_QUICK','MARR,DIV,_NMR'),(1,'FAM_FACTS_UNIQUE','NCHI,MARL,DIV,ANUL,DIVF,ENGA,MARB,MARC,MARS,_NMR'),(1,'FAM_ID_PREFIX','F'),(1,'FORMAT_TEXT','markdown'),(1,'FULL_SOURCES','0'),(1,'GEDCOM_ID_PREFIX','I'),(1,'GEDCOM_MEDIA_PATH',''),(1,'GENERATE_UIDS','0'),(1,'HIDE_GEDCOM_ERRORS','1'),(1,'HIDE_LIVE_PEOPLE','1'),(1,'imported','1'),(1,'INDI_FACTS_ADD','AFN,BIRT,DEAT,BURI,CREM,ADOP,BAPM,BARM,BASM,BLES,CHRA,CONF,FCOM,ORDN,NATU,EMIG,IMMI,CENS,PROB,WILL,GRAD,RETI,DSCR,EDUC,IDNO,NATI,NCHI,NMR,OCCU,PROP,RELI,RESI,SSN,TITL,BAPL,CONL,ENDL,SLGC,_MILI,ASSO,RESN'),(1,'INDI_FACTS_QUICK','BIRT,BURI,BAPM,CENS,DEAT,OCCU,RESI'),(1,'INDI_FACTS_UNIQUE',''),(1,'KEEP_ALIVE_YEARS_BIRTH',''),(1,'KEEP_ALIVE_YEARS_DEATH',''),(1,'LANGUAGE','en-GB'),(1,'MAX_ALIVE_AGE','120'),(1,'MAX_DESCENDANCY_GENERATIONS','15'),(1,'MAX_PEDIGREE_GENERATIONS','10'),(1,'MEDIA_DIRECTORY','media/'),(1,'MEDIA_ID_PREFIX','M'),(1,'MEDIA_UPLOAD','1'),(1,'META_DESCRIPTION',''),(1,'META_TITLE','webtrees'),(1,'NO_UPDATE_CHAN','0'),(1,'NOTE_FACTS_ADD','SOUR,RESN'),(1,'NOTE_FACTS_QUICK',''),(1,'NOTE_FACTS_UNIQUE',''),(1,'NOTE_ID_PREFIX','N'),(1,'PEDIGREE_FULL_DETAILS','1'),(1,'PEDIGREE_LAYOUT','1'),(1,'PEDIGREE_ROOT_ID',''),(1,'PEDIGREE_SHOW_GENDER','0'),(1,'PREFER_LEVEL2_SOURCES','1'),(1,'QUICK_REQUIRED_FACTS','BIRT,DEAT'),(1,'QUICK_REQUIRED_FAMFACTS','MARR'),(1,'REPO_FACTS_ADD','PHON,EMAIL,FAX,WWW,RESN'),(1,'REPO_FACTS_QUICK',''),(1,'REPO_FACTS_UNIQUE','NAME,ADDR'),(1,'REPO_ID_PREFIX','R'),(1,'REQUIRE_AUTHENTICATION','0'),(1,'SAVE_WATERMARK_IMAGE','0'),(1,'SAVE_WATERMARK_THUMB','0'),(1,'SHOW_AGE_DIFF','0'),(1,'SHOW_COUNTER','1'),(1,'SHOW_DEAD_PEOPLE','2'),(1,'SHOW_EST_LIST_DATES','0'),(1,'SHOW_FACT_ICONS','1'),(1,'SHOW_GEDCOM_RECORD','0'),(1,'SHOW_HIGHLIGHT_IMAGES','1'),(1,'SHOW_LDS_AT_GLANCE','0'),(1,'SHOW_LEVEL2_NOTES','1'),(1,'SHOW_LIVING_NAMES','1'),(1,'SHOW_MEDIA_DOWNLOAD','0'),(1,'SHOW_NO_WATERMARK','1'),(1,'SHOW_PARENTS_AGE','1'),(1,'SHOW_PEDIGREE_PLACES','9'),(1,'SHOW_PEDIGREE_PLACES_SUFFIX','0'),(1,'SHOW_PRIVATE_RELATIONSHIPS','1'),(1,'SHOW_RELATIVES_EVENTS','_BIRT_CHIL,_BIRT_SIBL,_MARR_CHIL,_MARR_PARE,_DEAT_CHIL,_DEAT_PARE,_DEAT_GPAR,_DEAT_SIBL,_DEAT_SPOU'),(1,'SOUR_FACTS_ADD','NOTE,REPO,SHARED_NOTE,RESN'),(1,'SOUR_FACTS_QUICK','TEXT,NOTE,REPO'),(1,'SOUR_FACTS_UNIQUE','AUTH,ABBR,TITL,PUBL,TEXT'),(1,'SOURCE_ID_PREFIX','S'),(1,'SUBLIST_TRIGGER_I','200'),(1,'SURNAME_LIST_STYLE','style2'),(1,'SURNAME_TRADITION','paternal'),(1,'THUMBNAIL_WIDTH','100'),(1,'title','TEST Mary Wade Family'),(1,'USE_RIN','0'),(1,'USE_SILHOUETTE','1'),(1,'WATERMARK_THUMB','0'),(1,'WEBMASTER_USER_ID','1'),(1,'WEBTREES_EMAIL','webtrees-noreply@localhost'),(1,'WORD_WRAPPED_NOTES','0');
/*!40000 ALTER TABLE `wt_gedcom_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_hit_counter`
--

DROP TABLE IF EXISTS `wt_hit_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_hit_counter` (
	`gedcom_id` int(11) NOT NULL,
	`page_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`page_parameter` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`page_count` int(11) NOT NULL,
	PRIMARY KEY (`gedcom_id`,`page_name`,`page_parameter`),
	CONSTRAINT `wt_hit_counter_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_hit_counter`
--

LOCK TABLES `wt_hit_counter` WRITE;
/*!40000 ALTER TABLE `wt_hit_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_hit_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_individuals`
--

DROP TABLE IF EXISTS `wt_individuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_individuals` (
	`i_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`i_file` int(11) NOT NULL,
	`i_rin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`i_sex` enum('U','M','F') COLLATE utf8_unicode_ci NOT NULL,
	`i_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`i_id`,`i_file`),
	UNIQUE KEY `wt_individuals_ix1` (`i_file`,`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_individuals`
--

LOCK TABLES `wt_individuals` WRITE;
/*!40000 ALTER TABLE `wt_individuals` DISABLE KEYS */;
INSERT INTO `wt_individuals` VALUES ('I1',1,'I1','M','0 @I1@ INDI\n1 NAME Joe /BLOGGS/\n1 SEX M\n1 BIRT\n2 DATE 01 JAN 1850\n2 NOTE Edit this individual and replace their details with your own.');
/*!40000 ALTER TABLE `wt_individuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_link`
--

DROP TABLE IF EXISTS `wt_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_link` (
	`l_file` int(11) NOT NULL,
	`l_from` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`l_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`l_to` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`l_from`,`l_file`,`l_type`,`l_to`),
	UNIQUE KEY `wt_link_ix1` (`l_to`,`l_file`,`l_type`,`l_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_link`
--

LOCK TABLES `wt_link` WRITE;
/*!40000 ALTER TABLE `wt_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_log`
--

DROP TABLE IF EXISTS `wt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_log` (
	`log_id` int(11) NOT NULL AUTO_INCREMENT,
	`log_time` timestamp NOT NULL DEFAULT current_timestamp(),
	`log_type` enum('auth','config','debug','edit','error','media','search') COLLATE utf8_unicode_ci NOT NULL,
	`log_message` longtext COLLATE utf8_unicode_ci NOT NULL,
	`ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
	`user_id` int(11) DEFAULT NULL,
	`gedcom_id` int(11) DEFAULT NULL,
	PRIMARY KEY (`log_id`),
	KEY `wt_log_ix1` (`log_time`),
	KEY `wt_log_ix2` (`log_type`),
	KEY `wt_log_ix3` (`ip_address`),
	KEY `wt_log_fk1` (`user_id`),
	KEY `wt_log_fk2` (`gedcom_id`),
	CONSTRAINT `wt_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
	CONSTRAINT `wt_log_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_log`
--

LOCK TABLES `wt_log` WRITE;
/*!40000 ALTER TABLE `wt_log` DISABLE KEYS */;
INSERT INTO `wt_log` VALUES (1,'2019-03-05 00:32:09','config','Site preference \"INDEX_DIRECTORY\" set to \"data/\"','172.21.0.1',NULL,NULL),(2,'2019-03-05 00:32:09','config','Site preference \"USE_REGISTRATION_MODULE\" set to \"1\"','172.21.0.1',NULL,NULL),(3,'2019-03-05 00:32:09','config','Site preference \"ALLOW_USER_THEMES\" set to \"1\"','172.21.0.1',NULL,NULL),(4,'2019-03-05 00:32:09','config','Site preference \"ALLOW_CHANGE_GEDCOM\" set to \"1\"','172.21.0.1',NULL,NULL),(5,'2019-03-05 00:32:09','config','Site preference \"SESSION_TIME\" set to \"7200\"','172.21.0.1',NULL,NULL),(6,'2019-03-05 00:32:09','config','Site preference \"SMTP_ACTIVE\" set to \"internal\"','172.21.0.1',NULL,NULL),(7,'2019-03-05 00:32:09','config','Site preference \"SMTP_HOST\" set to \"localhost\"','172.21.0.1',NULL,NULL),(8,'2019-03-05 00:32:09','config','Site preference \"SMTP_PORT\" set to \"25\"','172.21.0.1',NULL,NULL),(9,'2019-03-05 00:32:09','config','Site preference \"SMTP_AUTH\" set to \"1\"','172.21.0.1',NULL,NULL),(10,'2019-03-05 00:32:09','config','Site preference \"SMTP_SSL\" set to \"none\"','172.21.0.1',NULL,NULL),(11,'2019-03-05 00:32:09','config','Site preference \"SMTP_HELO\" set to \"localhost\"','172.21.0.1',NULL,NULL),(12,'2019-03-05 00:32:09','config','Site preference \"SMTP_FROM_NAME\" set to \"localhost\"','172.21.0.1',NULL,NULL),(13,'2019-03-05 00:32:09','config','Site preference \"FV_SCHEMA_VERSION\" set to \"1\"','172.21.0.1',NULL,NULL),(14,'2019-03-05 00:32:09','config','Site preference \"FV_SCHEMA_VERSION\" set to \"2\"','172.21.0.1',NULL,NULL),(15,'2019-03-05 00:32:09','config','Site preference \"FV_SCHEMA_VERSION\" set to \"3\"','172.21.0.1',NULL,NULL),(16,'2019-03-05 00:32:09','config','Site preference \"FV_SCHEMA_VERSION\" set to \"4\"','172.21.0.1',NULL,NULL),(17,'2019-03-05 00:32:09','config','Site preference \"NB_SCHEMA_VERSION\" set to \"1\"','172.21.0.1',NULL,NULL),(18,'2019-03-05 00:32:09','config','Site preference \"NB_SCHEMA_VERSION\" set to \"2\"','172.21.0.1',NULL,NULL),(19,'2019-03-05 00:32:09','config','Site preference \"NB_SCHEMA_VERSION\" set to \"3\"','172.21.0.1',NULL,NULL),(20,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"1\"','172.21.0.1',NULL,NULL),(21,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"2\"','172.21.0.1',NULL,NULL),(22,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"3\"','172.21.0.1',NULL,NULL),(23,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"4\"','172.21.0.1',NULL,NULL),(24,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"5\"','172.21.0.1',NULL,NULL),(25,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"6\"','172.21.0.1',NULL,NULL),(26,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"7\"','172.21.0.1',NULL,NULL),(27,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"8\"','172.21.0.1',NULL,NULL),(28,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"9\"','172.21.0.1',NULL,NULL),(29,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"10\"','172.21.0.1',NULL,NULL),(30,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"11\"','172.21.0.1',NULL,NULL),(31,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"12\"','172.21.0.1',NULL,NULL),(32,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"13\"','172.21.0.1',NULL,NULL),(33,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"14\"','172.21.0.1',NULL,NULL),(34,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"15\"','172.21.0.1',NULL,NULL),(35,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"16\"','172.21.0.1',NULL,NULL),(36,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"17\"','172.21.0.1',NULL,NULL),(37,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"18\"','172.21.0.1',NULL,NULL),(38,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"19\"','172.21.0.1',NULL,NULL),(39,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"20\"','172.21.0.1',NULL,NULL),(40,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"21\"','172.21.0.1',NULL,NULL),(41,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"22\"','172.21.0.1',NULL,NULL),(42,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"23\"','172.21.0.1',NULL,NULL),(43,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"24\"','172.21.0.1',NULL,NULL),(44,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"25\"','172.21.0.1',NULL,NULL),(45,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"26\"','172.21.0.1',NULL,NULL),(46,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"27\"','172.21.0.1',NULL,NULL),(47,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"28\"','172.21.0.1',NULL,NULL),(48,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"29\"','172.21.0.1',NULL,NULL),(49,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"30\"','172.21.0.1',NULL,NULL),(50,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"31\"','172.21.0.1',NULL,NULL),(51,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"32\"','172.21.0.1',NULL,NULL),(52,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"33\"','172.21.0.1',NULL,NULL),(53,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"34\"','172.21.0.1',NULL,NULL),(54,'2019-03-05 00:32:09','config','Site preference \"WT_SCHEMA_VERSION\" set to \"35\"','172.21.0.1',NULL,NULL),(55,'2019-03-05 00:32:10','config','Site preference \"WT_SCHEMA_VERSION\" set to \"36\"','172.21.0.1',NULL,NULL),(56,'2019-03-05 00:32:10','config','Site preference \"WT_SCHEMA_VERSION\" set to \"37\"','172.21.0.1',NULL,NULL),(57,'2019-03-05 00:42:25','auth','Login: test/Test Admin','172.23.0.1',1,NULL),(58,'2019-03-05 00:42:27','config','Site preference \"LATEST_WT_VERSION\" set to \"1.7.12|1.0.0|https://github.com/fisharebest/webtrees/releases/download/1.7.12/webtrees-1.7.12.zip\"','172.23.0.1',1,NULL),(59,'2019-03-05 00:42:27','config','Site preference \"LATEST_WT_VERSION_TIMESTAMP\" set to \"1551746545\"','172.23.0.1',1,NULL),(60,'2019-03-05 00:43:02','config','Tree preference \"imported\" set to \"0\"','172.23.0.1',1,1),(61,'2019-03-05 00:43:02','config','Tree preference \"title\" set to \"TEST Mary Wade Family\"','172.23.0.1',1,1),(62,'2019-03-05 00:43:02','config','Tree preference \"CONTACT_USER_ID\" set to \"1\"','172.23.0.1',1,1),(63,'2019-03-05 00:43:02','config','Tree preference \"WEBMASTER_USER_ID\" set to \"1\"','172.23.0.1',1,1),(64,'2019-03-05 00:43:02','config','Tree preference \"LANGUAGE\" set to \"en-GB\"','172.23.0.1',1,1),(65,'2019-03-05 00:43:02','config','Tree preference \"SURNAME_TRADITION\" set to \"paternal\"','172.23.0.1',1,1),(66,'2019-03-05 00:43:03','config','Tree preference \"imported\" set to \"1\"','172.23.0.1',1,1);
/*!40000 ALTER TABLE `wt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_media`
--

DROP TABLE IF EXISTS `wt_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_media` (
	`m_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`m_ext` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
	`m_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`m_titl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`m_filename` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
	`m_file` int(11) NOT NULL,
	`m_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`m_file`,`m_id`),
	UNIQUE KEY `wt_media_ix1` (`m_id`,`m_file`),
	KEY `wt_media_ix2` (`m_ext`,`m_type`),
	KEY `wt_media_ix3` (`m_titl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_media`
--

LOCK TABLES `wt_media` WRITE;
/*!40000 ALTER TABLE `wt_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_message`
--

DROP TABLE IF EXISTS `wt_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_message` (
	`message_id` int(11) NOT NULL AUTO_INCREMENT,
	`sender` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
	`ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
	`user_id` int(11) NOT NULL,
	`subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`body` longtext COLLATE utf8_unicode_ci NOT NULL,
	`created` timestamp NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`message_id`),
	KEY `wt_message_fk1` (`user_id`),
	CONSTRAINT `wt_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_message`
--

LOCK TABLES `wt_message` WRITE;
/*!40000 ALTER TABLE `wt_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module`
--

DROP TABLE IF EXISTS `wt_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module` (
	`module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
	`tab_order` int(11) DEFAULT NULL,
	`menu_order` int(11) DEFAULT NULL,
	`sidebar_order` int(11) DEFAULT NULL,
	PRIMARY KEY (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module`
--

LOCK TABLES `wt_module` WRITE;
/*!40000 ALTER TABLE `wt_module` DISABLE KEYS */;
INSERT INTO `wt_module` VALUES ('ahnentafel_report','enabled',NULL,NULL,NULL),('ancestors_chart','enabled',NULL,NULL,NULL),('batch_update','enabled',NULL,NULL,NULL),('bdm_report','enabled',NULL,NULL,NULL),('birth_report','enabled',NULL,NULL,NULL),('cemetery_report','enabled',NULL,NULL,NULL),('change_report','enabled',NULL,NULL,NULL),('charts','enabled',NULL,NULL,NULL),('ckeditor','enabled',NULL,NULL,NULL),('clippings','enabled',NULL,20,60),('compact_tree_chart','enabled',NULL,NULL,NULL),('death_report','enabled',NULL,NULL,NULL),('descendancy','enabled',NULL,NULL,30),('descendancy_chart','enabled',NULL,NULL,NULL),('descendancy_report','enabled',NULL,NULL,NULL),('extra_info','enabled',NULL,NULL,10),('fact_sources','enabled',NULL,NULL,NULL),('families','enabled',NULL,NULL,50),('family_book_chart','enabled',NULL,NULL,NULL),('family_group_report','enabled',NULL,NULL,NULL),('family_nav','enabled',NULL,NULL,20),('fan_chart','enabled',NULL,NULL,NULL),('faq','enabled',NULL,40,NULL),('gedcom_block','enabled',NULL,NULL,NULL),('gedcom_favorites','enabled',NULL,NULL,NULL),('gedcom_news','enabled',NULL,NULL,NULL),('gedcom_stats','enabled',NULL,NULL,NULL),('GEDFact_assistant','enabled',NULL,NULL,NULL),('googlemap','enabled',80,NULL,NULL),('hourglass_chart','enabled',NULL,NULL,NULL),('html','enabled',NULL,NULL,NULL),('individual_ext_report','enabled',NULL,NULL,NULL),('individual_report','enabled',NULL,NULL,NULL),('individuals','enabled',NULL,NULL,40),('lifespans_chart','enabled',NULL,NULL,NULL),('lightbox','enabled',60,NULL,NULL),('logged_in','enabled',NULL,NULL,NULL),('login_block','enabled',NULL,NULL,NULL),('marriage_report','enabled',NULL,NULL,NULL),('media','enabled',50,NULL,NULL),('missing_facts_report','enabled',NULL,NULL,NULL),('notes','enabled',40,NULL,NULL),('occupation_report','enabled',NULL,NULL,NULL),('page_menu','enabled',NULL,10,NULL),('pedigree_chart','enabled',NULL,NULL,NULL),('pedigree_report','enabled',NULL,NULL,NULL),('personal_facts','enabled',10,NULL,NULL),('random_media','enabled',NULL,NULL,NULL),('recent_changes','enabled',NULL,NULL,NULL),('relationships_chart','enabled',NULL,NULL,NULL),('relative_ext_report','enabled',NULL,NULL,NULL),('relatives','enabled',20,NULL,NULL),('review_changes','enabled',NULL,NULL,NULL),('sitemap','enabled',NULL,NULL,NULL),('sources_tab','enabled',30,NULL,NULL),('statistics_chart','enabled',NULL,NULL,NULL),('stories','enabled',55,30,NULL),('theme_select','enabled',NULL,NULL,NULL),('timeline_chart','enabled',NULL,NULL,NULL),('todays_events','enabled',NULL,NULL,NULL),('todo','enabled',NULL,NULL,NULL),('top10_givnnames','enabled',NULL,NULL,NULL),('top10_pageviews','enabled',NULL,NULL,NULL),('top10_surnames','enabled',NULL,NULL,NULL),('tree','enabled',68,NULL,NULL),('upcoming_events','enabled',NULL,NULL,NULL),('user_blog','enabled',NULL,NULL,NULL),('user_favorites','enabled',NULL,NULL,NULL),('user_messages','enabled',NULL,NULL,NULL),('user_welcome','enabled',NULL,NULL,NULL),('yahrzeit','enabled',NULL,NULL,NULL);
/*!40000 ALTER TABLE `wt_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module_privacy`
--

DROP TABLE IF EXISTS `wt_module_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module_privacy` (
	`module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`gedcom_id` int(11) NOT NULL,
	`component` enum('block','chart','menu','report','sidebar','tab','theme') COLLATE utf8_unicode_ci NOT NULL,
	`access_level` tinyint(4) NOT NULL,
	PRIMARY KEY (`module_name`,`gedcom_id`,`component`),
	KEY `wt_module_privacy_fk2` (`gedcom_id`),
	CONSTRAINT `wt_module_privacy_ibfk_1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`),
	CONSTRAINT `wt_module_privacy_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module_privacy`
--

LOCK TABLES `wt_module_privacy` WRITE;
/*!40000 ALTER TABLE `wt_module_privacy` DISABLE KEYS */;
INSERT INTO `wt_module_privacy` VALUES ('ahnentafel_report',-1,'report',2),('ahnentafel_report',1,'report',2),('ancestors_chart',-1,'chart',2),('ancestors_chart',1,'chart',2),('bdm_report',-1,'report',2),('bdm_report',1,'report',2),('birth_report',-1,'report',2),('birth_report',1,'report',2),('cemetery_report',-1,'report',2),('cemetery_report',1,'report',2),('change_report',-1,'report',1),('change_report',1,'report',1),('charts',-1,'block',2),('charts',1,'block',2),('clippings',-1,'menu',1),('clippings',-1,'sidebar',1),('clippings',1,'menu',1),('clippings',1,'sidebar',1),('compact_tree_chart',-1,'chart',2),('compact_tree_chart',1,'chart',2),('death_report',-1,'report',2),('death_report',1,'report',2),('descendancy',-1,'sidebar',2),('descendancy',1,'sidebar',2),('descendancy_chart',-1,'chart',2),('descendancy_chart',1,'chart',2),('descendancy_report',-1,'report',2),('descendancy_report',1,'report',2),('extra_info',-1,'sidebar',2),('extra_info',1,'sidebar',2),('fact_sources',-1,'report',1),('fact_sources',1,'report',1),('families',-1,'sidebar',2),('families',1,'sidebar',2),('family_book_chart',-1,'chart',2),('family_book_chart',1,'chart',2),('family_group_report',-1,'report',2),('family_group_report',1,'report',2),('family_nav',-1,'sidebar',2),('family_nav',1,'sidebar',2),('fan_chart',-1,'chart',2),('fan_chart',1,'chart',2),('faq',-1,'menu',2),('faq',1,'menu',2),('gedcom_block',-1,'block',2),('gedcom_block',1,'block',2),('gedcom_favorites',-1,'block',2),('gedcom_favorites',1,'block',2),('gedcom_news',-1,'block',2),('gedcom_news',1,'block',2),('gedcom_stats',-1,'block',2),('gedcom_stats',1,'block',2),('googlemap',-1,'chart',2),('googlemap',-1,'tab',2),('googlemap',1,'chart',2),('googlemap',1,'tab',2),('hourglass_chart',-1,'chart',2),('hourglass_chart',1,'chart',2),('html',-1,'block',2),('html',1,'block',2),('individual_ext_report',-1,'report',1),('individual_ext_report',1,'report',1),('individual_report',-1,'report',2),('individual_report',1,'report',2),('individuals',-1,'sidebar',2),('individuals',1,'sidebar',2),('lifespans_chart',-1,'chart',2),('lifespans_chart',1,'chart',2),('lightbox',-1,'tab',2),('lightbox',1,'tab',2),('logged_in',-1,'block',2),('logged_in',1,'block',2),('login_block',-1,'block',2),('login_block',1,'block',2),('marriage_report',-1,'report',2),('marriage_report',1,'report',2),('media',-1,'tab',2),('media',1,'tab',2),('missing_facts_report',-1,'report',1),('missing_facts_report',1,'report',1),('notes',-1,'tab',2),('notes',1,'tab',2),('occupation_report',-1,'report',1),('occupation_report',1,'report',1),('page_menu',-1,'menu',2),('page_menu',1,'menu',2),('pedigree_chart',-1,'chart',2),('pedigree_chart',1,'chart',2),('pedigree_report',-1,'report',2),('pedigree_report',1,'report',2),('personal_facts',-1,'tab',2),('personal_facts',1,'tab',2),('random_media',-1,'block',2),('random_media',1,'block',2),('recent_changes',-1,'block',2),('recent_changes',1,'block',2),('relationships_chart',-1,'chart',2),('relationships_chart',1,'chart',2),('relative_ext_report',-1,'report',2),('relative_ext_report',1,'report',2),('relatives',-1,'tab',2),('relatives',1,'tab',2),('review_changes',-1,'block',2),('review_changes',1,'block',2),('sources_tab',-1,'tab',2),('sources_tab',1,'tab',2),('statistics_chart',-1,'chart',2),('statistics_chart',1,'chart',2),('stories',-1,'menu',-1),('stories',-1,'tab',-1),('stories',1,'menu',-1),('stories',1,'tab',-1),('theme_select',-1,'block',2),('theme_select',1,'block',2),('timeline_chart',-1,'chart',2),('timeline_chart',1,'chart',2),('todays_events',-1,'block',2),('todays_events',1,'block',2),('todo',-1,'block',2),('todo',1,'block',2),('top10_givnnames',-1,'block',2),('top10_givnnames',1,'block',2),('top10_pageviews',-1,'block',2),('top10_pageviews',1,'block',2),('top10_surnames',-1,'block',2),('top10_surnames',1,'block',2),('tree',-1,'chart',2),('tree',-1,'tab',2),('tree',1,'chart',2),('tree',1,'tab',2),('upcoming_events',-1,'block',2),('upcoming_events',1,'block',2),('user_blog',-1,'block',2),('user_blog',1,'block',2),('user_favorites',-1,'block',2),('user_favorites',1,'block',2),('user_messages',-1,'block',2),('user_messages',1,'block',2),('user_welcome',-1,'block',2),('user_welcome',1,'block',2),('yahrzeit',-1,'block',2),('yahrzeit',1,'block',2);
/*!40000 ALTER TABLE `wt_module_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module_setting`
--

DROP TABLE IF EXISTS `wt_module_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module_setting` (
	`module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`module_name`,`setting_name`),
	CONSTRAINT `wt_module_setting_ibfk_1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module_setting`
--

LOCK TABLES `wt_module_setting` WRITE;
/*!40000 ALTER TABLE `wt_module_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_module_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_name`
--

DROP TABLE IF EXISTS `wt_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_name` (
	`n_file` int(11) NOT NULL,
	`n_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`n_num` int(11) NOT NULL,
	`n_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`n_sort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`n_full` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`n_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_surn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_givn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_soundex_givn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_soundex_surn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_soundex_givn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`n_soundex_surn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`n_id`,`n_file`,`n_num`),
	KEY `wt_name_ix1` (`n_full`,`n_id`,`n_file`),
	KEY `wt_name_ix2` (`n_surn`,`n_file`,`n_type`,`n_id`),
	KEY `wt_name_ix3` (`n_givn`,`n_file`,`n_type`,`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_name`
--

LOCK TABLES `wt_name` WRITE;
/*!40000 ALTER TABLE `wt_name` DISABLE KEYS */;
INSERT INTO `wt_name` VALUES (1,'I1',0,'NAME','BLOGGS,Joe','Joe BLOGGS','BLOGGS','BLOGGS','Joe','J000','B420','100000:400000:500000','785400:784540:784000');
/*!40000 ALTER TABLE `wt_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_news`
--

DROP TABLE IF EXISTS `wt_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_news` (
	`news_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`gedcom_id` int(11) DEFAULT NULL,
	`subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`body` longtext COLLATE utf8_unicode_ci NOT NULL,
	`updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`news_id`),
	KEY `news_ix1` (`user_id`,`updated`),
	KEY `news_ix2` (`gedcom_id`,`updated`),
	CONSTRAINT `wt_news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
	CONSTRAINT `wt_news_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_news`
--

LOCK TABLES `wt_news` WRITE;
/*!40000 ALTER TABLE `wt_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_next_id`
--

DROP TABLE IF EXISTS `wt_next_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_next_id` (
	`gedcom_id` int(11) NOT NULL,
	`record_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`next_id` decimal(20,0) NOT NULL,
	PRIMARY KEY (`gedcom_id`,`record_type`),
	CONSTRAINT `wt_next_id_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_next_id`
--

LOCK TABLES `wt_next_id` WRITE;
/*!40000 ALTER TABLE `wt_next_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_next_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_other`
--

DROP TABLE IF EXISTS `wt_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_other` (
	`o_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`o_file` int(11) NOT NULL,
	`o_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
	`o_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`o_id`,`o_file`),
	UNIQUE KEY `wt_other_ix1` (`o_file`,`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_other`
--

LOCK TABLES `wt_other` WRITE;
/*!40000 ALTER TABLE `wt_other` DISABLE KEYS */;
INSERT INTO `wt_other` VALUES ('HEAD',1,'HEAD','0 HEAD\n1 CHAR UTF-8\n1 DATE 5 Mar 2019'),('TRLR',1,'TRLR','0 TRLR');
/*!40000 ALTER TABLE `wt_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_placelinks`
--

DROP TABLE IF EXISTS `wt_placelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_placelinks` (
	`pl_p_id` int(11) NOT NULL,
	`pl_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`pl_file` int(11) NOT NULL,
	PRIMARY KEY (`pl_p_id`,`pl_gid`,`pl_file`),
	KEY `wt_placelinks_ix1` (`pl_p_id`),
	KEY `wt_placelinks_ix2` (`pl_gid`),
	KEY `wt_placelinks_ix3` (`pl_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_placelinks`
--

LOCK TABLES `wt_placelinks` WRITE;
/*!40000 ALTER TABLE `wt_placelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_placelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_places`
--

DROP TABLE IF EXISTS `wt_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_places` (
	`p_id` int(11) NOT NULL AUTO_INCREMENT,
	`p_place` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
	`p_parent_id` int(11) DEFAULT NULL,
	`p_file` int(11) NOT NULL,
	`p_std_soundex` longtext COLLATE utf8_unicode_ci NOT NULL,
	`p_dm_soundex` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`p_id`),
	UNIQUE KEY `wt_places_ix2` (`p_parent_id`,`p_file`,`p_place`),
	KEY `wt_places_ix1` (`p_file`,`p_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_places`
--

LOCK TABLES `wt_places` WRITE;
/*!40000 ALTER TABLE `wt_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_session`
--

DROP TABLE IF EXISTS `wt_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_session` (
	`session_id` char(128) COLLATE utf8_unicode_ci NOT NULL,
	`session_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	`user_id` int(11) NOT NULL,
	`ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
	`session_data` longblob NOT NULL,
	PRIMARY KEY (`session_id`),
	KEY `ix1` (`session_time`),
	KEY `ix2` (`user_id`,`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_session`
--

LOCK TABLES `wt_session` WRITE;
/*!40000 ALTER TABLE `wt_session` DISABLE KEYS */;
INSERT INTO `wt_session` VALUES ('kmf2ao3i81ltfjvt73pvalj8av','2019-03-05 00:43:00',1,'172.23.0.1','initiated|b:1;locale|s:5:\"en-GB\";activity_time|i:1551746540;theme_id|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"fvYm09TkDxqNV74r6dlrz9LYxr6LKwkK\";wt_user|s:1:\"1\";GEDCOM|s:14:\"marywadefamily\";'),('ouv9oq0jhufbviagjruelp5rbd','2019-03-05 00:42:00',0,'172.23.0.1','initiated|b:1;locale|s:5:\"en-GB\";activity_time|i:1551746540;theme_id|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"fvYm09TkDxqNV74r6dlrz9LYxr6LKwkK\";');
/*!40000 ALTER TABLE `wt_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_site_access_rule`
--

DROP TABLE IF EXISTS `wt_site_access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_site_access_rule` (
	`site_access_rule_id` int(11) NOT NULL AUTO_INCREMENT,
	`ip_address_start` int(10) unsigned NOT NULL DEFAULT 0,
	`ip_address_end` int(10) unsigned NOT NULL DEFAULT 4294967295,
	`user_agent_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`rule` enum('allow','deny','robot','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
	`comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`site_access_rule_id`),
	UNIQUE KEY `wt_site_access_rule_ix1` (`ip_address_end`,`ip_address_start`,`user_agent_pattern`,`rule`),
	KEY `wt_site_access_rule_ix2` (`rule`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_site_access_rule`
--

LOCK TABLES `wt_site_access_rule` WRITE;
/*!40000 ALTER TABLE `wt_site_access_rule` DISABLE KEYS */;
INSERT INTO `wt_site_access_rule` VALUES (1,0,4294967295,'Mozilla/5.0 (%) Gecko/% %/%','allow','Gecko-based browsers','2019-03-05 00:32:09'),(2,0,4294967295,'Mozilla/5.0 (%) AppleWebKit/% (KHTML, like Gecko)%','allow','WebKit-based browsers','2019-03-05 00:32:09'),(3,0,4294967295,'Opera/% (%) Presto/% Version/%','allow','Presto-based browsers','2019-03-05 00:32:09'),(4,0,4294967295,'Mozilla/% (compatible; MSIE %','allow','Trident-based browsers','2019-03-05 00:32:09'),(5,0,4294967295,'Mozilla/5.0 (% Konqueror/%','allow','Konqueror browser','2019-03-05 00:32:09'),(6,0,4294967295,'Mozilla/% (Windows%; Trident%; rv:%) like Gecko','allow','Modern Internet Explorer','2019-03-05 00:32:09'),(7,0,4294967295,'Mozilla/5.0 (Mobile; Windows Phone 8.1; % Microsoft; %','allow','Windows Phone 8.1','2019-03-05 00:32:09');
/*!40000 ALTER TABLE `wt_site_access_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_site_setting`
--

DROP TABLE IF EXISTS `wt_site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_site_setting` (
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_site_setting`
--

LOCK TABLES `wt_site_setting` WRITE;
/*!40000 ALTER TABLE `wt_site_setting` DISABLE KEYS */;
INSERT INTO `wt_site_setting` VALUES ('ALLOW_CHANGE_GEDCOM','1'),('ALLOW_USER_THEMES','1'),('FV_SCHEMA_VERSION','4'),('INDEX_DIRECTORY','data/'),('LATEST_WT_VERSION','1.7.12|1.0.0|https://github.com/fisharebest/webtrees/releases/download/1.7.12/webtrees-1.7.12.zip'),('LATEST_WT_VERSION_TIMESTAMP','1551746545'),('NB_SCHEMA_VERSION','3'),('SESSION_TIME','7200'),('SMTP_ACTIVE','internal'),('SMTP_AUTH','1'),('SMTP_FROM_NAME','localhost'),('SMTP_HELO','localhost'),('SMTP_HOST','localhost'),('SMTP_PORT','25'),('SMTP_SSL','none'),('USE_REGISTRATION_MODULE','1'),('WT_SCHEMA_VERSION','37');
/*!40000 ALTER TABLE `wt_site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_sources`
--

DROP TABLE IF EXISTS `wt_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_sources` (
	`s_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`s_file` int(11) NOT NULL,
	`s_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`s_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`s_id`,`s_file`),
	UNIQUE KEY `wt_sources_ix1` (`s_file`,`s_id`),
	KEY `wt_sources_ix2` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_sources`
--

LOCK TABLES `wt_sources` WRITE;
/*!40000 ALTER TABLE `wt_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user`
--

DROP TABLE IF EXISTS `wt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user` (
	`user_id` int(11) NOT NULL AUTO_INCREMENT,
	`user_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`real_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`user_id`),
	UNIQUE KEY `wt_user_ix1` (`user_name`),
	UNIQUE KEY `wt_user_ix2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user`
--

LOCK TABLES `wt_user` WRITE;
/*!40000 ALTER TABLE `wt_user` DISABLE KEYS */;
INSERT INTO `wt_user` VALUES (-1,'DEFAULT_USER','DEFAULT_USER','DEFAULT_USER','DEFAULT_USER'),(1,'test','Test Admin','test@marywadefamily.org','$2y$10$ZYCPAQ.V4f70mAdVxtJjNeqjEkEHMWVjNnShQppHXLKCBtPZ2ee82');
/*!40000 ALTER TABLE `wt_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user_gedcom_setting`
--

DROP TABLE IF EXISTS `wt_user_gedcom_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user_gedcom_setting` (
	`user_id` int(11) NOT NULL,
	`gedcom_id` int(11) NOT NULL,
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`user_id`,`gedcom_id`,`setting_name`),
	KEY `wt_user_gedcom_setting_fk2` (`gedcom_id`),
	CONSTRAINT `wt_user_gedcom_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
	CONSTRAINT `wt_user_gedcom_setting_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user_gedcom_setting`
--

LOCK TABLES `wt_user_gedcom_setting` WRITE;
/*!40000 ALTER TABLE `wt_user_gedcom_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_user_gedcom_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user_setting`
--

DROP TABLE IF EXISTS `wt_user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user_setting` (
	`user_id` int(11) NOT NULL,
	`setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
	`setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`user_id`,`setting_name`),
	CONSTRAINT `wt_user_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user_setting`
--

LOCK TABLES `wt_user_setting` WRITE;
/*!40000 ALTER TABLE `wt_user_setting` DISABLE KEYS */;
INSERT INTO `wt_user_setting` VALUES (1,'canadmin','1'),(1,'language','en-GB'),(1,'sessiontime','1551746545'),(1,'verified','1'),(1,'verified_by_admin','1'),(1,'visibleonline','1');
/*!40000 ALTER TABLE `wt_user_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-06 10:40:20
