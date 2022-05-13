DECLARE
  /* Declare a type. */
  TYPE three_type IS RECORD
  ( xnum     NUMBER
  , xdate    DATE
  , xstring  VARCHAR2(30));

  /* Declare a variable of my user-defined type. */
  lv_stooges three_type;

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

  /* What should I learn from these printing commands?
     -------------------------------------------------
     1. The order is equally dependent on input order.
     2. Learn how to the members of a record, which differ
        from the elements in a collection.
        variable_name.member_name
  */
  dbms_output.put_line('lv_stooges.xnum   :'||lv_stooges.xnum);
  dbms_output.put_line('lv_stooges.xdate  :'||lv_stooges.xdate);
  dbms_output.put_line('lv_stooges.xstring:'||lv_stooges.xstring);
END;
/
