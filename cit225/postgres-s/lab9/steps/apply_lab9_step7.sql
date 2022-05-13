-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step7.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Nov-2019
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
--   psql> \i apply_lab9_step6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Update the state_province column of the address table.
-- -------------------------------------------------------------------

UPDATE address
SET    state_province = 'California'
WHERE  state_province = 'CA';
