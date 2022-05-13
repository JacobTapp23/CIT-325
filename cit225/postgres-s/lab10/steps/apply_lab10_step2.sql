-- ------------------------------------------------------------------
--  Program Name:   apply_lab10_step2.sql
--  Lab Assignment: Lab #10
--  Program Author: Michael McLaughlin
--  Creation Date:  22-Feb-2022
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
--  Task #1: Count rows from import table: [10752].
-- ------------------------------------------------------------------

-- Counting importing rental items.
SELECT   COUNT(*)
FROM    (SELECT   ri.rental_item_id
         ,        r.rental_id
         ,        tu.item_id
         ,        r.return_date - r.check_out_date AS rental_item_price
         ,        cl.common_lookup_id AS rental_item_type
         ,        1001 AS created_by
         ,        CURRENT_DATE AS creation_date
         ,        1001 AS last_updated_by
         ,        CURRENT_DATE AS last_update_date
         FROM     member m INNER JOIN contact c
         ON       m.member_id = c.member_id INNER JOIN transaction_upload tu
         ON       c.first_name = tu.first_name
         AND      COALESCE(c.middle_name,'x') = COALESCE(tu.middle_name,'x')
         AND      c.last_name = tu.last_name
         AND      tu.account_number = m.account_number INNER JOIN rental r
         ON       c.contact_id = r.customer_id
         AND      tu.check_out_date = r.check_out_date
         AND      tu.return_date = r.return_date INNER JOIN common_lookup cl
         ON       cl.common_lookup_table = 'RENTAL_ITEM'
         AND      cl.common_lookup_column = 'RENTAL_ITEM_TYPE'
         AND      cl.common_lookup_type = tu.rental_item_type  LEFT JOIN rental_item ri
         ON       r.rental_id = ri.rental_id) ri;
		 
-- ------------------------------------------------------------------
--  Task #2: Count rows from import and import target tables: [10752].
-- ------------------------------------------------------------------

INSERT INTO rental_item
( rental_item_id
, rental_id
, item_id
, rental_item_type
, rental_item_price
, created_by
, creation_date
, last_updated_by
, last_update_date )
(SELECT   COALESCE(ri.rental_item_id, NEXTVAL('rental_item_rental_item_id_seq'::regclass))
 ,        r.rental_id
 ,        tu.item_id
 ,        cl.common_lookup_id AS rental_item_type
 ,        r.return_date - r.check_out_date AS rental_item_price
 ,        1001 AS created_by
 ,        CURRENT_DATE AS creation_date
 ,        1001 AS last_updated_by
 ,        CURRENT_DATE AS last_update_date
 FROM     member m INNER JOIN contact c
 ON       m.member_id = c.member_id INNER JOIN transaction_upload tu
 ON       c.first_name = tu.first_name
 AND      COALESCE(c.middle_name,'x') = COALESCE(tu.middle_name,'x')
 AND      c.last_name = tu.last_name
 AND      tu.account_number = m.account_number LEFT JOIN rental r
 ON       c.contact_id = r.customer_id
 AND      tu.check_out_date = r.check_out_date
 AND      tu.return_date = r.return_date INNER JOIN common_lookup cl
 ON       cl.common_lookup_table = 'RENTAL_ITEM'
 AND      cl.common_lookup_column = 'RENTAL_ITEM_TYPE'
 AND      cl.common_lookup_type = tu.rental_item_type  LEFT JOIN rental_item ri
 ON       r.rental_id = ri.rental_id);
