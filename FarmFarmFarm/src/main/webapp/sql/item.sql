drop table item cascade constraints purge;
create table item(
	ITEM_ID			NUMBER(20),
	ITEM_NAME		VARCHAR2(30),
	ITEM_SELLER		VARCHAR2(20),
	ITEM_PRICE		NUMBER(10),
	ITEM_STOCK		NUMBER(10),
	ITEM_DISCOUNT	NUMBER(10),
	ITEM_CATEGORY	VARCHAR2(20),
	ITEM_TYPE		VARCHAR2(20),
	ITEM_LIKEBTN	NUMBER(10),
	ITEM_REGDATE	DATE DEFAULT SYSDATE,
	ITEM_FILE1		VARCHAR2(100),
	ITEM_FILE2		VARCHAR2(100),
	ITEM_FILE3		VARCHAR2(100),
	ITEM_FILE4		VARCHAR2(100),
	ITEM_TIMESALE	VARCHAR2(20),
	ITEM_SEASON		NUMBER(2),
	ITEM_ADDRESS	VARCHAR2(10),
	ITEM_DESCRIPTION	VARCHAR2(100),
	PRIMARY KEY(ITEM_ID)
);

INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(1, '맛있는 포도', '팜팜팜', 32900, 30, 
				30, '제철', '과일', 1, SYSDATE,
				'image/fruits/grape.jpg', 'image/fruits/grape2.jpg', 'image/fruits/grape3.jpg', 'image/fruits/grape4.jpg', 
				'타임세일', 7, '경기도', '맛있는 포도입니다.');
				
INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(2, '맛있는 황도복숭아', '팜팜팜', 32900, 30, 
				10, '제철', '채소', 1, SYSDATE,
				'image/fruits/peach.jpg', 'image/fruits/peach2.jpg', 'image/fruits/peach3.jpg', 'image/fruits/peach4.jpg', 
				'타임세일', 7, '경기도', '맛있는 복숭아입니다.');
				
INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(3, '맛있는 방울토마토', '팜팜팜', 13900, 30, 
				30, '제철', '채소', 1, SYSDATE,
				'image/vegetables/cherryTomato.jpg', 'image/vegetables/cherryTomato2.jpg', 'image/vegetables/cherryTomato3.jpg', 'image/vegetables/cherryTomato4.jpg', 
				'타임세일', 7, '전라도', '맛있는 방울토마토입니다.');
				
INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(4, '맛있는 수미감자', '팜팜팜', 16900, 30, 
				15, '제철', '과일', 1, SYSDATE,
				'image/vegetables/potato.jpg', 'image/vegetables/potato2.jpg', 'image/vegetables/potato3.jpg', 'image/vegetables/potato4.jpg', 
				'타임세일', 7, '강원도', '맛있는 감자입니다.');
				
INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(5, '맛있는 양파', '팜팜팜', 15900, 30, 
				11, '제철', '채소', 1, SYSDATE,
				'image/vegetables/onion.jpg', 'image/vegetables/onion2.jpg', 'image/vegetables/onion3.jpg', 'image/vegetables/onion4.jpg', 
				'타임세일', 7, '전라도', '맛있는 양파입니다.');
				
INSERT INTO ITEM 
	(ITEM_ID, ITEM_NAME, ITEM_SELLER, ITEM_PRICE, ITEM_STOCK, 
	ITEM_DISCOUNT, ITEM_CATEGORY, ITEM_TYPE, ITEM_LIKEBTN, ITEM_REGDATE, 
	ITEM_FILE1, ITEM_FILE2, ITEM_FILE3, ITEM_FILE4,
	ITEM_TIMESALE, ITEM_SEASON, ITEM_ADDRESS,  ITEM_DESCRIPTION) 
		VALUES(6, '맛있는 생땅콩', '팜팜팜', 13900, 30, 
				36, '제철', '견과류', 1, SYSDATE,
				'image/nuts/peanut.jpg', 'image/nuts/peanut2.jpg', 'image/nuts/peanut3.jpg', 'image/nuts/peanut4.jpg', 
				'타임세일', 7, '강원도', '맛있는 땅콩입니다.');				

select * from ITEM;