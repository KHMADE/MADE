﻿﻿/*** Semi 데이터 베이스 스크립트 Ver 2.5 ***/
/* ID : made / PWD : made1708 */

/** 1.0 ver 스크립트 초기화를 위한 테이블 삭제 **/
/*
DROP TABLE MEMBER_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE PRODUCT_BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_PB;
DROP TABLE RESOURCE_LIST CASCADE CONSTRAINTS;
DROP TABLE NEED_RESOURCE;
DROP TABLE RESOURCE_BOARD;
DROP TABLE ORDER_INFO;
DROP TABLE ORDER_STATUS;
DROP TABLE ORDER_ITEM;
DROP TABLE NOTICE;
DROP TABLE MESSAGE;
*/

/** 1.5 ver 스크립트 초기화를 위한 테이블 삭제 **/
/*
DROP TABLE MEMBER_TYPE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE MEMBER_ADDR CASCADE CONSTRAINTS;
DROP TRIGGER TR_ADDR CASCADE CONSTRAINTS;
DROP TABLE RSRC_TYPE CASCADE CONSTRAINTS;
DROP TABLE RESOURCE_LIST CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_RE;
DROP TABLE PRODUCT_BOARD CASCADE CONSTRAINTS;
DROP TABLE NEED_RSRC CASCADE CONSTRAINTS;
DROP TABLE FINISHED_ITEM CASCADE CONSTRAINTS;
DROP TABLE RESOURCE_BOARD CASCADE CONSTRAINTS;
DROP TABLE ORDER_ITEM CASCADE CONSTRAINTS;
DROP TABLE ORDER_INFO CASCADE CONSTRAINTS;
DROP TABLE SHIP_COM CASCADE CONSTRAINTS;
DROP TABLE SHIP_STATUS CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE MESSAGE CASCADE CONSTRAINTS;
DROP TABLE QNA_BOARD CASCADE CONSTRAINTS;
DROP TABLE REQUEST_BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_MSG;
*/

/* 회원 정보 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 회원 구분 */
DROP TABLE MEMBER_CLASS 
	CASCADE CONSTRAINTS;

/* 쪽지 */
DROP TABLE MESSAGE 
	CASCADE CONSTRAINTS;

/* 주소록 */
DROP TABLE ADDR_BOOK 
	CASCADE CONSTRAINTS;

/* 디자인 의뢰서 */
DROP TABLE REQUEST 
	CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE NOTICE 
	CASCADE CONSTRAINTS;

/* 주문서 */
DROP TABLE ORDER_INFO 
	CASCADE CONSTRAINTS;

/* 주문 상태 */
DROP TABLE ORDER_STATE 
	CASCADE CONSTRAINTS;

/* 부품 판매 게시글 */
DROP TABLE PART 
	CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_PART;

/* 디자인 제공 게시글 */
DROP TABLE DESIGN 
	CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_DE;

/* 부품 묶음 */
DROP TABLE PART_SET 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE CATEGORY 
	CASCADE CONSTRAINTS;

/* Q&A */
DROP TABLE QA 
	CASCADE CONSTRAINTS;

/* 상품 */
DROP TABLE PRODUCT 
	CASCADE CONSTRAINTS;

/* FAQ */
DROP TABLE FAQ 
	CASCADE CONSTRAINTS;

/* 카테고리 관계 */
DROP TABLE CATEGORY_RELATION 
	CASCADE CONSTRAINTS;

/* 상품 후기 */
DROP TABLE ITEM_REVIEW 
	CASCADE CONSTRAINTS;

/* 공지사항 댓글 */
DROP TABLE NOTICE_REPLY
	CASCADE CONSTRAINTS;

/* 배송 업체 */
DROP TABLE SHIP_COMPANY 
	CASCADE CONSTRAINTS;

/* 회원 정보 */
CREATE TABLE MEMBER (
	MEMBER_ID VARCHAR2(30) CONSTRAINT PK_MEMBER PRIMARY KEY, /* 아이디 */
	MEMBER_CLASS_CODE VARCHAR2(2) NOT NULL, /* 구분 코드 */
	MEMBER_PASSWORD VARCHAR2(30) NOT NULL, /* 비밀번호 */
	MEMBER_NAME VARCHAR2(30) NOT NULL, /* 이름 */
	MEMBER_BIRTHDAY DATE NOT NULL, /* 생년월일 */
	MEMBER_EMAIL VARCHAR2(30) NOT NULL, /* 이메일 */
	MEMBER_PHONE VARCHAR2(30) NOT NULL, /* 전화번호 */
	MEMBER_ADDRESS VARCHAR2(50) NOT NULL, /* 주소 */
	MEMBER_SIGN_DATE DATE DEFAULT SYSDATE, /* 가입일 */
	MEMBER_PROFILE_IMG VARCHAR2(50), /* 프로필 이미지 */
	MEMBER_POINT NUMBER NOT NULL, /* 포인트 */
	MEMBER_NICKNAME VARCHAR2(30) NOT NULL /* 별명 */
);

COMMENT ON TABLE MEMBER IS '회원 정보';

COMMENT ON COLUMN MEMBER.MEMBER_ID IS '아이디';

COMMENT ON COLUMN MEMBER.MEMBER_CLASS_CODE IS '구분 코드';

COMMENT ON COLUMN MEMBER.MEMBER_PASSWORD IS '비밀번호';

COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '이름';

COMMENT ON COLUMN MEMBER.MEMBER_BIRTHDAY IS '생년월일';

COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';

COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';

COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';

COMMENT ON COLUMN MEMBER.MEMBER_SIGN_DATE IS '가입일';

