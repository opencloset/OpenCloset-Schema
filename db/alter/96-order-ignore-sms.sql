ALTER TABLE `order` ADD COLUMN `ignore_sms` INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true' AFTER `ignore`;
