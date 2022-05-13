-- ------------------------------------------------------------------
--  Program Name:   verity_lab6_step4.sql
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
SELECT 'Lab 6: Step 5: Task 1, 2, 3, & 4' AS "Task Identifier";

-- Query the result sets.
SELECT   m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' || c.middle_name || ' '
           ELSE ''
         END AS full_name
,        sa.street_address
,        a.city
,        a.state_province AS state
,        a.postal_code
FROM     member m INNER JOIN contact c
ON       m.member_id = c.member_id INNER JOIN address a
ON       c.contact_id = a.contact_id INNER JOIN street_address sa
ON       a.address_id = sa.address_id INNER JOIN telephone t
ON       c.contact_id = t.contact_id
WHERE    c.last_name = 'Potter';