COMMENT ON COLUMN MEMBER.MEMBER_PROFILE_IMG IS '프로필 이미지';

COMMENT ON COLUMN MEMBER.MEMBER_POINT IS '누적 포인트';

COMMENT ON COLUMN MEMBER.MEMBER_NICKNAME IS '별명';


/* 회원 구분 */
CREATE TABLE MEMBER_CLASS (
	MEMBER_CLASS_CODE VARCHAR2(2) CONSTRAINT PK_MEMBER_CLASS PRIMARY KEY, /* 구분 코드 */
	MEMBER_CLASS_NAME VARCHAR(20) NOT NULL /* 구분 명칭 */
);

COMMENT ON TABLE MEMBER_CLASS IS '회원 구분';

COMMENT ON COLUMN MEMBER_CLASS.MEMBER_CLASS_CODE IS '구분 코드';

COMMENT ON COLUMN MEMBER_CLASS.MEMBER_CLASS_NAME IS '구분 명칭';


/* 쪽지 */
CREATE TABLE MESSAGE (
	MESSAGE_CODE VARCHAR2(14) CONSTRAINT PK_MESSAGE	PRIMARY KEY, /* 쪽지 코드 */
	MESSAGE_SENDER_ID VARCHAR2(30) NOT NULL, /* 보낸 아이디 */
	MESSAGE_RECIPIENT_ID VARCHAR2(30) NOT NULL, /* 받는 아이디 */
	MESSAGE_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	MESSAGE_DATE DATE NOT NULL /* 작성일 */
);

COMMENT ON TABLE MESSAGE IS '쪽지';

COMMENT ON COLUMN MESSAGE.MESSAGE_CODE IS '쪽지 코드';

COMMENT ON COLUMN MESSAGE.MESSAGE_SENDER_ID IS '보낸 아이디';

COMMENT ON COLUMN MESSAGE.MESSAGE_RECIPIENT_ID IS '받는 아이디';

COMMENT ON COLUMN MESSAGE.MESSAGE_CONTENTS IS '내용';

COMMENT ON COLUMN MESSAGE.MESSAGE_DATE IS '작성일';

/* 주소록 */
CREATE TABLE ADDR_BOOK (
	ADDR_BOOK_NAME VARCHAR2(30) CONSTRAINT PK_ADDR_BOOK PRIMARY KEY, /* 주소록 명칭 */
	MEMBER_ID VARCHAR2(30) NOT NULL, /* 아이디 */
	ADDR_BOOK_ADDR VARCHAR2(50) NOT NULL, /* 주소 */
	ADDR_BOOK_POST VARCHAR2(30) NOT NULL, /* 우편 번호 */
	ADDR_BOOK_RECIPIENT VARCHAR2(30) NOT NULL, /* 받는이 */
	ADDR_BOOK_PHONE VARCHAR2(30) NOT NULL /* 전화번호 */
);

COMMENT ON TABLE ADDR_BOOK IS '주소록';

COMMENT ON COLUMN ADDR_BOOK.ADDR_BOOK_NAME IS '주소록 명칭';

COMMENT ON COLUMN ADDR_BOOK.MEMBER_ID IS '아이디';

COMMENT ON COLUMN ADDR_BOOK.ADDR_BOOK_ADDR IS '주소';

COMMENT ON COLUMN ADDR_BOOK.ADDR_BOOK_POST IS '우편 번호';

COMMENT ON COLUMN ADDR_BOOK.ADDR_BOOK_RECIPIENT IS '받는이';

COMMENT ON COLUMN ADDR_BOOK.ADDR_BOOK_PHONE IS '전화번호';

/* 디자인 의뢰서 */
CREATE TABLE REQUEST (
	REQUEST_CODE VARCHAR2(14) NOT NULL, /* 의뢰서 코드 */
	MEMBER_ID VARCHAR2(30) NOT NULL, /* 아이디 */
	REQUEST_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	REQUEST_DATE DATE NOT NULL, /* 작성일 */
	REQUEST_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	REQUEST_FILE VARCHAR2(50) NOT NULL /* 첨부 파일 */
);

COMMENT ON TABLE REQUEST IS '디자인 의뢰서';

COMMENT ON COLUMN REQUEST.REQUEST_CODE IS '의뢰서 코드';

COMMENT ON COLUMN REQUEST.MEMBER_ID IS '아이디';

COMMENT ON COLUMN REQUEST.REQUEST_TITLE IS '제목';

COMMENT ON COLUMN REQUEST.REQUEST_DATE IS '작성일';

COMMENT ON COLUMN REQUEST.REQUEST_CONTENTS IS '내용';

COMMENT ON COLUMN REQUEST.REQUEST_FILE IS '첨부 파일';

CREATE UNIQUE INDEX PK_REQUEST
	ON REQUEST (
		REQUEST_CODE ASC
	);

ALTER TABLE REQUEST
	ADD
		CONSTRAINT PK_REQUEST
		PRIMARY KEY (
			REQUEST_CODE
		);

/* 공지사항 */
CREATE TABLE NOTICE (
	NOTICE_CODE VARCHAR2(14) CONSTRAINT PK_NOTICE PRIMARY KEY, /* 공지사항 코드 */
	NOTICE_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	NOTICE_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	NOTICE_DATE DATE NOT NULL, /* 작성일 */
	NOTICE_IMG VARCHAR2(50) /* 이미지 */
);

COMMENT ON TABLE NOTICE IS '공지사항';

COMMENT ON COLUMN NOTICE.NOTICE_CODE IS '공지사항 코드';

COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '제목';

COMMENT ON COLUMN NOTICE.NOTICE_CONTENTS IS '내용';

COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '작성일';

COMMENT ON COLUMN NOTICE.NOTICE_IMG IS '이미지';


/* 주문서 */
CREATE TABLE ORDER_INFO (
	ORDER_CODE VARCHAR2(14) CONSTRAINT PK_ORDER PRIMARY KEY, /* 주문 코드 */
	MEMBER_ID VARCHAR2(30) NOT NULL, /* 아이디 */
	ORDER_DATE DATE NOT NULL, /* 주문일 */
	ORDER_POINT NUMBER, /* 주문별 포인트 */
	ORDER_STATE_CODE VARCHAR2(10) NOT NULL, /* 상태 코드 */
	SHIP_COMPANY_NAME VARCHAR2(30), /* 배송 업체명 */
	ORDER_SHIP_CODE VARCHAR2(30) /* 운송장 번호 */
);

COMMENT ON TABLE ORDER_INFO IS '주문서';

COMMENT ON COLUMN ORDER_INFO.ORDER_CODE IS '주문 코드';

COMMENT ON COLUMN ORDER_INFO.MEMBER_ID IS '아이디';

COMMENT ON COLUMN ORDER_INFO.ORDER_DATE IS '주문일';

COMMENT ON COLUMN ORDER_INFO.ORDER_POINT IS '주문별 포인트';

COMMENT ON COLUMN ORDER_INFO.ORDER_STATE_CODE IS '상태 코드';

COMMENT ON COLUMN ORDER_INFO.SHIP_COMPANY_NAME IS '배송 업체명';

COMMENT ON COLUMN ORDER_INFO.ORDER_SHIP_CODE IS '운송장 번호';

