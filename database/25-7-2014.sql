-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for akcms
CREATE DATABASE IF NOT EXISTS `akcms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `akcms`;


-- Dumping structure for table akcms.address
CREATE TABLE IF NOT EXISTS `address` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NOT NULL DEFAULT '0',
  `typeId` int(11) NOT NULL DEFAULT '0',
  `cityId` int(11) NOT NULL DEFAULT '0',
  `stateId` int(11) NOT NULL DEFAULT '0',
  `countryId` int(11) NOT NULL DEFAULT '0',
  `street` varchar(255) NOT NULL DEFAULT '0',
  `number` varchar(255) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_address_person` (`personId`),
  KEY `FK_address_lookup` (`typeId`),
  KEY `FK_address_lookup_2` (`cityId`),
  KEY `FK_address_lookup_3` (`stateId`),
  KEY `FK_address_lookup_4` (`countryId`),
  KEY `FK_address_person_2` (`createdBy`),
  KEY `FK_address_person_3` (`lastUpdatedBy`),
  CONSTRAINT `FK_address_person_2` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_address_person_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_address_lookup` FOREIGN KEY (`typeId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_address_lookup_2` FOREIGN KEY (`cityId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_address_lookup_3` FOREIGN KEY (`stateId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_address_lookup_4` FOREIGN KEY (`countryId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_address_person` FOREIGN KEY (`personId`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.address: ~0 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;


-- Dumping structure for table akcms.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.ci_sessions: ~0 rows (approximately)
DELETE FROM `ci_sessions`;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


-- Dumping structure for table akcms.identity
CREATE TABLE IF NOT EXISTS `identity` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL DEFAULT '0',
  `basic` tinyint(4) NOT NULL DEFAULT '0',
  `description` tinyint(4) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.identity: ~0 rows (approximately)
DELETE FROM `identity`;
/*!40000 ALTER TABLE `identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity` ENABLE KEYS */;


-- Dumping structure for table akcms.lookup
CREATE TABLE IF NOT EXISTS `lookup` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '0',
  `editable` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_lookup_lookup` (`parentId`),
  KEY `FK_lookup_person` (`createdBy`),
  KEY `FK_lookup_person_2` (`lastUpdatedBy`),
  CONSTRAINT `FK_lookup_person_2` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_lookup_lookup` FOREIGN KEY (`parentId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_lookup_person` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.lookup: ~14 rows (approximately)
DELETE FROM `lookup`;
/*!40000 ALTER TABLE `lookup` DISABLE KEYS */;
INSERT INTO `lookup` (`idc`, `parentId`, `selectable`, `editable`, `description`, `alias`, `link`, `createdOn`, `createdBy`, `lastUpdatedOn`, `lastUpdatedBy`) VALUES
	(1, 1, 0, 0, 'ROOT', 'ROOT', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(4, 1, 0, 0, 'PERSON_TYPES', 'PERSON_TYPES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(5, 4, 1, 0, 'ADMIN', 'ADMIN', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(6, 4, 1, 0, 'CUSTOMER', 'CUSTOMER', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(7, 4, 1, 0, 'EDITOR', 'EDITOR', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(8, 4, 1, 0, 'AUTHOR', 'AUTHOR', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(9, 4, 0, 0, 'SUPER_ADMIN', 'SUPER_ADMIN', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(11, 1, 1, 0, 'COUNTRIES', 'COUNTRIES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(12, 1, 1, 0, 'STATES', 'STATES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(13, 1, 1, 0, 'CITIES', 'CITIES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(14, 1, 1, 1, 'PHONE_TYPES', 'PHONE_TYPES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(15, 1, 1, 1, 'WEB_PROFILE_TYPES', 'WEB_PROFILE_TYPES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(16, 1, 1, 1, 'IDENTITY_TYPES', 'IDENTITY_TYPES', '0', '2014-07-25 15:18:36', 1, '2014-07-25 15:18:36', 1),
	(18, 1, 1, 1, 'MENUS', 'MENUS', '0', '2014-07-25 15:24:23', 1, '2014-07-25 15:24:23', 1);
/*!40000 ALTER TABLE `lookup` ENABLE KEYS */;


-- Dumping structure for table akcms.order
CREATE TABLE IF NOT EXISTS `order` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NOT NULL DEFAULT '0',
  `addressId` int(11) NOT NULL DEFAULT '0',
  `telephoneId` int(11) NOT NULL DEFAULT '0',
  `statusId` int(11) NOT NULL DEFAULT '0',
  `total` float NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_order_person` (`personId`),
  KEY `FK_order_lookup` (`statusId`),
  KEY `FK_order_person_2` (`createdBy`),
  KEY `FK_order_person_3` (`lastUpdatedBy`),
  KEY `FK_order_address` (`addressId`),
  CONSTRAINT `FK_order_address` FOREIGN KEY (`addressId`) REFERENCES `address` (`idc`),
  CONSTRAINT `FK_order_lookup` FOREIGN KEY (`statusId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_order_person` FOREIGN KEY (`personId`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_order_person_2` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_order_person_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.order: ~0 rows (approximately)
DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Dumping structure for table akcms.page
CREATE TABLE IF NOT EXISTS `page` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '0',
  `subtitle` varchar(255) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `price` float NOT NULL,
  `sku` varchar(255) NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_page_lookup` (`typeId`),
  KEY `FK_page_person` (`createdBy`),
  KEY `FK_page_person_2` (`lastUpdatedBy`),
  CONSTRAINT `FK_page_lookup` FOREIGN KEY (`typeId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_page_person` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_page_person_2` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.page: ~0 rows (approximately)
DELETE FROM `page`;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


-- Dumping structure for table akcms.person
CREATE TABLE IF NOT EXISTS `person` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL DEFAULT '0',
  `firstName` varchar(50) NOT NULL DEFAULT '0',
  `lastName` varchar(50) NOT NULL DEFAULT '0',
  `username` char(128) NOT NULL DEFAULT '0',
  `password` char(128) NOT NULL DEFAULT '0',
  `salt` char(128) NOT NULL DEFAULT '0',
  `lastLogin` datetime DEFAULT NULL,
  `lastLogout` datetime DEFAULT NULL,
  `loginCount` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_person_lookup` (`typeId`),
  KEY `FK_person_person` (`createdBy`),
  KEY `FK_person_person_2` (`lastUpdatedBy`),
  CONSTRAINT `FK_person_person_2` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_person_lookup` FOREIGN KEY (`typeId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_person_person` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.person: ~1 rows (approximately)
DELETE FROM `person`;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`idc`, `typeId`, `firstName`, `lastName`, `username`, `password`, `salt`, `lastLogin`, `lastLogout`, `loginCount`, `createdOn`, `createdBy`, `lastUpdatedOn`, `lastUpdatedBy`) VALUES
	(1, 9, 'Andreas', 'Iosifelis', '80e58b6aa13b7418908191f7587b47e01c12913cc190e2f9bcf07a828d1e1eb32497bd84fc3d510d344ba6a5aa52374029f0460735a16d4f9b71a8a98da7e358', '19b0653ba1dd78aa50b53a4dd8bcc5098eabd29fafa53ebaa5de525918c4a347235a60e0fabcb5cbac378320c9a55a311ad4424c8e26d80f53903f067cc8b0b2', 'db6f9854897334663765ea139a10d2c0b647c1a63364f37fd978a88fcf1d8a7e60665b06a53246a15460da789e422ecd7a91912c22d37774a32a9f23c4845ee1', NULL, NULL, NULL, NULL, 1, NULL, 1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


-- Dumping structure for table akcms.telephone
CREATE TABLE IF NOT EXISTS `telephone` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NOT NULL DEFAULT '0',
  `typeId` int(11) NOT NULL DEFAULT '0',
  `basic` tinyint(4) NOT NULL DEFAULT '0',
  `prefix` varchar(50) NOT NULL DEFAULT '0',
  `telephone` varchar(50) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_telephone_person` (`personId`),
  KEY `FK_telephone_lookup` (`typeId`),
  KEY `FK_telephone_person_2` (`createdBy`),
  KEY `FK_telephone_person_3` (`lastUpdatedBy`),
  CONSTRAINT `FK_telephone_person_2` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_telephone_person_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_telephone_lookup` FOREIGN KEY (`typeId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_telephone_person` FOREIGN KEY (`personId`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.telephone: ~0 rows (approximately)
DELETE FROM `telephone`;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;


-- Dumping structure for table akcms.webprofile
CREATE TABLE IF NOT EXISTS `webprofile` (
  `idc` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NOT NULL DEFAULT '0',
  `typeId` int(11) NOT NULL DEFAULT '0',
  `basic` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idc`),
  KEY `FK_webprofile_lookup` (`typeId`),
  KEY `FK_webprofile_person` (`personId`),
  KEY `FK_webprofile_person_2` (`createdBy`),
  KEY `FK_webprofile_person_3` (`lastUpdatedBy`),
  CONSTRAINT `FK_webprofile_lookup` FOREIGN KEY (`typeId`) REFERENCES `lookup` (`idc`),
  CONSTRAINT `FK_webprofile_person` FOREIGN KEY (`personId`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_webprofile_person_2` FOREIGN KEY (`createdBy`) REFERENCES `person` (`idc`),
  CONSTRAINT `FK_webprofile_person_3` FOREIGN KEY (`lastUpdatedBy`) REFERENCES `person` (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table akcms.webprofile: ~0 rows (approximately)
DELETE FROM `webprofile`;
/*!40000 ALTER TABLE `webprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `webprofile` ENABLE KEYS */;


-- Dumping structure for procedure akcms.GET_LOOKUP
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LOOKUP`(IN `PARENT` INT)
BEGIN
select * from lookup where parentId = PARENT;
END//
DELIMITER ;


-- Dumping structure for procedure akcms.GET_LOOKUP_TYPES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_LOOKUP_TYPES`()
BEGIN
select * from lookup where parentId = 1 and idc!=1;
END//
DELIMITER ;


-- Dumping structure for procedure akcms.INSERT_LOOKUP
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LOOKUP`(IN `PARENT` INT, IN `SELECTABLE` INT, IN `EDITABLE` INT)
BEGIN

insert into lookup (parentId, selectable, editable, description, alias, createdBy, createdOn, lastUpdatedBy, lastUpdatedOn)
values
(PARENT, SELECTABLE, EDITABLE, DESCRIPTION, DESCRIPTION, 1, NOW(), 1, NOW());

select * from lookup where parentId = PARENT;
END//
DELIMITER ;


-- Dumping structure for procedure akcms.INSERT_LOOKUP_TYPE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_LOOKUP_TYPE`(IN `SELECTABLE` INT, IN `EDITABLE` INT, IN `DESCRIPTION` VARCHAR(50))
BEGIN
#selectable
#editable
#description
#alias
insert into lookup (parentId, selectable, editable, description, alias, createdBy, createdOn, lastUpdatedOn, lastUpdatedBy)
	values
	(1, SELECTABLE, EDITABLE, DESCRIPTION, DESCRIPTION, 1, NOW(), NOW(), 1);
select * from lookup;
#selectable όταν θα μπορεί ο χρήστης να το επιλέξει από ένα select box
#editable όταν θα μπορεί ο χρήστης να το διαχειριστεί.(Προσθαφαίρεση τιμών)
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
