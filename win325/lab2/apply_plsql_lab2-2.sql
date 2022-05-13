/*
||  Name:          apply_plsql_lab2-2.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 3 lab.
*/

-- Enter your solution here.
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

QUIT
