-- ------------------------------------------------------------------
--  Program Name:   apply_lab4_step10.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  27-Aug-2020
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
--   psql> \i apply_lab4_step10.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   c.last_name
,        m.account_number
,        sa.street_address || E'\n'
||       a.city || ', ' || a.state_province || ' ' || a.postal_code AS c_address
,        i.item_title
FROM     member m JOIN contact c
ON       m.member_id = c.member_id 
JOIN     address a
ON       c.contact_id = a.contact_id
JOIN     street_address sa
ON       a.address_id = sa.address_id
JOIN     telephone t
ON       c.contact_id = t.contact_id
JOIN     rental r
ON       c.contact_id = r.customer_id
JOIN     rental_item ri
ON       r.rental_id = ri.rental_id
JOIN     item i
ON       ri.item_id = i.item_id
WHERE    i.item_title LIKE 'St_r Wars%';
