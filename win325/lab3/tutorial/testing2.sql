DECLARE
  /* Declare a collection of strings. */
  TYPE list IS TABLE OF VARCHAR2(10);
  /* Declare a variable of the string collection. */
  lv_strings  LIST := list('one','two','three','four');
BEGIN
  /* Delete a value. */
  lv_strings.DELETE(2);
  dbms_output.put_line('lv_strings.COUNT ['||lv_strings.COUNT||']');
  FOR i IN 1..lv_strings.LAST LOOP
    IF lv_strings.EXISTS(i) THEN
      dbms_output.put_line('Element ['||i||'] ['
      ||                    NVL(lv_strings(i),'Null')||']');
    ELSE
      dbms_output.put_line('Element ['||i||'] ['||'Null]');
    END IF;
  END LOOP;
END;
/
