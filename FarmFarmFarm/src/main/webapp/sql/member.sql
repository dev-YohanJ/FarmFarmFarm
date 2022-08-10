drop table member cascade constraints purge;
--1. index.jsp에서 시작 합니다.
--2. 관리자 계정 admin, 비번 1234를 만듭니다.
--3. 사용자 계정을 3개 만듭니다.

create table MEM(
	MEM_ID			varchar2(20),
	MEM_PASS		varchar2(20),
	MEM_NAME		varchar2(10),
	MEM_JUMIN		varchar2(14),
	MEM_PHONE  	 	varchar2(13),
	MEM_EMAIL		varchar2(30),
	MEM_ADDRESS		varchar2(50),
	MEM_ADDRESS2	varchar2(50),
	MEM_ADDRESS3	varchar2(50),
	MEM_VERIFY		number(1),
	PRIMARY	KEY(MEM_ID)
);

INSERT INTO MEMBER 
VALUES('admin', '1234', '관리자', '111111-1111111', '010-1234-5678', 'admin@naver.com'
      ,'서울시 종로','서울시 강남', '서울시 대치', 1);


select * from MEMBER;

delete from member where id = 'test11';
delete from member where id = 'test1';
delete from member where id = 'test2';
delete from member where id = 'test4';
delete from member where id = 'test5';
delete from member where id = 'test7';
delete from member where id = 'test9';

--memberfile은 회원 정보 수정시 적용합니다.