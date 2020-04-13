SET NAMES utf8;
DROP TABLE IF EXISTS `order_tag`;
CREATE TABLE `order_tag` (
  `order_id` INT UNSIGNED NOT NULL,
  `tag_id`   INT UNSIGNED NOT NULL,

  PRIMARY KEY (`order_id`, `tag_id`),
  CONSTRAINT `fk_order_tag1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_tag2` FOREIGN KEY (`tag_id`)   REFERENCES `tag`   (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
