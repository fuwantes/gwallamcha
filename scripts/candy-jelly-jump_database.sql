create table cjj_player (
	game_user_id 	INT(7) 		NOT NULL,
	user_id 	 	INT(5) 		NOT NULL,
	current_level	INT(3) 		DEFAULT 1,
	current_exp		INT(10)		DEFAULT 0,
	current_jellies INT(10)		DEFAULT 0,
	current_member	INT(5) 		DEFAULT NULL,
	current_uniform INT(5) 		DEFAULT NULL,
	date_saved		TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP
);

create table cjj_player_score (
	game_user_id	INT(7)		NOT NULL,
	game_score		INT(10)		DEFAULT 0,
	game_length		INT(10)		DEFAULT 0,
	exp_amount		INT(10)		DEFAULT 0,
	credit_amount 	INT(10)		DEFAULT 0,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP
);

create table cjj_player_transactions (
	transaction_id	INT(11)		NOT NULL AUTO_INCREMENT,
	tran_reverse_id INT(11)		DEFAULT NULL,
	game_user_id 	INT(7)		NOT NULL,
	credit_amount 	INT(10)		DEFAULT 0,
	debit_amount 	INT(10)		DEFAULT 0,
	credit_reason	VARCHAR(100)DEFAULT NULL,
	debit_reason	VARCHAR(100)DEFAULT NULL,
	item_id			INT(10)		DEFAULT NULL,
	reverse_flag	CHAR(1)		DEFAULT 'N',
	date_credited	TIMESTAMP 	DEFAULT NULL,
	date_debited	TIMESTAMP 	DEFAULT NULL,
	date_reversed 	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(transaction_id)
);

create table cjj_player_exp (
	transaction_id 	INT(11)		NOT NULL AUTO_INCREMENT,
	game_user_id 	INT(7)		NOT NULL,
	credit_amount	INT(10)		DEFAULT 0,
	credit_reason 	VARCHAR(100)DEFAULT NULL,
	date_credited	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(transaction_id)
);

create table cjj_player_levels (
	game_user_id	INT(7) 		NOT NULL,
	level 			INT(3)		DEFAULT 1,
	exp_amount 		INT(10)		DEFAULT 0,
	claimed_flag 	CHAR(1)		DEFAULT 'Y',
	date_claimed 	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP
);

create table cjj_player_uniforms (
	game_user_id	INT(7)		NOT NULL,
	uniform_id		INT(5)		NOT NULL,
	transaction_id	INT(11)		NOT NULL,
	unlock_flag		CHAR(1)		DEFAULT 'N',
	date_unlocked	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP
);

create table cjj_player_hairstyles (
	game_user_id	INT(7)		NOT NULL,
	hairstyle_id	INT(5)		NOT NULL,
	transaction_id	INT(11)		NOT NULL,
	unlock_flag		CHAR(1)		DEFAULT 'N',
	date_unlocked	TIMESTAMP 	DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP
);

--create table cjj_player_furniture (
-- COMING SOON
--);

--create table cjj_player_room (
-- COMING SOON
--);

