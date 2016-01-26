DROP TABLE IF EXISTS `suit` ;
CREATE TABLE `suit` (
  `code_top`    CHAR(5) NOT NULL,
  `code_bottom` CHAR(5) NOT NULL,

  PRIMARY KEY (`code_top`),
  UNIQUE KEY  (`code_bottom`),

  CONSTRAINT `fk_suit1` FOREIGN KEY (`code_top`)    REFERENCES `clothes` (`code`) ON DELETE CASCADE,
  CONSTRAINT `fk_suit2` FOREIGN KEY (`code_bottom`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
