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
ALTER TABLE `users` ADD COLUMN `pincode` INT NULL;

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

CREATE TABLE `cardealer_vehicles` (
	`id` int NOT NULL AUTO_INCREMENT,
	`vehicle` varchar(255) NOT NULL,
	`price` int NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vehicle_sold` (
	`client` VARCHAR(50) NOT NULL,
	`model` VARCHAR(50) NOT NULL,
	`plate` VARCHAR(50) NOT NULL,
	`soldby` VARCHAR(50) NOT NULL,
	`date` VARCHAR(50) NOT NULL,

	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('simcard', 'Simcard', 1, 0, 1),
	('simcard_wish', 'Simcard', 1, 0, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('taxi',0,'recrue','Recrue',12,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',1,'novice','Novice',24,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',2,'experimente','Experimente',36,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',3,'uber','Uber',48,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',4,'boss','Patron',0,'{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}')
;
CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles`
(
    `id`           int         NOT NULL AUTO_INCREMENT,
    `profile_name` varchar(90) NOT NULL,
    `identifier`   varchar(48) NOT NULL COLLATE 'utf8mb4_general_ci',
#   Default Profile avatar can be set here
    `avatar_url`   varchar(255)         DEFAULT 'https://i.file.glass/QrEvq.png',
    `createdAt`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_phone_contacts`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48)           DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `avatar`     varchar(255)          DEFAULT NULL,
    `number`     varchar(20)           DEFAULT NULL,
    `display`    varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE `npwd_twitter_tweets`
(
    `id`         INT(11)       NOT NULL AUTO_INCREMENT,
    `message`    VARCHAR(1000) NOT NULL COLLATE 'utf8mb4_general_ci',
    `createdAt`  TIMESTAMP     NOT NULL DEFAULT current_timestamp(),
    `updatedAt`  TIMESTAMP     NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `likes`      INT(11)       NOT NULL DEFAULT '0',
    `identifier` VARCHAR(48)   NOT NULL COLLATE 'utf8mb4_general_ci',
    `visible`    TINYINT(4)    NOT NULL DEFAULT '1',
    `images`     VARCHAR(1000) NULL     DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `retweet`    INT(11)       NULL     DEFAULT NULL,
    `profile_id` INT(11)       NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
    CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `npwd_twitter_likes`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `profile_id` int NOT NULL,
    `tweet_id`   int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
    KEY `profile_idx` (`profile_id`),
    KEY `tweet_idx` (`tweet_id`),
    CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
    CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `npwd_match_profiles`
(
    `id`            int          NOT NULL AUTO_INCREMENT,
    `identifier`    varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `name`          varchar(90)  NOT NULL,
    `image`         varchar(255) NOT NULL,
    `bio`           varchar(512)          DEFAULT NULL,
    `location`      varchar(45)           DEFAULT NULL,
    `job`           varchar(45)           DEFAULT NULL,
    `tags`          varchar(255) NOT NULL DEFAULT '',
    `voiceMessage`  varchar(512)         DEFAULT NULL,
    `createdAt`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier_UNIQUE` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_match_views`
(
    `id`         int         NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48) NOT NULL COLLATE 'utf8mb4_general_ci',
    `profile`    int         NOT NULL,
    `liked`      tinyint              DEFAULT '0',
    `createdAt`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `match_profile_idx` (`profile`),
    CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_notes`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `title`      varchar(255) NOT NULL,
    `content`    varchar(255) NOT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `identifier`  varchar(48)           DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `username`    varchar(255)          DEFAULT NULL,
    `name`        varchar(50)           DEFAULT NULL,
    `number`      varchar(255) NOT NULL,
    `title`       varchar(255)          DEFAULT NULL,
    `url`         varchar(255)          DEFAULT NULL,
    `description` varchar(255) NOT NULL,
    `createdAt`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `reported`    tinyint      NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_twitter_reports`
(
    `id`         int NOT NULL AUTO_INCREMENT,
    `profile_id` int NOT NULL,
    `tweet_id`   int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_combination` (`profile_id`, `tweet_id`),
    KEY `profile_idx` (`profile_id`),
    KEY `tweet_idx` (`tweet_id`),
    CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
    CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `npwd_messages`
(
    `id`              int(11)      NOT NULL AUTO_INCREMENT,
    `message`         varchar(512) NOT NULL COLLATE 'utf8mb4_general_ci',
    `user_identifier` varchar(48)  NOT NULL COLLATE 'utf8mb4_general_ci',
    `conversation_id` varchar(512) NOT NULL,
    `isRead`          tinyint(4)   NOT NULL DEFAULT 0,
    `createdAt`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updatedAt`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP,
    `visible`         tinyint(4)   NOT NULL DEFAULT 1,
    `author`          varchar(255) NOT NULL,
    `is_embed`        tinyint(4)   NOT NULL default 0,
    `embed`           varchar(512) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    INDEX `user_identifier` (`user_identifier`)
);

CREATE TABLE `npwd_messages_conversations`
(
    `id`                INT(11)      NOT NULL AUTO_INCREMENT,
    `conversation_list` VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
    `label`             VARCHAR(60)  NULL     DEFAULT '' COLLATE 'utf8mb4_general_ci',
    `createdAt`         TIMESTAMP    NOT NULL DEFAULT current_timestamp(),
    `updatedAt`         TIMESTAMP    NOT NULL DEFAULT current_timestamp(),
    `last_message_id`   INT(11)      NULL     DEFAULT NULL,
    `is_group_chat`     TINYINT(4)   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE
);

CREATE TABLE `npwd_messages_participants`
(
    `id`              INT(11)      NOT NULL AUTO_INCREMENT,
    `conversation_id` INT(11)      NOT NULL,
    `participant`     VARCHAR(225) NOT NULL COLLATE 'utf8mb4_general_ci',
    `unread_count`    INT(11)      NULL DEFAULT '0',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
    CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `npwd_calls`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `identifier`  varchar(48)  DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `transmitter` varchar(255) NOT NULL,
    `receiver`    varchar(255) NOT NULL,
    `is_accepted` tinyint(4)   DEFAULT 0,
    `start`       varchar(255) DEFAULT NULL,
    end           varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE IF NOT EXISTS `npwd_phone_gallery`
(
    `id`         int(11)      NOT NULL AUTO_INCREMENT,
    `identifier` varchar(48) DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `image`      varchar(255) NOT NULL,
    PRIMARY KEY (id),
    INDEX `identifier` (`identifier`)
);

CREATE TABLE `npwd_darkchat_channels` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=20
;

CREATE TABLE `npwd_darkchat_channel_members` (
	`channel_id` INT(11) NOT NULL,
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`is_owner` TINYINT(4) NOT NULL DEFAULT '0',
	INDEX `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `npwd_darkchat_messages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`channel_id` INT(11) NOT NULL,
	`message` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_identifier` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`createdAt` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	`is_image` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
	CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=31
;
-- dev.pefcl_accounts definition

CREATE TABLE `pefcl_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT '0',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int DEFAULT '25000',
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_cash definition

CREATE TABLE `pefcl_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT '2000',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_external_accounts definition

CREATE TABLE `pefcl_external_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dev.pefcl_invoices definition

CREATE TABLE `pefcl_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT '0',
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


