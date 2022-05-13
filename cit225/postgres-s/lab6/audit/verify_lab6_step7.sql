-- ------------------------------------------------------------------
--  Program Name:   verity_lab6_step7.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  07-Nov-2019
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

-- Query label.
SELECT 'Lab 6: Step 7: Task 1, 2, & 3' AS "Task Identifier";

-- Query the modified result set from the common_lookup table.
SELECT   common_lookup_table
,        common_lookup_column
,        common_lookup_type
FROM     common_lookup
ORDER BY 1;

-- Query the validity of joins based on correct foreign key column updates.
SELECT   cl.common_lookup_table AS table_name
,        cl.common_lookup_column AS column_name
,        cl.common_lookup_type AS value_type
,        COUNT(a.address_id) AS matches
FROM     address a RIGHT JOIN common_lookup cl
ON       a.address_type = cl.common_lookup_id
WHERE    cl.common_lookup_table = 'ADDRESS'
AND      cl.common_lookup_column = 'ADDRESS_TYPE'
AND      cl.common_lookup_type IN ('HOME','WORK')
GROUP BY cl.common_lookup_table
,        cl.common_lookup_column
,        cl.common_lookup_type
UNION
SELECT   cl.common_lookup_table AS table_name
,        cl.common_lookup_column AS column_name
,        cl.common_lookup_type AS value_type
,        COUNT(t.telephone_id) AS matches
FROM     telephone t RIGHT JOIN common_lookup cl
ON       t.telephone_type = cl.common_lookup_id
WHERE    cl.common_lookup_table = 'TELEPHONE'
AND      cl.common_lookup_column = 'TELEPHONE_TYPE'
AND      cl.common_lookup_type IN ('HOME','WORK')
GROUP BY cl.common_lookup_table
,        cl.common_lookup_column
,        cl.common_lookup_type;

-- Set session variable.
SET SESSION "videodb.table_name" = 'common_lookup';

--  Verify table name.
SELECT current_setting('videodb.table_name');

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

