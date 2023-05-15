-- --------------------------------------------------------
----Upgrade SQL von Template Server 4.0 -- Bei einem kompletten cleanen Instalation bitte legacy.sql nutzen
-- --------------------------------------------------------

--
-- Table structure for table `multicharacter_slots`
--

CREATE TABLE `multicharacter_slots` (
	`identifier` VARCHAR(60) NOT NULL,
	`slots` INT(11) NOT NULL,
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `slots` (`slots`) USING BTREE
) ENGINE=InnoDB;

-- --------------------------------------------------------

ALTER TABLE `users` ADD COLUMN `metadata` LONGTEXT NULL DEFAULT NULL;
ALTER TABLE `users` ADD COLUMN `id` int(11) NOT NULL;
ALTER TABLE `users` ADD COLUMN `disabled` TINYINT(1) NULL DEFAULT '0';
ALTER TABLE `users` ADD COLUMN `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `users` ADD COLUMN `last_seen` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
	`identifier` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
