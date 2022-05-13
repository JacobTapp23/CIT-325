-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step9c.sql
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
--   psql> \i apply_lab5_step9c.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the Task #9b.
--  ------------------
--   Update the rating_id foreign key column based on current
--   data set. 
-- ------------------------------------------------------------------

UPDATE item i
SET    rating_id = r.rating_id
FROM   rating r
WHERE  r.rating = i.item_rating
OR     r.description = i.item_rating;
