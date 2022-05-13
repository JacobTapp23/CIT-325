@/home/student/Data/cit325/lab1/apply_plsql_lab1.sql

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

COL common_lookup_table   FORMAT A12
COL common_lookup_column  FORMAT A12
COL common_lookup_type    FORMAT A12
SELECT  common_lookup_table
,       common_lookup_column
,       common_lookup_type
FROM    common_lookup
WHERE   common_lookup_type = 'BLU-RAY';

CREATE SEQUENCE rating_agency_s START WITH 1001;

CREATE TABLE rating_agency AS
  SELECT rating_agency_s.NEXTVAL AS rating_agency_id
  ,      il.item_rating AS rating
  ,      il.item_rating_agency AS rating_agency
  FROM  (SELECT DISTINCT
                i.item_rating
         ,      i.item_rating_agency
         FROM   item i) il;

SELECT * FROM rating_agency;

ALTER TABLE item 
ADD (rating_agency_id  NUMBER);

SET NULL ''
COLUMN table_name   FORMAT A18
COLUMN column_id    FORMAT 9999
COLUMN column_name  FORMAT A22
COLUMN data_type    FORMAT A12
SELECT   table_name
,        column_id
,        column_name
,        CASE
           WHEN nullable = 'N' THEN 'NOT NULL'
           ELSE ''
         END AS nullable
,        CASE
           WHEN data_type IN ('CHAR','VARCHAR2','NUMBER') THEN
             data_type||'('||data_length||')'
           ELSE
             data_type
         END AS data_type
FROM     user_tab_columns
WHERE    table_name = 'ITEM'
ORDER BY 2;

SELECT   rating_agency_id
,        COUNT(*)
FROM     item
WHERE    rating_agency_id IS NOT NULL
GROUP BY rating_agency_id
ORDER BY 1;
