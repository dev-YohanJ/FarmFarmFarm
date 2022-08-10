create table member(
	id			varchar2(12),
	password	varchar2(10),
	name		varchar2(15),
	age			number(2),
	gender		varchar2(3),
	email		varchar2(30),
	memberfile	VARCHAR2(50),
	PRIMARY	KEY(id)
);