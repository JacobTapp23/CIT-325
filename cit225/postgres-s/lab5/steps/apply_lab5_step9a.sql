-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step9a.sql
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
--   psql> \i apply_lab5_step9a.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the Task #9a.
--  ------------------
--   Change the value of the item_rating column.
-- ------------------------------------------------------------------


UPDATE item
SET    item_rating = 'PG-13'
WHERE  item_rating = 'PG13';
