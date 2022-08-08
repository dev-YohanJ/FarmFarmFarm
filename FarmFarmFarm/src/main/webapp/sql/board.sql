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

insert into QNA (QNA_NUM, QNA_SUBJECT, QNA_NAME, QNA_RE_REF) values(1, '오픈안내', 'admin', 1);

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
