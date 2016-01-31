DROP TABLE IF EXISTS `donation_form` ;
CREATE TABLE `donation_form` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`            VARCHAR(32)  DEFAULT NULL,
  `ever_sent`       INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `birth_date`      DATETIME     DEFAULT NULL,
  `gender`          INT(11)      DEFAULT NULL COMMENT '1: male, 2: female',
  `phone`           CHAR(11)     DEFAULT NULL COMMENT 'format: 010xxxxxxxx',
  `email`           VARCHAR(128) DEFAULT NULL,
  `address1`        TEXT         DEFAULT NULL COMMENT 'address',
  `address2`        TEXT         DEFAULT NULL COMMENT 'jibeon address',
  `address3`        TEXT         DEFAULT NULL COMMENT 'extra address',
  `category`        VARCHAR(128) DEFAULT NULL,
  `quantity`        VARCHAR(32)  DEFAULT NULL,
  `terms`           INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `talent_donation` INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `talent`          TEXT         DEFAULT NULL,

  --                                                    접수 | 발송 | 반송 | 완료 | 취소
  `status`          VARCHAR(32)  DEFAULT NULL COMMENT 'accept | sent | return | done | cancel',
  `create_date`     DATETIME     DEFAULT NULL,
  `update_date`     DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
