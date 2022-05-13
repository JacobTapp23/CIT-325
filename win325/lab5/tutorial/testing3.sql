DROP TABLE days;
CREATE TABLE days
( ind NUMBER
, day VARCHAR2(8));

INSERT INTO days
VALUES (1,'first');
INSERT INTO days
VALUES (2,'second');
INSERT INTO days
VALUES (3,'third');
INSERT INTO days
VALUES (4,'fourth');
INSERT INTO days
VALUES (5,'fifth');
INSERT INTO days
VALUES (6,'sixth');
INSERT INTO days
VALUES (7,'seventh');
INSERT INTO days
VALUES (8,'eighth');
INSERT INTO days
VALUES (9,'nineth');
INSERT INTO days
VALUES (10,'tenth');
INSERT INTO days
VALUES (11,'eleventh');
INSERT INTO days
VALUES (12,'twelveth');

DROP TABLE verse;
CREATE TABLE verse
( ind  NUMBER
, text  VARCHAR2(28));

DECLARE
  TYPE verse_tab IS TABLE OF VARCHAR2(28);

  lv_verse VERSE_TAB := verse_tab(
	       'Partridge in a pear tree,'
	      ,'Two Tutle Doves,'
              ,'Three French hens,'
              ,'Four calling birds,'
              ,'Five gold rings,'
              ,'Six geese a-laying,'
              ,'Seven swans a-swimming,'
              ,'Eight maids a-milking,'
              ,'Nine ladies dancing,'
              ,'Tenth lords a-leaping,'
              ,'Eleven pipers piping,'
              ,'Twelve drummers drumming,');
BEGIN
  FOR i IN 1..lv_verse.COUNT LOOP
    INSERT INTO verse VALUES (i,lv_verse(i));
  END LOOP;
END;
/

DECLARE
  CURSOR d IS
    SELECT * FROM days;
  CURSOR v IS
    SELECT * FROM verse;
  FUNCTION get_verse (pv_ind number) return varchar2 IS
    retval  VARCHAR2(28);
  BEGIN
    SELECT  text
    INTO    retval
    FROM    verse
    WHERE   ind = pv_ind;
    RETURN retval;
  END get_verse;
BEGIN
  FOR i in d LOOP
  /* i.ind 
     i.day */
    dbms_output.put_line('[index]['||i.ind||'][value]['||i.day||']');
    FOR j IN REVERSE 1..i.ind LOOP
      dbms_output.put_line('['||i.ind||']['||get_verse(j)||']');
    END LOOP;
  END LOOP;
END;
/




