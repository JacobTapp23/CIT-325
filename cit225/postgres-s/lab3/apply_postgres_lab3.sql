-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab3.sql
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
--   psql> \i apply_postgres_lab3.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab2/apply_postgres_lab2.sql

-- ------------------------------------------------------------------
--  Run the 10 use cases.
-- ------------------------------------------------------------------

\o ./logs/apply_lab3_step1.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step1.sql
\o ./logs/apply_lab3_step2.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step2.sql
\o ./logs/apply_lab3_step3.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step3.sql
\o ./logs/apply_lab3_step4.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step4.sql
\o ./logs/apply_lab3_step5.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step5.sql
\o ./logs/apply_lab3_step6.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step6.sql
\o ./logs/apply_lab3_step7.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step7.sql
\o ./logs/apply_lab3_step8.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step8.sql
\o ./logs/apply_lab3_step9.txt  \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step9.sql
\o ./logs/apply_lab3_step10.txt \i C:/Data/cit225/postgres-s/lab3/steps/apply_lab3_step10.sql
