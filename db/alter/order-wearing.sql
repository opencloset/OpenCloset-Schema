ALTER TABLE `order`
  ADD COLUMN `does_wear` INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true';
