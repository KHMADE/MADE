-- member.sql
-- 이클립스에서 연동 시 Alt + X 키가 실행!!
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

select * from MEMBER_CLASS;
select * from MEMBER;
commit;
