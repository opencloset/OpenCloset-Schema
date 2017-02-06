ALTER TABLE `order` ADD COLUMN `misc`          TEXT DEFAULT NULL AFTER `message`;
ALTER TABLE `order` ADD COLUMN `shipping_misc` TEXT DEFAULT NULL AFTER `misc`;
