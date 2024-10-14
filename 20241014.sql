-- 데이터 수정 : UPDATE
-- UPDATE 테이블명 SET 수정할컬럼명 = 수정할 값,... WHERE 조건절
-- + - * / 

-- PERSON 테이블의 데이터 중 20세 미만인 데이터는 나이를 99로 수정
UPDATE PERSON SET PAGE = 99 WHERE PAGE < 20;

SELECT * FROM PERSON;

-- PERSON 테이블의 데이터 중 30세 미만인 데이터의 나이를 현재 값에 5씩 감소시켜 저장
UPDATE PERSON SET PAGE = PAGE - 5 WHERE  PAGE < 30;

-- 학생 데이터 중 점수 1.5 미만이면 이름을 제적으로 수정
UPDATE STUDENT SET STD_NEW_NAME = '제적' WHERE STD_SCORE < 1.5;

-- 데이터 삭제 : DELETE
-- DELETE FROM 테이블명 WHERE 조건절
-- PERSON 테이블의 데이터 중 나이가 99세는 전부 삭제
DELETE FROM PERSON WHERE PAGE LIKE 99;

CREATE TABLE CAR(
    CAR_ID CHAR(10), --> A000000000
    CAR_NAME VARCHAR2(30),
    CAR_MAKER VARCHAR2(30),
    CAR_MAKE_YEAR NUMBER(4),
    CAR_PRICE NUMBER(5)
);

SELECT * FROM CAR;
TRUNCATE TABLE CAR;





