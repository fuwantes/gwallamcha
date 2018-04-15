create table game (
	game_id 		INT(5) 		 NOT NULL AUTO_INCREMENT,
	title 			VARCHAR(50)  NOT NULL,
	link  			VARCHAR(100) NOT NULL,
	genre 			VARCHAR(20)  DEFAULT NULL,
	description 	VARCHAR(200) DEFAULT NULL,
	image_icon 		VARCHAR(100) DEFAULT NULL,
	image_featured 	VARCHAR(100) DEFAULT NULL,
	version_id 		VARCHAR(5) 	 DEFAULT '1.0.0',
	launch_flag		CHAR(1)		 DEFAULT 'N',
	delete_flag 	CHAR(1) 	 DEFAULT 'N',
	date_launched	TIMESTAMP 	 DEFAULT  NULL,
	date_deleted	TIMESTAMP 	 DEFAULT  NULL,
	date_created  	TIMESTAMP 	 NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	 NOT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY_KEY (game_id)
);

create table game_entities (
	table_id 		INT(5) 		NOT NULL AUTO_INCREMENT,
	game_id			INT(5)		NOT NULL,
	table_name 		VARCHAR(50) NOT NULL,
	delete_flag		CHAR(1)		DEFAULT 'N',
	date_deleted 	TIMESTAMP 	DEFAULT  NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY		(table_id)
);

create table game_version (
	version_id 		INT(5)		 NOT NULL AUTO_INCREMENT,
	game_id 		INT(5)		 NOT NULL,
	version_no		VARCHAR(7)	 NOT NULL,
	description		VARCHAR(200) DEFAULT NULL,
	launch_flag 	CHAR(1) 	 DEFAULT 'N',
	delete_flag 	CHAR(1) 	 DEFAULT 'N',
	date_launched	TIMESTAMP 	 DEFAULT  NULL,
	date_deleted	TIMESTAMP 	 DEFAULT  NULL,
	date_created  	TIMESTAMP 	 NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	 NOT NULL ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY_KEY 	(version_id)
);

create table game_users (
	game_user_id	INT(7)		NOT NULL AUTO_INCREMENT,
	game_id 		INT(5)		NOT NULL,
	user_id			INT(5)		NOT NULL,
	banned_flag		CHAR(1)		DEFAULT 'N',
	delete_flag 	CHAR(1) 	DEFAULT 'N',
	date_saved		TIMESTAMP 	DEFAULT  NULL,
	date_banned		TIMESTAMP 	DEFAULT  NULL,
	date_deleted	TIMESTAMP 	DEFAULT  NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY		(game_user_id)
);

create table game_codes (
	code_id 		INT(7)		NOT NULL AUTO_INCREMENT,
	game_id 		INT(5)		NOT NULL,
	code 			VARCHAR(8)	NOT NULL,
	title			VARCHAR(30) DEFAULT  NULL,
	description		VARCHAR(200)DEFAULT  NULL,
	item_1_id		INT(10)		DEFAULT  NULL,
	item_2_id		INT(10)		DEFAULT  NULL,
	item_3_id		INT(10)		DEFAULT  NULL,
	item_4_id		INT(10)		DEFAULT  NULL,
	item_5_id		INT(10)		DEFAULT  NULL,
	launch_flag		CHAR(1)		DEFAULT  'N',
	delete_flag		CHAR(1)		DEFAULT  'N',
	date_expired	TIMESTAMP 	DEFAULT  NULL,
	date_launched	TIMESTAMP 	DEFAULT  NULL,
	date_deleted	TIMESTAMP 	DEFAULT  NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(code_id)
);

create table game_achievements (
	achievement_id 	INT(7)		NOT NULL AUTO_INCREMENT,
	game_id 		INT(5)		NOT NULL,
	seq_no			INT(3)		NOT NULL,
	title			VARCHAR(50)	NOT NULL,
	description		VARCHAR(200)NOT NULL,
	image_icon		VARCHAR(100)DEFAULT NULL,
	reward_flag		CHAR(1)		DEFAULT 'Y',
	launch_flag		CHAR(1)		DEFAULT 'N',
	delete_flag		CHAR(1)		DEFAULT 'N',
	free_item_1_id	INT(10)		DEFAULT  NULL,
	free_item_2_id	INT(10)		DEFAULT  NULL,
	free_item_3_id	INT(10)		DEFAULT  NULL,
	free_item_4_id	INT(10)		DEFAULT  NULL,
	free_item_5_id	INT(10)		DEFAULT  NULL,
	date_launched	TIMESTAMP 	DEFAULT  NULL,
	date_deleted	TIMESTAMP 	DEFAULT  NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(achievement_id)
);

create table game_audit (
	audit_id 		INT(11)		NOT NULL AUTO_INCREMENT,
	table			VARCHAR(50)	NOT NULL,
	field			VARCHAR(50) NOT NULL,
	entity_id		INT(11)		NOT NULL,
	action			VARCHAR(50) NOT NULL,
	old_value		VARCHAR(300)DEFAULT NULL,
	new_value		VARCHAR(300)DEFAULT NULL,
	username		VARCHAR(30) NOT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(audit_id)
);

