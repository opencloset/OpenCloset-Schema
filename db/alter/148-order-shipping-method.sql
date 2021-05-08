ALTER TABLE `order`
  ADD COLUMN `shipping_method` VARCHAR(64) DEFAULT NULL COMMENT 'parcel|quick_service|post_office_parcel'
  AFTER `shipping_misc`;
