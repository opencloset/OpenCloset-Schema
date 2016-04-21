ALTER TABLE `clothes`        MODIFY `cuff` DECIMAL(5, 2) DEFAULT 0.00;
ALTER TABLE `order_size_log` MODIFY `cuff` DECIMAL(5, 2) DEFAULT 0.00;

UPDATE `clothes`        SET `cuff` = NULL WHERE `cuff` = 0.00;
UPDATE `order_size_log` SET `cuff` = NULL WHERE `cuff` = 0.00;
