ALTER TABLE `donation_form` ADD COLUMN `donation_id` INT UNSIGNED DEFAULT NULL AFTER `id`;
ALTER TABLE `donation_form` ADD CONSTRAINT `fk_donation_form1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`) ON DELETE CASCADE;
