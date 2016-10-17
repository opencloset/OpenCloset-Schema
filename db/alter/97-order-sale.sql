--
-- sale / order_sale
--

DROP TABLE IF EXISTS `order_sale`;
DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        CHAR(32)     NOT NULL,
  `desc`        TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sale` (`name`, `desc`) VALUES
  ("3times", "3회 이상 대여 할인");

CREATE TABLE `order_sale` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`    INT UNSIGNED NOT NULL,
  `sale_id`     INT UNSIGNED NOT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_sale1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_sale2` FOREIGN KEY (`sale_id`)  REFERENCES `sale`  (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
