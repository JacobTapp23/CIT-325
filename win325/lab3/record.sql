DECLARE
  /* Declare a type. */
  TYPE three_type IS RECORD
  ( xnum     NUMBER
  , xdate    DATE
  , xstring  VARCHAR2(30));

  lv_stooges three_type;

  lv_input1  VARCHAR2(100);
  lv_input2  VARCHAR2(100);
  lv_input3  VARCHAR2(100);
BEGIN
  lv_input1 := '&1';
  lv_input2 := '&2';
  lv_input3 := '&3';

  lv_stooges.xnum := lv_input1;
  lv_stooges.xdate := lv_input2;
  lv_stooges.xstring := lv_input3; 
END;
/
