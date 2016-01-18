ALTER TABLE `order`
  ADD COLUMN `is_wearing` INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true';
