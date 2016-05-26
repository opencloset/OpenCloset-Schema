ALTER TABLE `order` ADD COLUMN `ignore` INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true' AFTER bestfit;
