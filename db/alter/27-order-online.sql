ALTER TABLE `order`
  ADD COLUMN `online` INT DEFAULT 0 COMMENT '0 is offline, otherwise online' AFTER `user_address_id`;
