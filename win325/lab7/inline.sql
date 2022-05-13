DROP TABLE a;
DROP SEQUENCE a_s;
DROP TABLE b;
DROP SEQUENCE b_s;
DROP PROCEDURE tester;

CREATE TABLE a
( a_id    NUMBER
, cat     VARCHAR2(20));

CREATE SEQUENCE a_s;

CREATE TABLE b
( b_id    NUMBER
, a_id    NUMBER
, thing   VARCHAR2(20));

CREATE SEQUENCE b_s;

DROP TABLE log;
CREATE TABLE log
( time      DATE
, msg       VARCHAR2(100));

CREATE PROCEDURE tester
( pv_cat     VARCHAR2
, pv_thing   VARCHAR2 ) IS

BEGIN
  dbms_output.put_line('This is a test ['||pv_cat||']['||pv_thing||'].');
END;
/

LIST
SHOW ERRORS
DECLARE
  c number;
  x number;
BEGIN 
  insert into log values (sysdate, 'Before ...');
  tester('Cat in the hat.','Thing 1');
  for i in 1..10000000 LOOP
    x := POWER(x,2);
    c := i;
  end loop;
  insert into log values (sysdate, '['||c||']['||x||']');
  insert into log values (sysdate, 'After ...');
END;
/

CREATE OR REPLACE PROCEDURE tester
( pv_cat     VARCHAR2
, pv_thing   VARCHAR2 ) IS

  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  insert into log values
 (sysdate, 'This is a test ['||pv_cat||']['||pv_thing||'].');
  commit;
END;
/

BEGIN 
  dbms_output.put_line('Before ...');
  tester('Cat in the hat.','Thing 1');
  dbms_output.put_line('After ...');
END;
/

SELECT TO_CHAR(time,'DD-MON-RR HH24:MI:SSSS')
,      msg
FROM   log;
