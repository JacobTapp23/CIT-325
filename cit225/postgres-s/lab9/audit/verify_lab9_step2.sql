-- ------------------------------------------------------------------
--  Program Name:   verify_lab9_step2.sql
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
--   psql> \i verify_lab9_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert 6 rows into the common_lookup table.
-- -------------------------------------------------------------------

-- Query label.
SELECT 'Lab 9: Step 2: Task 1' AS "Task Expected Results";

-- Insert a transaction_type row in common_lookup table.
SELECT   common_lookup_table
,        common_lookup_column
,        common_lookup_type
,        common_lookup_meaning
,        common_lookup_code
FROM     common_lookup
WHERE    common_lookup_table = UPPER('transaction');
