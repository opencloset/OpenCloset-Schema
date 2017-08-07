ALTER TABLE `order` ADD COLUMN `agent` INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true' AFTER does_wear;

DROP TABLE IF EXISTS `order_agent`;
CREATE TABLE `order_agent` (
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`      INT UNSIGNED NOT NULL,

  `label`         VARCHAR(128) DEFAULT NULL,
  `gender`        VARCHAR(6)   DEFAULT NULL COMMENT 'male/female',

  `pre_category`  VARCHAR(128) DEFAULT NULL,

  `height`        INT DEFAULT NULL,
  `weight`        INT DEFAULT NULL,
  `neck`          INT DEFAULT NULL,
  `bust`          INT DEFAULT NULL,
  `waist`         INT DEFAULT NULL,
  `hip`           INT DEFAULT NULL,
  `topbelly`      INT DEFAULT NULL,
  `belly`         INT DEFAULT NULL,
  `thigh`         INT DEFAULT NULL,
  `arm`           INT DEFAULT NULL,
  `leg`           INT DEFAULT NULL,
  `knee`          INT DEFAULT NULL,
  `foot`          INT DEFAULT NULL,
  `pants`         INT DEFAULT NULL,
  `skirt`         INT DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_agent1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
