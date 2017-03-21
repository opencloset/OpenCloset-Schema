ALTER TABLE `tag` ADD COLUMN `label` CHAR(128) NOT NULL AFTER `name`;

UPDATE `tag` SET `label` = `name` WHERE `label` = '';
