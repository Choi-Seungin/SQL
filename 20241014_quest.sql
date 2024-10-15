-- 제품 테이블
-- 샘플데이터 50건
-- 제품 번호, 제품 명, 제조사 번호, 금액
CREATE TABLE PRODUCT(
	PRODUCT_ID CHAR(11),
	PRODUCT_NAME VARCHAR(30),
	MANUFACTURER_ID CHAR(5),
	PRICE NUMBER(10)
);

DROP TABLE PRODUCT;
-- 제조사 테이블
-- 샘플데이터 5건
-- 제조사 번호, 제조사 명
CREATE TABLE SUPPLIER(
	SUP_ID CHAR(5),
	SUP_NAME VARCHAR(30)
);
DROP TABLE SUPPLIER;

INSERT ALL 
	INTO SUPPLIER(SUP_ID, SUP_NAME) VALUES('A1', 'Apple')
	INTO SUPPLIER(SUP_ID, SUP_NAME) VALUES('B2', 'Samsung')
	INTO SUPPLIER(SUP_ID, SUP_NAME) VALUES('C3', 'Sony')
	INTO SUPPLIER(SUP_ID, SUP_NAME) VALUES('D4', 'LG')
	INTO SUPPLIER(SUP_ID, SUP_NAME) VALUES('E5', 'Huawei')
SELECT * FROM DUAL;

TRUNCATE TABLE SUPPLIER;

SELECT ROWNUM, P.* FROM PRODUCT P;

UPDATE PRODUCT SET