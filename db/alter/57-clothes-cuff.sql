ALTER TABLE `clothes` ADD COLUMN `cuff` INT DEFAULT 0 AFTER `length`;
ALTER TABLE `clothes` ADD INDEX (`cuff`);
