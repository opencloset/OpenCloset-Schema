ALTER TABLE `volunteer`
  ADD COLUMN `gender` VARCHAR(32)  DEFAULT NULL
  AFTER `name`;

ALTER TABLE `volunteer_work`
  ADD COLUMN `job` VARCHAR(32)  DEFAULT NULL
  AFTER `path`;

ALTER TABLE `volunteer_guestbook`
  DROP COLUMN `gender`,
  DROP COLUMN `job`;
