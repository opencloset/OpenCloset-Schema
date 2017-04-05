SET NAMES utf8;

DROP DATABASE `opencloset`;
CREATE DATABASE `opencloset`;
USE `opencloset`;

--
-- user
--

CREATE TABLE `user` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `name`        VARCHAR(32)  NOT NULL, -- realname
  `email`       VARCHAR(128) DEFAULT NULL,
  `password`    CHAR(50)     DEFAULT NULL COMMENT 'first 40 length for digest, after 10 length for salt(random)',
  `authcode`    VARCHAR(32)  DEFAULT NULL,
  `expires`     INT(11)      DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`,`name`,`email`)
  VALUES
    (1, '열린옷장','opencloset@opencloset.net'),
    (2, '열린옷장01','staff01@opencloset.net'),
    (3, '열린옷장02','staff02@opencloset.net'),
    (4, '열린옷장03','staff03@opencloset.net'),
    (5, '열린옷장04','staff04@opencloset.net'),
    (6, '열린옷장05','staff05@opencloset.net'),
    (7, '열린옷장06','staff06@opencloset.net'),
    (8, '열린옷장07','staff07@opencloset.net'),
    (9, '열린옷장08','staff08@opencloset.net'),
    (10,'열린옷장09','staff09@opencloset.net')
    ;

--
-- user_info
--

CREATE TABLE `user_info` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`     INT UNSIGNED NOT NULL,

  --
  -- general
  --
  `phone`       VARCHAR(16)  DEFAULT NULL COMMENT 'regex: 01\d{8,9}',
  `address1`    VARCHAR(32)  DEFAULT NULL COMMENT 'dbid',
  `address2`    VARCHAR(256) DEFAULT NULL COMMENT '도로명주소',
  `address3`    VARCHAR(256) DEFAULT NULL COMMENT '구(old)주소',
  `address4`    VARCHAR(256) DEFAULT NULL COMMENT '상세주소',
  `gender`      VARCHAR(6)   DEFAULT NULL COMMENT 'male/female',
  `birth`       INT          DEFAULT NULL,
  `comment`     TEXT         DEFAULT NULL,

  --
  -- for rental
  --
  `height`      INT DEFAULT NULL, -- 키(cm)
  `weight`      INT DEFAULT NULL, -- 몸무게(kg)
  `neck`        INT DEFAULT NULL, -- 목     둘레(cm)
  `bust`        INT DEFAULT NULL, -- 가슴   둘레(cm)
  `waist`       INT DEFAULT NULL, -- 허리   둘레(cm)
  `hip`         INT DEFAULT NULL, -- 엉덩이 둘레(cm)
  `topbelly`    INT DEFAULT NULL, -- 윗배   둘레(cm)
  `belly`       INT DEFAULT NULL, -- 배꼽   둘레(cm)
  `thigh`       INT DEFAULT NULL, -- 허벅지 둘레(cm)
  `arm`         INT DEFAULT NULL, -- 팔     길이(cm)
  `leg`         INT DEFAULT NULL, -- 다리   길이(cm)
  `knee`        INT DEFAULT NULL, -- 무릎   길이(cm)
  `foot`        INT DEFAULT NULL, -- 발     크기(mm)
  `pants`       INT DEFAULT NULL, -- 바지   길이(cm)
  `skirt`       INT DEFAULT NULL, -- 스커트 둘레(cm)

  --
  -- etc
  --
  `staff`        BOOLEAN DEFAULT 0,
  `wearon_date`  DATETIME DEFAULT NULL,
  `purpose`      VARCHAR(128) DEFAULT NULL,
  `purpose2`     TEXT DEFAULT NULL,
  `pre_category` VARCHAR(128) DEFAULT NULL,
  `pre_color`    VARCHAR(32)  DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`user_id`),
  UNIQUE KEY (`phone`),
  CONSTRAINT `fk_user_info1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT
  INTO `user_info` ( `id`, `user_id`, `phone`, `address4`, `gender`, `birth`, `comment`, `staff` )
  VALUES
    (  1,  1, '07075837521', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, 2012, '열린옷장', 1 ),
    (  2,  2, '99999889991', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 01', 1 ),
    (  3,  3, '99999889992', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 02', 1 ),
    (  4,  4, '99999889993', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 03', 1 ),
    (  5,  5, '99999889994', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 04', 1 ),
    (  6,  6, '99999889995', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 05', 1 ),
    (  7,  7, '99999889996', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 06', 1 ),
    (  8,  8, '99999889997', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 07', 1 ),
    (  9,  9, '99999889998', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 08', 1 ),
    ( 10, 10, '99999889999', '서울특별시 광진구 화양동 48-3 웅진빌딩 403호', NULL, NULL, '열린옷장 스태프 09', 1 )
    ;

--
-- status
--

CREATE TABLE `status` (
  `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR (64) NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status` (`id`, `name`)
  VALUES
    (1,  '대여가능'),
    (2,  '대여중'),
    (3,  '대여불가'),
    (4,  '예약'),
    (5,  '세탁'),
    (6,  '수선'),
    (7,  '분실'),
    (8,  '폐기'),
    (9,  '반납'),
    (10, '부분반납'),
    (11, '반납배송중'),
    (12, '방문안함'),
    (13, '방문'),
    (14, '방문예약'),
    (15, '배송예약'),
    (16, '치수측정'),
    (17, '의류준비'),
    (18, '포장'),
    (19, '결제대기'),
    (20, '탈의01'),
    (21, '탈의02'),
    (22, '탈의03'),
    (23, '탈의04'),
    (24, '탈의05'),
    (25, '탈의06'),
    (26, '탈의07'),
    (27, '탈의08'),
    (28, '탈의09'),
    (29, '탈의10'),
    (30, '탈의11'),
    (31, '탈의12'),
    (32, '탈의13'),
    (33, '탈의14'),
    (34, '탈의15'),
    (35, '탈의16'),
    (36, '탈의17'),
    (37, '탈의18'),
    (38, '탈의19'),
    (39, '탈의20'),
    (40, '대여안함'),
    (41, '포장취소'),
    (42, '환불'),
    (43, '사이즈없음'),
    (44, '포장완료')
    (45, '재활용(옷캔)'),
    (46, '재활용(비백)'),
    (47, '사용못함'),
    (48, '의류선택'),
    (49, '주소선택'),
    (50, '결제완료'),
    (51, '입금확인'),
    (52, '발송대기'),
    (53, '배송중'),
    (54, '배송완료'),
    (55, '반송신청'),
    (56, '입금대기')
    ;

--
-- group
--

CREATE TABLE `group` (
  `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `group` (`id`) VALUES (1);

