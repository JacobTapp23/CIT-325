CREATE OR REPLACE
  FUNCTION verify_date
  ( pv_date_in IN VARCHAR2) RETURN DATE IS
  /* Local return variable. */
  lv_date_in VARCHAR2(11);
  lv_date_out  DATE;
BEGIN
  /* Parse Promote the month to uppercase. */
  IF LENGTH(pv_date_in) > 11 THEN
    lv_date_in := UPPER(SUBSTR(TRIM(pv_date_in),1,11));
  ELSE
  lv_date_in := UPPER(pv_date_in);
  END IF;
  /* Check for a DD-MON-RR or DD-MON-YYYY string. */
  IF REGEXP_LIKE(lv_date_in,'^[0-9]{2,2}-[ADFJMNOS][ACEOPU][BCGLNPRTVY]-([0-9]{2,2}|[0-9]{4,4})$') THEN
    /* Case statement checks for 28 or 29, 30, or 31 day month. */
    CASE
      /* Valid 31 day month date value. */
      WHEN SUBSTR(lv_date_in,4,3) IN ('JAN','MAR','MAY','JUL','AUG','OCT','DEC') AND
           TO_NUMBER(SUBSTR(lv_date_in,1,2)) BETWEEN 1 AND 31 THEN 
        lv_date_out := lv_date_in;
      /* Valid 30 day month date value. */
      WHEN SUBSTR(lv_date_in,4,3) IN ('APR','JUN','SEP','NOV') AND
           TO_NUMBER(SUBSTR(lv_date_in,1,2)) BETWEEN 1 AND 30 THEN 
        lv_date_out := lv_date_in;
      /* Valid 28 or 29 day month date value. */
      WHEN SUBSTR(lv_date_in,4,3) = 'FEB' THEN
        /* Verify 2-digit or 4-digit year. */
        IF (LENGTH(lv_date_in) = 9 AND MOD(TO_NUMBER(SUBSTR(lv_date_in,8,2)) + 2000,4) = 0 OR
            LENGTH(lv_date_in) = 11 AND MOD(TO_NUMBER(SUBSTR(lv_date_in,8,4)),4) = 0) AND
            TO_NUMBER(SUBSTR(lv_date_in,1,2)) BETWEEN 1 AND 29 THEN
          lv_date_out := lv_date_in;
        ELSE /* Not a leap year. */
          IF TO_NUMBER(SUBSTR(lv_date_in,1,2)) BETWEEN 1 AND 28 THEN
            lv_date_out := lv_date_in;
          ELSE
            lv_date_out := null;
          END IF;
        END IF;
      ELSE
        /* Assign a default date. */
        lv_date_out := null;
    END CASE;
  ELSE
    /* Assign a default date. */
    lv_date_out := null;
  END IF;
  /* Return date. */
  RETURN lv_date_out;
END;
/
SET VERIFY OFF
DECLARE
  /* Declare a collection of strings. */
  TYPE list IS TABLE OF VARCHAR2(20);

  argc     NUMBER := 3;
  counter  NUMBER := 1;

  xnumber  NUMBER;
  xstring  VARCHAR2(10);
  xdate    DATE;

  /* Declare a variable of the string collection. */
  lv_strings  LIST := list();
BEGIN
  lv_strings.EXTEND(argc);
  FOR i IN 1..lv_strings.LAST LOOP
    IF i = 1 THEN
      lv_strings(counter) := NVL('&1','');
    ELSIF i = 2 THEN
      lv_strings(counter) := NVL('&2','');
    ELSIF i = 3 THEN
      lv_strings(counter) := NVL('&3','');
    END IF;
    counter := counter + 1;
  END LOOP;

 

  /* Loop through list of values to find only the numbers. */
  FOR i IN 1..lv_strings.LAST LOOP
    IF REGEXP_LIKE(lv_strings(i),'^[[:digit:]]*$') AND xnumber IS NULL THEN
      xnumber := lv_strings(i);
    ELSIF verify_date(lv_strings(i)) IS NOT NULL AND xdate IS NULL THEN
      xdate := lv_strings(i);
    ELSIF REGEXP_LIKE(lv_strings(i),'^[[:alnum:]]*$') THEN
      xstring := lv_strings(i);
    END IF;
  END LOOP;
  dbms_output.put_line(xnumber);
  dbms_output.put_line(xdate);
  dbms_output.put_line(xstring);
END;
/

