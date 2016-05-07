
CREATE TABLE wf_Instance (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`user_id` int unsigned NOT NULL,
	`form_id` int unsigned NOT NULL,
	`form_name` int unsigned NOT NULL,
	`title` nvarchar(200) NOT NULL,
	`flow_data` text,
	`status` varchar(100) NOT NULL,
	`is_archived` tinyint(1) DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES core_user(`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE wf_Instance_item (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`instance_id` int unsigned NOT NULL,
	`task_id` varchar(100) NOT NULL,
	`user_id` int unsigned NOT NULL,
	`status` varchar(100) NOT NULL,
	`content` text,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES core_user(`id`),
	FOREIGN KEY (`instance_id`) REFERENCES wf_Instance(`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE fm_template (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100),
	`fields` text,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE fm_team_template (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`name` varchar(100) NOT NULL,
	`fields` text,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE wf_template (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
	`team_id` int unsigned NOT NULL,
	`user_id` int unsigned NOT NULL,
	`team_template_id` int unsigned NOT NULL,
	`data` text,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES core_user(`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE fm_form (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
    `team_id` int unsigned NOT NULL,
	`team_template_id` int unsigned NOT NULL,
	`fields` text,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
	FOREIGN KEY (`team_template_id`) REFERENCES fm_team_template(`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE fm_form_parameters (
	`id` int unsigned NOT NULL AUTO_INCREMENT,
    `team_id` int unsigned NOT NULL,
	`form_id` int unsigned NOT NULL,
	`uid` varchar(200),
	`name` varchar(200),
	`field_type` varchar(100),
	`string_value` varchar(500) DEFAULT NULL,
	`int_value` int DEFAULT NULL,
	`date_value` timestamp,
	`text_value` text,
	`bool_value` tinyint(1) DEFAULT 0,
	`double_value` decimal(10,2) DEFAULT NULL,
	`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` int unsigned DEFAULT NULL,
    `updated_by` int unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`team_id`) REFERENCES core_team(`id`),
    FOREIGN KEY (`form_id`) REFERENCES fm_form(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








