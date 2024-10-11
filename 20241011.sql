-- 사원 정보
-- 사번, 이름, 직급명, 부서명, 연봉, 입사일
CREATE TABLE EMPLOYEE(
	EMP_NO CHAR(9) PRIMARY KEY,
	EMP_NAME VARCHAR2(30),
	EMP_POSITION VARCHAR2(30) DEFAULT '사원' NOT NULL,
	EMP_DEPARTMENT VARCHAR2(30),
	EMP_SALARY NUMBER(12) DEFAULT 0,
	EMP_COURSE_DATE DATE DEFAULT SYSDATE
);
-- 사원정보 샘플데이터 50건 저장
-- CSV로 만들어서 저장

-- DML(Data Manipulation Language) : 데이터 조작어
-- 데이터를 조회, 삭제, 수정, 추가
-- SELECT, DELETE, UPDATE, INSERT

CREATE TABLE PERSON(
	PNAME VARCHAR2(30),
	PAGE NUMBER(3)
);

DROP TABLE PERSON;
-- INSERT : 추가
-- INSERT INTO 테이블명(컬럼1, 컬럼2, 컬럼3...) VALUES(데이터1, 데이터2, 데이터3...)
-- INSERT INTO 테이블명 VALUES(데이터1, 데이터2, 데이터3...)
-- 테이블 생성 시 만든 모든 컬럼에 데이터를 저장, 데이터 순서는 CREATE 작성 시 만든 컬럼의 순서대로 작성

-- PERSON 테이블에 데이터 추가
INSERT INTO PERSON(PNAME, PAGE) VALUES('김철수', 32);
INSERT INTO PERSON VALUES('이영희', 29);

--PERSON 데이터 5건 추가
INSERT ALL
	INTO PERSON(PNAME, PAGE) VALUES('이수영', 28)
	INTO PERSON(PNAME, PAGE) VALUES('박민수', 45)
	INTO PERSON(PNAME, PAGE) VALUES('최지혜', 37)
	INTO PERSON(PNAME, PAGE) VALUES('정호석', 29)
	INTO PERSON(PNAME, PAGE) VALUES('조하늘', 31)
SELECT * FROM DUAL;

TRUNCATE TABLE PERSON;

-- 학생데이터 한건 추가하는 INSERT문 작성
INSERT INTO STUDENT VALUES('20230051','최승인','게임기획',3.2);
-- 사원정보 1건 등록하는 INSERT문 작성 - 입사일 제외하고 추가
INSERT INTO EMPLOYEE(EMP_NO,EMP_NAME,EMP_POSITION,EMP_DEPARTMENT,EMP_SALARY) VALUES('A20241011','최승인','사원','IT부',45000000);
-- 사원정보 1건 등록하는 INSERT문 작성 - 모든 항목 추가
INSERT INTO EMPLOYEE VALUES('A20241012','유다희','대리','총무부',64000000,'2024-10-11');

-- 데이터 조회 : SELECT
-- SELECT 조회할 컬럼1, 조회할 컬럼2, ...
-- FORM 조회할 테이블1, 조회할 테이블2, ...
-- WHERE 조건절
-- GROUP BY 그룹으로 묶을 컬럼1, 그룹으로 묶을 컬럼2, ... [HAVING 조건절]
-- ORDER BY 정렬할 기준 컬럼 [ASC | DESC], 정렬할 기준 컬럼2, ...

-- 전체 PERSON 데이터 조회
SELECT * FROM PERSON;
SELECT PNAME, PAGE FROM PERSON;

-- AS 해당 컬럼의 별칭을 지정함, 함수나 수식을 감추기 위해서
SELECT PNAME AS 이름, PAGE AS 나이 FROM PERSON;
SELECT PNAME, LENGTH(PNAME) AS PNAME_LENGTH FROM PERSON;

-- 학생 테이블에서 학과명만 조회
-- DISTINCT : 중복된 내용 제거해서 조회
SELECT DISTINCT MAJOR_NAME FROM STUDENT;



