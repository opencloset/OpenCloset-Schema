DROP TABLE IF EXISTS `order_parcel` ;
CREATE TABLE `order_parcel` (
  `id`             INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`       INT UNSIGNED NOT NULL,
  `parcel_service` VARCHAR(32)  DEFAULT NULL,
  `waybill`        VARCHAR(128) DEFAULT NULL,
  `return_waybill` VARCHAR(128) DEFAULT NULL,
  `sms_bitmask`    INT          DEFAULT 0 COMMENT 'flag to show each sms sent or not',
  `comment`        TEXT         DEFAULT NULL,

  `create_date`         DATETIME DEFAULT NULL,
  `update_date`         DATETIME DEFAULT NULL,
  `sent_date`           DATETIME DEFAULT NULL COMMENT '택배보낸날짜',
  `arrival_date`        DATETIME DEFAULT NULL COMMENT '택배받은날짜',
  `return_sent_date`    DATETIME DEFAULT NULL COMMENT '반송보낸날짜',
  `return_arrival_date` DATETIME DEFAULT NULL COMMENT '반송받은날짜',

  PRIMARY KEY (`id`),
  UNIQUE KEY (`order_id`),
  CONSTRAINT `fk_order_parcel1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
