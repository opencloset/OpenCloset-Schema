ALTER TABLE `user` ADD COLUMN `authcode` VARCHAR(32) DEFAULT NULL AFTER `password`;