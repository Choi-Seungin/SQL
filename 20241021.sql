-- INDEX
-- 테이블에 있는 데이터를 빠르게 검색하기 위한 용도로 나온 데이터베이스 객체
-- 테이블에 하나 이상의 컬럼으로 인덱스를 만들 수 있음
-- 오라클에서는 기본적으로 테이블 기본키로 인덱스가 설정되어 있음
-- 생성한 모든 인덱스 개체 조회
SELECT * FROM USER_INDEXES;

-- CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명(컬럼1,컬럼2...)
-- PERSON 테이블에 사람이름으로 인덱스 지정
CREATE INDEX PERSON_PNAME_IDX ON PERSON(PNAME);
CREATE UNIQUE INDEX PERSON_PNAME_IDX ON PERSON(PNAME);
INSERT INTO PERSON VALUES('0003','홍길동',33);
SELECT * FROM PERSON;

-- 인덱스 삭제
DROP INDEX PERSON_PNAME_IDX;

-- 리빌딩 작업
-- 데이터를 추가 삭제 수정등의 작업을 하다보면 트리가 한쪽으로 치우쳐지는 현상이 나기 때문에 리빌딩 필요
ALTER INDEX PERSON_PNAME_IDX REBUILD;

CREATE INDEX CAR_SELL_DATE_IDX ON CAR_SELL(CAR_SELL_DATE);

-- 사원 테이블에서 이름, 직급, 부서 인덱스를 적용
CREATE INDEX EMPLOYEE_IDX ON EMPLOYEE(EMP_NAME, POS_NO, DEPT_NO);

-- SEQUENCE(시퀸스)
-- 자동으로 증가하는 순번을 반환하는 데이터베이스 객체
CREATE SEQUENCE NO_SEQ;
DROP SEQUENCE NO_SEQ;
SELECT NO_SEQ.NEXTVAL FROM DUAL;
SELECT NO_SEQ.CURRVAL FROM DUAL;

CREATE SEQUENCE TEST_SEQ 
INCREMENT BY 2
START WITH 5
MINVALUE 4
MAXVALUE 10
CYCLE -- NOCYCLE
CACHE 2; --NOCACHE

DROP SEQUENCE TEST_SEQ;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;

CREATE SEQUENCE TEST_SEQ 
INCREMENT BY 2
START WITH 5
NOMINVALUE 
NOMAXVALUE
NOCYCLE
NOCACHE;
DROP SEQUENCE TEST_SEQ;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;

-- 생성한 시퀸스 목록을 조회
SELECT * FROM USER_SEQUENCES;

-- 문제1 조건
-- 시퀸스 이름 : SEQ_EMP_ID, 시작 값 : 1, 최대 값 : 9999, 증가 값 : 1, 캐시 값 : 20 
CREATE SEQUENCE SEQ_EMP_ID
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
CACHE 20;
SELECT SEQ_EMP_ID.NEXTVAL FROM DUAL;
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE SEQ_DEPT_ID
START WITH 100
MAXVALUE 110
MINVALUE 100
INCREMENT BY 1
CYCLE
NOCACHE;
DROP SEQUENCE SEQ_DEPT_ID;

CREATE SEQUENCE SEQ_ORDER_NO
START WITH 1000
MAXVALUE 2000
MINVALUE 500
INCREMENT BY -10;

DROP SEQUENCE SEQ_ORDER_NO;

-- VIEW(뷰)
-- SQL에 하나 이상의 테이블 조회 결과를 저장한 가상 테이블, 스토리지 용량 X
-- 실제 데이터를 저장하지 않고, 쿼리의 결과를 미리 정의해 두어 필요할때 재사용
-- CREATE OR REPLACE VIEW 뷰이름 AS 조회할 SQL문(SELECT문);

-- 뷰 생성 권한
GRANT CREATE VIEW TO C##CHOI;
-- 관리자 권한
-- GRANT DBA TO 사용자명;

-- 학생 정보 조회, 학번, 이름, 학과명, 평점, 성별 조회하는 조회문 작성
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER 
FROM STUDENT s JOIN MAJOR m ON S.MAJOR_NO = M.MAJOR_NO;

-- 위의 조회문을 뷰로 만듦
CREATE OR REPLACE VIEW STUDENT_VIEW
AS
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE, S.STD_GENDER 
FROM STUDENT s JOIN MAJOR m ON S.MAJOR_NO = M.MAJOR_NO;

SELECT * FROM STUDENT_VIEW;

-- 성별 컬럼은 제거 후 뷰로 생성
CREATE OR REPLACE VIEW STUDENT_VIEW
AS
SELECT S.STD_NO, S.STD_NAME, M.MAJOR_NAME, S.STD_SCORE
FROM STUDENT s JOIN MAJOR m ON S.MAJOR_NO = M.MAJOR_NO;

-- 학과별 인원수
SELECT 
	MAJOR_NAME, COUNT(*)
FROM STUDENT_VIEW
GROUP BY MAJOR_NAME;

-- 장학금을 받는 학생들의 정보를 저장하는 뷰 생성
-- 장학금 번호, 금액, 학번, 이름, 학과명, 성별, 평점
CREATE OR REPLACE
VIEW STUDENT_SCHOLARSHIP_VIEW
AS
SELECT
	SS.SCHOLARSHIP_NO,
	SS.MONEY,
	S.STD_NO,
	S.STD_NAME,
	M.MAJOR_NAME,
	S.STD_GENDER,
	S.STD_SCORE
FROM
	STUDENT S
JOIN STUDENT_SCHOLARSHIP SS ON
	S.STD_NO = SS.STD_NO
JOIN MAJOR M ON
	S.MAJOR_NO = M.MAJOR_NO
ORDER BY SS.SCHOLARSHIP_NO DESC;

SELECT
	*
FROM
	STUDENT_SCHOLARSHIP_VIEW;





