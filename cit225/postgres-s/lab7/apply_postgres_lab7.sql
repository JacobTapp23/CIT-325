-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab7.sql
--  Lab Assignment: Lab #7
--  Program Author: Michael McLaughlin
--  Creation Date:  09-Nov-2019
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
--   psql> \i apply_postgres_lab7.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab6/apply_postgres_lab6.sql

-- ------------------------------------------------------------------
--  Step #1: Add 8 rows to the common_lookup table.
-- ------------------------------------------------------------------

\o ./logs/apply_lab7_step1.txt  \i C:/Data/cit225/postgres-s/lab7/steps/apply_lab7_step1.sql
\o ./logs/verify_lab7_step1.txt \i C:/Data/cit225/postgres-s/lab7/audit/verify_lab7_step1.sql

-- ------------------------------------------------------------------
--  Step #2: Update rental_item_type in the rental table, and
--           add a foreign key and not null constraint to the 
--           column.
-- ------------------------------------------------------------------

\o ./logs/apply_lab7_step2.txt  \i C:/Data/cit225/postgres-s/lab7/steps/apply_lab7_step2.sql
\o ./logs/verify_lab7_step2.txt \i C:/Data/cit225/postgres-s/lab7/audit/verify_lab7_step2.sql

-- ------------------------------------------------------------------
--  Step #3: Update rental_item_type in the rental table, and
--           add a foreign key and not null constraint to the 
--           column.
-- ------------------------------------------------------------------

\o ./logs/apply_lab7_step3.txt  \i C:/Data/cit225/postgres-s/lab7/steps/apply_lab7_step3.sql
\o ./logs/verify_lab7_step3.txt \i C:/Data/cit225/postgres-s/lab7/audit/verify_lab7_step3.sql
