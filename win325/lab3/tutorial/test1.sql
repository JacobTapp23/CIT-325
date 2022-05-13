DECLARE
  /* Declare a collection of strings. */
  TYPE list IS TABLE OF VARCHAR2(10);

  /* Declare a variable of the string collection. */
  lv_strings  LIST := list();
BEGIN
  /* Assign values. */
  lv_strings.EXTEND;
  lv_strings(lv_strings.COUNT) := NVL('&1','');
  dbms_output.put_line('lv_strings.COUNT ['||lv_strings.COUNT||']');
  dbms_output.put_line('lv_strings(1)    ['||lv_strings(lv_strings.COUNT)||']');
END;
/
