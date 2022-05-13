-- ------------------------------------------------------------------
--  Program Name:   verify_lab9_step6.sql
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
--   psql> \i verify_lab9_step6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Verify the seeding of the airport table.
-- -------------------------------------------------------------------

-- Query label.
SELECT 'Lab 9: Step 6: Task 1' AS "Task Expected Results";

-- Call the seed_account_list() stored procedure.
SELECT   SUBSTR(account_number,1,3) AS "Airport"
,        COUNT(*) AS "# Accounts"
FROM     account_list
WHERE    consumed_date IS NULL
GROUP BY SUBSTR(account_number,1,3)
ORDER BY 1;
