set serveroutput on size unlimited
declare
  input     VARCHAR2(400);
  assigned  VARCHAR2(10);
begin
  input := '&1';
  IF LENGTH(input) > 10 THEN
    assigned := SUBSTR(input,1,10);
  ELSE
    assigned := input;
  END IF;
  dbms_output.put_line('Hello ['||assigned||']!');
end;
/
quit;
