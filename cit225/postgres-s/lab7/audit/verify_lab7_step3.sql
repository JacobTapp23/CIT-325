-- ------------------------------------------------------------------
--  Program Name:   verity_lab6_step3.sql
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
--   psql> \i apply_postgres_lab6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

-- Query label.
SELECT 'Lab 7: Step 2: Task 3' AS "Task Expected Results";

-- Query to validate insert statement success.
SELECT   i.item_id
,        af.active_flag
,        cl.common_lookup_id AS price_type
,        cl.common_lookup_type AS price_desc
,        CASE
           WHEN current_date - release_date > 30
           THEN i.release_date + INTERVAL '31 day'
           ELSE i.release_date
         END::date AS start_date
,        CASE
           WHEN current_date - release_date > 30 AND active_flag = 'N'
           THEN i.release_date + interval '30 day'
         END::date AS end_date
,        CASE
           WHEN current_date - release_date > 30 AND active_flag = 'Y' THEN
             CASE
               WHEN dr.rental_days = '1' THEN 1
               WHEN dr.rental_days = '3' THEN 3
               WHEN dr.rental_days = '5' THEN 5
             END
           ELSE
             CASE
               WHEN dr.rental_days = '1' THEN 3
               WHEN dr.rental_days = '3' THEN 10
               WHEN dr.rental_days = '5' THEN 15
             END
         END AS amount
FROM     item i CROSS JOIN
        (SELECT 'Y' AS active_flag
         UNION ALL
         SELECT 'N' AS active_flag) af CROSS JOIN
        (SELECT '1' AS rental_days
         UNION ALL
         SELECT '3' AS rental_days
         UNION ALL
         SELECT '5' AS rental_days) dr INNER JOIN
         common_lookup cl ON dr.rental_days = SUBSTR(cl.common_lookup_type,1,1)
WHERE    cl.common_lookup_table = 'PRICE'
AND      cl.common_lookup_column = 'PRICE_TYPE'
AND NOT ((current_date - i.release_date <= 30) AND (active_flag = 'N'))
ORDER BY 1, 2, 3;
