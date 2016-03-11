DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `code`            VARCHAR(32)  NOT NULL,
  `type`            VARCHAR(32)  DEFAULT 'default' COMMENT 'default|suit',
      -- default: `price` 가격으로 제공되는 쿠폰
      -- suit:    suit 한벌을 빌릴 수 있는 쿠폰

  `status`          VARCHAR(32)  DEFAULT NULL COMMENT 'provided|used|discarded',
      -- provided:  지급됨
      -- used:      사용됨
      -- discarded: 폐기됨

  `desc`            TEXT         DEFAULT NULL,
  `price`           INT          DEFAULT 0,

  `create_date`     DATETIME     DEFAULT NULL,
  `update_date`     DATETIME     DEFAULT NULL,
  `expires_date`    DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `order` ADD COLUMN `coupon_id` INT UNSIGNED DEFAULT NULL AFTER `booking_id`;
ALTER TABLE `order` ADD CONSTRAINT `fk_order6` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`) ON DELETE CASCADE
