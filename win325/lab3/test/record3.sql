DECLARE
  /* Declare a type. */
  TYPE three_type IS RECORD
  ( xnum     NUMBER
  , xdate    DATE
  , xstring  VARCHAR2(30));

  /* Declare a variable of my user-defined type. */
  lv_stooges three_type;

  /* Declare a collection or a memory table. */
  TYPE list IS TABLE OF VARCHAR2(100);

  lv_list LIST := list();

  lv_input1  VARCHAR2(100);
  lv_input2  VARCHAR2(100);
  lv_input3  VARCHAR2(100);
BEGIN
  /* What's the problem with this type of assignment?
     ------------------------------------------------
     1. You have no guarantee of the order of inputs
        by type.
     2. If the order differs you raise an unhandled
        exception.
  */
  lv_input1 := '&1';
  lv_input2 := '&2';
  lv_input3 := '&3';

  /* What does this do? 
     ------------------
     1. Allocates memory to a collection.
     2. Assigns input values when they are provided.
     3. Assigns input values in the order that they
        were received.
  */ 
  lv_list.extend(3);
  IF lv_input1 IS NOT NULL THEN
    lv_list(1) := lv_input1;
  END IF;
  IF lv_input2 IS NOT NULL THEN
    lv_list(2) := lv_input2;
  END IF;
  IF lv_input3 IS NOT NULL THEN
    lv_list(3) := lv_input3;
  END IF;

  /* What does this do?
     ------------------
     Print elements of a collection.
  */
  FOR i IN 1..lv_list.COUNT LOOP
    dbms_output.put_line('Index ['||i||'] ['||lv_list(i)||']');
  END LOOP;

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
  dbms_output.put_line('lv_stooges.xnum   : ['||lv_stooges.xnum   ||']');
  dbms_output.put_line('lv_stooges.xdate  : ['||lv_stooges.xdate  ||']');
  dbms_output.put_line('lv_stooges.xstring: ['||lv_stooges.xstring||']');
END;
/
