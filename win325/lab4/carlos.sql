DROP TYPE lyric FORCE;

CREATE OR REPLACE
  TYPE lyric IS OBJECT
  ( day_name    VARCHAR2(8)
  , gift_name   VARCHAR2(24));
/

DECLARE
  /* Declare an array of days and gifts. */
  TYPE days  IS TABLE OF VARCHAR2(8);
  TYPE gifts IS TABLE OF LYRIC;
BEGIN
  NULL;
END;
/
