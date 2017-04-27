ALTER TABLE `visitor` ADD COLUMN `visited_rate_30`          INT DEFAULT 0 AFTER `visited_age_30`;
ALTER TABLE `visitor` ADD COLUMN `visited_rate_30_sum`      INT DEFAULT 0 AFTER `visited_rate_30`;
ALTER TABLE `visitor` ADD COLUMN `visited_rate_30_discount` INT DEFAULT 0 AFTER `visited_rate_30_sum`;
