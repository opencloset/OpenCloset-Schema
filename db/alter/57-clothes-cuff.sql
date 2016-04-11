ALTER TABLE `clothes` ADD COLUMN `cuff` INT DEFAULT 0 AFTER `length`;
ALTER TABLE `clothes` ADD INDEX (`cuff`);
ALTER TABLE `order_size_log` ADD `cuff` INT(11)  NULL  DEFAULT '0'  AFTER `length`;

DROP TRIGGER IF EXISTS `tracking_order_clothes_size_insert`;

DELIMITER $$
CREATE TRIGGER `tracking_order_clothes_size_insert` AFTER INSERT ON `order_detail` FOR EACH ROW
INSERT INTO `order_size_log`
(
    SELECT
            a.order_id
            ,c.id
            ,a.clothes_code
            ,now()
            ,b.category
            ,b.color
            ,b.gender
            ,b.neck
            ,b.bust
            ,b.waist
            ,b.hip
            ,b.topbelly
            ,b.belly
            ,b.arm
            ,b.thigh
            ,b.length
            ,b.cuff
            ,b.price
    FROM `order_detail` AS a
      INNER JOIN `clothes` AS b ON a.`clothes_code` = b.`code`
      INNER JOIN `order`   AS c ON a.`order_id` = c.`id`
    WHERE a.order_id = NEW.order_id AND a.clothes_code = NEW.clothes_code
    LIMIT 1
) $$
DELIMITER ;
