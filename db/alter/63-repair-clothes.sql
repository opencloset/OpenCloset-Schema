DROP TABLE IF EXISTS `repair_clothes` ;
CREATE TABLE `repair_clothes` (
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clothes_code`  CHAR(5)      NOT NULL,

  `alteration_at` VARCHAR(128) DEFAULT NULL,
  `cost`          INT DEFAULT 0,
  `done`          INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true',

  `assign_date`   DATETIME DEFAULT NULL COMMENT '수선맡긴날',
  `pickup_date`   DATETIME DEFAULT NULL COMMENT '수거일',
  `create_date`   DATETIME DEFAULT NULL,
  `update_date`   DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`clothes_code`),
  CONSTRAINT `fk_repair_clothes1` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
