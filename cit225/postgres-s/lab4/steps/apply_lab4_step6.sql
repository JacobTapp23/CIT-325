-- ------------------------------------------------------------------
--  Program Name:   apply_lab4_step6.sql
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
--   psql> \i apply_lab4_step5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   c.last_name
,        m.account_number
,        sa.street_address || E'\n'
||       a.city || ', ' || a.state_province || ' ' || a.postal_code AS c_address
,        '(' || t.area_code || ') ' || telephone_number telephone
FROM     member m JOIN contact c
ON       m.member_id = c.member_id 
JOIN     address a
ON       c.contact_id = a.contact_id
JOIN     street_address sa
ON       a.address_id = sa.address_id
JOIN     telephone t
ON       c.contact_id = t.contact_id
WHERE    c.last_name = 'Vizquel';
