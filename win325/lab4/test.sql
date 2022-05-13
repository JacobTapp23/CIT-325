SET SERVEROUTPUT ON SIZE UNLIMITED

DECLARE
  /* Declare an array of days and gifts. */
  TYPE days IS TABLE OF VARCHAR2(8);
  TYPE gifts IS TABLE OF lyric;

  COUNTER NUMBER := 0;

  /* Initialize the collection of days. */
  lv_days DAYS := days( 'first', 'second', 'third', 'fourth'
                      , 'fifth', 'sixth', 'seventh', 'eighth'
                      , 'nineth', 'tenth', 'eleventh', 'twelfth');

  /* Initialize the collection of lyrics. */
  lv_gifts GIFTS := gifts( lyric('and a', 'Partridge in a pear tree')
                         , lyric('Two', 'Turtle doves')
                         , lyric('Three', 'French hens')
                         , lyric('Four', 'Calling birds')
                         , lyric('Five', 'Golden rings' )
                         , lyric('Six', 'Geese a laying')
                         , lyric('Seven', 'Swans a swimming')
                         , lyric('Eight', 'Maids a milking')
                         , lyric('Nine', 'Ladies dancing')
                         , lyric('Ten', 'Lords a leaping')
                         , lyric('Eleven', 'Pipers piping')
                         , lyric('Twelve', 'Drummers drumming'));
BEGIN
  /* Read forward through the days. */
  FOR i IN 1..lv_days.LAST LOOP
    DBMS_OUTPUT.put_line('On the ' || lv_days(i) || ' day of Christmas');
    DBMS_OUTPUT.put_line('my true love sent to me:');

    /* Read backward through the lyrics based on the ascending value of the day. */
    FOR j IN REVERSE 1..i LOOP
      IF i = 1 THEN
        DBMS_OUTPUT.put_line('-'||'A'||' '||lv_gifts(j).gift_name);
      ELSE
        DBMS_OUTPUT.put_line('-'||lv_gifts(j).day_name||' '||lv_gifts(j).gift_name);
      END IF;
      COUNTER := COUNTER + 1;
    END LOOP;

    /* A line break by verse. */
    DBMS_OUTPUT.put_line(CHR(13));
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('Counter ['||counter||']');
END;
/

QUIT;
