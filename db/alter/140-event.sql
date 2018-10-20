SET NAMES utf8;
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(32) NOT NULL,
  `desc`         TEXT DEFAULT NULL,
  `sponsor`      VARCHAR(128) DEFAULT NULL,
  `year`         INT(11) DEFAULT 0 COMMENT '연도; 애매하면 0',
  `nth`          INT(11) DEFAULT 1 COMMENT '회차; 회차와 연도로 그룹화; 2018년 2회차; 2019년 1회차',
  `start_date`   DATETIME DEFAULT NULL,
  `end_date`     DATETIME DEFAULT NULL,
  `create_date`  DATETIME DEFAULT NULL,
  `update_date`  DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 쓰레기 값을 NULL 로 변경하는 쿼리
-- CAST 해주어야 동작함: https://stackoverflow.com/a/37780259
-- 2018-10-20 06:00 데이터 기준 예외는 이거 두개

UPDATE donation_form SET birth_date = NULL WHERE CAST(birth_date AS CHAR(20)) = '0000-00-00 00:00:00';
UPDATE donation_form SET birth_date = NULL WHERE CAST(birth_date AS CHAR(20)) = '1991-00-00 00:00:00';

ALTER TABLE `donation_form`
  ADD COLUMN `event_id` INT UNSIGNED
  DEFAULT NULL AFTER `donation_id`;

ALTER TABLE `donation_form`
  ADD CONSTRAINT `fk_donation_form2`
  FOREIGN KEY (`event_id`)
  REFERENCES `event` (`id`)
  ON DELETE CASCADE;
