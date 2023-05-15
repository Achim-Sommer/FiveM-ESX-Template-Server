CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'caution', 0),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 0, NULL),
(3, 'society_ambulance', 0, NULL),
(4, 'society_mechanic', 0, NULL),
(5, 'society_taxi', 0, NULL);
-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB;

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

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_ambulance', 'EMS', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);


INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
    ('user_ears', 'Ears', 0),
    ('user_glasses', 'Glasses', 0),
    ('user_helmet', 'Helmet', 0),
    ('user_mask', 'Mask', 0);
    
-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'society_ambulance', NULL, '{}'),
(3, 'society_mechanic', NULL, '{}'),
(4, 'society_taxi', NULL, '{}'),
(5, 'property', NULL, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken', 'lebendes Huhn', 1, 0, 1),
('ammunition_smg_large', 'SMG Ammo Large', 10, 0, 1),
('ammunition_snp', 'Sniper Ammo', 10, 0, 1),
('arm_bandage', 'Arm Bandage', 1, 0, 1),
('automatic_tranny', 'Automatic Tranny', 1, 0, 1),
('bandage', 'Verband', 2, 0, 1),
('beer', 'Bier', 1, 0, 1),
('binoculars', 'Fernglas', 1, 0, 1),
('blowpipe', 'Schneidbrenner', 2, 0, 1),
('body_bandage', 'Body Bandage', 1, 0, 1),
('bolcacahuetes', 'Erdnussschale', 5, 0, 1),
('bolchips', 'Chips', 5, 0, 1),
('bolnoixcajou', 'Cashewnuss-Schale', 5, 0, 1),
('bolpistache', 'Pistazienschale', 5, 0, 1),
('bread', 'Hamburger', 1, 0, 1),
('bulletproof', 'Kugelsichere Weste', 1, 0, 1),
('cannabis', 'Cannabis', 1, 0, 1),
('carokit', 'Body Kit', 3, 0, 1),
('carotool', 'Tools', 2, 0, 1),
('chemicals', 'Chemikalien', 1, 0, 1),
('chemicalslisence', 'Chemikalien Lizenz', 0, 0, 1),
('clothe', 'Kleidung', 1, 0, 1),
('coca_leaf', 'Koksblatt', 3, 0, 1),
('coke', 'Koks', 3, 0, 1),
('colis', 'Paket', -1, 0, 1),
('contract', 'Kaufvertrag', 1, 0, 1),
('coolant', 'Coolant', 1, 0, 1),
('copper', 'Kupfer', 1, 0, 1),
('croquettes', 'Tierfutter', 10, 0, 1),
('cutted_wood', 'Holzstämme', 1, 0, 1),
('darknet', 'Dark Net', 1, 0, 1),
('diamond', 'Diamant', 1, 0, 1),
('dia_box', 'Diamond Box', 2, 0, 1),
('drag_tirekit', 'Drag Tires Kit', 1, 0, 1),
('drill', 'Bohrer', 1, 0, 1),
('drpepper', 'Dr. Pepper', 5, 0, 1),
('energy', 'Energy Drink', 5, 0, 1),
('engineoil', 'Engine Oil', 1, 0, 1),
('engine_adder', 'Adder Engine', 1, 0, 1),
('engine_airbus', 'Airbus Engine', 1, 0, 1),
('engine_airtug', 'Airtug Engine', 1, 0, 1),
('engine_akula', 'Akula Engine', 1, 0, 1),
('engine_akuma', 'Akuma Engine', 1, 0, 1),
('engine_alkonost', 'Alkonost Engine', 1, 0, 1),
('engine_alpha', 'Alpha Engine', 1, 0, 1),
('engine_alphaz1', 'Alphaz1 Engine', 1, 0, 1),
('engine_ambulance', 'Ambulance Engine', 1, 0, 1),
('engine_annihilator', 'Annihilator Engine', 1, 0, 1),
('engine_annihilator2', 'Annihilator2 Engine', 1, 0, 1),
('engine_apc', 'Apc Engine', 1, 0, 1),
('engine_ardent', 'Ardent Engine', 1, 0, 1),
('engine_armytanker', 'Armytanker Engine', 1, 0, 1),
('engine_armytrailer', 'Armytrailer Engine', 1, 0, 1),
('engine_armytrailer2', 'Armytrailer2 Engine', 1, 0, 1),
('engine_asbo', 'Asbo Engine', 1, 0, 1),
('engine_asea', 'Asea Engine', 1, 0, 1),
('engine_asea2', 'Asea2 Engine', 1, 0, 1),
('engine_asterope', 'Asterope Engine', 1, 0, 1),
('engine_autarch', 'Autarch Engine', 1, 0, 1),
('engine_avarus', 'Avarus Engine', 1, 0, 1),
('engine_avenger', 'Avenger Engine', 1, 0, 1),
('engine_avenger2', 'Avenger2 Engine', 1, 0, 1),
('engine_avisa', 'Avisa Engine', 1, 0, 1),
('engine_b16b', 'B16b Engine', 1, 0, 1),
('engine_bagger', 'Bagger Engine', 1, 0, 1),
('engine_baletrailer', 'Baletrailer Engine', 1, 0, 1),
('engine_baller', 'Baller Engine', 1, 0, 1),
('engine_baller2', 'Baller2 Engine', 1, 0, 1),
('engine_baller3', 'Baller3 Engine', 1, 0, 1),
('engine_baller4', 'Baller4 Engine', 1, 0, 1),
('engine_baller5', 'Baller5 Engine', 1, 0, 1),
('engine_baller6', 'Baller6 Engine', 1, 0, 1),
('engine_banshee', 'Banshee Engine', 1, 0, 1),
('engine_banshee2', 'Banshee2 Engine', 1, 0, 1),
('engine_barracks', 'Barracks Engine', 1, 0, 1),
('engine_barracks2', 'Barracks2 Engine', 1, 0, 1),
('engine_barracks3', 'Barracks3 Engine', 1, 0, 1),
('engine_barrage', 'Barrage Engine', 1, 0, 1),
('engine_bati', 'Bati Engine', 1, 0, 1),
('engine_bati2', 'Bati2 Engine', 1, 0, 1),
('engine_benson', 'Benson Engine', 1, 0, 1),
('engine_besra', 'Besra Engine', 1, 0, 1),
('engine_bestiagts', 'Bestiagts Engine', 1, 0, 1),
('engine_bf400', 'Bf400 Engine', 1, 0, 1),
('engine_bfinjection', 'Bfinjection Engine', 1, 0, 1),
('engine_biff', 'Biff Engine', 1, 0, 1),
('engine_bifta', 'Bifta Engine', 1, 0, 1),
('engine_bison', 'Bison Engine', 1, 0, 1),
('engine_bison2', 'Bison2 Engine', 1, 0, 1),
('engine_bison3', 'Bison3 Engine', 1, 0, 1),
('engine_bjxl', 'Bjxl Engine', 1, 0, 1),
('engine_blade', 'Blade Engine', 1, 0, 1),
('engine_blazer', 'Blazer Engine', 1, 0, 1),
('engine_blazer2', 'Blazer2 Engine', 1, 0, 1),
('engine_blazer3', 'Blazer3 Engine', 1, 0, 1),
('engine_blazer4', 'Blazer4 Engine', 1, 0, 1),
('engine_blazer5', 'Blazer5 Engine', 1, 0, 1),
('engine_blimp', 'Blimp Engine', 1, 0, 1),
('engine_blimp2', 'Blimp2 Engine', 1, 0, 1),
('engine_blimp3', 'Blimp3 Engine', 1, 0, 1),
('engine_blista', 'Blista Engine', 1, 0, 1),
('engine_blista2', 'Blista2 Engine', 1, 0, 1),
('engine_blista3', 'Blista3 Engine', 1, 0, 1),
('engine_bmx', 'Bmx Engine', 1, 0, 1),
('engine_boattrailer', 'Boattrailer Engine', 1, 0, 1),
('engine_bobcatxl', 'Bobcatxl Engine', 1, 0, 1),
('engine_bodhi2', 'Bodhi2 Engine', 1, 0, 1),
('engine_bombushka', 'Bombushka Engine', 1, 0, 1),
('engine_boxville', 'Boxville Engine', 1, 0, 1),
('engine_boxville2', 'Boxville2 Engine', 1, 0, 1),
('engine_boxville3', 'Boxville3 Engine', 1, 0, 1),
('engine_boxville4', 'Boxville4 Engine', 1, 0, 1),
('engine_boxville5', 'Boxville5 Engine', 1, 0, 1),
('engine_brawler', 'Brawler Engine', 1, 0, 1),
('engine_brickade', 'Brickade Engine', 1, 0, 1),
('engine_brioso', 'Brioso Engine', 1, 0, 1),
('engine_brioso2', 'Brioso2 Engine', 1, 0, 1),
('engine_bruiser', 'Bruiser Engine', 1, 0, 1),
('engine_bruiser2', 'Bruiser2 Engine', 1, 0, 1),
('engine_bruiser3', 'Bruiser3 Engine', 1, 0, 1),
('engine_brutus', 'Brutus Engine', 1, 0, 1),
('engine_brutus2', 'Brutus2 Engine', 1, 0, 1),
('engine_brutus3', 'Brutus3 Engine', 1, 0, 1),
('engine_btype', 'Btype Engine', 1, 0, 1),
('engine_btype2', 'Btype2 Engine', 1, 0, 1),
('engine_btype3', 'Btype3 Engine', 1, 0, 1),
('engine_buccaneer', 'Buccaneer Engine', 1, 0, 1),
('engine_buccaneer2', 'Buccaneer2 Engine', 1, 0, 1),
('engine_buffalo', 'Buffalo Engine', 1, 0, 1),
('engine_buffalo2', 'Buffalo2 Engine', 1, 0, 1),
('engine_buffalo3', 'Buffalo3 Engine', 1, 0, 1),
('engine_bulldozer', 'Bulldozer Engine', 1, 0, 1),
('engine_bullet', 'Bullet Engine', 1, 0, 1),
('engine_burrito', 'Burrito Engine', 1, 0, 1),
('engine_burrito2', 'Burrito2 Engine', 1, 0, 1),
('engine_burrito3', 'Burrito3 Engine', 1, 0, 1),
('engine_burrito4', 'Burrito4 Engine', 1, 0, 1),
('engine_burrito5', 'Burrito5 Engine', 1, 0, 1),
('engine_bus', 'Bus Engine', 1, 0, 1),
('engine_buzzard', 'Buzzard Engine', 1, 0, 1),
('engine_buzzard2', 'Buzzard2 Engine', 1, 0, 1),
('engine_cablecar', 'Cablecar Engine', 1, 0, 1),
('engine_caddy', 'Caddy Engine', 1, 0, 1),
('engine_caddy2', 'Caddy2 Engine', 1, 0, 1),
('engine_caddy3', 'Caddy3 Engine', 1, 0, 1),
('engine_calico', 'Calico Engine', 1, 0, 1),
('engine_camper', 'Camper Engine', 1, 0, 1),
('engine_caracara', 'Caracara Engine', 1, 0, 1),
('engine_caracara2', 'Caracara2 Engine', 1, 0, 1),
('engine_carbonizzare', 'Carbonizzare Engine', 1, 0, 1),
('engine_carbonrs', 'Carbonrs Engine', 1, 0, 1),
('engine_cargobob', 'Cargobob Engine', 1, 0, 1),
('engine_cargobob2', 'Cargobob2 Engine', 1, 0, 1),
('engine_cargobob3', 'Cargobob3 Engine', 1, 0, 1),
('engine_cargobob4', 'Cargobob4 Engine', 1, 0, 1),
('engine_cargoplane', 'Cargoplane Engine', 1, 0, 1),
('engine_casco', 'Casco Engine', 1, 0, 1),
('engine_cavalcade', 'Cavalcade Engine', 1, 0, 1),
('engine_cavalcade2', 'Cavalcade2 Engine', 1, 0, 1),
('engine_cerberus', 'Cerberus Engine', 1, 0, 1),
('engine_cerberus2', 'Cerberus2 Engine', 1, 0, 1),
('engine_cerberus3', 'Cerberus3 Engine', 1, 0, 1),
('engine_cheburek', 'Cheburek Engine', 1, 0, 1),
('engine_cheetah', 'Cheetah Engine', 1, 0, 1),
('engine_cheetah2', 'Cheetah2 Engine', 1, 0, 1),
('engine_chernobog', 'Chernobog Engine', 1, 0, 1),
('engine_chimera', 'Chimera Engine', 1, 0, 1),
('engine_chino', 'Chino Engine', 1, 0, 1),
('engine_chino2', 'Chino2 Engine', 1, 0, 1),
('engine_cliffhanger', 'Cliffhanger Engine', 1, 0, 1),
('engine_clique', 'Clique Engine', 1, 0, 1),
('engine_club', 'Club Engine', 1, 0, 1),
('engine_coach', 'Coach Engine', 1, 0, 1),
('engine_cog55', 'Cog55 Engine', 1, 0, 1),
('engine_cog552', 'Cog552 Engine', 1, 0, 1),
('engine_cogcabrio', 'Cogcabrio Engine', 1, 0, 1),
('engine_cognoscenti', 'Cognoscenti Engine', 1, 0, 1),
('engine_cognoscenti2', 'Cognoscenti2 Engine', 1, 0, 1),
('engine_comet2', 'Comet2 Engine', 1, 0, 1),
('engine_comet3', 'Comet3 Engine', 1, 0, 1),
('engine_comet4', 'Comet4 Engine', 1, 0, 1),
('engine_comet5', 'Comet5 Engine', 1, 0, 1),
('engine_comet6', 'Comet6 Engine', 1, 0, 1),
('engine_contender', 'Contender Engine', 1, 0, 1),
('engine_coquette', 'Coquette Engine', 1, 0, 1),
('engine_coquette2', 'Coquette2 Engine', 1, 0, 1),
('engine_coquette3', 'Coquette3 Engine', 1, 0, 1),
('engine_coquette4', 'Coquette4 Engine', 1, 0, 1),
('engine_cruiser', 'Cruiser Engine', 1, 0, 1),
('engine_crusader', 'Crusader Engine', 1, 0, 1),
('engine_cuban800', 'Cuban800 Engine', 1, 0, 1),
('engine_cutter', 'Cutter Engine', 1, 0, 1),
('engine_cyclone', 'Cyclone Engine', 1, 0, 1),
('engine_cypher', 'Cypher Engine', 1, 0, 1),
('engine_daemon', 'Daemon Engine', 1, 0, 1),
('engine_daemon2', 'Daemon2 Engine', 1, 0, 1),
('engine_deathbike', 'Deathbike Engine', 1, 0, 1),
('engine_deathbike2', 'Deathbike2 Engine', 1, 0, 1),
('engine_deathbike3', 'Deathbike3 Engine', 1, 0, 1),
('engine_defiler', 'Defiler Engine', 1, 0, 1),
('engine_deluxo', 'Deluxo Engine', 1, 0, 1),
('engine_deveste', 'Deveste Engine', 1, 0, 1),
('engine_deviant', 'Deviant Engine', 1, 0, 1),
('engine_diablous', 'Diablous Engine', 1, 0, 1),
('engine_diablous2', 'Diablous2 Engine', 1, 0, 1),
('engine_dilettante', 'Dilettante Engine', 1, 0, 1),
('engine_dilettante2', 'Dilettante2 Engine', 1, 0, 1),
('engine_dinghy', 'Dinghy Engine', 1, 0, 1),
('engine_dinghy2', 'Dinghy2 Engine', 1, 0, 1),
('engine_dinghy3', 'Dinghy3 Engine', 1, 0, 1),
('engine_dinghy4', 'Dinghy4 Engine', 1, 0, 1),
('engine_dinghy5', 'Dinghy5 Engine', 1, 0, 1),
('engine_dloader', 'Dloader Engine', 1, 0, 1),
('engine_docktrailer', 'Docktrailer Engine', 1, 0, 1),
('engine_docktug', 'Docktug Engine', 1, 0, 1),
('engine_dodo', 'Dodo Engine', 1, 0, 1),
('engine_dominator', 'Dominator Engine', 1, 0, 1),
('engine_dominator2', 'Dominator2 Engine', 1, 0, 1),
('engine_dominator3', 'Dominator3 Engine', 1, 0, 1),
('engine_dominator4', 'Dominator4 Engine', 1, 0, 1),
('engine_dominator5', 'Dominator5 Engine', 1, 0, 1),
('engine_dominator6', 'Dominator6 Engine', 1, 0, 1),
('engine_dominator7', 'Dominator7 Engine', 1, 0, 1),
('engine_dominator8', 'Dominator8 Engine', 1, 0, 1),
('engine_double', 'Double Engine', 1, 0, 1),
('engine_drafter', 'Drafter Engine', 1, 0, 1),
('engine_dubsta', 'Dubsta Engine', 1, 0, 1),
('engine_dubsta2', 'Dubsta2 Engine', 1, 0, 1),
('engine_dubsta3', 'Dubsta3 Engine', 1, 0, 1),
('engine_dukes', 'Dukes Engine', 1, 0, 1),
('engine_dukes2', 'Dukes2 Engine', 1, 0, 1),
('engine_dukes3', 'Dukes3 Engine', 1, 0, 1),
('engine_dump', 'Dump Engine', 1, 0, 1),
('engine_dune', 'Dune Engine', 1, 0, 1),
('engine_dune2', 'Dune2 Engine', 1, 0, 1),
('engine_dune3', 'Dune3 Engine', 1, 0, 1),
('engine_dune4', 'Dune4 Engine', 1, 0, 1),
('engine_dune5', 'Dune5 Engine', 1, 0, 1),
('engine_duster', 'Duster Engine', 1, 0, 1),
('engine_dynasty', 'Dynasty Engine', 1, 0, 1),
('engine_elegy', 'Elegy Engine', 1, 0, 1),
('engine_elegy2', 'Elegy2 Engine', 1, 0, 1),
('engine_ellie', 'Ellie Engine', 1, 0, 1),
('engine_emerus', 'Emerus Engine', 1, 0, 1),
('engine_emperor', 'Emperor Engine', 1, 0, 1),
('engine_emperor2', 'Emperor2 Engine', 1, 0, 1),
('engine_emperor3', 'Emperor3 Engine', 1, 0, 1),
('engine_enduro', 'Enduro Engine', 1, 0, 1),
('engine_entity2', 'Entity2 Engine', 1, 0, 1),
('engine_entityxf', 'Entityxf Engine', 1, 0, 1),
('engine_esskey', 'Esskey Engine', 1, 0, 1),
('engine_euros', 'Euros Engine', 1, 0, 1),
('engine_everon', 'Everon Engine', 1, 0, 1),
('engine_exemplar', 'Exemplar Engine', 1, 0, 1),
('engine_f620', 'F620 Engine', 1, 0, 1),
('engine_faction', 'Faction Engine', 1, 0, 1),
('engine_faction2', 'Faction2 Engine', 1, 0, 1),
('engine_faction3', 'Faction3 Engine', 1, 0, 1),
('engine_fagaloa', 'Fagaloa Engine', 1, 0, 1),
('engine_faggio', 'Faggio Engine', 1, 0, 1),
('engine_faggio2', 'Faggio2 Engine', 1, 0, 1),
('engine_faggio3', 'Faggio3 Engine', 1, 0, 1),
('engine_fbi', 'Fbi Engine', 1, 0, 1),
('engine_fbi2', 'Fbi2 Engine', 1, 0, 1),
('engine_fcr', 'Fcr Engine', 1, 0, 1),
('engine_fcr2', 'Fcr2 Engine', 1, 0, 1),
('engine_felon', 'Felon Engine', 1, 0, 1),
('engine_felon2', 'Felon2 Engine', 1, 0, 1),
('engine_feltzer2', 'Feltzer2 Engine', 1, 0, 1),
('engine_feltzer3', 'Feltzer3 Engine', 1, 0, 1),
('engine_firetruk', 'Firetruk Engine', 1, 0, 1),
('engine_fixter', 'Fixter Engine', 1, 0, 1),
('engine_flashgt', 'Flashgt Engine', 1, 0, 1),
('engine_flatbed', 'Flatbed Engine', 1, 0, 1),
('engine_fmj', 'Fmj Engine', 1, 0, 1),
('engine_forklift', 'Forklift Engine', 1, 0, 1),
('engine_formula', 'Formula Engine', 1, 0, 1),
('engine_formula2', 'Formula2 Engine', 1, 0, 1),
('engine_fq2', 'Fq2 Engine', 1, 0, 1),
('engine_freecrawler', 'Freecrawler Engine', 1, 0, 1),
('engine_freight', 'Freight Engine', 1, 0, 1),
('engine_freightcar', 'Freightcar Engine', 1, 0, 1),
('engine_freightcar2', 'Freightcar2 Engine', 1, 0, 1),
('engine_freightcont1', 'Freightcont1 Engine', 1, 0, 1),
('engine_freightcont2', 'Freightcont2 Engine', 1, 0, 1),
('engine_freightgrain', 'Freightgrain Engine', 1, 0, 1),
('engine_freighttrailer', 'Freighttrailer Engine', 1, 0, 1),
('engine_frogger', 'Frogger Engine', 1, 0, 1),
('engine_frogger2', 'Frogger2 Engine', 1, 0, 1),
('engine_fugitive', 'Fugitive Engine', 1, 0, 1),
('engine_furia', 'Furia Engine', 1, 0, 1),
('engine_furoregt', 'Furoregt Engine', 1, 0, 1),
('engine_fusilade', 'Fusilade Engine', 1, 0, 1),
('engine_futo', 'Futo Engine', 1, 0, 1),
('engine_futo2', 'Futo2 Engine', 1, 0, 1),
('engine_gargoyle', 'Gargoyle Engine', 1, 0, 1),
('engine_gauntlet', 'Gauntlet Engine', 1, 0, 1),
('engine_gauntlet2', 'Gauntlet2 Engine', 1, 0, 1),
('engine_gauntlet3', 'Gauntlet3 Engine', 1, 0, 1),
('engine_gauntlet4', 'Gauntlet4 Engine', 1, 0, 1),
('engine_gauntlet5', 'Gauntlet5 Engine', 1, 0, 1),
('engine_gb200', 'Gb200 Engine', 1, 0, 1),
('engine_gburrito', 'Gburrito Engine', 1, 0, 1),
('engine_gburrito2', 'Gburrito2 Engine', 1, 0, 1),
('engine_glendale', 'Glendale Engine', 1, 0, 1),
('engine_glendale2', 'Glendale2 Engine', 1, 0, 1),
('engine_gp1', 'Gp1 Engine', 1, 0, 1),
('engine_graintrailer', 'Graintrailer Engine', 1, 0, 1),
('engine_granger', 'Granger Engine', 1, 0, 1),
('engine_gresley', 'Gresley Engine', 1, 0, 1),
('engine_growler', 'Growler Engine', 1, 0, 1),
('engine_gt500', 'Gt500 Engine', 1, 0, 1),
('engine_guardian', 'Guardian Engine', 1, 0, 1),
('engine_habanero', 'Habanero Engine', 1, 0, 1),
('engine_hakuchou', 'Hakuchou Engine', 1, 0, 1),
('engine_hakuchou2', 'Hakuchou2 Engine', 1, 0, 1),
('engine_halftrack', 'Halftrack Engine', 1, 0, 1),
('engine_handler', 'Handler Engine', 1, 0, 1),
('engine_hauler', 'Hauler Engine', 1, 0, 1),
('engine_hauler2', 'Hauler2 Engine', 1, 0, 1),
('engine_havok', 'Havok Engine', 1, 0, 1),
('engine_hellion', 'Hellion Engine', 1, 0, 1),
('engine_hermes', 'Hermes Engine', 1, 0, 1),
('engine_hexer', 'Hexer Engine', 1, 0, 1),
('engine_hotknife', 'Hotknife Engine', 1, 0, 1),
('engine_hotring', 'Hotring Engine', 1, 0, 1),
('engine_howard', 'Howard Engine', 1, 0, 1),
('engine_hunter', 'Hunter Engine', 1, 0, 1),
('engine_huntley', 'Huntley Engine', 1, 0, 1),
('engine_hustler', 'Hustler Engine', 1, 0, 1),
('engine_hydra', 'Hydra Engine', 1, 0, 1),
('engine_imorgon', 'Imorgon Engine', 1, 0, 1),
('engine_impaler', 'Impaler Engine', 1, 0, 1),
('engine_impaler2', 'Impaler2 Engine', 1, 0, 1),
('engine_impaler3', 'Impaler3 Engine', 1, 0, 1),
('engine_impaler4', 'Impaler4 Engine', 1, 0, 1),
('engine_imperator', 'Imperator Engine', 1, 0, 1),
('engine_imperator2', 'Imperator2 Engine', 1, 0, 1),
('engine_imperator3', 'Imperator3 Engine', 1, 0, 1),
('engine_infernus', 'Infernus Engine', 1, 0, 1),
('engine_infernus2', 'Infernus2 Engine', 1, 0, 1),
('engine_ingot', 'Ingot Engine', 1, 0, 1),
('engine_innovation', 'Innovation Engine', 1, 0, 1),
('engine_insurgent', 'Insurgent Engine', 1, 0, 1),
('engine_insurgent2', 'Insurgent2 Engine', 1, 0, 1),
('engine_insurgent3', 'Insurgent3 Engine', 1, 0, 1),
('engine_intruder', 'Intruder Engine', 1, 0, 1),
('engine_issi2', 'Issi2 Engine', 1, 0, 1),
('engine_issi3', 'Issi3 Engine', 1, 0, 1),
('engine_issi4', 'Issi4 Engine', 1, 0, 1),
('engine_issi5', 'Issi5 Engine', 1, 0, 1),
('engine_issi6', 'Issi6 Engine', 1, 0, 1),
('engine_issi7', 'Issi7 Engine', 1, 0, 1),
('engine_italigtb', 'Italigtb Engine', 1, 0, 1),
('engine_italigtb2', 'Italigtb2 Engine', 1, 0, 1),
('engine_italigto', 'Italigto Engine', 1, 0, 1),
('engine_italirsx', 'Italirsx Engine', 1, 0, 1),
('engine_jackal', 'Jackal Engine', 1, 0, 1),
('engine_jb700', 'Jb700 Engine', 1, 0, 1),
('engine_jb7002', 'Jb7002 Engine', 1, 0, 1),
('engine_jester', 'Jester Engine', 1, 0, 1),
('engine_jester2', 'Jester2 Engine', 1, 0, 1),
('engine_jester3', 'Jester3 Engine', 1, 0, 1),
('engine_jester4', 'Jester4 Engine', 1, 0, 1),
('engine_jet', 'Jet Engine', 1, 0, 1),
('engine_jetmax', 'Jetmax Engine', 1, 0, 1),
('engine_journey', 'Journey Engine', 1, 0, 1),
('engine_jugular', 'Jugular Engine', 1, 0, 1),
('engine_kalahari', 'Kalahari Engine', 1, 0, 1),
('engine_kamacho', 'Kamacho Engine', 1, 0, 1),
('engine_kanjo', 'Kanjo Engine', 1, 0, 1),
('engine_khamelion', 'Khamelion Engine', 1, 0, 1),
('engine_khanjali', 'Khanjali Engine', 1, 0, 1),
('engine_komoda', 'Komoda Engine', 1, 0, 1),
('engine_kosatka', 'Kosatka Engine', 1, 0, 1),
('engine_krieger', 'Krieger Engine', 1, 0, 1),
('engine_kuruma', 'Kuruma Engine', 1, 0, 1),
('engine_kuruma2', 'Kuruma2 Engine', 1, 0, 1),
('engine_landstalker', 'Landstalker Engine', 1, 0, 1),
('engine_landstalker2', 'Landstalker2 Engine', 1, 0, 1),
('engine_lazer', 'Lazer Engine', 1, 0, 1),
('engine_le7b', 'Le7b Engine', 1, 0, 1),
('engine_lectro', 'Lectro Engine', 1, 0, 1),
('engine_lguard', 'Lguard Engine', 1, 0, 1),
('engine_limo2', 'Limo2 Engine', 1, 0, 1),
('engine_locust', 'Locust Engine', 1, 0, 1),
('engine_longfin', 'Longfin Engine', 1, 0, 1),
('engine_lurcher', 'Lurcher Engine', 1, 0, 1),
('engine_luxor', 'Luxor Engine', 1, 0, 1),
('engine_luxor2', 'Luxor2 Engine', 1, 0, 1),
('engine_lynx', 'Lynx Engine', 1, 0, 1),
('engine_mamba', 'Mamba Engine', 1, 0, 1),
('engine_mammatus', 'Mammatus Engine', 1, 0, 1),
('engine_manana', 'Manana Engine', 1, 0, 1),
('engine_manana2', 'Manana2 Engine', 1, 0, 1),
('engine_manchez', 'Manchez Engine', 1, 0, 1),
('engine_manchez2', 'Manchez2 Engine', 1, 0, 1),
('engine_marquis', 'Marquis Engine', 1, 0, 1),
('engine_marshall', 'Marshall Engine', 1, 0, 1),
('engine_massacro', 'Massacro Engine', 1, 0, 1),
('engine_massacro2', 'Massacro2 Engine', 1, 0, 1),
('engine_maverick', 'Maverick Engine', 1, 0, 1),
('engine_menacer', 'Menacer Engine', 1, 0, 1),
('engine_mesa', 'Mesa Engine', 1, 0, 1),
('engine_mesa2', 'Mesa2 Engine', 1, 0, 1),
('engine_mesa3', 'Mesa3 Engine', 1, 0, 1),
('engine_metrotrain', 'Metrotrain Engine', 1, 0, 1),
('engine_michelli', 'Michelli Engine', 1, 0, 1),
('engine_microlight', 'Microlight Engine', 1, 0, 1),
('engine_miljet', 'Miljet Engine', 1, 0, 1),
('engine_minitank', 'Minitank Engine', 1, 0, 1),
('engine_minivan', 'Minivan Engine', 1, 0, 1),
('engine_minivan2', 'Minivan2 Engine', 1, 0, 1),
('engine_mixer', 'Mixer Engine', 1, 0, 1),
('engine_mixer2', 'Mixer2 Engine', 1, 0, 1),
('engine_mogul', 'Mogul Engine', 1, 0, 1),
('engine_molotok', 'Molotok Engine', 1, 0, 1),
('engine_monroe', 'Monroe Engine', 1, 0, 1),
('engine_monster', 'Monster Engine', 1, 0, 1),
('engine_monster3', 'Monster3 Engine', 1, 0, 1),
('engine_monster4', 'Monster4 Engine', 1, 0, 1),
('engine_monster5', 'Monster5 Engine', 1, 0, 1),
('engine_moonbeam', 'Moonbeam Engine', 1, 0, 1),
('engine_moonbeam2', 'Moonbeam2 Engine', 1, 0, 1),
('engine_mower', 'Mower Engine', 1, 0, 1),
('engine_mule', 'Mule Engine', 1, 0, 1),
('engine_mule2', 'Mule2 Engine', 1, 0, 1),
('engine_mule3', 'Mule3 Engine', 1, 0, 1),
('engine_mule4', 'Mule4 Engine', 1, 0, 1),
('engine_nebula', 'Nebula Engine', 1, 0, 1),
('engine_nemesis', 'Nemesis Engine', 1, 0, 1),
('engine_neo', 'Neo Engine', 1, 0, 1),
('engine_neon', 'Neon Engine', 1, 0, 1),
('engine_nero', 'Nero Engine', 1, 0, 1),
('engine_nero2', 'Nero2 Engine', 1, 0, 1),
('engine_nexus', 'Nexus Engine', 1, 0, 1),
('engine_nightblade', 'Nightblade Engine', 1, 0, 1),
('engine_nightshade', 'Nightshade Engine', 1, 0, 1),
('engine_nightshark', 'Nightshark Engine', 1, 0, 1),
('engine_nimbus', 'Nimbus Engine', 1, 0, 1),
('engine_ninef', 'Ninef Engine', 1, 0, 1),
('engine_ninef2', 'Ninef2 Engine', 1, 0, 1),
('engine_nokota', 'Nokota Engine', 1, 0, 1),
('engine_novak', 'Novak Engine', 1, 0, 1),
('engine_omnis', 'Omnis Engine', 1, 0, 1),
('engine_openwheel1', 'Openwheel1 Engine', 1, 0, 1),
('engine_openwheel2', 'Openwheel2 Engine', 1, 0, 1),
('engine_oppressor', 'Oppressor Engine', 1, 0, 1),
('engine_oppressor2', 'Oppressor2 Engine', 1, 0, 1),
('engine_oracle', 'Oracle Engine', 1, 0, 1),
('engine_oracle2', 'Oracle2 Engine', 1, 0, 1),
('engine_osiris', 'Osiris Engine', 1, 0, 1),
('engine_outlaw', 'Outlaw Engine', 1, 0, 1),
('engine_packer', 'Packer Engine', 1, 0, 1),
('engine_panto', 'Panto Engine', 1, 0, 1),
('engine_paradise', 'Paradise Engine', 1, 0, 1),
('engine_paragon', 'Paragon Engine', 1, 0, 1),
('engine_paragon2', 'Paragon2 Engine', 1, 0, 1),
('engine_pariah', 'Pariah Engine', 1, 0, 1),
('engine_patriot', 'Patriot Engine', 1, 0, 1),
('engine_patriot2', 'Patriot2 Engine', 1, 0, 1),
('engine_patrolboat', 'Patrolboat Engine', 1, 0, 1),
('engine_pbus', 'Pbus Engine', 1, 0, 1),
('engine_pbus2', 'Pbus2 Engine', 1, 0, 1),
('engine_pcj', 'Pcj Engine', 1, 0, 1),
('engine_penetrator', 'Penetrator Engine', 1, 0, 1),
('engine_penumbra', 'Penumbra Engine', 1, 0, 1),
('engine_penumbra2', 'Penumbra2 Engine', 1, 0, 1),
('engine_peyote', 'Peyote Engine', 1, 0, 1),
('engine_peyote2', 'Peyote2 Engine', 1, 0, 1),
('engine_peyote3', 'Peyote3 Engine', 1, 0, 1),
('engine_pfister811', 'Pfister811 Engine', 1, 0, 1),
('engine_phantom', 'Phantom Engine', 1, 0, 1),
('engine_phantom2', 'Phantom2 Engine', 1, 0, 1),
('engine_phantom3', 'Phantom3 Engine', 1, 0, 1),
('engine_phoenix', 'Phoenix Engine', 1, 0, 1),
('engine_picador', 'Picador Engine', 1, 0, 1),
('engine_pigalle', 'Pigalle Engine', 1, 0, 1),
('engine_police', 'Police Engine', 1, 0, 1),
('engine_police2', 'Police2 Engine', 1, 0, 1),
('engine_police3', 'Police3 Engine', 1, 0, 1),
('engine_police4', 'Police4 Engine', 1, 0, 1),
('engine_policeb', 'Policeb Engine', 1, 0, 1),
('engine_policeold1', 'Policeold1 Engine', 1, 0, 1),
('engine_policeold2', 'Policeold2 Engine', 1, 0, 1),
('engine_policet', 'Policet Engine', 1, 0, 1),
('engine_polmav', 'Polmav Engine', 1, 0, 1),
('engine_pony', 'Pony Engine', 1, 0, 1),
('engine_pony2', 'Pony2 Engine', 1, 0, 1),
('engine_pounder', 'Pounder Engine', 1, 0, 1),
('engine_pounder2', 'Pounder2 Engine', 1, 0, 1),
('engine_prairie', 'Prairie Engine', 1, 0, 1),
('engine_pranger', 'Pranger Engine', 1, 0, 1),
('engine_predator', 'Predator Engine', 1, 0, 1),
('engine_premier', 'Premier Engine', 1, 0, 1),
('engine_previon', 'Previon Engine', 1, 0, 1),
('engine_primo', 'Primo Engine', 1, 0, 1),
('engine_primo2', 'Primo2 Engine', 1, 0, 1),
('engine_proptrailer', 'Proptrailer Engine', 1, 0, 1),
('engine_prototipo', 'Prototipo Engine', 1, 0, 1),
('engine_pyro', 'Pyro Engine', 1, 0, 1),
('engine_radi', 'Radi Engine', 1, 0, 1),
('engine_raiden', 'Raiden Engine', 1, 0, 1),
('engine_raketrailer', 'Raketrailer Engine', 1, 0, 1),
('engine_rallytruck', 'Rallytruck Engine', 1, 0, 1),
('engine_rancherxl', 'Rancherxl Engine', 1, 0, 1),
('engine_rancherxl2', 'Rancherxl2 Engine', 1, 0, 1),
('engine_rapidgt', 'Rapidgt Engine', 1, 0, 1),
('engine_rapidgt2', 'Rapidgt2 Engine', 1, 0, 1),
('engine_rapidgt3', 'Rapidgt3 Engine', 1, 0, 1),
('engine_raptor', 'Raptor Engine', 1, 0, 1),
('engine_ratbike', 'Ratbike Engine', 1, 0, 1),
('engine_ratloader', 'Ratloader Engine', 1, 0, 1),
('engine_ratloader2', 'Ratloader2 Engine', 1, 0, 1),
('engine_rb26dett', 'Rb26dett Engine', 1, 0, 1),
('engine_rcbandito', 'Rcbandito Engine', 1, 0, 1),
('engine_reaper', 'Reaper Engine', 1, 0, 1),
('engine_rebel', 'Rebel Engine', 1, 0, 1),
('engine_rebel2', 'Rebel2 Engine', 1, 0, 1),
('engine_rebla', 'Rebla Engine', 1, 0, 1),
('engine_regina', 'Regina Engine', 1, 0, 1),
('engine_remus', 'Remus Engine', 1, 0, 1),
('engine_rentalbus', 'Rentalbus Engine', 1, 0, 1),
('engine_retinue', 'Retinue Engine', 1, 0, 1),
('engine_retinue2', 'Retinue2 Engine', 1, 0, 1),
('engine_revolter', 'Revolter Engine', 1, 0, 1),
('engine_rhapsody', 'Rhapsody Engine', 1, 0, 1),
('engine_rhino', 'Rhino Engine', 1, 0, 1),
('engine_riata', 'Riata Engine', 1, 0, 1),
('engine_riot', 'Riot Engine', 1, 0, 1),
('engine_riot2', 'Riot2 Engine', 1, 0, 1),
('engine_ripley', 'Ripley Engine', 1, 0, 1),
('engine_rocoto', 'Rocoto Engine', 1, 0, 1),
('engine_rogue', 'Rogue Engine', 1, 0, 1),
('engine_romero', 'Romero Engine', 1, 0, 1),
('engine_rrocket', 'Rrocket Engine', 1, 0, 1),
('engine_rt3000', 'Rt3000 Engine', 1, 0, 1),
('engine_rubble', 'Rubble Engine', 1, 0, 1),
('engine_ruffian', 'Ruffian Engine', 1, 0, 1),
('engine_ruiner', 'Ruiner Engine', 1, 0, 1),
('engine_ruiner2', 'Ruiner2 Engine', 1, 0, 1),
('engine_ruiner3', 'Ruiner3 Engine', 1, 0, 1),
('engine_rumpo', 'Rumpo Engine', 1, 0, 1),
('engine_rumpo2', 'Rumpo2 Engine', 1, 0, 1),
('engine_rumpo3', 'Rumpo3 Engine', 1, 0, 1),
('engine_ruston', 'Ruston Engine', 1, 0, 1),
('engine_rx713b', 'Rx713b Engine', 1, 0, 1),
('engine_s80', 'S80 Engine', 1, 0, 1),
('engine_sabregt', 'Sabregt Engine', 1, 0, 1),
('engine_sabregt2', 'Sabregt2 Engine', 1, 0, 1),
('engine_sadler', 'Sadler Engine', 1, 0, 1),
('engine_sadler2', 'Sadler2 Engine', 1, 0, 1),
('engine_sanchez', 'Sanchez Engine', 1, 0, 1),
('engine_sanchez2', 'Sanchez2 Engine', 1, 0, 1),
('engine_sanctus', 'Sanctus Engine', 1, 0, 1),
('engine_sandking', 'Sandking Engine', 1, 0, 1),
('engine_sandking2', 'Sandking2 Engine', 1, 0, 1),
('engine_savage', 'Savage Engine', 1, 0, 1),
('engine_savestra', 'Savestra Engine', 1, 0, 1),
('engine_sc1', 'Sc1 Engine', 1, 0, 1),
('engine_scarab', 'Scarab Engine', 1, 0, 1),
('engine_scarab2', 'Scarab2 Engine', 1, 0, 1),
('engine_scarab3', 'Scarab3 Engine', 1, 0, 1),
('engine_schafter2', 'Schafter2 Engine', 1, 0, 1),
('engine_schafter3', 'Schafter3 Engine', 1, 0, 1),
('engine_schafter4', 'Schafter4 Engine', 1, 0, 1),
('engine_schafter5', 'Schafter5 Engine', 1, 0, 1),
('engine_schafter6', 'Schafter6 Engine', 1, 0, 1),
('engine_schlagen', 'Schlagen Engine', 1, 0, 1),
('engine_schwarzer', 'Schwarzer Engine', 1, 0, 1),
('engine_scorcher', 'Scorcher Engine', 1, 0, 1),
('engine_scramjet', 'Scramjet Engine', 1, 0, 1),
('engine_scrap', 'Scrap Engine', 1, 0, 1),
('engine_seabreeze', 'Seabreeze Engine', 1, 0, 1),
('engine_seashark', 'Seashark Engine', 1, 0, 1),
('engine_seashark2', 'Seashark2 Engine', 1, 0, 1),
('engine_seashark3', 'Seashark3 Engine', 1, 0, 1),
('engine_seasparrow', 'Seasparrow Engine', 1, 0, 1),
('engine_seasparrow2', 'Seasparrow2 Engine', 1, 0, 1),
('engine_seasparrow3', 'Seasparrow3 Engine', 1, 0, 1),
('engine_seminole', 'Seminole Engine', 1, 0, 1),
('engine_seminole2', 'Seminole2 Engine', 1, 0, 1),
('engine_sentinel', 'Sentinel Engine', 1, 0, 1),
('engine_sentinel2', 'Sentinel2 Engine', 1, 0, 1),
('engine_sentinel3', 'Sentinel3 Engine', 1, 0, 1),
('engine_serrano', 'Serrano Engine', 1, 0, 1),
('engine_seven70', 'Seven70 Engine', 1, 0, 1),
('engine_shamal', 'Shamal Engine', 1, 0, 1),
('engine_sheava', 'Sheava Engine', 1, 0, 1),
('engine_sheriff', 'Sheriff Engine', 1, 0, 1),
('engine_sheriff2', 'Sheriff2 Engine', 1, 0, 1),
('engine_shotaro', 'Shotaro Engine', 1, 0, 1),
('engine_skylift', 'Skylift Engine', 1, 0, 1),
('engine_slamtruck', 'Slamtruck Engine', 1, 0, 1),
('engine_slamvan', 'Slamvan Engine', 1, 0, 1),
('engine_slamvan2', 'Slamvan2 Engine', 1, 0, 1),
('engine_slamvan3', 'Slamvan3 Engine', 1, 0, 1),
('engine_slamvan4', 'Slamvan4 Engine', 1, 0, 1),
('engine_slamvan5', 'Slamvan5 Engine', 1, 0, 1),
('engine_slamvan6', 'Slamvan6 Engine', 1, 0, 1),
('engine_sovereign', 'Sovereign Engine', 1, 0, 1),
('engine_specter', 'Specter Engine', 1, 0, 1),
('engine_specter2', 'Specter2 Engine', 1, 0, 1),
('engine_speeder', 'Speeder Engine', 1, 0, 1),
('engine_speeder2', 'Speeder2 Engine', 1, 0, 1),
('engine_speedo', 'Speedo Engine', 1, 0, 1),
('engine_speedo2', 'Speedo2 Engine', 1, 0, 1),
('engine_speedo4', 'Speedo4 Engine', 1, 0, 1),
('engine_squaddie', 'Squaddie Engine', 1, 0, 1),
('engine_squalo', 'Squalo Engine', 1, 0, 1),
('engine_stafford', 'Stafford Engine', 1, 0, 1),
('engine_stalion', 'Stalion Engine', 1, 0, 1),
('engine_stalion2', 'Stalion2 Engine', 1, 0, 1),
('engine_stanier', 'Stanier Engine', 1, 0, 1),
('engine_starling', 'Starling Engine', 1, 0, 1),
('engine_stinger', 'Stinger Engine', 1, 0, 1),
('engine_stingergt', 'Stingergt Engine', 1, 0, 1),
('engine_stockade', 'Stockade Engine', 1, 0, 1),
('engine_stockade3', 'Stockade3 Engine', 1, 0, 1),
('engine_stratum', 'Stratum Engine', 1, 0, 1),
('engine_streiter', 'Streiter Engine', 1, 0, 1),
('engine_stretch', 'Stretch Engine', 1, 0, 1),
('engine_strikeforce', 'Strikeforce Engine', 1, 0, 1),
('engine_stromberg', 'Stromberg Engine', 1, 0, 1),
('engine_stryder', 'Stryder Engine', 1, 0, 1),
('engine_stunt', 'Stunt Engine', 1, 0, 1),
('engine_submersible', 'Submersible Engine', 1, 0, 1),
('engine_submersible2', 'Submersible2 Engine', 1, 0, 1),
('engine_sugoi', 'Sugoi Engine', 1, 0, 1),
('engine_sultan', 'Sultan Engine', 1, 0, 1),
('engine_sultan2', 'Sultan2 Engine', 1, 0, 1),
('engine_sultan3', 'Sultan3 Engine', 1, 0, 1),
('engine_sultanrs', 'Sultanrs Engine', 1, 0, 1),
('engine_suntrap', 'Suntrap Engine', 1, 0, 1),
('engine_superd', 'Superd Engine', 1, 0, 1),
('engine_supervolito', 'Supervolito Engine', 1, 0, 1),
('engine_supervolito2', 'Supervolito2 Engine', 1, 0, 1),
('engine_supra2jzgtett', 'Supra2jzgtett Engine', 1, 0, 1),
('engine_surano', 'Surano Engine', 1, 0, 1),
('engine_surfer', 'Surfer Engine', 1, 0, 1),
('engine_surfer2', 'Surfer2 Engine', 1, 0, 1),
('engine_surge', 'Surge Engine', 1, 0, 1),
('engine_swift', 'Swift Engine', 1, 0, 1),
('engine_swift2', 'Swift2 Engine', 1, 0, 1),
('engine_swinger', 'Swinger Engine', 1, 0, 1),
('engine_t20', 'T20 Engine', 1, 0, 1),
('engine_taco', 'Taco Engine', 1, 0, 1),
('engine_tailgater', 'Tailgater Engine', 1, 0, 1),
('engine_tailgater2', 'Tailgater2 Engine', 1, 0, 1),
('engine_taipan', 'Taipan Engine', 1, 0, 1),
('engine_tampa', 'Tampa Engine', 1, 0, 1),
('engine_tampa2', 'Tampa2 Engine', 1, 0, 1),
('engine_tampa3', 'Tampa3 Engine', 1, 0, 1),
('engine_tanker', 'Tanker Engine', 1, 0, 1),
('engine_tanker2', 'Tanker2 Engine', 1, 0, 1),
('engine_tankercar', 'Tankercar Engine', 1, 0, 1),
('engine_taxi', 'Taxi Engine', 1, 0, 1),
('engine_technical', 'Technical Engine', 1, 0, 1),
('engine_technical2', 'Technical2 Engine', 1, 0, 1),
('engine_technical3', 'Technical3 Engine', 1, 0, 1),
('engine_tempesta', 'Tempesta Engine', 1, 0, 1),
('engine_terbyte', 'Terbyte Engine', 1, 0, 1),
('engine_tezeract', 'Tezeract Engine', 1, 0, 1),
('engine_thrax', 'Thrax Engine', 1, 0, 1),
('engine_thrust', 'Thrust Engine', 1, 0, 1),
('engine_thruster', 'Thruster Engine', 1, 0, 1),
('engine_tigon', 'Tigon Engine', 1, 0, 1),
('engine_tiptruck', 'Tiptruck Engine', 1, 0, 1),
('engine_tiptruck2', 'Tiptruck2 Engine', 1, 0, 1),
('engine_titan', 'Titan Engine', 1, 0, 1),
('engine_toreador', 'Toreador Engine', 1, 0, 1),
('engine_torero', 'Torero Engine', 1, 0, 1),
('engine_tornado', 'Tornado Engine', 1, 0, 1),
('engine_tornado2', 'Tornado2 Engine', 1, 0, 1),
('engine_tornado3', 'Tornado3 Engine', 1, 0, 1),
('engine_tornado4', 'Tornado4 Engine', 1, 0, 1),
('engine_tornado5', 'Tornado5 Engine', 1, 0, 1),
('engine_tornado6', 'Tornado6 Engine', 1, 0, 1),
('engine_toro', 'Toro Engine', 1, 0, 1),
('engine_toro2', 'Toro2 Engine', 1, 0, 1),
('engine_toros', 'Toros Engine', 1, 0, 1),
('engine_tourbus', 'Tourbus Engine', 1, 0, 1),
('engine_towtruck', 'Towtruck Engine', 1, 0, 1),
('engine_towtruck2', 'Towtruck2 Engine', 1, 0, 1),
('engine_tr2', 'Tr2 Engine', 1, 0, 1),
('engine_tr3', 'Tr3 Engine', 1, 0, 1),
('engine_tr4', 'Tr4 Engine', 1, 0, 1),
('engine_tractor', 'Tractor Engine', 1, 0, 1),
('engine_tractor2', 'Tractor2 Engine', 1, 0, 1),
('engine_tractor3', 'Tractor3 Engine', 1, 0, 1),
('engine_trailerlarge', 'Trailerlarge Engine', 1, 0, 1),
('engine_trailerlogs', 'Trailerlogs Engine', 1, 0, 1),
('engine_trailers', 'Trailers Engine', 1, 0, 1),
('engine_trailers2', 'Trailers2 Engine', 1, 0, 1),
('engine_trailers3', 'Trailers3 Engine', 1, 0, 1),
('engine_trailers4', 'Trailers4 Engine', 1, 0, 1),
('engine_trailersmall', 'Trailersmall Engine', 1, 0, 1),
('engine_trailersmall2', 'Trailersmall2 Engine', 1, 0, 1),
('engine_trash', 'Trash Engine', 1, 0, 1),
('engine_trash2', 'Trash2 Engine', 1, 0, 1),
('engine_trflat', 'Trflat Engine', 1, 0, 1),
('engine_tribike', 'Tribike Engine', 1, 0, 1),
('engine_tribike2', 'Tribike2 Engine', 1, 0, 1),
('engine_tribike3', 'Tribike3 Engine', 1, 0, 1),
('engine_trophytruck', 'Trophytruck Engine', 1, 0, 1),
('engine_trophytruck2', 'Trophytruck2 Engine', 1, 0, 1),
('engine_tropic', 'Tropic Engine', 1, 0, 1),
('engine_tropic2', 'Tropic2 Engine', 1, 0, 1),
('engine_tropos', 'Tropos Engine', 1, 0, 1),
('engine_tug', 'Tug Engine', 1, 0, 1),
('engine_tula', 'Tula Engine', 1, 0, 1),
('engine_tulip', 'Tulip Engine', 1, 0, 1),
('engine_turismo2', 'Turismo2 Engine', 1, 0, 1),
('engine_turismor', 'Turismor Engine', 1, 0, 1),
('engine_tvtrailer', 'Tvtrailer Engine', 1, 0, 1),
('engine_tyrant', 'Tyrant Engine', 1, 0, 1),
('engine_tyrus', 'Tyrus Engine', 1, 0, 1),
('engine_utillitruck', 'Utillitruck Engine', 1, 0, 1),
('engine_utillitruck2', 'Utillitruck2 Engine', 1, 0, 1),
('engine_utillitruck3', 'Utillitruck3 Engine', 1, 0, 1),
('engine_vacca', 'Vacca Engine', 1, 0, 1),
('engine_vader', 'Vader Engine', 1, 0, 1),
('engine_vagner', 'Vagner Engine', 1, 0, 1),
('engine_vagrant', 'Vagrant Engine', 1, 0, 1),
('engine_valkyrie', 'Valkyrie Engine', 1, 0, 1),
('engine_valkyrie2', 'Valkyrie2 Engine', 1, 0, 1),
('engine_vamos', 'Vamos Engine', 1, 0, 1),
('engine_vectre', 'Vectre Engine', 1, 0, 1),
('engine_velum', 'Velum Engine', 1, 0, 1),
('engine_velum2', 'Velum2 Engine', 1, 0, 1),
('engine_verlierer2', 'Verlierer2 Engine', 1, 0, 1),
('engine_verus', 'Verus Engine', 1, 0, 1),
('engine_vestra', 'Vestra Engine', 1, 0, 1),
('engine_vetir', 'Vetir Engine', 1, 0, 1),
('engine_veto', 'Veto Engine', 1, 0, 1),
('engine_veto2', 'Veto2 Engine', 1, 0, 1),
('engine_vigero', 'Vigero Engine', 1, 0, 1),
('engine_vigilante', 'Vigilante Engine', 1, 0, 1),
('engine_vindicator', 'Vindicator Engine', 1, 0, 1),
('engine_virgo', 'Virgo Engine', 1, 0, 1),
('engine_virgo2', 'Virgo2 Engine', 1, 0, 1),
('engine_virgo3', 'Virgo3 Engine', 1, 0, 1),
('engine_viseris', 'Viseris Engine', 1, 0, 1),
('engine_visione', 'Visione Engine', 1, 0, 1),
('engine_volatol', 'Volatol Engine', 1, 0, 1),
('engine_volatus', 'Volatus Engine', 1, 0, 1),
('engine_voltic', 'Voltic Engine', 1, 0, 1),
('engine_voltic2', 'Voltic2 Engine', 1, 0, 1),
('engine_voodoo', 'Voodoo Engine', 1, 0, 1),
('engine_voodoo2', 'Voodoo2 Engine', 1, 0, 1),
('engine_vortex', 'Vortex Engine', 1, 0, 1),
('engine_vstr', 'Vstr Engine', 1, 0, 1),
('engine_warrener', 'Warrener Engine', 1, 0, 1),
('engine_washington', 'Washington Engine', 1, 0, 1),
('engine_wastelander', 'Wastelander Engine', 1, 0, 1),
('engine_weevil', 'Weevil Engine', 1, 0, 1),
('engine_windsor', 'Windsor Engine', 1, 0, 1),
('engine_windsor2', 'Windsor2 Engine', 1, 0, 1),
('engine_winky', 'Winky Engine', 1, 0, 1),
('engine_wolfsbane', 'Wolfsbane Engine', 1, 0, 1),
('engine_xa21', 'Xa21 Engine', 1, 0, 1),
('engine_xls', 'Xls Engine', 1, 0, 1),
('engine_xls2', 'Xls2 Engine', 1, 0, 1),
('engine_yosemite', 'Yosemite Engine', 1, 0, 1),
('engine_yosemite2', 'Yosemite2 Engine', 1, 0, 1),
('engine_yosemite3', 'Yosemite3 Engine', 1, 0, 1),
('engine_youga', 'Youga Engine', 1, 0, 1),
('engine_youga2', 'Youga2 Engine', 1, 0, 1),
('engine_youga3', 'Youga3 Engine', 1, 0, 1),
('engine_z190', 'Z190 Engine', 1, 0, 1),
('engine_zentorno', 'Zentorno Engine', 1, 0, 1),
('engine_zhaba', 'Zhaba Engine', 1, 0, 1),
('engine_zion', 'Zion Engine', 1, 0, 1),
('engine_zion2', 'Zion2 Engine', 1, 0, 1),
('engine_zion3', 'Zion3 Engine', 1, 0, 1),
('engine_zombiea', 'Zombiea Engine', 1, 0, 1),
('engine_zombieb', 'Zombieb Engine', 1, 0, 1),
('engine_zorrusso', 'Zorrusso Engine', 1, 0, 1),
('engine_zr350', 'Zr350 Engine', 1, 0, 1),
('engine_zr380', 'Zr380 Engine', 1, 0, 1),
('engine_zr3802', 'Zr3802 Engine', 1, 0, 1),
('engine_zr3803', 'Zr3803 Engine', 1, 0, 1),
('engine_ztype', 'Ztype Engine', 1, 0, 1),
('essence', 'Benzin', 1, 0, 1),
('fabric', 'Tuch', 1, 0, 1),
('firstaidkit', 'Erste-Hilfe-Kasten', 1, 0, 1),
('fish', 'Fisch', 1, 0, 1),
('fishbait', 'Fischköder', 1, 0, 1),
('fishingrod', 'Angelrute', 2, 0, 1),
('fixkit', 'Repair Kit', 3, 0, 1),
('fixtool', 'Werkzeugkasten', 5, 0, 1),
('flashlight', 'Flashlight', 2, 0, 1),
('GADGET_PARACHUTE', 'Fallschrim', 2, 0, 1),
('gazbottle', 'Gasflasche', 2, 0, 1),
('gold', 'Gold', 1, 0, 1),
('gold_bar', 'Goldbarren', 2, 0, 1),
('golem', 'Golem', 5, 0, 1),
('grapperaisin', 'Weintrauben', 5, 0, 1),
('grip', 'Grip', 2, 0, 1),
('head_brace', 'Head Brace', 1, 0, 1),
('heroin', 'Heroin', 1, 0, 1),
('hydrochloric_acid', 'HydroChlorsäure', 1, 0, 1),
('ice', 'Eis', 5, 0, 1),
('icetea', 'Ice Tea', 5, 0, 1),
('id_card', 'ID Card', 1, 0, 1),
('id_card_f', 'Malicious Access Card', 1, 3, 1),
('ied', 'Autobombe', 0, 0, 1),
('iron', 'Eisen', 1, 0, 1),
('jager', 'Jägermeister', 5, 0, 1),
('jagerbomb', 'Jägerbomb', 5, 0, 1),
('jagercerbere', 'Jäger Cerbère', 3, 0, 1),
('jewels', 'Juwelen', 1, 0, 1),
('jusfruit', 'Fruchtsaft', 5, 0, 1),
('keycard', 'Keycard', 1, 0, 1),
('laptop_h', 'Hacker Laptop', 1, 0, 1),
('leg_bandage', 'Leg Bandage', 1, 0, 1),
('letter', 'Brief', -1, 0, 1),
('limonade', 'Fanta', 5, 0, 1),
('lockpick', 'Dietrich', 1, 0, 1),
('lsa', 'LSA', 1, 0, 1),
('lsd', 'LSD', 1, 0, 1),
('manual_tranny', 'Manual Trannsmition', 1, 0, 1),
('marijuana', 'Marijuana', 1, 0, 1),
('martini', 'Weisser Martini', 5, 0, 1),
('medikit', 'Verbandskasten', 2, 0, 1),
('menthe', 'Minzblatt', 10, 0, 1),
('meth', 'Meth', 1, 0, 1),
('metreshooter', 'Mètre de shooter', 3, 0, 1),
('mini_c4', 'Mini C4 Charge', 1, 0, 1),
('mixapero', 'Apéro-Mix', 3, 0, 1),
('mojito', 'Mojito', 5, 0, 1),
('moneywash', 'Geldwasch Lizenz', 0, 0, 1),
('nitro', 'Nitro', 1, 0, 1),
('normal_c4', 'C4 Ladung', 1, 0, 1),
('oxygenmask', 'Tauchflasche', 1, 0, 1),
('packaged_chicken', 'Hähnchenfilet', 1, 0, 1),
('packaged_plank', 'Bretterpaket', 1, 0, 1),
('pdbadge', 'Police Badge', 1, 0, 1),
('peach', 'Pfirsich', 1, 0, 1),
('peach_juice', 'Pfirsichsaft', 1, 0, 1),
('petrol', 'Öl', 1, 0, 1),
('petrol_raffin', 'bearbeitetes Öl', 1, 0, 1),
('phone', 'Smartphone', 1, 0, 1),
('pickaxe', 'Spitzhacke', 1, 0, 1),
('poppyresin', 'Mohnharz', 1, 0, 1),
('racing_tirekit', 'Racing Tires Kit', 1, 0, 1),
('radio', 'Funkgerät', 1, 0, 1),
('repairkit', 'Reparatur-Kit', 1, 0, 1),
('rhum', 'Rum', 5, 0, 1),
('rhumcoca', 'Rum-Cola', 5, 0, 1),
('rhumfruit', 'Rum-Fruchtsaft', 5, 0, 1),
('saucisson', 'Bratwurst', 5, 0, 1),
('scope', 'Scope', 2, 0, 1),
('scratch_ticket', 'Rubbellos', 1, 0, 1),
('secure_card', 'Secure ID Card', 1, 3, 1),
('shark', 'Haifisch', 0, 0, 1),
('skin', 'Skin', 2, 0, 1),
('slaughtered_chicken', 'geschlachtetes Huhn', 1, 0, 1),
('soda', 'Wasser', 5, 0, 1),
('sodium_hydroxide', 'Natriumhydroxid', 1, 0, 1),
('spikestrip', 'Nagelband', 1, 0, 1),
('sports_tirekit', 'Sports Tire Kit', 1, 0, 1),
('stone', 'Felsbrocken', 1, 0, 1),
('street_tirekit', 'Street Tire Kit', 1, 0, 1),
('sulfuric_acid', 'Schwefelsäure', 1, 0, 1),
('supressor', 'Suppressor', 2, 0, 1),
('teqpaf', 'teqpaf', 5, 0, 1),
('tequila', 'Tequila', 5, 0, 1),
('thermal_charge', 'thermische Ladung', 1, 0, 1),
('thionyl_chloride', 'Thionylchlorid', 1, 0, 1),
('tirekit', 'Reifen-Kit', 1, 0, 1),
('tunerchip', 'Tunerchip', 1, 0, 1),
('turbo_racing', 'Racing Turbine', 1, 0, 1),
('turbo_sports', 'Sports Turbine', 1, 0, 1),
('turbo_street', 'Street Turbine', 1, 0, 1),
('turtle', 'Meeresschildkröte', 3, 0, 1),
('turtlebait', 'Schildkrötenköder', 10, 0, 1),
('vehgps', 'Fahrzeug-GPS', 1, 0, 1),
('vodka', 'Wodka', 5, 0, 1),
('vodkaenergy', 'Wodka-Energy', 5, 0, 1),
('vodkafruit', 'Wodka-Fuchtsaft', 5, 0, 1),
('washed_stone', 'gewaschener Felsbrocken', 1, 0, 1),
('water', 'Wasser', 1, 0, 1),
('weabox', 'Munitionskiste', 1, 0, 1),
('weaclip', 'Waffenmagazin', 1, 0, 1),
('whisky', 'Whisky', 5, 0, 1),
('whiskycoca', 'Whisky-Cola', 5, 0, 1),
('wood', 'Holz', 1, 0, 1),
('wool', 'Wolle', 1, 0, 1),
('zetony', 'Spielchips', 0, 0, 1)
;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 0),
('cardealer', 'Cardealer', 0),
('fisherman', 'Fisherman', 0),
('fueler', 'Fueler', 0),
('lumberjack', 'Lumberjack', 0),
('mechanic', 'Mechanic', 0),
('miner', 'Miner', 0),
('police', 'LSPD', 0),
('reporter', 'Reporter', 0),
('slaughterer', 'Butcher', 0),
('tailor', 'Tailor', 0),
('taxi', 'Taxi', 0),
('unemployed', 'Unemployed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
(3, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
(4, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(6, 'police', 4, 'boss', 'Captain', 100, '{}', '{}'),
(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
(19, 'tailor', 0, 'employee', 'Employee', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(20, 'miner', 0, 'employee', 'Employee', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(32, 'taxi', 1, 'novice', 'Cabby', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Fahrgenehmigung'),
('drive', 'Führerschein'),
('drive_bike', 'Motorradführerschein'),
('drive_truck', 'Gewerblicher Führerschein'),
('weed_processing', 'Lizenz für Weedverarbeitung'),
('boat', 'Bootsführerschein');

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(60) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` VARCHAR(60) DEFAULT NULL,
  `pound` VARCHAR(60) DEFAULT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB;

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` LONGTEXT NULL DEFAULT NULL,
  `position` longtext NULL DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL,
  `disabled` TINYINT(1) NULL DEFAULT '0',
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `phone_number` VARCHAR(20) DEFAULT NULL
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB;


--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;


-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- Fine Types
--
	CREATE TABLE `fine_types` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Missbräuchliche Verwendung einer Hupe', 30, 0),
	('Illegales Überschreiten einer durchgehenden Linie', 40, 0),
	('Fahren auf der falschen Seite der Straße', 250, 0),
	('Unerlaubter U-Turn', 250, 0),
	('Illegales Fahren abseits der Straße', 170, 0),
	('Gesetzliche Befehle verweigern', 30, 0),
	('Unerlaubtes Anhalten eines Fahrzeugs', 150, 0),
	('Unerlaubtes Parken', 70, 0),
	('Rechtsabbiegen nicht beachtet', 70, 0),
	('Nichteinhaltung der Fahrzeuginformationen', 90, 0),
	('Nichtanhalten an einem Stoppschild ', 105, 0),
	('Nichtanhalten an einer roten Ampel', 130, 0),
	('Unerlaubtes Überholen', 100, 0),
	('Fahren eines illegalen Fahrzeugs', 100, 0),
	('Fahren ohne Führerschein', 1500, 0),
	('Fahrerflucht', 800, 0),
	('Geschwindigkeitsüberschreitung über < 5 km/h', 90, 0),
	('Geschwindigkeitsüberschreitung über 5-15 km/h', 120, 0),
	('Überschreiten von Geschwindigkeiten über 15-30 km/h', 180, 0),
	('Exceeding Speeds Over > 30 mph', 300, 0),
	('Impeding traffic flow', 110, 1),
	('Public Intoxication', 90, 1),
	('Disorderly conduct', 90, 1),
	('Obstruction of Justice', 130, 1),
	('Insults towards Civilans', 75, 1),
	('Disrespecting of an LEO', 110, 1),
	('Verbal Threat towards a Civilan', 90, 1),
	('Verbal Threat towards an LEO', 150, 1),
	('Providing False Information', 250, 1),
	('Attempt of Corruption', 1500, 1),
	('Brandishing a weapon in city Limits', 120, 2),
	('Brandishing a Lethal Weapon in city Limits', 300, 2),
	('No Firearms License', 600, 2),
	('Possession of an Illegal Weapon', 700, 2),
	('Possession of Burglary Tools', 300, 2),
	('Grand Theft Auto', 1800, 2),
	('Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	('Frabrication of an Illegal Substance', 1500, 2),
	('Possession of an Illegal Substance ', 650, 2),
	('Kidnapping of a Civilan', 1500, 2),
	('Kidnapping of an LEO', 2000, 2),
	('Robbery', 650, 2),
	('Armed Robbery of a Store', 650, 2),
	('Armed Robbery of a Bank', 1500, 2),
	('Assault on a Civilian', 2000, 3),
	('Assault of an LEO', 2500, 3),
	('Attempt of Murder of a Civilian', 3000, 3),
	('Attempt of Murder of an LEO', 5000, 3),
	('Murder of a Civilian', 10000, 3),
	('Murder of an LEO', 30000, 3),
	('Involuntary manslaughter', 1800, 3),
	('Fraud', 2000, 2);


--
-- ESX Bankerjob
--

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_banker','Bank',1),
	('bank_savings','Savings account',0),
  ('society_cardealer','Cardealer',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('banker','Banker'),
  ('police', 'LSPD'),
  ('cardealer','Cardealer'),
  ('ambulance','Ambulance'),
  ('taxi', 'Taxi')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('banker',0,'advisor','Consultant',10,'{}','{}'),
	('banker',1,'banker','Banker',20,'{}','{}'),
	('banker',2,'business_banker',"Investment banker",30,'{}','{}'),
	('banker',3,'trader','Broker',40,'{}','{}'),
	('banker',4,'boss','Boss',0,'{}','{}'),
  ('police',0,'recruit','Recrue',20,'{}','{}'),
	('police',1,'officer','Officier',40,'{}','{}'),
	('police',2,'sergeant','Sergent',60,'{}','{}'),
	('police',3,'lieutenant','Lieutenant',85,'{}','{}'),
	('police',4,'boss','Commandant',100,'{}','{}'),
  ('cardealer',0,'recruit','Recruit',10,'{}','{}'),
	('cardealer',1,'novice','Novice',25,'{}','{}'),
	('cardealer',2,'experienced','Experienced',40,'{}','{}'),
	('cardealer',3,'boss','Boss',0,'{}','{}'),
  ('ambulance',0,'ambulance','Ambulancier',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',1,'doctor','Medecin',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',2,'chief_doctor','Medecin-chef',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',3,'boss','Chirurgien',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
  ('taxi',0,'recrue','Recruit',12,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',1,'novice','Cabby',24,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',2,'experimente','Experienced',36,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',3,'uber','Uber Cabby',48,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',4,'boss','Lead Cabby',0,'{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}')
;

--
-- ESX Banking
--

CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

ALTER TABLE `users` ADD COLUMN `pincode` INT NULL;

CREATE TABLE IF NOT EXISTS `criminal_records` ( `id` int(11) NOT NULL UNIQUE auto_increment, `reason` varchar(250) NOT NULL , `fine` varchar(250) NOT NULL , `time` varchar(250) NOT NULL , `offence` varchar(250) DEFAULT NULL ,`user_id` varchar(250) NOT NULL, `officer_id` varchar(250) NOT NULL, `jail` int(11), `created_at` int (20), PRIMARY KEY(`id`));
CREATE TABLE IF NOT EXISTS `epc_notes` ( `id` int(11) NOT NULL UNIQUE auto_increment, `title` varchar(250) NOT NULL ,`content` varchar(250) NOT NULL, `user_id` varchar(250) NOT NULL, `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  PRIMARY KEY(`id`));
CREATE TABLE IF NOT EXISTS `epc_bolos` ( `id` int(11) NOT NULL UNIQUE auto_increment, `name` varchar(250) , `lastname` varchar(250) , `apperance` varchar(250) , `fine` varchar(250) , `gender` varchar(250) ,`height` varchar(250), `age` varchar(250), `type_of_crime` varchar(250), `note` varchar(250), `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  PRIMARY KEY(`id`));

ALTER TABLE users
ADD (`doges` int(11) NOT NULL DEFAULT '50',
`winnings` longtext COLLATE utf8mb4_bin NULL);
