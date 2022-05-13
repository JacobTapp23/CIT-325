DECLARE
  /* Declare a type. */
  TYPE three_type IS RECORD
  ( xnum     NUMBER
  , xdate    DATE
  , xstring  VARCHAR2(30));

  /* Declare a variable of my user-defined type. */
  lv_stooges THREE_TYPE;

  lv_input1  VARCHAR2(100);
  lv_input2  VARCHAR2(100);
  lv_input3  VARCHAR2(100);
BEGIN
  lv_input1 := '&1';
  lv_input2 := '&2';
  lv_input3 := '&3';

  /* What's the problem with this type of assignment?
     ------------------------------------------------
     1. You have no guarantee of the order of inputs
        by type.
     2. If the order differs you raise an unhandled
        exception.
  */
  lv_stooges.xnum := lv_input1;
  lv_stooges.xdate := lv_input2;
  lv_stooges.xstring := lv_input3; 
END;
/
