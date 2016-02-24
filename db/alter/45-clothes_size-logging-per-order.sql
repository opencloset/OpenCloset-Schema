DROP TABLE IF EXISTS `order_size_log`;

CREATE TABLE `order_size_log` (
  `order_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `clothes_code` CHAR(5) NOT NULL DEFAULT '',
  `timestamp` DATETIME NOT NULL,
  `category` VARCHAR(32) NOT NULL,
  `color` VARCHAR(32) DEFAULT NULL,
  `gender` VARCHAR(6) DEFAULT NULL COMMENT 'male/female/unisex',
  `neck` INT(11) DEFAULT '0',
  `bust` INT(11) DEFAULT '0',
  `waist` INT(11) DEFAULT '0',
  `hip` INT(11) DEFAULT '0',
  `topbelly` INT(11) DEFAULT '0',
  `belly` INT(11) DEFAULT '0',
  `arm` INT(11) DEFAULT '0',
  `thigh` INT(11) DEFAULT '0',
  `length` INT(11) DEFAULT '0',
  `price` INT(11) DEFAULT '0',
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
            ,b.price
    FROM `order_detail` AS a
      INNER JOIN `clothes` AS b ON a.`clothes_code` = b.`code`
      INNER JOIN `order`   AS c ON a.`order_id` = c.`id`
    WHERE a.order_id = NEW.order_id AND a.clothes_code = NEW.clothes_code
    LIMIT 1
) $$

DELIMITER ;
