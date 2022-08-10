drop table NOTICE cascade constraints purge;
drop table ADMIN cascade constraints purge;

CREATE TABLE NOTICE(
	NOTICE_NUM		NUMBER,			--글 번호
	NOTICE_NAME		VARCHAR2(30),	--작성자
	NOTICE_PASS		VARCHAR2(20),	--비밀번호
	NOTICE_SUBJECT	VARCHAR2(300),	--제목
	NOTICE_CONTENT	VARCHAR2(4000),	--내용
	NOTICE_FILE		VARCHAR2(50),	--첨부될 파일 명
	NOTICE_RE_REF	NUMBER,			--답변 글 작성시 참조되는 글의 번호
	NOTICE_RE_LEV	NUMBER,			--답변 글의 깊이
	NOTICE_RE_SEQ	NUMBER,			--답변 글의 순서
	NOTICE_READCOUNT	NUMBER,			--글의 조회수
	NOTICE_DATE DATE default sysdate,	--글의 작성 날짜
	PRIMARY KEY(NOTICE_NUM)
);

select nvl(max(notice_num),0)+1 from notice;

SELECT * FROM NOTICE;

insert into NOTICE (NOTICE_NUM, NOTICE_SUBJECT, NOTICE_NAME, NOTICE_RE_REF) values(1, '공지사항 테스트', 'admin', 1);
insert into NOTICE (NOTICE_NUM, NOTICE_SUBJECT, NOTICE_NAME, NOTICE_RE_REF) values(2, '공지사항 테스트2', 'admin', 2);
insert into NOTICE (NOTICE_NUM, NOTICE_SUBJECT, NOTICE_NAME, NOTICE_RE_REF) values(3, '공지사항 테스트3', 'admin', 3);

insert into QNA (QNA_NUM, QNA_SUBJECT, QNA_NAME, QNA_RE_REF) values(1, '오픈안내', 'admin', 1);

create table comm(
	num				number			primary key,
	id				varchar2(30)	references member(mem_id),
	content			varchar2(200),
	reg_date		date,
	comment_notice_num	number	references notice(notice_num) on delete cascade,
											  --comm 테이블이 참조하는 보드 글 번호
	comment_re_lev	number(1) check(comment_re_lev in (0,1,2)), --원문이면 0 답글이면 1
	comment_re_seq	number,	-- 원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
	comment_re_ref	number	-- 원문은 자신 글번호, 답글이면 원문 글번호
);

create table comm_qna(
	num				number			primary key,
	id				varchar2(30)	references member(mem_id),
	content			varchar2(200),
	reg_date		date,
	comment_qna_num	number	references qna(qna_num) on delete cascade,
											  --comm 테이블이 참조하는 보드 글 번호
	comment_re_lev	number(1) check(comment_re_lev in (0,1,2)), --원문이면 0 답글이면 1
	comment_re_seq	number,	-- 원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
	comment_re_ref	number	-- 원문은 자신 글번호, 답글이면 원문 글번호
);

select * from member;

create sequence com_seq;

SELECT * FROM QNA;

CREATE TABLE QNA(
	QNA_NUM		NUMBER,			--글 번호
	QNA_NAME		VARCHAR2(30),	--작성자
	QNA_PASS		VARCHAR2(20),	--비밀번호
	QNA_SUBJECT	VARCHAR2(300),	--제목
	QNA_CONTENT	VARCHAR2(4000),	--내용
	QNA_FILE		VARCHAR2(50),	--첨부될 파일 명
	QNA_RE_REF	NUMBER,			--답변 글 작성시 참조되는 글의 번호
	QNA_RE_LEV	NUMBER,			--답변 글의 깊이
	QNA_RE_SEQ	NUMBER,			--답변 글의 순서
	QNA_READCOUNT	NUMBER,			--글의 조회수
	QNA_DATE DATE default sysdate,	--글의 작성 날짜
	PRIMARY KEY(QNA_NUM)
);

select nvl(max(qna_num),0)+1 from qna;

select *
from (select rownum rnum, j.*
	   from (
	   		 select notice_num, notice_subject, nvl(cnt,0) as cnt
	   		  from notice left outer join (select comment_notice_num, count(*) cnt
	   		  							  from comm
	   		  							  group by comment_notice_num)
	   		  on notice_num=comment_notice_num
	   		  order by NOTICE_RE_REF desc,
	   		  NOTICE_RE_SEQ asc
	   		  ) j
	  where rownum <= 10
	  )
where rnum >= 1 and rnum <= 10;

select *
from (select rownum rnum, j.*
	   from (
	   		 select qna_num, qna_subject, nvl(cnt,0) as cnt
	   		  from qna left outer join (select comment_qna_num, count(*) cnt
	   		  							  from comm_qna
	   		  							  group by comment_qna_num)
	   		  on qna_num=comment_qna_num
	   		  order by QNA_RE_REF desc,
	   		  QNA_RE_SEQ asc
	   		  ) j
	  where rownum <= 10
	  )
where rnum >= 1 and rnum <= 10;
