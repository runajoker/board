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
values (1, 'timestamp test', 'admin', 'test', '^^', 'localhost');

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
	MODIFY COLUMN member_no int NOT NULL DEFAULT 0

	update t_article set member_no = 0;

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

select member_no, article_no, article_title, article_user_id,
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


select count(*) as count 
from t_article
where board_no = 1

order by article_no 
limit 10, 10

select article_no, article_title, article_user_id,
				article_creation_date, article_readcount
		from t_article
		where board_no = 1
		order by article_no
		limit 10, 10
		
	select count(*) as cnt 
	from t_article
	where board_no = 1
	
select article_no, article_title, article_content, article_user_id,
				article_creation_date, article_readcount
		from t_article
		where board_no = 1 and article_no = 1
		
		
		select * from t_article where article_no = 1
		update t_article
		set article_readcount = article_readcount + 1
		where article_no = 1
		
	select article_no, article_title, article_user_id,
	case(now() - article_creation_date )			
		when 
	article_creation_date
		from t_article
		where board_no = 1
		order by article_no desc
		limit 0, 4	
		
insert into t_article(board_no, article_title, article_user_id, article_creation_date, article_user_password, article_content, article_creating_ip)
values (1, 'timestamp test', 'admin', '2015-11-30' ,'test', '^^', 'localhost');		


insert into t_article(board_no, article_title, article_user_id,  article_user_password, article_content, article_creating_ip)
values (1, 'timestamp test', 'admin', 'test', '^^', 'localhost');		
		
select time_format(SEC_TO_TIME(time_to_sec(now()) - time_to_sec(article_creation_date)), '%Y년 %H시간 %i분 %s초')  
		
from t_article where article_no = 607

select time_format(SEC_TO_TIME(now() -article_creation_date), '%H %i %s')  
		
from t_article where article_no = 606

select article_creation_date from t_article where article_no = 606
select sysdate() from dual 

select article_creation_date from t_article where article_no = 605
select * from t_article order by article_no desc

insert into t_article(board_no, article_title, article_user_id, article_user_password, article_content, article_creating_ip)
values (1, 'timestamp test', 'admin', 'test', '^^', 'localhost');

select article_creation_date,case 
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 31536000 ) then concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 31536000), ' 년 전')
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 2592000 ) then concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 2592000), ' 달 전')
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 86400 ) then concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 86400), '일 전')  
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 3600 )	 then concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 3600), '시간 전')
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 60 )	 then concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 60), '분 전')
	else '방금' 
	end as article_creation_date
from t_article
order by article_no desc
where article_no = 607

select article_creation_date from t_article
order by article_no desc



select article_creation_date from t_article where article_no = 607

select time_to_sec(now()) - time_to_sec(article_creation_date) from t_article

select article_creation_date from t_article

select now() - 


select A.art_no, A.art_content, A.art_like, A.art_com_cnt, A.art_pic, A.art_regdate, B.mem_no, A.mem_nick 
from (select a.art_no, a.art_content, a.mem_no, a.mem_nick, a.art_like, art_com_cnt, a.art_pic, 
case to_char(a.art_regdate, 'YYYY-MM-DD') 
when to_char(sysdate, 'YYYY-MM-DD') 
then 'Today, ' 
|| to_char(a.art_regdate, 'HH:MI:SS') 
else to_char(a.art_regdate, 'YYYY-MM-DD') 
end as art_regdate 

from t_article a inner join t_member m on a.mem_no = m.mem_no) A inner join (select mem_no from t_member where mem_no = #{mem_no} or mem_no in (select distinct f.fri_no from t_friend f inner join t_member m on f.mem_no = m.mem_no where f.mem_no = #{mem_no})) B on A.mem_no = B.mem_no order by A.art_no desc

select date_format('17-09-2010', '%d-%m-%Y') from dual
select time_format(sec_to_time(time_to_sec(now()) - time_to_sec(article_creation_date)), '%H 시간 전') from t_article where article_no = 606

select (sec_to_time(time_to_sec(now()) - time_to_sec(article_creation_date) from t_article where article_no = 606

select (time_to_sec(now()) - time_to_sec(article_creation_date)) from t_article where article_no = 609

select now() - article_creation_date from t_article where article_no = 606

select * from t_article order by article_no desc
select * from t_article order by article_no desc

select time_to_sec(now()) -time_to_sec(TIME('2011-10-10 01:02:03')) from dual;

select time_format(unix_timestamp(now()) - unix_timestamp(article_creation_date), '%y %m %d %H %i %s') from t_article order by article_no desc


select case 
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 31536000 ) then time_format(unix_timestamp(now()) - unix_timestamp(article_creation_date), '')
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 2592000 ) 	then unix_timestamp(now())
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 86400 ) 	then unix_timestamp(now())
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 3600 )	 	then unix_timestamp(now())
	when(unix_timestamp(now()) - unix_timestamp(article_creation_date) > 60 )	 	then unix_timestamp(now())
	else '방금' 
	end
from t_article
order by article_no desc

select date_format((unix_timestamp(now()) - unix_timestamp(article_creation_date)),'%Y년%m월%d일' ) as dat from t_article order by dat desc

select article_no,unix_timestamp(now()) - unix_timestamp(article_creation_date) from t_article order by article_no desc 
select concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 60), '분 전') from t_article where article_no = 611 
select concat( floor((unix_timestamp(now()) - unix_timestamp(article_creation_date)) / 86400), '일 전') from t_article where article_no = 607 
select (unix_timestamp(now()) - unix_timestamp(article_creation_date)) from t_article where article_no = 611 

