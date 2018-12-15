SET NAMES utf8;
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE `event_type` (
  `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type`         VARCHAR(128) NOT NULL COMMENT 'START_TYPE(reserve or rental)|END_TYPE(reserve or rental)',
  `domain`       VARCHAR(128) NOT NULL COMMENT 'rental or donation or volunteer',
  `desc`         TEXT NOT NULL,
  `create_date`  DATETIME DEFAULT NULL,
  `update_date`  DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `event_type` (`type`, `domain`, `desc`, `create_date`, `update_date`)
  VALUES
  ('reserve|reserve' , 'rental', '예약하는 날짜부터 이벤트 시작, 마감날짜 = 예약하는날짜', NOW(), NOW()),
  ('reserve|rental'  , 'rental', '예약하는 날짜부터 이벤트 시작, 마감날짜 = 대여일', NOW(), NOW()),
  ('rental|reserve'  , 'rental', '대여일부터 이벤트 시작, 마감날짜 = 예약하는날짜', NOW(), NOW()),
  ('rental|rental'   , 'rental', '대여일부터 이벤트 시작, 마감날짜 = 대여일', NOW(), NOW());

ALTER TABLE `event`
  ADD COLUMN `event_type_id` INT UNSIGNED
  DEFAULT NULL AFTER `id`;

ALTER TABLE `event`
  ADD COLUMN `free_shipping` INT
  DEFAULT 0 AFTER `nth`;

ALTER TABLE `event`
  ADD CONSTRAINT `fk_event1`
  FOREIGN KEY (`event_type_id`)
  REFERENCES `event_type` (`id`)
  ON DELETE CASCADE;

ALTER TABLE `coupon`
  ADD COLUMN `event_id` INT UNSIGNED
  DEFAULT NULL AFTER `id`;

ALTER TABLE `coupon`
  ADD CONSTRAINT `fk_coupon1`
  FOREIGN KEY (`event_id`)
  REFERENCES `event` (`id`)
  ON DELETE CASCADE;
