SET SERVEROUTPUT ON SIZE UNLIMITED

-- Open file to write the log.
SPOOL example1.txt

DECLARE
  /* Create a single column collection that is a list. */
  TYPE list IS TABLE OF VARCHAR2(40);
  /* Create a variable of the new list type:
  || =======================================
  ||  1. We give the variable a name of lv_list.
  ||  2. We assign a user-defined ADT (Attribute Data Type) collection.
  ||  3. We assign a value of an empty list, which has no memory
  ||     available for assignment.
  */
  lv_list   LIST := list();

  /* The difference here is that we assign twelve values when we construct
  || the instance of the LIST data type. This allocates four memory 
  || locations for 5 and 6 character strings.
  */
  lv_source LIST := list('first','second','third','fourth'
                        ,'fifth','sixth','seventh','eighth'
                        ,'nineth','tenth','eleventh','twelveth');

  /* The difference here is that we append a \n or line return to the
  || first element of a list, which happens to be a CHR(10) in Oracle.
  */
  lv_mime   LIST := list('partridge in a pear tree.'||CHR(10)
                        ,'Two turtle doves,'
                        ,'Three French hens,'
                        ,'Four calling birds,'
                        ,'Five gold rings,'
                        ,'Six geese a-laying,'
                        ,'Seven swans a-swimming,'
                        ,'Eight maids a-milking,'
                        ,'Nine ladies dancing,'
                        ,'Tenth lords a-leaping,'
                        ,'Eleven pipers piping,'
                        ,'Twelve drummers drumming,');
BEGIN
  /* Assign the values of the lv_source list to the lv_list list:
  || ============================================================
  ||  1. A list can have missing items.
  ||  2. A list has a sparsely populated index, which means there
  ||     can be gaps and incrementing one at a time may cause
  ||     errors.
  ||  3. A COUNT returns the number of items, while LAST returns
  ||     the highest index value.
  ||  4. CONCLUSION: Best practice is to always use LAST!
  */
  FOR i IN 1..lv_source.LAST LOOP
    /* Assign memory to the variable that is an empty list:
    || ====================================================
    ||  1. You add one memory location with .EXTEND appended
    ||     to an array or table (list).
    ||  2. You add n memory locations with .EXTEND(n) appended
    ||     to an array or talbe (list).
    ||  3. CAVEAT: That you cannot add memory beyond the 
    ||     LIMIT of elements in an array (also known as a 
    ||     VARRAY).
    */
    lv_list.EXTEND; 

    /* Assign a value from one list to the other. */
    lv_list(i) := lv_source(i);
  END LOOP;

  /* Couple the behavior of two lists in two loops. */
  FOR i IN 1..lv_list.LAST LOOP
    FOR j IN REVERSE 1..i LOOP
      dbms_output.put_line('[lv_list('||i||')][lv_mime('||j||')]');
    END LOOP;
  END LOOP;

  /* Couple the behavior of two lists in two loops. */
  FOR i IN 1..lv_list.LAST LOOP
    FOR j IN REVERSE 1..i LOOP
      dbms_output.put_line('['||lv_list(i)||']'||lv_mime(j));
    END LOOP;
  END LOOP;
END;
/

-- Close the log file.
SPOOL OFF
