DROP TABLE days;
DROP TABLE verse;

SET SERVEROUTPUT ON SIZE UNLIMITED
DECLARE
  TYPE day_tab IS TABLE OF VARCHAR2(8);
  TYPE verse_tab IS TABLE OF VARCHAR2(28);

  days DAY_TAB 
    := day_tab('first','second','third','fourth'
              ,'fifth','sixth','seventh','eighth'
              ,'nineth','tenth','eleventh','twelveth');

  verse VERSE_TAB
    :=  verse_tab('partridge in a pear tree.'
                 ,'Two turtle doves,'
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
  FOR i IN 1..days.COUNT LOOP
    dbms_output.put_line('On the '||days(i)||' day of Christmas my true love sent to me');
    FOR j IN REVERSE 1..i LOOP
      IF (j > 1) THEN
        dbms_output.put_line('- '||verse(j));
      ELSIF (i = j) THEN
        dbms_output.put_line('- A '||verse(j));
      ELSE
        dbms_output.put_line('- and a '||verse(j));
      END IF;
    END LOOP;
  END LOOP;
END;
/





