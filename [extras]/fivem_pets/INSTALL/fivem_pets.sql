INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('petfood', 'Tierfutter', 10)
;

ALTER TABLE `users` ADD COLUMN `pet` VARCHAR(50) NOT NULL;