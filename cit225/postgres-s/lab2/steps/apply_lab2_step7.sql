-- ------------------------------------------------------------------
--  Program Name:   apply_lab2_step7.sql
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
--   psql> \i apply_lab2_step7.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   first_name
,        middle_name
,        last_name
FROM     contact
WHERE    last_name = 'Sweeney'
AND      middle_name IS NULL;
