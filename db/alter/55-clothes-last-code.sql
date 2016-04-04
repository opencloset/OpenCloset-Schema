DROP TABLE IF EXISTS `clothes_code`;
CREATE TABLE `clothes_code` (
  `category` VARCHAR(32) NOT NULL,
  `code`     CHAR(5)     NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
