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
