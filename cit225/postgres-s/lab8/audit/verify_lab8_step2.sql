-- ------------------------------------------------------------------
--  Program Name:   verity_lab8_step2.sql
--  Lab Assignment: Lab #8
--  Program Author: Michael McLaughlin
--  Creation Date:  10-Nov-2019
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
--   psql> \i verify_lab8_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Update rental_item_price column with data.
-- ------------------------------------------------------------------

-- Query label.
SELECT 'Lab 8: Step 2: Task 1' AS "Task Expected Results";

-- Verify that the table has a not null constrained
SELECT   c.last_name||', '||c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' '||c.middle_name
	   ELSE ''
         END AS customer_name
,        r.customer_id AS contact_id
,        ri.rental_id AS ri_rental_id
,        ri.rental_item_id AS ri_id
,        p.item_id AS p_item_id
,        ri.item_id AS ri_item_id
,        ri.rental_item_price AS ri_price
,        p.amount
FROM     price p INNER JOIN common_lookup cl1
ON       p.price_type = cl1.common_lookup_id
AND      cl1.common_lookup_table = 'PRICE'
AND      cl1.common_lookup_column = 'PRICE_TYPE' FULL JOIN rental_item ri
ON       p.item_id = ri.item_id INNER JOIN common_lookup cl2
ON       ri.rental_item_type = cl2.common_lookup_id
AND      cl2.common_lookup_table = 'RENTAL_ITEM'
AND      cl2.common_lookup_column = 'RENTAL_ITEM_TYPE' RIGHT JOIN rental r
ON       ri.rental_id = r.rental_id FULL JOIN contact c
ON       r.customer_id = c.contact_id
WHERE    cl1.common_lookup_code = cl2.common_lookup_code
AND      r.check_out_date
BETWEEN  p.start_date AND COALESCE(p.end_date,current_date + INTERVAL '1 day')
ORDER BY 2, 3;
