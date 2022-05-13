-- ------------------------------------------------------------------
--  Program Name:   verity_lab7_step2.sql
--  Lab Assignment: Lab #7
--  Program Author: Michael McLaughlin
--  Creation Date:  09-Nov-2019
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
--   psql> \i apply_postgres_lab7.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Update the rental_item_type column with values and
--           verify the outcome.
-- ------------------------------------------------------------------

-- Query label.
SELECT 'Lab 7: Step 2: Task 1' AS "Task Expected Results";

-- Verify the update statement's success.
SELECT   ri.rental_item_type
,        cl.common_lookup_id
,        cl.common_lookup_code
,        r.return_date
,        r.check_out_date
,        (r.return_date - r.check_out_date)::text AS lookup_code
FROM     rental r FULL JOIN rental_item ri
ON       r.rental_id = ri.rental_id FULL JOIN common_lookup cl
ON       cl.common_lookup_code =
           (r.return_date - r.check_out_date)::text
WHERE    cl.common_lookup_table = 'RENTAL_ITEM'
AND      cl.common_lookup_column = 'RENTAL_ITEM_TYPE'
AND      cl.common_lookup_type LIKE '%-DAY RENTAL'
ORDER BY r.rental_id
,        ri.rental_id;


-- ------------------------------------------------------------------
--  Task #1: Verify that the rental_item_type column is not null.
-- ------------------------------------------------------------------

-- Set session variable.
SET SESSION "videodb.table_name" = 'rental_item';

-- Query label.
SELECT 'Lab 7: Step 2: Task 2' AS "Task Expected Results";

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
