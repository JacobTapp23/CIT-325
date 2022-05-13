-- ------------------------------------------------------------------
--  Program Name:   apply_lab3_step4.sql
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
--   psql> \i apply_lab3_step4.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   c.last_name
,        m.account_number
,        m.credit_card_number
,        COUNT(*) AS total_names
FROM     member m JOIN contact c
ON       m.member_id = c.member_id
GROUP BY c.last_name
,        m.account_number
,        m.credit_card_number
HAVING   COUNT(*) > 1;
