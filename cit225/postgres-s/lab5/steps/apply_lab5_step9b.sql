-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step9b.sql
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
--   psql> \i apply_lab5_step9b.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the Task #9b.
--  ------------------
--   Add a rating_id column to the item table.
-- ------------------------------------------------------------------

ALTER TABLE item 
  ADD COLUMN rating_id INT;
