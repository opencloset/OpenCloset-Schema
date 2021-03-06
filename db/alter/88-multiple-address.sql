DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id`       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`  INT UNSIGNED NOT NULL,
  `address1` VARCHAR(32)  DEFAULT NULL COMMENT 'dbid',
  `address2` VARCHAR(256) DEFAULT NULL COMMENT '도로명주소',
  `address3` VARCHAR(256) DEFAULT NULL COMMENT '지번주소',
  `address4` VARCHAR(256) DEFAULT NULL COMMENT '상세주소',

  `create_date` DATETIME DEFAULT NULL,
  `update_date` DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_address1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `order` ADD COLUMN `user_address_id` INT UNSIGNED DEFAULT NULL AFTER coupon_id;
ALTER TABLE `order` ADD CONSTRAINT `fk_order7` FOREIGN KEY (`user_address_id`) REFERENCES `user_address` (`id`) ON DELETE CASCADE;
