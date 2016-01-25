ALTER TABLE `order`
  ADD COLUMN `pass` INT DEFAULT NULL COMMENT 'a flag represent get pass or not. null or 0 is false, otherwise true'
  AFTER `compensation_pay_with`;
