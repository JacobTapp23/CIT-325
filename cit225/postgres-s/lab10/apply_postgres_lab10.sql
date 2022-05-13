-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab10.sql
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
--   psql> \i apply_postgres_lab10.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab9/apply_postgres_lab9.sql

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\o ./logs/apply_lab10_step1.txt \i C:/Data/cit225/postgres-s/lab10/steps/apply_lab10_step1.sql
\o ./logs/verify_lab10_step1.txt \i C:/Data/cit225/postgres-s/lab10/audit/verify_lab10_step1.sql

\o ./logs/apply_lab10_step2.txt \i C:/Data/cit225/postgres-s/lab10/steps/apply_lab10_step2.sql
\o ./logs/verify_lab10_step2.txt \i C:/Data/cit225/postgres-s/lab10/audit/verify_lab10_step2.sql

\o ./logs/apply_lab10_step3.txt \i C:/Data/cit225/postgres-s/lab10/steps/apply_lab10_step3.sql
\o ./logs/verify_lab10_step3.txt \i C:/Data/cit225/postgres-s/lab10/audit/verify_lab10_step3.sql