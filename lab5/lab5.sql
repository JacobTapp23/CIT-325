-- @C:\Data\lib\cleanup_oracle.sql
-- @C:\Data\lib\create_video_store.sql

/* lab deliverable */

DROP SEQUENCE rating_agency_s;

DROP TABLE rating_agency;

DROP TYPE rating_agency_type;

DROP TYPE rating_agency_table;

CREATE OR REPLACE TYPE rating_agency_type IS OBJECT
( rating_agency_id NUMBER
, rating           VARCHAR2(8)
, rating_agency    VARCHAR2(4));
/

CREATE OR REPLACE TYPE rating_agency_table IS TABLE OF rating_agency_type;
/

CREATE SEQUENCE rating_agency_s START WITH 1001;

CREATE TABLE rating_agency AS
  SELECT rating_agency_s.NEXTVAL AS rating_agency_id
  ,   il.item_rating AS rating
  ,   il.item_rating_agency AS rating_agency
  FROM (SELECT DISTINCT
          i.item_rating
        , i.item_rating_agency
        FROM item i) il;

ALTER TABLE item
  ADD (rating_agency_id NUMBER);
DECLARE
    /* declare a rating agency cursor */
    CURSOR rating_agency_cur IS
        SELECT rating_agency_id
        ,      rating
        ,      rating_agency
        FROM   rating_agency;

    /* declare a colletion of the rating_agency_table */
    lv_rating_agency_tab RATING_AGENCY_TABLE := rating_agency_table();

BEGIN
    /* Read the rating_agency into a collection */
    FOR i IN rating_agency_cur LOOP
        lv_rating_agency_tab.EXTEND;
        lv_rating_agency_tab(lv_rating_agency_tab.COUNT) :=
            rating_agency_type(i.rating_agency_id, i.rating, i.rating_agency);
    END LOOP;
    /* Read through the collection and update rows */
    FOR i IN 1..lv_rating_agency_tab.COUNT LOOP
        UPDATE item
        SET rating_agency_id = lv_rating_agency_tab(i).rating_agency_id
        WHERE item_rating = lv_rating_agency_tab(i).rating
        AND item_rating_agency = lv_rating_agency_tab(i).rating_agency;
    END LOOP;

    dbms_output.put_line('Rows ['||lv_rating_agency_tab.COUNT||']');
END;
/

-- QUERY THE RESULTS test case
SELECT   rating_agency_id
,        COUNT(*)
FROM     item
WHERE    rating_agency_id IS NOT NULL
GROUP BY rating_agency_id
ORDER BY 1;

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

SELECT * FROM rating_agency;