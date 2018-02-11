
--
-- coupon_limit
--

DROP TABLE IF EXISTS `coupon_limit`;

CREATE TABLE `coupon_limit` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `cid`             VARCHAR(64)  NOT NULL,
  `limit`           INT          DEFAULT -1,

  `create_date`     DATETIME     DEFAULT NULL,
  `update_date`     DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `coupon_limit`
  (`cid`, `limit`, `create_date`, `update_date`)
  VALUES
    ( '10bob', 0, NOW(), NOW() )
    , ( 'anyangyouth', 0, NOW(), NOW() )
    , ( 'gwanak', 0, NOW(), NOW() )
    , ( 'hanshin_univ', 0, NOW(), NOW() )
    , ( 'incheonjob', 0, NOW(), NOW() )
    , ( 'linkstart', 0, NOW(), NOW() )
    , ( '해피빈캠페인', 0, NOW(), NOW() )
    , ( 'gunpo201801', 200, NOW(), NOW() )
    ;
