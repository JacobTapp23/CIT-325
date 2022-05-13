-- ------------------------------------------------------------------
--  Program Name:   apply_lab10_step1.sql
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
--  Task #1: Count rows from import table: [4081].
-- ------------------------------------------------------------------

SELECT   COUNT(*)
FROM    (SELECT   DISTINCT
                  r.rental_id
         ,        c.contact_id
         ,        tu.check_out_date AS check_out_date
         ,        tu.return_date AS return_date
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
         AND      tu.return_date = r.return_date) AS r;

-- ------------------------------------------------------------------
--  Task #2: Count rows from import and import target tables: [4089].
-- ------------------------------------------------------------------
		 
INSERT INTO rental
SELECT   COALESCE(r.rental_id, NEXTVAL('rental_rental_id_seq'::regclass)) AS rental_id
,        r.contact_id
,        r.check_out_date
,        r.return_date
,        r.created_by
,        r.creation_date
,        r.last_updated_by
,        r.last_update_date
FROM    (SELECT   DISTINCT
                  r.rental_id
         ,        c.contact_id
         ,        tu.check_out_date AS check_out_date
         ,        tu.return_date AS return_date
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
         AND      tu.return_date = r.return_date) AS r;