--
-- donation
--

CREATE TABLE `donation` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`     INT UNSIGNED NOT NULL,

  `message`     TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_donation1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `donation` (`id`,`user_id`,`message`,`create_date`) VALUES (1,1,'초기 생성용 기본 기증 정보',NOW());

--
-- clothes
--

CREATE TABLE `clothes` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `donation_id` INT UNSIGNED DEFAULT 1,
  `status_id`   INT UNSIGNED DEFAULT 1,
  `group_id`    INT UNSIGNED DEFAULT 1,

  `code`        CHAR(5)     NOT NULL,  -- 바코드 품번
  `neck`        INT         DEFAULT 0, -- 목     둘레(cm)
  `bust`        INT         DEFAULT 0, -- 가슴   둘레(cm)
  `waist`       INT         DEFAULT 0, -- 허리   둘레(cm)
  `hip`         INT         DEFAULT 0, -- 엉덩이 둘레(cm)
  `topbelly`    INT         DEFAULT 0, -- 윗배   둘레(cm)
  `belly`       INT         DEFAULT 0, -- 배꼽   둘레(cm)
  `arm`         INT         DEFAULT 0, -- 팔     길이(cm)
  `thigh`       INT         DEFAULT 0, -- 허벅지 둘레(cm)
  `length`      INT         DEFAULT 0, -- 기장(cm) 또는 발 크기(mm)
  `cuff`       DECIMAL(5,2) DEFAULT 0.00, -- 밑단둘레(cm) 또는 소매둘레(mm)
  `color`       VARCHAR(32) DEFAULT NULL,
  `gender`      VARCHAR(6)  DEFAULT NULL COMMENT 'male/female/unisex',
  `category`    VARCHAR(32) NOT NULL,  -- 종류
  `price`       INT DEFAULT 0,         -- 대여 가격
  `comment`     TEXT        DEFAULT NULL,

  `compatible_code` VARCHAR(32) DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`code`),
  INDEX (`bust`),
  INDEX (`waist`),
  INDEX (`hip`),
  INDEX (`topbelly`),
  INDEX (`belly`),
  INDEX (`arm`),
  INDEX (`thigh`),
  INDEX (`length`),
  INDEX (`cuff`),
  INDEX (`category`),
  CONSTRAINT `fk_clothes1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_clothes2` FOREIGN KEY (`status_id`)   REFERENCES `status`   (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_clothes3` FOREIGN KEY (`group_id`)    REFERENCES `group`    (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- tag
--

CREATE TABLE `tag` (
  `id`    INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`  CHAR(128)    NOT NULL,
  `label` CHAR(128)    NOT NULL,
  `desc`  TEXT         DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT
  INTO `tag` (`id`,`name`)
  VALUES
    (1,'봄'),
    (2,'여름'),
    (3,'가을'),
    (4,'겨울'),
    (5,'솔리드'),
    (6,'체크'),
    (7,'스트라이프'),
    (8,'도트'),
    (9,'패턴')
    ;

--
-- clothes_tag
--

CREATE TABLE `clothes_tag` (
  `clothes_code` CHAR(5)      NOT NULL,
  `tag_id`       INT UNSIGNED NOT NULL,

  PRIMARY KEY (`clothes_code`, `tag_id`),
  CONSTRAINT `fk_clothes_tag1` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE,
  CONSTRAINT `fk_clothes_tag2` FOREIGN KEY (`tag_id`)       REFERENCES `tag`     (`id`)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- satisfaction
--

CREATE TABLE `satisfaction` (
  -- 1: 매우작음, 2: 매우큼, 3: 작음, 4: 큼, 5: 맞음
  -- 높을 수록 좋은거(작은거 보단 큰게 낫다 by aanoaa)
  -- 쟈켓만 해당함

  `user_id`      INT UNSIGNED NOT NULL,
  `clothes_code` CHAR(5)      NOT NULL,
  `bust`         INT DEFAULT NULL,
  `waist`        INT DEFAULT NULL,
  `arm`          INT DEFAULT NULL,
  `top_fit`      INT DEFAULT NULL,
  `bottom_fit`   INT DEFAULT NULL,
  `create_date`  DATETIME DEFAULT NULL,

  PRIMARY KEY (`user_id`, `clothes_code`),
  CONSTRAINT `fk_satisfaction1` FOREIGN KEY (`user_id`)      REFERENCES `user`    (`id`)   ON DELETE CASCADE,
  CONSTRAINT `fk_satisfaction2` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- booking
--

CREATE TABLE `booking` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `date`        DATETIME     NOT NULL,
  `gender`      VARCHAR(6)   NOT NULL COMMENT 'male/female',
  `slot`        INT UNSIGNED NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY ( `date`, `gender` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- coupon
--

CREATE TABLE `coupon` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `code`            VARCHAR(32)  NOT NULL,
  `type`            VARCHAR(32)  DEFAULT 'default' COMMENT 'default|suit',
      -- default: `price` 가격으로 제공되는 쿠폰
      -- suit:    suit 한벌을 빌릴 수 있는 쿠폰

  `status`          VARCHAR(32)  DEFAULT NULL COMMENT 'provided|used|discarded',
      -- provided:  지급됨
      -- used:      사용됨
      -- discarded: 폐기됨

  `desc`            TEXT         DEFAULT NULL,
  `price`           INT          DEFAULT 0,

  `create_date`     DATETIME     DEFAULT NULL,
  `update_date`     DATETIME     DEFAULT NULL,
  `expires_date`    DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- order
--

CREATE TABLE `order` (
  `id`                    INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`               INT UNSIGNED NOT NULL,
  `status_id`             INT UNSIGNED DEFAULT NULL,
  `staff_id`              INT UNSIGNED DEFAULT NULL,
  `parent_id`             INT UNSIGNED DEFAULT NULL,
  `booking_id`            INT UNSIGNED DEFAULT NULL,
  `coupon_id`             INT UNSIGNED DEFAULT NULL,
  `user_address_id`       INT UNSIGNED DEFAULT NULL,
  `online`                INT DEFAULT 0 COMMENT '0 is offline, otherwise online',

  `additional_day`        INT UNSIGNED DEFAULT 0,
  `rental_date`           DATETIME DEFAULT NULL,
  `wearon_date`           DATETIME DEFAULT NULL,
  `target_date`           DATETIME DEFAULT NULL,
  `user_target_date`      DATETIME DEFAULT NULL,
  `return_date`           DATETIME DEFAULT NULL,
  `return_method`         VARCHAR(32) DEFAULT NULL,
  `return_memo`           TEXT DEFAULT NULL,
  `price_pay_with`        VARCHAR(32) DEFAULT NULL,
  `late_fee_pay_with`     VARCHAR(32) DEFAULT NULL,
  `compensation_pay_with` VARCHAR(32) DEFAULT NULL,
  `pass`                  INT         DEFAULT NULL COMMENT 'a flag represent get pass or not. null or 0 is false, otherwise true',
  `desc`                  TEXT DEFAULT NULL,
  `message`               TEXT DEFAULT NULL,
  `misc`                  TEXT DEFAULT NULL,
  `shipping_misc`         TEXT DEFAULT NULL,

  -- guest info
  `purpose`               VARCHAR(128) DEFAULT NULL,
  `purpose2`              TEXT DEFAULT NULL,
  `pre_category`          VARCHAR(128) DEFAULT NULL,
  `pre_color`             VARCHAR(32)  DEFAULT NULL,
  `height`                INT DEFAULT NULL, -- 키(cm)
  `weight`                INT DEFAULT NULL, -- 몸무게(kg)
  `neck`                  INT DEFAULT NULL, -- 목     둘레(cm)
  `bust`                  INT DEFAULT NULL, -- 가슴   둘레(cm)
  `waist`                 INT DEFAULT NULL, -- 허리   둘레(cm)
  `hip`                   INT DEFAULT NULL, -- 엉덩이 둘레(cm)
  `topbelly`              INT DEFAULT NULL, -- 윗배   둘레(cm)
  `belly`                 INT DEFAULT NULL, -- 배꼽   둘레(cm)
  `thigh`                 INT DEFAULT NULL, -- 허벅지 둘레(cm)
  `arm`                   INT DEFAULT NULL, -- 팔     길이(cm)
  `leg`                   INT DEFAULT NULL, -- 다리   길이(cm)
  `knee`                  INT DEFAULT NULL, -- 무릎   길이(cm)
  `foot`                  INT DEFAULT NULL, -- 발     크기(mm)
  `pants`                 INT DEFAULT NULL, -- 바지   길이(cm)
  `skirt`                 INT DEFAULT NULL, -- 스커트 둘레(cm)
  `bestfit`               BOOLEAN DEFAULT 0,
  `ignore`                INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true',
  `ignore_sms`            INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true',

  `create_date`           DATETIME DEFAULT NULL,
  `update_date`           DATETIME DEFAULT NULL,

  `does_wear`             INT DEFAULT NULL COMMENT 'null and 0 are false, otherwise true',

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order1` FOREIGN KEY (`user_id`)         REFERENCES `user`         (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order2` FOREIGN KEY (`status_id`)       REFERENCES `status`       (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order3` FOREIGN KEY (`staff_id`)        REFERENCES `user`         (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order4` FOREIGN KEY (`parent_id`)       REFERENCES `order`        (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order5` FOREIGN KEY (`booking_id`)      REFERENCES `booking`      (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order6` FOREIGN KEY (`coupon_id`)       REFERENCES `coupon`       (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order7` FOREIGN KEY (`user_address_id`) REFERENCES `user_address` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- order_detail
--

CREATE TABLE `order_detail` (
  `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`     INT UNSIGNED NOT NULL,
  `clothes_code` CHAR(5)      DEFAULT NULL,
  `status_id`    INT UNSIGNED DEFAULT NULL,

  `name`         TEXT         NOT NULL,
  `price`        INT          DEFAULT 0,
  `final_price`  INT          DEFAULT 0,
  `stage`        INT          DEFAULT 0,
  `desc`         TEXT         DEFAULT NULL,
  `pay_with`     VARCHAR(32)  DEFAULT NULL,
  `create_date`  DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_detail1` FOREIGN KEY (`order_id`)     REFERENCES `order`   (`id`)   ON DELETE CASCADE,
  CONSTRAINT `fk_order_detail2` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_detail3` FOREIGN KEY (`status_id`)    REFERENCES `status`  (`id`)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- sms
--

CREATE TABLE `sms` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,

  `from`        VARCHAR(12)  NOT NULL,
  `to`          VARCHAR(12)  NOT NULL,
  `text`        TEXT         NOT NULL,

  `ret`         INT          DEFAULT NULL,
  `status`      VARCHAR(7)   DEFAULT 'pending',
  `method`      VARCHAR(128) DEFAULT NULL,
  `detail`      TEXT         DEFAULT NULL,
  `sent_date`   DATETIME     DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  INDEX (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- order_status_log
--

CREATE TABLE `order_status_log` (
  `order_id`  INT(10) UNSIGNED NOT NULL,
  `status_id` INT(10) UNSIGNED NOT NULL,
  `timestamp` DATETIME         NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS `tracking_order_insert`;
DROP TRIGGER IF EXISTS `tracking_order_update`;

DELIMITER $$

CREATE TRIGGER `tracking_order_update` AFTER UPDATE on `order`
FOR EACH ROW
BEGIN
    IF (NEW.id = OLD.id AND NEW.status_id != OLD.status_id ) THEN
        INSERT INTO `order_status_log`
            (`order_id` , `status_id` , `timestamp`)
        VALUES
            (NEW.id, NEW.status_id, NOW());
    END IF;
END$$

CREATE TRIGGER `tracking_order_insert` AFTER INSERT on `order`
FOR EACH ROW
BEGIN
    INSERT INTO `order_status_log`
        (`order_id` , `status_id` , `timestamp`)
    VALUES
        (NEW.id, NEW.status_id, NOW());
END$$

DELIMITER ;

ALTER TABLE `order_status_log` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `order_status_log` ADD FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- volunteer
--

CREATE TABLE `volunteer` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`               VARCHAR(32)  NOT NULL,
  `gender`             VARCHAR(32)  DEFAULT NULL,
  `email`              VARCHAR(128) DEFAULT NULL,
  `phone`              VARCHAR(16)  DEFAULT NULL COMMENT 'regex: 01\d{8,9}',
  `address`            TEXT         DEFAULT NULL,
  `birth_date`         DATETIME     DEFAULT NULL,
  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`email`),
  UNIQUE  KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- volunteer_work
--

CREATE TABLE `volunteer_work` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `volunteer_id`       INT UNSIGNED NOT NULL,

  `activity_from_date` DATETIME     NOT NULL,
  `activity_to_date`   DATETIME     NOT NULL,
  `period`             VARCHAR(32)  DEFAULT NULL,
  `reason`             TEXT         DEFAULT NULL,
  `path`               TEXT         DEFAULT NULL,
  `job`                VARCHAR(32)  DEFAULT NULL,
  `activity`           TEXT         DEFAULT NULL,
  `comment`            TEXT         DEFAULT NULL,

  `status`             VARCHAR(32)  DEFAULT 'reported' COMMENT 'reported | approved | done | canceled',
  `authcode`           VARCHAR(32)  DEFAULT NULL,
  `need_1365`          INT          DEFAULT 0,
  `done_1365`          INT          DEFAULT 0,
  `talent`             TEXT         DEFAULT NULL,
  `event_id`           VARCHAR(32)  DEFAULT NULL,
  `org_username`       VARCHAR(128) DEFAULT NULL COMMENT 'volunteer organization(1365) username',
  `org_region`         VARCHAR(128) DEFAULT NULL,

  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_volunteer_work1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- volunteer_guestbook
--

CREATE TABLE `volunteer_guestbook` (
  `id`                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `volunteer_work_id`  INT UNSIGNED NOT NULL,

  `name`               VARCHAR(32)  DEFAULT NULL,
  `age_group`          VARCHAR(32)  DEFAULT NULL,
  `impression`         VARCHAR(32)  DEFAULT NULL,
  `activity_hour`      VARCHAR(32)  DEFAULT NULL,
  `activity`           TEXT         DEFAULT NULL,
  `want_to_do`         TEXT         DEFAULT NULL,
  `comment`            TEXT         DEFAULT NULL,

  `create_date`        DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_volunteer_guestbook1` FOREIGN KEY (`volunteer_work_id`) REFERENCES `volunteer_work` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- suit
--

CREATE TABLE `suit` (
  `code_top`    CHAR(5) NOT NULL,
  `code_bottom` CHAR(5) NOT NULL,

  PRIMARY KEY (`code_top`),
  UNIQUE KEY  (`code_bottom`),

  CONSTRAINT `fk_suit1` FOREIGN KEY (`code_top`)    REFERENCES `clothes` (`code`) ON DELETE CASCADE,
  CONSTRAINT `fk_suit2` FOREIGN KEY (`code_bottom`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- donation_form
--

CREATE TABLE `donation_form` (
  `id`              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `donation_id`     INT UNSIGNED DEFAULT NULL,
  `name`            VARCHAR(32)  DEFAULT NULL,
  `ever_donate`     INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `ever_use`        INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `birth_date`      DATETIME     DEFAULT NULL,
  `gender`          INT(11)      DEFAULT NULL COMMENT '1: male, 2: female',
  `phone`           CHAR(11)     DEFAULT NULL COMMENT 'format: 010xxxxxxxx',
  `email`           VARCHAR(128) DEFAULT NULL,
  `address`         TEXT         DEFAULT NULL,
  `category`        VARCHAR(128) DEFAULT NULL,
  `quantity`        VARCHAR(32)  DEFAULT NULL,
  `terms`           INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `talent_donation` INT(11)      DEFAULT NULL COMMENT '0 is false, otherwise true',
  `talent`          TEXT         DEFAULT NULL,

  --                                                   접수     | 발송대기 | 배송중     | 발송완료  | 반송신청   | 반송완료 | 취소
  `status`          VARCHAR(32)  DEFAULT NULL COMMENT 'accepted | waiting | delivering | delivered | returning | returned | cancel',
  `parcel_service`  VARCHAR(32)  DEFAULT NULL,
  `waybill`         VARCHAR(128) DEFAULT NULL,
  `return_waybill`  VARCHAR(128) DEFAULT NULL,
  `sms_bitmask`     INT(11)      DEFAULT 0    COMMENT 'flag to show each sms sent or not',
  `comment`         TEXT         DEFAULT NULL,

  `create_date`     DATETIME     DEFAULT NULL,
  `return_date`     DATETIME     DEFAULT NULL,
  `update_date`     DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_donation_form1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- order_size_log
--

DROP TABLE IF EXISTS `order_size_log`;

CREATE TABLE `order_size_log` (
  `order_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `clothes_code` CHAR(5) NOT NULL DEFAULT '',
  `timestamp` DATETIME NOT NULL,
  `category` VARCHAR(32) NOT NULL,
  `color` VARCHAR(32) DEFAULT NULL,
  `gender` VARCHAR(6) DEFAULT NULL COMMENT 'male/female/unisex',
  `neck` INT(11) DEFAULT '0',
  `bust` INT(11) DEFAULT '0',
  `waist` INT(11) DEFAULT '0',
  `hip` INT(11) DEFAULT '0',
  `topbelly` INT(11) DEFAULT '0',
  `belly` INT(11) DEFAULT '0',
  `arm` INT(11) DEFAULT '0',
  `thigh` INT(11) DEFAULT '0',
  `length` INT(11) DEFAULT '0',
  `price` INT(11) DEFAULT '0',
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS `tracking_order_clothes_size_insert`;

DELIMITER $$

CREATE TRIGGER `tracking_order_clothes_size_insert` AFTER INSERT ON `order_detail` FOR EACH ROW
INSERT INTO `order_size_log`
(
    SELECT
            a.order_id
            ,c.id
            ,a.clothes_code
            ,now()
            ,b.category
            ,b.color
            ,b.gender
            ,b.neck
            ,b.bust
            ,b.waist
            ,b.hip
            ,b.topbelly
            ,b.belly
            ,b.arm
            ,b.thigh
            ,b.length
            ,b.price
    FROM `order_detail` AS a
      INNER JOIN `clothes` AS b ON a.`clothes_code` = b.`code`
      INNER JOIN `order`   AS c ON a.`order_id` = c.`id`
    WHERE a.order_id = NEW.order_id AND a.clothes_code = NEW.clothes_code
    LIMIT 1
) $$

DELIMITER ;

--
-- clothes_code
--

DROP TABLE IF EXISTS `clothes_code`;

CREATE TABLE `clothes_code` (
  `category` VARCHAR(32) NOT NULL,
  `code`     CHAR(5)     NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- repair_clothes
--

DROP TABLE IF EXISTS `repair_clothes` ;
CREATE TABLE `repair_clothes` (
  `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clothes_code`  CHAR(5)      NOT NULL,

  `alteration_at` VARCHAR(128) DEFAULT NULL,
  `cost`          INT DEFAULT 0,
  `done`          INT DEFAULT NULL COMMENT '1: 치수변경, 2: 수선완료',
  `comment`       TEXT DEFAULT NULL,

  `assign_date`   DATETIME DEFAULT NULL COMMENT '수선맡긴날',
  `pickup_date`   DATETIME DEFAULT NULL COMMENT '수거일',
  `create_date`   DATETIME DEFAULT NULL,
  `update_date`   DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`clothes_code`),
  CONSTRAINT `fk_repair_clothes1` FOREIGN KEY (`clothes_code`) REFERENCES `clothes` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- discard_clothes
--

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

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id`       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`  INT UNSIGNED NOT NULL,
  `name`     VARCHAR(32)  NOT NULL,
  `phone`    VARCHAR(16)  NOT NULL,
  `address1` VARCHAR(32)  DEFAULT NULL COMMENT 'dbid',
  `address2` VARCHAR(256) DEFAULT NULL COMMENT '도로명주소',
  `address3` VARCHAR(256) DEFAULT NULL COMMENT '지번주소',
  `address4` VARCHAR(256) DEFAULT NULL COMMENT '상세주소',

  `create_date` DATETIME DEFAULT NULL,
  `update_date` DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_address1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_parcel` ;
CREATE TABLE `order_parcel` (
  `id`             INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`       INT UNSIGNED NOT NULL,
  `status_id`      INT UNSIGNED NOT NULL,
  `parcel_service` VARCHAR(32)  DEFAULT NULL,
  `waybill`        VARCHAR(128) DEFAULT NULL,
  `return_waybill` VARCHAR(128) DEFAULT NULL,
  `sms_bitmask`    INT          DEFAULT 0 COMMENT 'flag to show each sms sent or not',
  `comment`        TEXT         DEFAULT NULL,

  `create_date`         DATETIME DEFAULT NULL,
  `update_date`         DATETIME DEFAULT NULL,
  `sent_date`           DATETIME DEFAULT NULL COMMENT '택배보낸날짜',
  `arrival_date`        DATETIME DEFAULT NULL COMMENT '택배받은날짜',
  `return_sent_date`    DATETIME DEFAULT NULL COMMENT '반송보낸날짜',
  `return_arrival_date` DATETIME DEFAULT NULL COMMENT '반송받은날짜',

  PRIMARY KEY (`id`),
  UNIQUE KEY (`order_id`),
  CONSTRAINT `fk_order_parcel1` FOREIGN KEY (`order_id`)  REFERENCES `order`  (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_parcel2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- sale / order_sale
--

DROP TABLE IF EXISTS `order_sale`;
DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        CHAR(32)     NOT NULL,
  `desc`        TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE  KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sale` (`name`, `desc`) VALUES
  ("3times", "3회 이상 대여 할인");

CREATE TABLE `order_sale` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`    INT UNSIGNED NOT NULL,
  `sale_id`     INT UNSIGNED NOT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_sale1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_sale2` FOREIGN KEY (`sale_id`)  REFERENCES `sale`  (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- sms_macro
--

DROP TABLE IF EXISTS `sms_macro`;

CREATE TABLE `sms_macro` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(32)  NOT NULL,
  `from`        VARCHAR(12)  NOT NULL,
  `text`        TEXT         DEFAULT NULL,
  `enabled`     INT          DEFAULT 1 COMMENT '0 is disabled',
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- payment & payment_log
--

DROP TABLE IF EXISTS `payment_log` ;
DROP TABLE IF EXISTS `payment` ;

CREATE TABLE `payment` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id`    INT UNSIGNED NOT NULL,
  `sid`         VARCHAR(32)  DEFAULT NULL COMMENT 'server id: imp_uid',
  `cid`         VARCHAR(128) DEFAULT NULL COMMENT 'client id: merchant_uid',
  `amount`      INT          DEFAULT 0,
  `vendor`      VARCHAR(32)  DEFAULT NULL,
  `pay_method`  VARCHAR(32)  DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,
  `update_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  UNIQUE (`sid`),
  UNIQUE (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `payment_log` (
  `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_id`  INT UNSIGNED NOT NULL,
  `status`      VARCHAR(32)  DEFAULT NULL COMMENT 'paid|ready|cancelled|failed',
  `detail`      TEXT         DEFAULT NULL,
  `create_date` DATETIME     DEFAULT NULL,

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_payment_log1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- visitor
--

DROP TABLE IF EXISTS `visitor`;

CREATE TABLE `visitor` (
  `id`               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date`             DATE NOT NULL,
  `online`           INT DEFAULT 0 COMMENT 'null and 0 are false, otherwise true',

  `reserved`         INT DEFAULT 0,
  `reserved_male`    INT DEFAULT 0,
  `reserved_female`  INT DEFAULT 0,

  `visited`          INT DEFAULT 0,
  `visited_male`     INT DEFAULT 0,
  `visited_female`   INT DEFAULT 0,
  `visited_age_10`   INT DEFAULT 0,
  `visited_age_20`   INT DEFAULT 0,
  `visited_age_30`   INT DEFAULT 0,

  `unvisited`        INT DEFAULT 0,
  `unvisited_male`   INT DEFAULT 0,
  `unvisited_female` INT DEFAULT 0,
  `unvisited_age_10` INT DEFAULT 0,
  `unvisited_age_20` INT DEFAULT 0,
  `unvisited_age_30` INT DEFAULT 0,

  `rented`           INT DEFAULT 0,
  `rented_male`      INT DEFAULT 0,
  `rented_female`    INT DEFAULT 0,

  `bestfit`          INT DEFAULT 0,
  `bestfit_male`     INT DEFAULT 0,
  `bestfit_female`   INT DEFAULT 0,

  `event`            VARCHAR(32) DEFAULT NULL,

  `create_date`      DATETIME DEFAULT NULL,
  `update_date`      DATETIME DEFAULT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
