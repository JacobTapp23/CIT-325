SET ECHO ON

/* Create a user defined table or list. */
CREATE OR REPLACE
  TYPE list_jar IS TABLE OF VARCHAR2(60);
/

/* Create a procedure or void method that prints the content of a list. */
CREATE OR REPLACE
  PROCEDURE my_procedure (list LIST_JAR) IS
BEGIN
  FOR i IN 1..list.COUNT LOOP
    dbms_output.put_line('Element: ['||list(i)||']');
  END LOOP;
END;
/

/* Create an anonymous block to populate a list and call the my_procedure
   program unit. */
DECLARE
  /* Declare a local PL/SQL variable of the SQL data type. */
  lv_list LIST_JAR := list_jar();

  /* Declare a static cursor. */
  CURSOR c IS
    SELECT item_title FROM item;
BEGIN
  /* Read the contents of the cursor line-by-line into the list. */
  FOR i IN c LOOP
    lv_list.EXTEND;                          /* Allocate memory. */
    lv_list(lv_list.COUNT) := i.item_title;  /* Assign values to indexed value of list. */
  END LOOP;

  /* Call the my_procedure with the newly populated list. */
  my_procedure(lv_list);
END;
/
