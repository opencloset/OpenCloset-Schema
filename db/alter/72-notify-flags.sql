ALTER TABLE `user_info`
  ADD COLUMN `email_notify` INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true',
  ADD COLUMN `sms_notify`   INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true';

ALTER TABLE `discard_clothes`
  ADD COLUMN `notify_sent` INT DEFAULT NULL COMMENT 'null and 0 is false, otherwise true' AFTER `comment`;
