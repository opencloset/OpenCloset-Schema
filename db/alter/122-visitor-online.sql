ALTER TABLE `visitor` ADD COLUMN `online` INT DEFAULT 0 COMMENT 'null and 0 are false, otherwise true' AFTER `date`;
