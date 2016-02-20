

CREATE TABLE pro_project (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`status` varchar(100) NOT NULL,
	`icon` varchar(200),
	`is_archived` tinyint(1) DEFAULT 0,
	`is_del` tinyint(1) DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pro_tag (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
    `team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`tagname` nvarchar(100),
	`color` varchar(100),
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pro_user (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`user_id` int unsigned NOT NULL,
	`role` varchar(50) NOT NULL,
	`is_owner` tinyint(1) DEFAULT 0,
	`status` varchar(100) NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`user_id`) REFERENCES core_user(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE pro_task (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`content` text,
	`status` varchar(100) NOT NULL,
	`points` int unsigned NOT NULL DEFAULT 0,
	`owner_id` int unsigned DEFAULT NULL,
	`is_archived` tinyint(1) DEFAULT 0,
	`pri` int unsigned DEFAULT 0,
	`end_date`  timestamp,
	`plan_end_date` timestamp,
	`is_del` tinyint(1) DEFAULT 0,
	`sequence` int unsigned,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`owner_id`) REFERENCES core_user(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pro_task_tag (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
    `team_id` int unsigned NOT NULL,
	`task_id` int unsigned NOT NULL,
	`tag_id` int unsigned NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`task_id`) REFERENCES pro_task(`id`),
    FOREIGN KEY (`tag_id`) REFERENCES pro_tag(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE pro_task_check (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`task_id` int unsigned NOT NULL,
	`content` nvarchar(500) NOT NULL,
	`status` varchar(100) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`task_id`) REFERENCES pro_task(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE pro_subject(
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`content` text,
	`status` varchar(100) NOT NULL,
	`is_top` tinyint(1) DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE pro_subject_item (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`owner_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`content` text,
	`status` varchar(100) NOT NULL,
	`is_elite` tinyint(1) DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE pro_doc(
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`project_id` int unsigned NOT NULL,
	`name` nvarchar(100) NOT NULL,
	`content` text,
	`is_del` tinyint(1) DEFAULT 0,
	`sequence` int unsigned,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`project_id`) REFERENCES pro_project(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


