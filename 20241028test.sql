CREATE or REPLACE FUNCTION get_odd_even(n in NUMBER)
RETURN VARCHAR2
IS
  msg VARCHAR2;
BEGIN
  if n = 0 THEN
    msg := '0입니다.';
  elsif mod(n, 2) = 0 THEN
    msg := '짝수입니다.'
  else 
    msg := '홀수입니다.';
  if END;
  RETURN msg;
END;

