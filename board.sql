SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS t_comment;
DROP TABLE IF EXISTS t_article;
DROP TABLE IF EXISTS t_boards;
DROP TABLE IF EXISTS t_member;




/* Create Tables */

CREATE TABLE t_article
(
	board_no int NOT NULL,
	article_no int NOT NULL AUTO_INCREMENT,
	article_title varchar(100) NOT NULL,
	article_user_id varchar(20) NOT NULL,
	article_user_password varchar(128) NOT NULL,
	article_content varchar(4000) NOT NULL,
	article_creation_date datetime DEFAULT now() NOT NULL,
	article_creating_ip varchar(128) NOT NULL,
	article_file_name varchar(260),
	PRIMARY KEY (article_no)
);
insert into t_article(board_no, article_title, article_user_id, article_user_password, article_content, article_creating_ip)
values (1, '제목', 'admin', 'test', '한글되냐', 'localhost');

CREATE TABLE t_boards
(
	board_no int NOT NULL AUTO_INCREMENT,
	board_name varchar(25) NOT NULL,
	board_status boolean,
	member_no int NOT NULL,
	PRIMARY KEY (board_no),
	UNIQUE (board_no),
	UNIQUE (board_name)
);
insert into t_boards(board_name, board_status, member_no) 
values ('free', true, 1);

CREATE TABLE t_comment
(
	comment_no int NOT NULL AUTO_INCREMENT,
	comment_user_id varchar(20) NOT NULL,
	comment_user_pw varchar(128) NOT NULL,
	comment_content varchar(300) NOT NULL,
	comment_creation_date datetime DEFAULT now() NOT NULL,
	comment_creation_ip varchar(128) NOT NULL,
	article_no int NOT NULL,
	PRIMARY KEY (comment_no)
);


CREATE TABLE t_member
(
	member_no int NOT NULL AUTO_INCREMENT,
	member_id varchar(20) NOT NULL,
	member_pw varchar(255) NOT NULL,
	member_name varchar(24) NOT NULL,
	member_email varchar(255) NOT NULL,
	member_creation_date datetime DEFAULT now() NOT NULL,
	member_level int(1) DEFAULT 1 NOT NULL,
	member_point int DEFAULT 300 NOT NULL,
	PRIMARY KEY (member_no),
	UNIQUE (member_id),
	UNIQUE (member_email)
);
insert into t_member (member_id, member_pw,member_name,member_email, member_point, member_level)
values('admin','admin','상훈','runajoker@naver.com', 10000, 9);
update t_member set member_level = 9 , member_point = 100000
/* Create Foreign Keys */

ALTER TABLE t_comment
	ADD FOREIGN KEY (article_no)
	REFERENCES t_article (article_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_article
	ADD FOREIGN KEY (board_no)
	REFERENCES t_boards (board_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_boards
	ADD FOREIGN KEY (member_no)
	REFERENCES t_member (member_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

alter table t_article
	add article_readcount int not null default 0

delete from t_member
select article_no, article_title, article_user_id, article_creation_date, article_readcount 

from t_article

select article_no, article_title, article_user_id,
		article_creation_date, article_readcount
		from t_article
		
select * from t_article		
		
DELIMITER $$
DROP PROCEDURE IF EXISTS FILL_RATE_TEST_DATA$$
CREATE PROCEDURE FILL_RATE_TEST_DATA()
BEGIN
	DECLARE i INT DEFAULT 1;
		
	WHILE i <= 300 DO
		INSERT INTO t_article (board_no, article_title, article_user_id, article_user_password, article_content, article_creating_ip) VALUES (1, '제목', 'admin', 'test', '한글되냐', 'localhost');
		SET i = i + 1;
	END WHILE;
END$$


DELIMITER $$