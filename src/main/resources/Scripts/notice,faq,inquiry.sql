CREATE TABLE NOTICE(
 NOTICE_NO NUMBER PRIMARY KEY,
 NOTICE_CATEGORY VARCHAR2(50) NOT NULL CHECK(NOTICE_CATEGORY IN('굿즈','일반','행사')),
 NOTICE_TITLE VARCHAR2(100) NOT NULL,
 NOTICE_CONTENT VARCHAR2(2000),
 NOTICE_DATE DATE DEFAULT SYSDATE
);

INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,'굿즈','BTS굿즈판매','FEQFWEERIGOPJEGPIORGP',DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,'일반','KUPID 업데이트 8/1','IGOPJEGPIORGP',DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,'행사','5/12SE','AFFWEERIGOPJEGPIORGP',DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,'일반','KUPID 업데이트 8/1','FIORGP',DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL,'굿즈','BTS굿즈판매','WEERIGOPJEGPIORGP',DEFAULT);

CREATE SEQUENCE SEQ_NOTICE;
DROP TABLE NOTICE;


--faq
CREATE TABLE FAQ(
 FAQ_NO NUMBER PRIMARY KEY,
 FAQ_CATEGORY VARCHAR2(50) NOT NULL CHECK(FAQ_CATEGORY IN('회원','상점','커뮤니티')),
 FAQ_TITLE VARCHAR2(100) NOT NULL,
 FAQ_CONTENT VARCHAR2(1000),
 FAQ_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_FAQ;

INSERT INTO FAQ VALUES(SEQ_FAQ.NEXTVAL,'회원','로그인이안돼요','WEERIGOPJEGPIORGP',DEFAULT);
INSERT INTO FAQ VALUES(SEQ_FAQ.NEXTVAL,'상점','구매가 안돼요','EERIGEGPIORGP',DEFAULT);
INSERT INTO FAQ VALUES(SEQ_FAQ.NEXTVAL,'커뮤니티','삭제는 어떻게 하나','GOPJEGPIORGP',DEFAULT);

SELECT * FROM FAQ;


ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER semi IDENTIFIED BY semi DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

GRANT CONNECT,RESOURCE TO semi;

SELECT * FROM NOTICE;


--문의
CREATE TABLE INQUIRY(
 INQ_NO NUMBER PRIMARY KEY,
 INQ_MEMBER VARCHAR2(20) NOT NULL REFERENCES MEMBER(MEMBER_ID),
 INQ_TITLE VARCHAR2(100) NOT NULL,
 INQ_CONTENT VARCHAR2(1000),
 INQ_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_INQUIRY;
DROP TABLE INQUIRY;

INSERT INTO INQUIRY VALUES(SEQ_INQUIRY.NEXTVAL,'abcde','삭제가 하는 방법','GOPJEGPIORGP',DEFAULT);
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY.NEXTVAL,'qwerty','탈퇴가 안 ','gbeafafOafsdaP',DEFAULT);
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY.NEXTVAL,'hihiroo','가격이 얼마인가요','굿즈asdasd',DEFAULT);