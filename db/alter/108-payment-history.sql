DROP TABLE IF EXISTS `payment_history` ;
CREATE TABLE `payment_history` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`    INT UNSIGNED NOT NULL,
  `sid`         VARCHAR(32)  DEFAULT NULL COMMENT 'imp_uid',
  `cid`         VARCHAR(32)  DEFAULT NULL COMMENT 'merchant_uid',
  `amount`      INT          DEFAULT 0,
  `status`      VARCHAR(32)  DEFAULT NULL COMMENT 'paid|ready|cancelled|failed',
  `vendor`      VARCHAR(32)  DEFAULT NULL,
  `pay_method`  VARCHAR(32)  DEFAULT NULL,
  `dump`        TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment_history1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  INDEX (`sid`),
  INDEX (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status` (`id`, `name`) VALUES (56, '입금대기');
