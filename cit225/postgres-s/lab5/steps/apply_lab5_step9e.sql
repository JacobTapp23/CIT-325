-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step9e.sql
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
--   psql> \i apply_lab5_step9d.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the Task #9e.
--  ------------------
--   Add a not null constraint on the rating_id column in the item
--   table.
-- ------------------------------------------------------------------

ALTER TABLE item
  ADD CONSTRAINT fk_item_4 FOREIGN KEY (rating_id)
      REFERENCES rating(rating_id);
