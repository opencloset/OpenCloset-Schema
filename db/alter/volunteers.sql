SET NAMES utf8;

DROP TABLE IF EXISTS `volunteer_guestbook`;
DROP TABLE IF EXISTS `volunteer_work`;
DROP TABLE IF EXISTS `volunteer`;

CREATE TABLE `volunteer` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`               VARCHAR(32)  NOT NULL,
  `email`              VARCHAR(128) DEFAULT NULL,
  `phone`              VARCHAR(16)  DEFAULT NULL COMMENT 'regex: 01\d{8,9}',
  `address`            TEXT         DEFAULT NULL,
  `birth_date`         DATETIME     DEFAULT NULL,
  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`email`),
  UNIQUE  KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `volunteer_work` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `volunteer_id`       INT UNSIGNED NOT NULL,

  `activity_from_date` DATETIME     NOT NULL,
  `activity_to_date`   DATETIME     NOT NULL,
  `period`             VARCHAR(32)  DEFAULT NULL,
  `reason`             TEXT         DEFAULT NULL,
  `path`               TEXT         DEFAULT NULL,
  `activity`           TEXT         DEFAULT NULL,
  `comment`            TEXT         DEFAULT NULL,

  `status`             VARCHAR(32)  DEFAULT 'reported' COMMENT 'reported | approved | done | canceled',
  `authcode`           VARCHAR(32)  DEFAULT NULL,
  `need_1365`          INT          DEFAULT 0,
  `done_1365`          INT          DEFAULT 0,
  `talent`             TEXT         DEFAULT NULL,

  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_volunteer_work1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `volunteer_guestbook` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `volunteer_work_id`  INT UNSIGNED NOT NULL,

  `name`               VARCHAR(32)  DEFAULT NULL,
  `age_group`          VARCHAR(32)  DEFAULT NULL,
  `gender`             VARCHAR(32)  DEFAULT NULL,
  `job`                VARCHAR(32)  DEFAULT NULL,
  `impression`         VARCHAR(32)  DEFAULT NULL,
  `activity_hour`      VARCHAR(32)  DEFAULT NULL,
  `activity`           TEXT         DEFAULT NULL,
  `want_to_do`         TEXT         DEFAULT NULL,
  `comment`            TEXT         DEFAULT NULL,

  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_volunteer_guestbook1` FOREIGN KEY (`volunteer_work_id`) REFERENCES `volunteer_work` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
