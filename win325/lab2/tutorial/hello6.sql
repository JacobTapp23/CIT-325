set serveroutput on size unlimited
declare
  input     VARCHAR2(400);
  assigned  VARCHAR2(10);
begin
  input := '&1';
  IF LENGTH(input) > 10 THEN
    assigned := SUBSTR(input,1,10);
  ELSIF LENGTH(input) > 0 THEN
    assigned := input;
  END IF;
  IF assigned IS NOT NULL THEN
    dbms_output.put_line('Hello '||assigned||'!');
  ELSE
    dbms_output.put_line('Hello World!');
  END IF;
end;
/
quit;
