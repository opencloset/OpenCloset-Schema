ALTER TABLE `coupon` ADD COLUMN `free_shipping` INT DEFAULT 0 COMMENT 'null and 0 are false, otherwise true' AFTER `price`;
