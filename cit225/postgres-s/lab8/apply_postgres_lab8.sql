-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab8.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  13-Oct-2019
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
--   psql> \i apply_postgres_lab8.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab7/apply_postgres_lab7.sql

-- ------------------------------------------------------------------
--  Step #1: Insert results of query into the price table.
-- ------------------------------------------------------------------

\o ./logs/apply_lab8_step1.txt \i C:/Data/cit225/postgres-s/lab8/steps/apply_lab8_step1.sql
\o ./logs/verify_lab8_step1.txt \i C:/Data/cit225/postgres-s/lab8/audit/verify_lab8_step1.sql

-- ------------------------------------------------------------------
--  Step #2: Update column values and add not null constraint
--           on the rental_item_price column of the rental_item table.
-- ------------------------------------------------------------------

\o ./logs/apply_lab8_step2.txt \i C:/Data/cit225/postgres-s/lab8/steps/apply_lab8_step2.sql
\o ./logs/verify_lab8_step2.txt \i C:/Data/cit225/postgres-s/lab8/audit/verify_lab8_step2.sql

-- ------------------------------------------------------------------
--  Step #3: Update column values and add not null constraint
--           on the rental_item_price column of the rental_item table.
-- ------------------------------------------------------------------

\o ./logs/apply_lab8_step3.txt \i C:/Data/cit225/postgres-s/lab8/steps/apply_lab8_step3.sql
\o ./logs/verify_lab8_step3.txt \i C:/Data/cit225/postgres-s/lab8/audit/verify_lab8_step3.sql
