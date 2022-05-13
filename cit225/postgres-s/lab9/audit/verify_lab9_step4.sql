-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step4.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  07-Nov-2019
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
--   psql> \i apply_lab9_step4.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Query 6 rows from the airport table.
-- -------------------------------------------------------------------

-- Query label.
SELECT 'Lab 9: Step 4: Task 1' AS "Task Expected Results";

-- Insert row into the airport table.
SELECT   airport_code AS code
,        airport_city
,        city
,        state_province
FROM     airport;
