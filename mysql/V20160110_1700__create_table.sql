CREATE TABLE core_role (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`status` varchar(100) NOT NULL DEFAULT 'ACTIVE',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE core_user (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`pass` nvarchar(100) NOT NULL,
	`email` varchar(100) NOT NULL,
	`photo` varchar(200) DEFAULT NULL,	
	`role_id` int unsigned DEFAULT NULL,
	`permission` varchar(100) NOT NULL DEFAULT 'NONE',
	`is_owner` tinyint(1) DEFAULT 0,
	`status` varchar(100) NOT NULL DEFAULT 'ACTIVE',
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE core_user_config (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`user_id` int unsigned NOT NULL,
	`theme` nvarchar(100) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES core_user(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE core_event (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`user_id` int unsigned NOT NULL,
	`title` nvarchar(200) NOT NULL,
	`content` nvarchar(500) DEFAULT NULL,
	`event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`owner_type` varchar(50) DEFAULT NULL,
	`owner_id` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
	FOREIGN KEY (`user_id`) REFERENCES core_user(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE core_invite (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`name` nvarchar(100) DEFAULT NULL,
	`status` varchar(100)  NOT NULL,
	`email` varchar(100) NOT NULL,
	`role_id` int unsigned,
	`content` nvarchar(500),
	`owner_type` varchar(50) DEFAULT NULL,
	`owner_id` int unsigned DEFAULT NULL,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






