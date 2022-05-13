CREATE OR REPLACE
  PROCEDURE test ( gaps LIST ) IS
  BEGIN
    FOR i IN 1..gaps.LAST LOOP
      IF gaps.EXISTS(i) THEN
        dbms_output.put_line('Element ['||i||'] ['
        ||                    NVL(gaps(i),'Null')||']');
      ELSE
        dbms_output.put_line('Element ['||i||'] ['||'Null]');
      END IF;
    END LOOP;
  END;
/

DECLARE
  /* Declare a variable of the string collection. */
  lv_strings  LIST := list('one','two','three','four');
BEGIN
  /* Delete a value. */
  lv_strings.DELETE(2);
  dbms_output.put_line('lv_strings.COUNT ['||lv_strings.COUNT||']');

  /* Call a procedure by passing the collection with gaps. */
  test(lv_strings);
END;
/

DECLARE
  /* Declare a variable of the string collection. */
  lv_strings  LIST := list('ounces','doces','threces','quartose');
BEGIN
  /* Delete a value. */
  dbms_output.put_line('lv_strings.COUNT ['||lv_strings.COUNT||']');

  /* Call a procedure by passing the collection with gaps. */
  test(lv_strings);
END;
/
