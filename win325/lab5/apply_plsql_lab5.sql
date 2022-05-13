/*
||  Name:          apply_plsql_lab4.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 5 lab.
*/

-- Call seeding libraries.
@$LIB/cleanup_oracle.sql
@$LIB/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
SPOOL apply_plsql_lab5.txt

-- Enter your solution here.

-- Drop table collection.
DROP TYPE common_lookup_tab;
 
-- Drop object type.
DROP TYPE common_lookup_obj;
 
-- Create object type.
CREATE OR REPLACE 
  TYPE common_lookup_obj IS OBJECT
  ( common_lookup_table    VARCHAR2(30)
  , common_lookup_column   VARCHAR2(30)
  , common_lookup_type     VARCHAR2(30)
  , common_lookup_code     VARCHAR2(8)
  , common_lookup_meaning  VARCHAR2(255));
/
 
-- Create collection of object type.
CREATE OR REPLACE
  TYPE common_lookup_tab IS TABLE OF common_lookup_obj;
/
 
-- Declare anonymous block to write to and use a collection.
DECLARE
  /* Declare input values. */
  lv_common_lookup_table    VARCHAR2(30) := 'ITEM';
  lv_common_lookup_column   VARCHAR2(30) := 'ITEM_TYPE';
  lv_common_lookup_type     VARCHAR2(30) := 'BLU-RAY';
  lv_common_lookup_code     VARCHAR2(8);
  lv_common_lookup_meaning  VARCHAR2(255) := 'Blu-ray';
 
  /* Declare empty collection. */
  lv_common_lookup_tab  COMMON_LOOKUP_TAB := common_lookup_tab();
BEGIN
  /* Implement assignment of variables inside a loop, which mimics
     how you would handle them if they were read from a cursor loop. */
  FOR i IN 1..1 LOOP
    lv_common_lookup_tab.EXTEND;
    lv_common_lookup_tab(lv_common_lookup_tab.COUNT) := 
       common_lookup_obj( lv_common_lookup_table
                        , lv_common_lookup_column
                        , lv_common_lookup_type
                        , lv_common_lookup_code
                        , lv_common_lookup_meaning );
  END LOOP;
 
  /* Insert the values from the collection into a table. */
  FOR i IN 1..lv_common_lookup_tab.COUNT LOOP
    INSERT INTO common_lookup
    VALUES
    ( common_lookup_s1.NEXTVAL
    , lv_common_lookup_table
    , lv_common_lookup_column
    , lv_common_lookup_type
    , lv_common_lookup_code
    , lv_common_lookup_meaning
    , 1
    , SYSDATE
    , 1
    , SYSDATE );
  END LOOP;
  /* Make insert permanent. */
  COMMIT;
END;
/

-- Close log file.
SPOOL OFF

