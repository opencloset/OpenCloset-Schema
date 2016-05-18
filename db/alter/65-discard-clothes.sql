DROP TABLE IF EXISTS `discard_clothes`;
CREATE TABLE `discard_clothes` (
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clothes_code`  CHAR(5)      NOT NULL,

  `discard_to`    VARCHAR(128) DEFAULT NULL,
  `comment`       TEXT DEFAULT NULL,

  `create_date`   DATETIME DEFAULT NULL,
  `update_date`   DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`clothes_code`),
  CONSTRAINT `fk_discard_clothes1` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
