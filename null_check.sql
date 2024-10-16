CREATE TABLE TEMP_TABLE(
    NO VARCHAR2(2),
    VAL NUMBER(3)
);

INSERT INTO TEMP_TABLE VALUES('01',100);
INSERT INTO TEMP_TABLE VALUES('02',100);
INSERT INTO TEMP_TABLE VALUES('03',100);
INSERT INTO TEMP_TABLE VALUES('01',200);
INSERT INTO TEMP_TABLE VALUES('02',NULL);
INSERT INTO TEMP_TABLE VALUES('03',200);
INSERT INTO TEMP_TABLE VALUES('01',300);
INSERT INTO TEMP_TABLE VALUES('02',300);
INSERT INTO TEMP_TABLE VALUES('03',300);

SELECT NO, COUNT(*), SUM(VAL), AVG(VAL), MAX(VAL), MIN(VAL) FROM TEMP_TABLE GROUP BY NO;
SELECT NO, COUNT(VAL), SUM(VAL), AVG(VAL), MAX(VAL), MIN(VAL) FROM TEMP_TABLE GROUP BY NO;
SELECT NO, COUNT(*), SUM(VAL), AVG(NVL(VAL,0)), MAX(VAL), MIN(VAL) FROM TEMP_TABLE GROUP BY NO;