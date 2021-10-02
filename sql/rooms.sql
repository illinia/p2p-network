CREATE TABLE IF NOT EXISTS `rooms` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `owner_id` BIGINT UNSIGNED NOT NULL,
    `title` VARCHAR(255) DEFAULT NULL,
    `description` TEXT DEFAULT NULL,
    `event_code` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) DEFAULT NULL,
    `create_tx_hash` VARCHAR(255) DEFAULT NULL,
    `is_private` TINYINT(1) DEFAULT 0,
    `wei_balance` BIGINT UNSIGNED DEFAULT 0,
    `wei_prize` BIGINT UNSIGNED DEFAULT 0,
    `start_time` DATETIME DEFAULT NULL,
    `end_time` DATETIME DEFAULT NULL,
    `active` TINYINT(1) DEFAULT 1,
    `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `event_code_UNIQUE` (`event_code` ASC),
    CONSTRAINT `fk_rooms_users`
		FOREIGN KEY(`owner_id`)
        REFERENCES `users` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT='master table of rooms';