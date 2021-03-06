DROP TABLE IF EXISTS `payment_log` ;
DROP TABLE IF EXISTS `payment` ;
DELETE FROM `status` WHERE id=56 AND name='입금대기';

CREATE TABLE `payment` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`    INT UNSIGNED NOT NULL,
  `sid`         VARCHAR(32)  DEFAULT NULL COMMENT 'server id: imp_uid',
  `cid`         VARCHAR(128) DEFAULT NULL COMMENT 'client id: merchant_uid',
  `amount`      INT          DEFAULT 0,
  `vendor`      VARCHAR(32)  DEFAULT NULL,
  `pay_method`  VARCHAR(32)  DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  UNIQUE (`sid`),
  UNIQUE (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `payment_log` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_id`  INT UNSIGNED NOT NULL,
  `status`      VARCHAR(32)  DEFAULT NULL COMMENT 'paid|ready|cancelled|failed',
  `detail`      TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment_log1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status` (`id`, `name`) VALUES (56, '입금대기');
