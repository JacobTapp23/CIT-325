set serveroutput on size unlimited
declare
  theWord     VARCHAR2(400);
  loutput  VARCHAR2(10);
begin
  theWord := '&1';
  IF theWord IS NULL THEN
  theWord := 'World';
  END IF;
  IF LENGTH(theWord) > 10 THEN
    loutput := SUBSTR(theWord,1,10);
  ELSE
    loutput := theWord;
  END IF;
  dbms_output.put_line('Hello ['||loutput||']!');
end;
/
