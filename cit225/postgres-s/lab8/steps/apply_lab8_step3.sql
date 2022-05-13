-- ------------------------------------------------------------------
--  Program Name:   apply_lab8_step3.sql
--  Lab Assignment: Lab #8
--  Program Author: Michael McLaughlin
--  Creation Date:  11-Nov-2019
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
--   psql> \i apply_lab6_step3.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Add not null constraint.
-- -------------------------------------------------------------------

ALTER TABLE rental_item
ALTER COLUMN rental_item_price SET NOT NULL;
