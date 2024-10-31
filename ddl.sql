-- DROP SCHEMA montrack;

CREATE SCHEMA montrack AUTHORIZATION myuser;

-- DROP SEQUENCE montrack.active_wallet_id_seq;

CREATE SEQUENCE montrack.active_wallet_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.goals_history_id_seq;

CREATE SEQUENCE montrack.goals_history_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.goals_id_seq;

CREATE SEQUENCE montrack.goals_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.money_records_id_seq;

CREATE SEQUENCE montrack.money_records_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.notification_id_seq;

CREATE SEQUENCE montrack.notification_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.pocket_id_seq;

CREATE SEQUENCE montrack.pocket_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.user_id_seq;

CREATE SEQUENCE montrack.user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE montrack.wallet_id_seq;

CREATE SEQUENCE montrack.wallet_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- montrack.active_wallet definition

-- Drop table

-- DROP TABLE montrack.active_wallet;

CREATE TABLE montrack.active_wallet (
	id serial4 NOT NULL,
	wallet_id int4 NOT NULL,
	CONSTRAINT active_wallet_pkey PRIMARY KEY (id)
);


-- montrack.goals definition

-- Drop table

-- DROP TABLE montrack.goals;

CREATE TABLE montrack.goals (
	id serial4 NOT NULL,
	wallet_id int4 NOT NULL,
	"name" varchar NULL,
	target_amount numeric(12, 2) NULL,
	current_amount numeric(12, 2) NULL,
	description text NULL,
	image_url varchar NULL,
	created_at timestamp NULL,
	CONSTRAINT goals_pkey PRIMARY KEY (id)
);


-- montrack.goals_history definition

-- Drop table

-- DROP TABLE montrack.goals_history;

CREATE TABLE montrack.goals_history (
	id serial4 NOT NULL,
	goals_id int4 NOT NULL,
	"name" varchar NULL,
	amount numeric(12, 2) NULL,
	"date" timestamp NULL,
	CONSTRAINT goals_history_pkey PRIMARY KEY (id)
);


-- montrack.money_records definition

-- Drop table

-- DROP TABLE montrack.money_records;

CREATE TABLE montrack.money_records (
	id serial4 NOT NULL,
	pocket_id int4 NOT NULL,
	"name" varchar NULL,
	"type" varchar NULL,
	"date" timestamp NULL,
	amount numeric(12, 2) NULL,
	description text NULL,
	attachment text NULL,
	CONSTRAINT money_records_pkey PRIMARY KEY (id)
);


-- montrack.notification definition

-- Drop table

-- DROP TABLE montrack.notification;

CREATE TABLE montrack.notification (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	title varchar NULL,
	description text NULL,
	is_read bool NULL,
	created_at timestamp NULL,
	CONSTRAINT notification_pkey PRIMARY KEY (id)
);


-- montrack.pocket definition

-- Drop table

-- DROP TABLE montrack.pocket;

CREATE TABLE montrack.pocket (
	id serial4 NOT NULL,
	wallet_id int4 NOT NULL,
	emoji_unicode varchar NULL,
	"name" varchar NULL,
	amount numeric(12, 2) NULL,
	description text NULL,
	CONSTRAINT pocket_pkey PRIMARY KEY (id)
);


-- montrack."user" definition

-- Drop table

-- DROP TABLE montrack."user";

CREATE TABLE montrack."user" (
	id serial4 NOT NULL,
	active_wallet_id int4 NULL,
	"name" varchar NULL,
	profile_photo varchar NULL,
	email varchar NOT NULL,
	"password" varchar NOT NULL,
	pin varchar NULL,
	"quotes" varchar NULL,
	oauth_provider varchar NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT user_email_key UNIQUE (email),
	CONSTRAINT user_pkey PRIMARY KEY (id)
);


-- montrack.wallet definition

-- Drop table

-- DROP TABLE montrack.wallet;

CREATE TABLE montrack.wallet (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	"name" varchar NULL,
	balance numeric(12, 2) NULL,
	CONSTRAINT wallet_pkey PRIMARY KEY (id)
);


-- montrack.active_wallet foreign keys

ALTER TABLE montrack.active_wallet ADD CONSTRAINT fk_active_wallet_wallet FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id);


-- montrack.goals foreign keys

ALTER TABLE montrack.goals ADD CONSTRAINT fk_goals_wallet FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id);


-- montrack.goals_history foreign keys

ALTER TABLE montrack.goals_history ADD CONSTRAINT fk_goals_history_goals FOREIGN KEY (goals_id) REFERENCES montrack.goals(id);


-- montrack.money_records foreign keys

ALTER TABLE montrack.money_records ADD CONSTRAINT fk_money_records_pocket FOREIGN KEY (pocket_id) REFERENCES montrack.pocket(id);


-- montrack.notification foreign keys

ALTER TABLE montrack.notification ADD CONSTRAINT fk_notification_user FOREIGN KEY (user_id) REFERENCES montrack."user"(id);


-- montrack.pocket foreign keys

ALTER TABLE montrack.pocket ADD CONSTRAINT fk_pocket_wallet FOREIGN KEY (wallet_id) REFERENCES montrack.wallet(id);


-- montrack."user" foreign keys

ALTER TABLE montrack."user" ADD CONSTRAINT fk_user_active_wallet FOREIGN KEY (active_wallet_id) REFERENCES montrack.active_wallet(id);


-- montrack.wallet foreign keys

ALTER TABLE montrack.wallet ADD CONSTRAINT fk_wallet_user FOREIGN KEY (user_id) REFERENCES montrack."user"(id);