create table cjj_player_audit (
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

create table cjj_members (
	member_id 		INT(5)		NOT NULL AUTO_INCREMENT,
	member_name		VARCHAR(15)	NOT NULL,
	member_desc		VARCHAR(200)DEFAULT NULL,
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(member_id)	
);

create table cjj_uniforms (
	uniform_id 		INT(5)		NOT NULL AUTO_INCREMENT,
	uniform_name	VARCHAR(15)	NOT NULL,
	uniform_desc	VARCHAR(200)DEFAULT NULL,
	debit_amount	INT(10)		DEFAULT 1,
	min_level		INT(3)		DEFAULT 1,
	min_tier		VARCHAR(30)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(uniform_id)	
);

create table cjj_hairstyles (
	hairstyle_id 	INT(5)		NOT NULL AUTO_INCREMENT,
	hairstyle_name	VARCHAR(15)	NOT NULL,
	hairstyle_desc	VARCHAR(200)DEFAULT NULL,
	member_id		INT(5)		NOT NULL,
	debit_amount	INT(10)		DEFAULT 1,
	min_level		INT(3)		DEFAULT 1,
	min_tier		VARCHAR(30)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(hairstyle_id)	
);

create table cjj_powerups (
	powerup_id 		INT(5)		NOT NULL AUTO_INCREMENT,
	powerup_name	VARCHAR(15)	NOT NULL,
	powerup_desc	VARCHAR(200)DEFAULT NULL,
	debit_amount	INT(10)		DEFAULT 1,
	min_level		INT(3)		DEFAULT 1,
	min_tier		VARCHAR(30)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(powerup_id)	
);

create table cjj_platforms (
	platform_id 	INT(5)		NOT NULL AUTO_INCREMENT,
	platform_name	VARCHAR(15)	NOT NULL,
	min_level		INT(3)		DEFAULT 1,
	min_height		INT(10)		DEFAULT 0,
	movement_x		INT(3)		DEFAULT 0,
	movement_y		INT(3)		DEFAULT 0,
	effect_1		VARCHAR(10)	DEFAULT 'NONE',
	effect_2		VARCHAR(10)	DEFAULT 'NONE',
	effect_3		VARCHAR(10)	DEFAULT 'NONE',
	effect_4		VARCHAR(10)	DEFAULT 'NONE',
	effect_5		VARCHAR(10)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(platform_id)	
);

create table cjj_enemies (
	enemy_id 		INT(5)		NOT NULL AUTO_INCREMENT,
	enemy_name		VARCHAR(15)	NOT NULL,
	enemy_desc		VARCHAR(200)DEFAULT NULL,
	min_level		INT(3)		DEFAULT 1,
	min_height		INT(10)		DEFAULT 0,
	movement_x		INT(3)		DEFAULT 0,
	movement_y		INT(3)		DEFAULT 0,
	effect_1		VARCHAR(10)	DEFAULT 'NONE',
	effect_2		VARCHAR(10)	DEFAULT 'NONE',
	effect_3		VARCHAR(10)	DEFAULT 'NONE',
	effect_4		VARCHAR(10)	DEFAULT 'NONE',
	effect_5		VARCHAR(10)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(enemy_id)	
);

create table cjj_backgrounds (
	background_id 	INT(5)		NOT NULL AUTO_INCREMENT,
	background_name	VARCHAR(15)	NOT NULL,
	min_level		INT(3)		DEFAULT 1,
	min_height		INT(10)		DEFAULT 0,
	effect_1		VARCHAR(10)	DEFAULT 'NONE',
	effect_2		VARCHAR(10)	DEFAULT 'NONE',
	effect_3		VARCHAR(10)	DEFAULT 'NONE',
	effect_4		VARCHAR(10)	DEFAULT 'NONE',
	effect_5		VARCHAR(10)	DEFAULT 'NONE',
	image_icon		VARCHAR(100)DEFAULT NULL,
	image_frame_0	VARCHAR(100)DEFAULT NULL,
	image_frame_1	VARCHAR(100)DEFAULT NULL,
	image_frame_2	VARCHAR(100)DEFAULT NULL,
	image_frame_3	VARCHAR(100)DEFAULT NULL,
	image_frame_4	VARCHAR(100)DEFAULT NULL,
	image_frame_5	VARCHAR(100)DEFAULT NULL,
	image_frame_6	VARCHAR(100)DEFAULT NULL,
	image_frame_7	VARCHAR(100)DEFAULT NULL,
	image_frame_8	VARCHAR(100)DEFAULT NULL,
	image_frame_9	VARCHAR(100)DEFAULT NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
	PRIMARY_KEY(background_id)	
);

create table cjj_levels (
	level 			INT(3)		NOT NULL AUTO_INCREMENT,
	exp_amount		INT(10)		DEFAULT  0,
	credit_amount	INT(10)		DEFAULT  0,
	item_1_id		INT(10)		DEFAULT  NULL,
	item_2_id		INT(10)		DEFAULT  NULL,
	item_3_id		INT(10)		DEFAULT  NULL,
	item_4_id		INT(10)		DEFAULT  NULL,
	item_5_id		INT(10)		DEFAULT  NULL,
	date_created  	TIMESTAMP 	NOT NULL DEFAULT 	CURRENT_TIMESTAMP,
	date_modified 	TIMESTAMP 	NOT NULL ON UPDATE 	CURRENT_TIMESTAMP,
);

--create table cjj_furniture (
-- COMING SOON
--);

--create table cjj_room (
-- COMING SOON
--);

create table cjj_audit (
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
