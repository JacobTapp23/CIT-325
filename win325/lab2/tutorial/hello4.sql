declare
  input     VARCHAR2(400);
  assigned  VARCHAR2(10);
begin
  input := '&1';
  assigned := input;
  dbms_output.put_line('Hello ['||assigned||']!');
end;
/
