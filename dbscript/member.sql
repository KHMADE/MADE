-- member.sql
-- 이클립스에서 연동 시 Alt + X 키가 실행!!

create table member(
ID	VARCHAR2(15 BYTE) Primary Key,
PASSWD	VARCHAR2(15 BYTE) NOT NULL,
NAME	VARCHAR2(20 BYTE) NOT NULL,
EMAIL	VARCHAR2(30 BYTE),
GENDER	CHAR(1 BYTE) CHECK(GENDER IN('M','F')),
AGE	NUMBER,
PHONE	VARCHAR2(13 BYTE),
ADDRESS	VARCHAR2(50 BYTE),
ENROLL_DATE	DATE default sysdate
);

DROP TABLE MEMBER;

insert into MEMBER
values('admin','admin','관리자','admin@iei.or.kr','M',33,'010-7777-8888','2323,서울,강남구',
	to_date('2012-01-23','RRRR-MM-DD'));
	
insert into MEMBER
values('user11','pass11','신사임당','sinsa@iei.or.kr','F',27,'010-7777-8888','2412,서울,강남구',
	to_date('2012-01-23','RRRR-MM-DD'));

insert into MEMBER
values('user22','pass22','이순신','leeshun@iei.or.kr','M',29,'010-7777-8888','3322,서울,강남구',
	to_date('2012-01-23','RRRR-MM-DD'));

insert into MEMBER
values('user33','pass33','홍삼남','hong@iei.or.kr','M',30,'010-7777-8888','3321,서울,강남구',
	to_date('2012-01-23','RRRR-MM-DD'));

SELECT * FROM MEMBER;

--delete from member where ID IN ('admin2', 'admin3');


commit;