INSERT INTO ORDER_INFO VALUES('OD170501180001', 'user22', TO_DATE('2017-05-01', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170502180002', 'user22', TO_DATE('2017-05-02', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170503180003', 'user22', TO_DATE('2017-05-03', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170504180004', 'user22', TO_DATE('2017-05-04', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170505180005', 'user22', TO_DATE('2017-05-05', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170506180006', 'user22', TO_DATE('2017-05-06', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170507180007', 'user22', TO_DATE('2017-05-07', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170508180008', 'user22', TO_DATE('2017-05-08', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170509180009', 'user22', TO_DATE('2017-05-09', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170510180010', 'user22', TO_DATE('2017-05-10', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170511180011', 'user22', TO_DATE('2017-05-11', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170512180012', 'user22', TO_DATE('2017-05-12', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170513180013', 'user22', TO_DATE('2017-05-13', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170514180014', 'user22', TO_DATE('2017-05-14', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170515180015', 'user22', TO_DATE('2017-05-15', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170516180016', 'user22', TO_DATE('2017-05-16', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170517180017', 'user22', TO_DATE('2017-05-17', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170518180018', 'user22', TO_DATE('2017-05-18', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170519180019', 'user22', TO_DATE('2017-05-19', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170520180020', 'user22', TO_DATE('2017-05-20', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170521180021', 'user22', TO_DATE('2017-05-21', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170522180022', 'user22', TO_DATE('2017-05-22', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170523180023', 'user22', TO_DATE('2017-05-23', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170524180024', 'user22', TO_DATE('2017-05-24', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170525180025', 'user22', TO_DATE('2017-05-25', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170526180026', 'user22', TO_DATE('2017-05-26', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170527180027', 'user22', TO_DATE('2017-05-27', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170528180028', 'user22', TO_DATE('2017-05-28', 'RRRR-MM-DD'), NULL, 'A', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170529180029', 'user22', TO_DATE('2017-05-29', 'RRRR-MM-DD'), NULL, 'B', NULL, NULL);
INSERT INTO ORDER_INFO VALUES('OD170530180030', 'user22', TO_DATE('2017-05-30', 'RRRR-MM-DD'), NULL, 'C', NULL, NULL);

/* 주문 상태 */
CREATE TABLE ORDER_STATE (
	ORDER_STATE_CODE VARCHAR2(14) CONSTRAINT PK_ORDER_STATE	PRIMARY KEY, /* 상태 코드 */
	ORDER_STATE_NAME VARCHAR2(30) NOT NULL /* 상태 명칭 */
);

COMMENT ON TABLE ORDER_STATE IS '주문 상태';

COMMENT ON COLUMN ORDER_STATE.ORDER_STATE_CODE IS '상태 코드';

COMMENT ON COLUMN ORDER_STATE.ORDER_STATE_NAME IS '상태 명칭';

INSERT INTO ORDER_STATE VALUES('A', '결제완료');
INSERT INTO ORDER_STATE VALUES('B', '배송 중');
INSERT INTO ORDER_STATE VALUES('C', '배송 완료');

/* 카테고리 */
CREATE TABLE CATEGORY (
	CATEGORY_CODE VARCHAR2(10) CONSTRAINT PK_CATEGORY PRIMARY KEY, /* 카테고리 코드 */
	CATEGORY_NAME VARCHAR2(30) NOT NULL /* 카테고리 명칭 */
);

COMMENT ON TABLE CATEGORY IS '카테고리';
COMMENT ON COLUMN CATEGORY.CATEGORY_CODE IS '카테고리 코드';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '카테고리 명칭';


/* 부품 판매 게시글 */
CREATE TABLE PART (
	PART_CODE VARCHAR2(14) CONSTRAINT PK_PART	PRIMARY KEY, /* 부품 코드 */
	PART_TITLE VARCHAR2(50) NOT NULL, /* 제목(부품 명칭) */
       PART_CATEGORY VARCHAR2(10),
	PART_DATE DATE NOT NULL, /* 작성일 */
	PART_PRICE NUMBER NOT NULL, /* 가격 */
	PART_STOCK NUMBER NOT NULL, /* 재고 */
	PART_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	PART_IMG VARCHAR2(50) NOT NULL, /* 이미지 */
       PART_COUNT NUMBER NOT NULL,  /* 부품 조회수 */
       CONSTRAINT FK_PT_CATEGORY FOREIGN KEY(PART_CATEGORY) REFERENCES CATEGORY
);

COMMENT ON TABLE PART IS '부품게시글';

COMMENT ON COLUMN PART.PART_CODE IS '부품 코드';

COMMENT ON COLUMN PART.PART_TITLE IS '제목(부품 명칭)';
COMMENT ON COLUMN PART.PART_CATEGORY IS '자재분류';

COMMENT ON COLUMN PART.PART_DATE IS '작성일';

COMMENT ON COLUMN PART.PART_PRICE IS '가격';

COMMENT ON COLUMN PART.PART_STOCK IS '재고';

COMMENT ON COLUMN PART.PART_CONTENTS IS '내용';

COMMENT ON COLUMN PART.PART_IMG IS '이미지';
COMMENT ON COLUMN PART.PART_COUNT IS '조회수';

/* 디자인 제공 게시글 */
CREATE TABLE DESIGN (
	DESIGN_CODE VARCHAR2(14) CONSTRAINT PK_DESIGN PRIMARY KEY, /* 디자인 코드 */
	DESIGN_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
       DESIGN_CATEGORY VARCHAR2(10),  /* 디자인 카테고리 */
	DESIGN_DATE DATE NOT NULL, /* 작성일 */
	DESIGN_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	DESIGN_PRICE NUMBER NOT NULL, /* 가격 */
	DESIGN_IMG VARCHAR2(50) NOT NULL, /* 이미지 */
	MEMBER_ID VARCHAR2(30), /* 디자이너 */
       DESIGN_COUNT NUMBER NOT NULL,  /* 디자인 된 조회수 */
       CONSTRAINT FK_DE_CATEGORY FOREIGN KEY(DESIGN_CATEGORY) REFERENCES CATEGORY
);

COMMENT ON TABLE DESIGN IS '디자인게시글';

COMMENT ON COLUMN DESIGN.DESIGN_CODE IS '디자인 코드';

COMMENT ON COLUMN DESIGN.DESIGN_TITLE IS '제목';
COMMENT ON COLUMN DESIGN.DESIGN_CATEGORY IS '자재분류';

COMMENT ON COLUMN DESIGN.DESIGN_DATE IS '작성일';

COMMENT ON COLUMN DESIGN.DESIGN_CONTENTS IS '내용';

COMMENT ON COLUMN DESIGN.DESIGN_PRICE IS '가격';

COMMENT ON COLUMN DESIGN.DESIGN_IMG IS '이미지';

COMMENT ON COLUMN DESIGN.MEMBER_ID IS '디자이너';
COMMENT ON COLUMN DESIGN.DESIGN_COUNT IS '조회수';

/* 부품 묶음 */
CREATE TABLE PART_SET (
	DESIGN_CODE VARCHAR2(14) NOT NULL, /* 디자인 코드 */
	PART_CODE VARCHAR2(14) NOT NULL, /* 부품 코드 */
       QUANTITY NUMBER      /* 부품 갯수 */
);

COMMENT ON TABLE PART_SET IS '부품 묶음';

COMMENT ON COLUMN PART_SET.DESIGN_CODE IS '디자인 코드';

COMMENT ON COLUMN PART_SET.PART_CODE IS '부품 코드';
COMMENT ON COLUMN PART_SET.QUANTITY IS '소비수량';

/* Q&A */
SET ESCAPE ON;

CREATE TABLE QA (
	QA_CODE VARCHAR2(14) CONSTRAINT PK_QA PRIMARY KEY, /* 공지사항 코드 */
	MEMBER_ID VARCHAR2(30) NOT NULL, /* 아이디 */
	QA_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	QA_CONTENTS VARCHAR2(500) NOT NULL, /* 내용 */
	QA_DATE DATE NOT NULL, /* 작성일 */
	QA_IMG VARCHAR2(50), /* 이미지 */
	QA_ANSWER VARCHAR2(500) /* 답변 */
);

COMMENT ON TABLE QA IS 'Q\&A';
COMMENT ON COLUMN QA.QA_CODE IS '공지코드';
COMMENT ON COLUMN QA.MEMBER_ID IS '아이디';
COMMENT ON COLUMN QA.QA_TITLE IS '제목';
COMMENT ON COLUMN QA.QA_CONTENTS IS '내용';
COMMENT ON COLUMN QA.QA_DATE IS '작성일';
COMMENT ON COLUMN QA.QA_IMG IS '이미지';
COMMENT ON COLUMN QA.QA_ANSWER IS '답변';

/* 상품 */
CREATE TABLE PRODUCT (
	ORDER_CODE VARCHAR2(14) NOT NULL, /* 주문 코드 */
	DESIGN_CODE VARCHAR2(14), /* 디자인 코드 */
	PART_CODE VARCHAR2(14) /* 부품 코드 */
);

COMMENT ON TABLE PRODUCT IS '상품';

COMMENT ON COLUMN PRODUCT.ORDER_CODE IS '주문 코드';

COMMENT ON COLUMN PRODUCT.DESIGN_CODE IS '디자인 코드';

COMMENT ON COLUMN PRODUCT.PART_CODE IS '부품 코드';

INSERT INTO PRODUCT VALUES(OD170501180001, DE170710133500, NULL);
INSERT INTO PRODUCT VALUES(OD170502180002, DE170712142501, NULL);
INSERT INTO PRODUCT VALUES(OD170503180003, DE170712143501, NULL);
INSERT INTO PRODUCT VALUES(OD170504180004, DE170713144401, NULL);
INSERT INTO PRODUCT VALUES(OD170505180005, DE170714024001, NULL);
INSERT INTO PRODUCT VALUES(OD170506180006, DE170713102501, NULL);
INSERT INTO PRODUCT VALUES(OD170507180007, DE170713112001, NULL);
INSERT INTO PRODUCT VALUES(OD170508180008, DE170713062301, NULL);
INSERT INTO PRODUCT VALUES(OD170509180009, DE170714204001, NULL);
INSERT INTO PRODUCT VALUES(OD170510180010, DE170714050501, NULL);
INSERT INTO PRODUCT VALUES(OD170511180011, DE170713141001, NULL);
INSERT INTO PRODUCT VALUES(OD170512180012, DE170715143001, NULL);
INSERT INTO PRODUCT VALUES(OD170513180013, DE170715144701, NULL);
INSERT INTO PRODUCT VALUES(OD170514180014, DE170713175001, NULL);
INSERT INTO PRODUCT VALUES(OD170515180015, );
INSERT INTO PRODUCT VALUES(OD170516180016, );
INSERT INTO PRODUCT VALUES(OD170517180017, );
INSERT INTO PRODUCT VALUES(OD170518180018, );
INSERT INTO PRODUCT VALUES(OD170519180019, );
INSERT INTO PRODUCT VALUES(OD170520180020, );
INSERT INTO PRODUCT VALUES(OD170521180021, );
INSERT INTO PRODUCT VALUES(OD170522180022, );
INSERT INTO PRODUCT VALUES(OD170523180023, );
INSERT INTO PRODUCT VALUES(OD170524180024, );
INSERT INTO PRODUCT VALUES(OD170525180025, );
INSERT INTO PRODUCT VALUES(OD170526180026, );
INSERT INTO PRODUCT VALUES(OD170527180027, );
INSERT INTO PRODUCT VALUES(OD170528180028, );
INSERT INTO PRODUCT VALUES(OD170529180029, );
INSERT INTO PRODUCT VALUES(OD170530180030, );



/* FAQ */
CREATE TABLE FAQ (
	FAQ_CODE VARCHAR2(14) CONSTRAINT PK_FAQ PRIMARY KEY, /* FAQ 코드 */
	FAQ_TITLE VARCHAR2(50) NOT NULL, /* 제목 */
	FAQ_CONTENT VARCHAR2(500) NOT NULL, /* 내용 */
	FAQ_CONTENTS DATE NOT NULL, /* 작성일 */
	FAQ_IMG VARCHAR2(50) /* 이미지 */
);

COMMENT ON TABLE FAQ IS 'FAQ';

COMMENT ON COLUMN FAQ.FAQ_CODE IS 'FAQ 코드';

COMMENT ON COLUMN FAQ.FAQ_TITLE IS '제목';

COMMENT ON COLUMN FAQ.FAQ_CONTENT IS '내용';

COMMENT ON COLUMN FAQ.FAQ_CONTENTS IS '작성일';

COMMENT ON COLUMN FAQ.FAQ_IMG IS '이미지';
--
--/* 카테고리 관계 */
--CREATE TABLE CATEGORY_RELATION (
--	CATEGORY_CODE VARCHAR2(10) NOT NULL, /* 카테고리 코드 */
--	DESIGN_CODE VARCHAR2(10), /* 디자인 코드 */
--	PART_CODE VARCHAR2(10) /* 부품 코드 */
--);
--
--COMMENT ON TABLE CATEGORY_RELATION IS '카테고리 관계';
--
--COMMENT ON COLUMN CATEGORY_RELATION.CATEGORY_CODE IS '카테고리 코드';
--
--COMMENT ON COLUMN CATEGORY_RELATION.DESIGN_CODE IS '디자인 코드';
--
--COMMENT ON COLUMN CATEGORY_RELATION.PART_CODE IS '부품 코드';

/* 배송 업체 */
CREATE TABLE SHIP_COMPANY (
	SHIP_COMPANY_NAME VARCHAR2(30) CONSTRAINT PK_SHIP_COMPANY PRIMARY KEY, /* 배송 업체명 */
	SHIP_COMPANY_URL VARCHAR2(100) /* 배송 업체 URL */
);

COMMENT ON TABLE SHIP_COMPANY IS '배송 업체';

COMMENT ON COLUMN SHIP_COMPANY.SHIP_COMPANY_NAME IS '배송 업체명';

COMMENT ON COLUMN SHIP_COMPANY.SHIP_COMPANY_URL IS '업체 URL';

/* 찜 목록 */
CREATE TABLE LIKELIST(
MEMBER_ID VARCHAR2(30) NOT NULL,
DESIGN_CODE VARCHAR2(14),
PART_CODE VARCHAR2(14),
CONSTRAINT FK_LL_MEMID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE,
CONSTRAINT FK_LL_DECODE FOREIGN KEY(DESIGN_CODE) REFERENCES DESIGN ON DELETE CASCADE,
CONSTRAINT FK_LL_PACODE FOREIGN KEY(PART_CODE) REFERENCES PART ON DELETE CASCADE
);

COMMENT ON COLUMN LIKELIST.MEMBER_ID IS '유저ID';
COMMENT ON COLUMN LIKELIST.DESIGN_CODE IS '디자인코드';
COMMENT ON COLUMN LIKELIST.PART_CODE IS '부품코드';

/* 상품 후기 */
CREATE TABLE ITEM_REVIEW(
ITEM_CODE VARCHAR2(14),
MEMBER_ID VARCHAR2(30),
REVIEW_CONTENT VARCHAR2(2000),
REVIEW_DATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_REVIEW_CODE FOREIGN KEY(ITEM_CODE) REFERENCES DESIGN ON DELETE CASCADE,
CONSTRAINT FK_REVIEW_MEMID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE
);
COMMENT ON COLUMN ITEM_REVIEW.ITEM_CODE IS '상품코드';
COMMENT ON COLUMN ITEM_REVIEW.MEMBER_ID IS '사용자ID';
COMMENT ON COLUMN ITEM_REVIEW.REVIEW_CONTENT IS '리뷰내용';
COMMENT ON COLUMN ITEM_REVIEW.REVIEW_DATE IS '리뷰일자';

/* 공지사항 댓글 */
CREATE TABLE NOTICE_REPLY(
NOTICE_CODE VARCHAR2(14),
MEMBER_ID VARCHAR2(30),
REPLY_CONTENT VARCHAR2(2000),
REPLY_DATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_NORPLY_CODE FOREIGN KEY(NOTICE_CODE) REFERENCES NOTICE ON DELETE CASCADE,
CONSTRAINT FK_NORPLY_MEMID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER ON DELETE CASCADE
);

COMMENT ON COLUMN NOTICE_REPLY.NOTICE_CODE IS '공지 CODE';
COMMENT ON COLUMN NOTICE_REPLY.MEMBER_ID IS '사용자ID';
COMMENT ON COLUMN NOTICE_REPLY.REPLY_CONTENT IS '답글 내용';
COMMENT ON COLUMN NOTICE_REPLY.REPLY_DATE IS '답글 작성일';

ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_MEMBER_CLASS
		FOREIGN KEY (
			MEMBER_CLASS_CODE
		)
		REFERENCES MEMBER_CLASS (
			MEMBER_CLASS_CODE
		);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_MSG_SEND
		FOREIGN KEY (
			MESSAGE_SENDER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_MSG_RICV
		FOREIGN KEY (
			MESSAGE_RECIPIENT_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE ADDR_BOOK
	ADD
		CONSTRAINT FK_ADDRBK_MEMBER
		FOREIGN KEY (
			MEMBER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE REQUEST
	ADD
		CONSTRAINT FK_REQUEST_MEMBER
		FOREIGN KEY (
			MEMBER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE ORDER_INFO
	ADD
		CONSTRAINT FK_ORDER_MEMBER
		FOREIGN KEY (
			MEMBER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE ORDER_INFO
	ADD
		CONSTRAINT FK_ORDER_STATE
		FOREIGN KEY (
			ORDER_STATE_CODE
		)
		REFERENCES ORDER_STATE (
			ORDER_STATE_CODE
		);

ALTER TABLE ORDER_INFO
	ADD
		CONSTRAINT FK_ORDER_SHIPCOM
		FOREIGN KEY (
			SHIP_COMPANY_NAME
		)
		REFERENCES SHIP_COMPANY (
			SHIP_COMPANY_NAME
		);

ALTER TABLE DESIGN
	ADD
		CONSTRAINT FK_DE_MEMBER
		FOREIGN KEY (
			MEMBER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE PART_SET
	ADD
		CONSTRAINT FK_PSET_DESIGN
		FOREIGN KEY (
			DESIGN_CODE
		)
		REFERENCES DESIGN (
			DESIGN_CODE
		);

ALTER TABLE PART_SET
	ADD
		CONSTRAINT FK_PSET_PART
		FOREIGN KEY (
			PART_CODE
		)
		REFERENCES PART (
			PART_CODE
		);

ALTER TABLE QA
	ADD
		CONSTRAINT FK_MEMBER_TO_QA
		FOREIGN KEY (
			MEMBER_ID
		)
		REFERENCES MEMBER (
			MEMBER_ID
		);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_PRO_ORDER
		FOREIGN KEY (
			ORDER_CODE
		)
		REFERENCES ORDER_INFO (
			ORDER_CODE
		);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_PRO_DESIGN
		FOREIGN KEY (
			DESIGN_CODE
		)
		REFERENCES DESIGN (
			DESIGN_CODE
		);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_PRO_PART
		FOREIGN KEY (
			PART_CODE
		)
		REFERENCES PART (
			PART_CODE
		);

--ALTER TABLE CATEGORY_RELATION
--	ADD
--		CONSTRAINT FK_CR_CATEGORY
--		FOREIGN KEY (
--			CATEGORY_CODE
--		)
--		REFERENCES CATEGORY (
--			CATEGORY_CODE
--		);
--
--ALTER TABLE CATEGORY_RELATION
--	ADD
--		CONSTRAINT FK_CR_DESIGN
--		FOREIGN KEY (
--			DESIGN_CODE
--		)
--		REFERENCES DESIGN (
--			DESIGN_CODE
--		);
--
--ALTER TABLE CATEGORY_RELATION
--	ADD
--		CONSTRAINT FK_CR_PART
--		FOREIGN KEY (
--			PART_CODE
--		)
--		REFERENCES PART (
--			PART_CODE
--		);
              
              
/* 회원 정보 추가 */
INSERT INTO MEMBER_CLASS VALUES('A','관리자');
INSERT INTO MEMBER_CLASS VALUES('D','디자이너');
INSERT INTO MEMBER_CLASS VALUES('C','소비자');

INSERT INTO MEMBER VALUES('admin','A','admin','관리자',TO_DATE('1999-01-01','RRRR-MM-DD'),
'admin@iei.or.kr','010-1111-2222','10332,서울,강남구 역삼동', SYSDATE, 'default.jpg',
99999,'관리자');
INSERT INTO MEMBER VALUES('design11','D','pass11','유정훈',TO_DATE('1999-02-10','RRRR-MM-DD'),
'aaaa@iei.or.kr','010-2211-1122','30221,서울시,강남구 역삼동', SYSDATE, 'default.jpg',
90000,'유사장');
INSERT INTO MEMBER VALUES('design22','D','pass22','김성권',TO_DATE('2000-03-15','RRRR-MM-DD'),
'ksk8948@iei.or.kr','010-1011-8022','83621,시흥시,OO구 XX동', SYSDATE, 'default.jpg',
99900,'김대리');
INSERT INTO MEMBER VALUES('user11','C','pass11','나상민',TO_DATE('2001-11-20','RRRR-MM-DD'),
'sm9171@iei.or.kr','010-1231-1246','56233,대전시,OO구 XX동', SYSDATE, 'default.jpg',
99000,'나과장');
INSERT INTO MEMBER VALUES('user22','C','pass22','임현상',TO_DATE('2001-06-25','RRRR-MM-DD'),
'cuhpepcekr@iei.or.kr','010-1974-7663','43232,서울,OO구 XX동', SYSDATE, 'default.jpg',
99990,'본부장');
INSERT INTO MEMBER VALUES('user33','C','pass33','정진모',TO_DATE('2002-07-30','RRRR-MM-DD'),
'jjm9290@iei.or.kr','010-7722-3349','97203,서울,OO구 XX동', SYSDATE, 'default.jpg',
99099,'정대리');

/*  Member 분류 에러 테스트
INSERT INTO MEMBER VALUES('test','F','test','TEST',TO_DATE('2002-07-30','RRRR-MM-DD'),
'TEST@iei.or.kr','010-2334-3433','97203,서울,OO구 XX동', SYSDATE, 'default.jpg',
99099,'TEST');
*/
--
--select * from MEMBER_CLASS;
--select * from MEMBER;
--commit;

/* 카테고리 추가 */

/* 카테고리 */
INSERT INTO CATEGORY VALUES('WOOD','목재');
INSERT INTO CATEGORY VALUES('STEEL','철재');
INSERT INTO CATEGORY VALUES('PLASTIC','플라스틱');
INSERT INTO CATEGORY VALUES('ETC','기타');

/* 자재 추가 */

CREATE SEQUENCE SEQ_PART
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;

CREATE SEQUENCE SEQ_DE
       START WITH 1
       INCREMENT BY 1
       MAXVALUE 99
       MINVALUE 0
       NOCACHE
       CYCLE;
       
/* 부품 판매 게시글 */

INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707101335','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 80X50cm','WOOD',TO_DATE('1707101335','RRMMDDHH24MI'),1500,10,'기본 목재 샘플1','default_wood1.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121425','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 120X80cm','WOOD',TO_DATE('1707121425','RRMMDDHH24MI'),1800,15,'기본 목재 샘플2','default_wood2.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121610','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'4x8 시트 플라스틱 골판지','PLASTIC',TO_DATE('1707121635','RRMMDDHH24MI'),20000,120,'플라스틱 자재 샘플1','default_plastic1.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121435','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철채 150X80cm','STEEL',TO_DATE('1707121435','RRMMDDHH24MI'),2000,20,'기본 철재 샘플1','default_steel1.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707131444','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재 180X100cm','STEEL',TO_DATE('1707131444','RRMMDDHH24MI'),2300,5,'기본 철재 샘플2','default_steel2.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121611','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'재활용 플라스틱 콘크리트 자재','PLASTIC',TO_DATE('1707121636','RRMMDDHH24MI'),18000,50,'플라스틱 자재 샘플2','default_plastic2.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707151015','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 150X80cm','WOOD',TO_DATE('1707151015','RRMMDDHH24MI'),2000,20,'기본 목재 샘플3','default_wood3.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707151020','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 180X100cm','WOOD',TO_DATE('1707151020','RRMMDDHH24MI'),2300,5,'기본 목재 샘플4','default_wood4.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121612','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'플라스틱 인조잔디블럭','PLASTIC',TO_DATE('1707121637','RRMMDDHH24MI'),25000,70,'플라스틱 자재 샘플3','default_plastic3.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707151115','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재 150X80cm','STEEL',TO_DATE('1707151115','RRMMDDHH24MI'),2000,20,'기본 철재 샘플3','default_steel3.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707151320','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재 180X100cm','STEEL',TO_DATE('1707151320','RRMMDDHH24MI'),2300,5,'기본 철재 샘플4','default_steel4.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707121614','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'플라스틱 지붕','PLASTIC',TO_DATE('1707121638','RRMMDDHH24MI'),32700,100,'플라스틱 자재 샘플4','default_plastic4.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707170102','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 180X100cm','WOOD',TO_DATE('1707121612','RRMMDDHH24MI'),21230,5,'기본 목재 샘플4','default_wood4.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707170207','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'플라스틱 인조잔디블럭','PLASTIC',TO_DATE('1707121637','RRMMDDHH24MI'),15000,70,'플라스틱 자재 샘플3','default_plastic3.jpg',0);
INSERT INTO PART VALUES('PA'||TO_CHAR(TO_DATE('1707170738','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재 150X80cm','STEEL',TO_DATE('1707170738','RRMMDDHH24MI'),22000,20,'기본 철재 샘플3','default_steel3.jpg',0);

/* 디자인 판매 게시글 */
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707101335','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(0,2,'0'),'목재서랍장1','WOOD',TO_DATE('1707101335','RRMMDDHH24MI'),'목재 서랍장1입니다.',15000,'default_design1.jpg','design11',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707121425','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재서랍장2','WOOD',TO_DATE('1707121425','RRMMDDHH24MI'),'목재 서랍장2입니다.',10000,'default_design2.jpg','design11',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707121435','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재서랍장1','STEEL',TO_DATE('1707121435','RRMMDDHH24MI'),'철재 서랍장1입니다.',20000,'default_design3.jpg','design22',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707131444','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재서랍장2','STEEL',TO_DATE('1707131444','RRMMDDHH24MI'),'철재 서랍장2입니다.',35000,'default_design4.jpg','design22',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707140240','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'통나무 양초 틀','WOOD',TO_DATE('1707140240','RRMMDDHH24MI'),'통나무 양초 틀입니다. 완제품 주문시 말씀하시면 원하시는 사이즈로 제단하여 배송드립니다.',47000,'default_design5.jpg','design22',3);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707131025','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 조명틀','WOOD',TO_DATE('1707131025','RRMMDDHH24MI'),'심심하지 않은 목재 조명틀입니다.',26500,'default_design6.jpg','design11',5);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707131120','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재 컵 받침대','WOOD',TO_DATE('1707131120','RRMMDDHH24MI'),'친환경 목재 컵 받침대! 깨질 염려는 이제 그만!!',12000,'default_design7.jpg','design22',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707130623','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'패트병 간편 정리함','PLASTIC',TO_DATE('1707130623','RRMMDDHH24MI'),'아이들의 조그만 장남감을 담을 수 있는 간편 정리함입니다.',10000,'default_design8.jpg','design11',2);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707142040','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'패트병 화분','PLASTIC',TO_DATE('1707142040','RRMMDDHH24MI'),'여러분이 쓰레기라고 생각하시는 패트병으로 이런 화분을 만들 수 있어요!!.',12500,'default_design9.jpg','design22',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707140505','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'새모이 틀','PLASTIC',TO_DATE('1707140505','RRMMDDHH24MI'),'새를 좋아하신다구요? 그런 분들을 위해 소개합니다. 친환경 새 모이 통!',20000,'default_design10.jpg','design11',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707131410','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재 그릴판','STEEL',TO_DATE('1707131410','RRMMDDHH24MI'),'더이상 그릴판을 사러 다니지 마세요!',45000,'default_design11.jpg','design22',1);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707151430','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'철재캠프파이어화덕','STEEL',TO_DATE('1707151430','RRMMDDHH24MI'),'역시 캠프하면 캠프파이어죠!! 화재는 책임 못집니다.',63000,'default_design12.jpg','design11',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707151447','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재n철재 책상','ETC',TO_DATE('1707151447','RRMMDDHH24MI'),'철재와 목재로 친환경 책상을 만듭니다, 완제품 구매시엔 원하시는 사이즈를 말씀하세요.',75000,'default_design13.jpg','design22',0);
INSERT INTO DESIGN VALUES('DE'||TO_CHAR(TO_DATE('1707131750','RRMMDDHH24MI'),'RRMMDDHH24MI')||LPAD(1,2,'0'),'목재n철재 탁자','ETC',TO_DATE('1707131750','RRMMDDHH24MI'),'정원에 이런 탁자, 다들 하나쯤은 있지 않나요?',59000,'default_design14.jpg','design11',0);

--SELECT * FROM CATEGORY;
--SELECT * FROM PART;
--SELECT * FROM DESIGN;

INSERT INTO PART_SET VALUES('DE170710133500','PA170710133501',1);
INSERT INTO PART_SET VALUES('DE170710133500','PA170715101501',2);

--SELECT * FROM PART_SET;
--
--SELECT SUM(QUANTITY*(CEIL(PART_PRICE*90)*0.01)) "RESULT" FROM DESIGN
--JOIN PART_SET USING(DESIGN_CODE)
--JOIN PART USING(PART_CODE);
--
--SELECT SUM(QUANTITY*CEIL(PART_PRICE)) FROM DESIGN
--JOIN PART_SET USING(DESIGN_CODE)
--JOIN PART USING(PART_CODE);
--
--SELECT SUM(PART_PRICE)*0.9 FROM PART;

COMMIT;

------------------------
 ---- CREATE VIEW 로 구현할 예정 ---
/* 수익 통계 전용 쿼리 기입부; 구현 필요 */
  -- 회원ID (디자이너별 확인을 위함)
  -- 월 별 수익 (최근 3개월)
  -- 년 별 수익
  -- 최다 판매 상품
  
/* TOP3 Item 추출 쿼리 기입부; 구현 필요 */

/* 테이블 정의서 추출 쿼리 */
SELECT a.TABLE_NAME, c.COMMENTS, a.COLUMN_NAME, b.COMMENTS, a.DATA_TYPE, a.DATA_LENGTH, a.NULLABLE
FROM  USER_TAB_COLUMNS a, USER_COL_COMMENTS b, USER_TAB_COMMENTS c
where a.TABLE_NAME=b.TABLE_NAME
    and b.TABLE_NAME=c.TABLE_NAME
    and a.COLUMN_NAME=b.COLUMN_NAME
order by a.TABLE_NAME,a.COLUMN_ID;