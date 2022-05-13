DECLARE
  TYPE list IS TABLE OF VARCHAR2(60);
  lv_list LIST := list();

  CURSOR c IS
    SELECT item_title FROM item;

BEGIN

  FOR i IN c LOOP

    lv_list.EXTEND;
    lv_list(lv_list.COUNT) := i.item_title;

  END LOOP;

  FOR j IN 1..lv_list.COUNT LOOP
    dbms_output.put_line('item '||lv_list(j));
  END LOOP;

END;
/

