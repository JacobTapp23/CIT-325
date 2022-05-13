/*
||  Name:          apply_plsql_lab3.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 4 lab.
*/

-- Call seeding libraries.
-- @$LIB/cleanup_oracle.sql
-- @$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
-- SPOOL apply_plsql_lab3.txt

SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED

DECLARE
    /* Declare a type. */
    TYPE three_type IS RECORD
    (xnum     NUMBER
      , xdate    DATE
      , xstring  VARCHAR2(30));

    lv_stooges three_type;  /* Declare a collection or a memory table. */

    TYPE list IS TABLE OF
    VARCHAR2(100);

    lv_list LIST := list();

    lv_input1  VARCHAR2(100);
    lv_input2  VARCHAR2(100);
    lv_input3  VARCHAR2(100);

    BEGIN
    lv_input1 := '&1';
    lv_input2 := '&2';
    lv_input3 := '&3';

    lv_list.extend(3);
    lv_list(1) := lv_input1;
    lv_list(2) := lv_input2;
    lv_list(3) := lv_input3;

    FOR i IN 1..lv_list.COUNT LOOP
      lv_stooges.xdate := '';
      IF REGEXP_LIKE(lv_list(i),'^[[:digit:]]*$') THEN
        lv_stooges.xnum := lv_list(i);
      ELSIF verify_date(lv_list(i)) IS NOT NULL THEN
        lv_stooges.xdate := lv_list(i);
      ELSIF REGEXP_LIKE(lv_list(i),'^[[:alnum:]]*$') THEN
        lv_stooges.xstring:= lv_list(i);
      END IF;
    END LOOP;
      dbms_output.put_line('RECORD ['||lv_stooges.xnum||'] ['
                         ||lv_stooges.xstring||'] ['||lv_stooges.xdate||']');
    END;
/

-- Close log file.
-- SPOOL OFF

QUIT
