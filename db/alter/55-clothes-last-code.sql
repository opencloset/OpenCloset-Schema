DROP TABLE IF EXISTS `clothes_code`;
CREATE TABLE `clothes_code` (
  `category` VARCHAR(32) NOT NULL,
  `code`     CHAR(5)     NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `clothes_code` (`category`, `code`) VALUES
  ("shoes", "0A18F"),
  ("blouse", "0B0T5"),
  ("coat", "0C04U"),
  ("belt", "0E149"),
  ("hat", "0H00O"),
  ("jacket", "0J2JN"),
  ("skirt", "0K12V"),
  ("onepiece", "0O04U"),
  ("pants", "0P1VG"),
  ("shirt", "0S2EX"),
  ("tie", "0T1DA"),
  ("waistcoat", "0W01D");

INSERT INTO `status` (`name`) VALUES
  ("재활용(옷캔)"),
  ("재활용(비백)"),
  ("사용못함");
