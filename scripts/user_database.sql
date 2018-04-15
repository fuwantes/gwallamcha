create table user (
	user_id 		INT(5)		NOT NULL AUTO_INCREMENT,
	discord_id		INT(30)		NOT NULL,
	ip_address		VARCHAR(30) NOT NULL,
	username		VARCHAR(30) NOT NULL,
	nickname		VARCHAR(30) DEFAULT NULL,
	image_icon		VARCHAR(100)DEFAULT NULL,
	description		VARCHAR(300)DEFAULT NULL,
	birthday		DATE 		DEFAULT NULL,
	suspend_flag	CHAR(1)		DEFAULT 'N',
	banned_flag		CHAR(1)		DEFAULT 'N',
	delete_flag		CHAR(1)		DEFAULT 'N',
	days_suspended	INT(3)		DEFAULT 0,
	date_last_login TIMESTAMP 	NOT NULL,
	date_suspended  TIMESTAMP 	DEFAULT NULL,
	date_banned		TIMESTAMP   DEFAULT NULL,
	date_deleted	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY		(user_id)
);

create table user_codes (
	user_code_id	INT(10)		NOT NULL AUTO_INCREMENT,
	user_id 		INT(5)		NOT NULL,
	game_id			INT(5)		NOT NULL,
	code_id 		INT(7)		NOT NULL,
	used_flag		CHAR(1)		DEFAULT 'N',
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(user_code_id)
);

create table user_achievements (
	user_achievement_id INT(10) NOT NULL AUTO_INCREMENT,
	user_id 		INT(5)		NOT NULL,
	game_id			INT(5)		NOT NULL,
	achievement_id 	INT(7)		NOT NULL,
	achieved_flag	CHAR(1)		DEFAULT 'N',
	claimed_flag	CHAR(1)		DEFAULT 'N',
	date_achieved  	TIMESTAMP 	DEFAULT NULL,
	date_claimed	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(user_achievement_id)
);

create table user_audit (
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