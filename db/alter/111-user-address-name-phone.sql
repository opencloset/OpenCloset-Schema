ALTER TABLE `user_address` ADD COLUMN `name`  VARCHAR(32) NOT NULL AFTER `user_id`;
ALTER TABLE `user_address` ADD COLUMN `phone` VARCHAR(16) NOT NULL AFTER `name`;
