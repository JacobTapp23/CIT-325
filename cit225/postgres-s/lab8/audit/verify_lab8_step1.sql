-- ------------------------------------------------------------------
--  Program Name:   verity_lab6_step1.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  05-Nov-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- You first connect to the Postgres database with this syntax:
--
--   psql -U student -d videodb -W
--
-- Then, you call this script with the following syntax:
--
--   psql> \i apply_postgres_lab6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Add rental_item_type column.
-- ------------------------------------------------------------------

-- Query label.
SELECT 'Lab 8: Step 1: Task 1' AS "Task Expected Results";

-- Query the values from the price table.
SELECT   p.item_id
,        p.active_flag
,        p.price_type
,        p.start_date
,        p.end_date
,        p.amount
FROM     price p;

-- Query computational validation.
SELECT  'OLD Y' AS "Type"
,        COUNT(CASE WHEN amount = 1 THEN 1 END) AS "1-Day"
,        COUNT(CASE WHEN amount = 3 THEN 1 END) AS "3-Day"
,        COUNT(CASE WHEN amount = 5 THEN 1 END) AS "5-Day"
,        COUNT(*) AS "TOTAL"
FROM     price p , item i
WHERE    active_flag = 'Y' AND i.item_id = p.item_id
AND     (current_date - i.release_date) > 30
AND      end_date IS NULL
UNION ALL
SELECT  'OLD N' AS "Type"
,        COUNT(CASE WHEN amount =  3 THEN 1 END) AS "1-Day"
,        COUNT(CASE WHEN amount = 10 THEN 1 END) AS "3-Day"
,        COUNT(CASE WHEN amount = 15 THEN 1 END) AS "5-Day"
,        COUNT(*) AS "TOTAL"
FROM     price p , item i
WHERE    active_flag = 'N' AND i.item_id = p.item_id
AND     (current_date - i.release_date) > 30
AND NOT end_date IS NULL
UNION ALL
SELECT  'NEW Y' AS "Type"
,        COUNT(CASE WHEN amount =  3 THEN 1 END) AS "1-Day"
,        COUNT(CASE WHEN amount = 10 THEN 1 END) AS "3-Day"
,        COUNT(CASE WHEN amount = 15 THEN 1 END) AS "5-Day"
,        COUNT(*) AS "TOTAL"
FROM     price p , item i
WHERE    active_flag = 'Y' AND i.item_id = p.item_id
AND     (current_date - i.release_date) < 31
AND      end_date IS NULL
UNION ALL
SELECT  'NEW N' AS "Type"
,        COUNT(CASE WHEN amount = 1 THEN 1 END) AS "1-Day"
,        COUNT(CASE WHEN amount = 3 THEN 1 END) AS "3-Day"
,        COUNT(CASE WHEN amount = 5 THEN 1 END) AS "5-Day"
,        COUNT(*) AS "TOTAL"
FROM     price p , item i
WHERE    active_flag = 'N' AND i.item_id = p.item_id
AND     (current_date - i.release_date) < 31
AND      NOT (end_date IS NULL);

-- ------------------------------------------------------------------
--  Task #2: Add not null constraint on rental_item_type column.
-- ------------------------------------------------------------------

-- Set session variable.
SET SESSION "videodb.table_name" = 'price';

-- Query label.
SELECT 'Lab 8: Step 1: Task 2' AS "Task Expected Results";

-- Query the columns from the table.
SELECT c1.table_name
,      c1.ordinal_position
,      c1.column_name
,      CASE
         WHEN c1.is_nullable = 'NO' AND c2.column_name IS NOT NULL THEN 'PRIMARY KEY'
         WHEN c1.is_nullable = 'NO' AND c2.column_name IS NULL THEN 'NOT NULL'
       END AS is_nullable
,      CASE
         WHEN data_type = 'character varying' THEN
           data_type||'('||character_maximum_length||')'
         WHEN data_type = 'numeric' THEN
           CASE
             WHEN numeric_scale != 0 AND numeric_scale IS NOT NULL THEN
               data_type||'('||numeric_precision||','||numeric_scale||')'
             ELSE
               data_type||'('||numeric_precision||')'
             END
         ELSE
           data_type
        END AS data_type
FROM    information_schema.columns c1 LEFT JOIN
          (SELECT trim(regexp_matches(column_default,current_setting('videodb.table_name'))::text,'{}')||'_id' column_name
           FROM   information_schema.columns) c2
ON       c1.column_name = c2.column_name
WHERE    c1.table_name = current_setting('videodb.table_name')
ORDER BY c1.ordinal_position;
