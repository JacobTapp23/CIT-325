SET SERVEROUTPUT ON SIZE UNLIMITED

-- Open file to write the log.
SPOOL example1.txt

DECLARE
  /* Create a single column collection that is a list. */
  TYPE list IS TABLE OF VARCHAR2(6);
  /* Create a variable of the new list type. */
  lv_list   LIST := list();
  lv_source LIST := list('first','second','third','fourth');
BEGIN
  /* Assign the values of the lv_source list to the lv_list list. */
  FOR i IN 1..lv_source.LAST LOOP
    /* Assign memory to the variable that is an empty list. */
    lv_list.EXTEND; 
    /* Assign a value from one list to the other. */
    lv_list(i) := lv_source(i);
  END LOOP;
  /* Did I really assign it, let us check. */
  FOR i IN 1..lv_list.LAST LOOP
    dbms_output.put_line('['||i||']['||lv_list(i)||'] [lv_list('||i||')]');
  END LOOP;
END;
/

-- Close the log file.
SPOOL OFF
