-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step10.sql
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
--   psql> \i apply_lab9_step10.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Copy the data from the file into the transaction_upload
--           table.
-- -------------------------------------------------------------------

-- Query label.
SELECT 'Lab 9: Step 10: Task 1' AS "Task Identifier";

-- Copy the contents of the external file.
DO $$
BEGIN
  /* Delete any previously loaded data because the copy method 
     is an append-only method. */
  EXECUTE 'DELETE FROM transaction_upload';

  /* Copy the csv file data into the transaction_upload table. */
  COPY transaction_upload
  FROM 'C:/Data/cit225/postgres-s/lab9/upload/transaction_upload_postgres.csv'
  DELIMITERS ',' CSV;
END;
$$;

