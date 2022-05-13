-- ------------------------------------------------------------------
--  Program Name:   apply_lab2_step9.sql
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
--   psql> \i apply_lab2_step9.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   city
,        state_province
,        postal_code
FROM     address
WHERE    city IN ('Provo','San Jose');
