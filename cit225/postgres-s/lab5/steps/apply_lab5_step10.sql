-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step10.sql
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
--   psql> \i apply_lab5_step10.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   m.account_number
,        c.last_name
,        i.item_title
,        ra.rating_agency_abbr
,        rate.rating
FROM     member m JOIN contact c
ON       m.member_id = c.member_id 
JOIN     rental r
ON       c.contact_id = r.customer_id
JOIN     rental_item ri
ON       r.rental_id = ri.rental_id
JOIN     item i
ON       ri.item_id = i.item_id
JOIN     rating rate
ON       i.rating_id = rate.rating_id
JOIN     rating_agency ra
ON       rate.rating_agency_id = ra.rating_agency_id
ORDER BY c.last_name
,        i.item_title;
