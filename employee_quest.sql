CREATE TABLE EMPLOYEE(
	EMP_NO CHAR(9) PRIMARY KEY,
	EMP_NAME VARCHAR2(50),
	POS_NO CHAR(2),
	DEPT_NO CHAR(4),
	EMP_SALARY NUMBER(12),
	EMP_COURSE_DATE DATE DEFAULT SYSDATE
);

CREATE TABLE EMP_POSITION(
	POS_NO CHAR(2) PRIMARY KEY,
	POS_NAME VARCHAR2(50)
);

CREATE TABLE EMP_DEPARTMENT(
	DEPT_NO CHAR(4) PRIMARY KEY,
	DEPT_NAME VARCHAR2(50)
);

--문제
--각 사원의 이름, 부서명, 직급명을 조회하는 SQL 문을 작성하세요.
SELECT E.EMP_NAME, ED.DEPT_NAME, EP.POS_NAME 
FROM EMPLOYEE E JOIN EMP_DEPARTMENT ED ON E.DEPT_NO = ED.DEPT_NO
JOIN EMP_POSITION EP ON E.POS_NO = EP.POS_NO;

--각 부서별로 평균 연봉을 계산하여 부서명과 평균 연봉을 조회하는 SQL 문을 작성하세요. 평균 연봉은 내림차순으로 정렬하세요.
SELECT ED.DEPT_NAME, TRUNC(AVG(E.EMP_SALARY),0) 
FROM EMPLOYEE E JOIN EMP_DEPARTMENT ED ON E.DEPT_NO = ED.DEPT_NO
GROUP BY ED.DEPT_NAME
ORDER BY TRUNC(AVG(E.EMP_SALARY),0) DESC;

--사원들의 연봉 순위(RANK)를 구하고, 사원 이름, 연봉, 연봉 순위를 조회하는 SQL 문을 작성하세요. 동일한 연봉일 경우 동일한 순위를 부여하며, 연봉은 내림차순으로 정렬하세요.
SELECT RANK() OVER(ORDER BY EMP_SALARY DESC), E.* FROM EMPLOYEE E;

--새로운 부서 '홍보부'를 부서 번호 'D009'로 EMP_DEPARTMENT 테이블에 추가하는 SQL 문을 작성하세요.
INSERT INTO EMP_DEPARTMENT(DEPT_NO, DEPT_NAME) VALUES('D009', '홍보부');

--사번이 'A20201111'인 사원의 연봉을 10% 인상하는 SQL 문을 작성하세요.
UPDATE EMPLOYEE SET EMP_SALARY = EMP_SALARY * 1.10 WHERE EMP_NO = 'A20201111';

--직급 번호가 '08'인 사원들을 EMPLOYEE 테이블에서 삭제하는 SQL 문을 작성하세요.
DELETE FROM EMPLOYEE WHERE POS_NO = '08';

--각 직급별로 사원 수를 계산하여 직급명과 사원 수를 조회하는 SQL 문을 작성하세요. 사원 수는 내림차순으로 정렬하세요.
SELECT EP.POS_NAME, COUNT(*) 
FROM EMPLOYEE E JOIN EMP_POSITION EP ON E.POS_NO = EP.POS_NO
GROUP BY EP.POS_NAME;

--각 부서별로 사원 수를 계산하여 부서명과 사원 수와 순위를 조회하는 SQL 문을 작성하세요. 사원 수는 내림차순으로 정렬하세요.
SELECT ED.DEPT_NAME, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS RANK_COUNT, COUNT(*) AS COUNT 
FROM EMPLOYEE e JOIN EMP_DEPARTMENT ed ON E.DEPT_NO = ED.DEPT_NO
GROUP BY ED.DEPT_NAME 
ORDER BY COUNT(*) DESC;

--각 부서별로 연봉을 합산하여 부서별 연봉 순위와 부서명, 연봉 총합을 조회하는 SQL문을 작성하세요.
SELECT ED.DEPT_NAME, DENSE_RANK() OVER(ORDER BY SUM(EMP_SALARY) DESC) AS RANK, SUM(EMP_SALARY) AS TOTAL_SALARY 
FROM EMPLOYEE e JOIN EMP_DEPARTMENT ed ON E.DEPT_NO = ED.DEPT_NO
GROUP BY ED.DEPT_NAME 

