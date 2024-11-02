CREATE TABLE REPORT(
	REPORT_NO NUMBER PRIMARY KEY,
	REPORTING_MEMBER REFERENCES MEMBER(MEMBER_NO),
	REPORTED_MEMBER REFERENCES MEMBER(MEMBER_NO),
	REPORT_CATEGORY VARCHAR2(50) NOT NULL,
	REPORT_CONTENT VARCHAR2(1000),
	REPORT_DATE DATE DEFAULT SYSDATE,
	REPORT_END_DATE DATE,
	REPORT_RESULT VARCHAR2(100),
	REPORT_RESOURCE VARCHAR2(500)
);

CREATE SEQUENCE SEQ_REPORT;



INSERT INTO REPORT VALUES(SEQ_REPORT.NEXTVAL,4,5,'욕설','욕설이 심해요',DEFAULT,'2024-05-22','REPORT.JPG');


CREATE TABLE PENALTY(
	PENALTY_NO NUMBER PRIMARY KEY,
	REPORT_NO REFERENCES REPORT(REPORT_NO),
	MEMBER_NO REFERENCES MEMBER(MEMBER_NO),
	PENALTY_CATEGORY VARCHAR2(30) CHECK (PENALTY_CATEGORY IN('stop','unactive','pass')),
	PENALTY_START_DATE DATE DEFAULT SYSDATE,
	PENALTY_END_DATE DATE
);

DROP TABLE PENALTY;


CREATE SEQUENCE SEQ_PENALTY;