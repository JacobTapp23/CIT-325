-- ------------------------------------------------------------------
--  Program Name:   apply_lab8_step1.sql
--  Lab Assignment: Lab #8
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
--   psql> \i apply_lab8_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Add rows to the price table.
-- ------------------------------------------------------------------

INSERT INTO price
( item_id
, price_type
, active_flag
, start_date
, end_date
, amount
, created_by
, last_updated_by )
( SELECT   il.item_id
  ,        il.price_type
  ,        il.active_flag
  ,        il.start_date
  ,        il.end_date
  ,        il.amount
  ,        il.created_by
  ,        il.last_updated_by
  FROM
   (SELECT   i.item_id
    ,        af.active_flag
    ,        cl.common_lookup_id AS price_type
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
                   WHEN dr.rental_days = '1' THEN 5
	           WHEN dr.rental_days = '3' THEN 10
                   WHEN dr.rental_days = '5' THEN 15
                 END
             END AS amount
    ,        1001 AS created_by
    ,        1001 AS last_updated_by
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
    AND NOT ((current_date - i.release_date <= 30) AND (active_flag = 'N'))) il);

-- ------------------------------------------------------------------
--  Task #2: Add not null constraint to the price_type column.
-- ------------------------------------------------------------------

ALTER TABLE price
ALTER COLUMN price_type SET NOT NULL;
