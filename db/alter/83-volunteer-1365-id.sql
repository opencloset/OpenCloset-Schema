ALTER TABLE `volunteer_work` ADD COLUMN `org_username` VARCHAR(128) DEFAULT NULL COMMENT 'volunteer organization(1365) username' AFTER event_id;
