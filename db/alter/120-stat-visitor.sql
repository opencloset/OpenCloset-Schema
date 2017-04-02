--
-- visitor
--

DROP TABLE IF EXISTS `visitor`;

CREATE TABLE `visitor` (
  `id`               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date`             DATETIME NOT NULL,
  `reserved`         INT DEFAULT 0,
  `reserved_male`    INT DEFAULT 0,
  `reserved_female`  INT DEFAULT 0,
  `visited`          INT DEFAULT 0,
  `visited_male`     INT DEFAULT 0,
  `visited_female`   INT DEFAULT 0,
  `unvisited`        INT DEFAULT 0,
  `unvisited_male`   INT DEFAULT 0,
  `unvisited_female` INT DEFAULT 0,
  `rented`           INT DEFAULT 0,
  `rented_male`      INT DEFAULT 0,
  `rented_female`    INT DEFAULT 0,

  `event`            VARCHAR(32) DEFAULT NULL,

  `create_date`      DATETIME DEFAULT NULL,
  `update_date`      DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
