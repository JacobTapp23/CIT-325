-- ------------------------------------------------------------------
--  Program Name:   verify_lab9_step9.sql
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
--   psql> \i verify_lab9_step9.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Query the number of rows inserted in to the
--           transaction_upload table.
-- -------------------------------------------------------------------

-- Query label.
SELECT 'Lab 9: Step 10: Task 1' AS "Task Expected Results";

SELECT COUNT(*)
FROM   transaction_upload;
