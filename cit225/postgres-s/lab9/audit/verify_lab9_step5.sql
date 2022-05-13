-- ------------------------------------------------------------------
--  Program Name:   verify_lab9_step5.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Nov-2019
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
--   psql> \i verify_lab9_step5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the airport table.
-- -------------------------------------------------------------------

-- Set session variable.
SET SESSION "videodb.table_name" = 'account_list';

-- Query label.
SELECT 'Lab 9: Step 5: Task 1' AS "Task Expected Results";

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
             WHEN numeric_precision != 0 AND numeric_precision IS NOT NULL THEN
               data_type||'('||numeric_precision||')'
             ELSE
	       data_type
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
