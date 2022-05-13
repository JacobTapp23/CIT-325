DECLARE
  /* Declare a type. */
  TYPE three_type IS RECORD
  ( xnum     NUMBER
  , xdate    DATE
  , xstring  VARCHAR2(30));

  lv_stooges three_type;

  /* Declare a collection or a memory table. */
  TYPE list IS TABLE OF VARCHAR2(100);

  lv_list LIST := list();

  lv_input1  VARCHAR2(100);
  lv_input2  VARCHAR2(100);
  lv_input3  VARCHAR2(100);
BEGIN
  lv_input1 := '&1';
  lv_input2 := '&2';
  lv_input3 := '&3';

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

  FOR i IN 1..lv_list.COUNT LOOP
    dbms_output.put_line('Index ['||i||'] '||lv_list(i));
  END LOOP;

  FOR i IN 1..lv_list.COUNT LOOP
    IF REGEXP_LIKE(lv_list(i),'^[[:digit:]]*$') THEN
  --IF REGEXP_LIKE(lv_list(i),'^[0-9]*$') THEN
      lv_stooges.xnum := lv_list(i);
    ELSIF verify_date(lv_list(i)) IS NOT NULL THEN
      lv_stooges.xdate := lv_list(i);
    ELSE
      lv_stooges.xstring := lv_list(i);
    END IF;
  END LOOP;

  -- lv_stooges.xdate := lv_input2;
  -- lv_stooges.xstring := lv_input3; 

  dbms_output.put_line('lv_stooges.xnum   :'||lv_stooges.xnum);
  dbms_output.put_line('lv_stooges.xdate  :'||lv_stooges.xdate);
  dbms_output.put_line('lv_stooges.xstring:'||lv_stooges.xstring);
END;
/
