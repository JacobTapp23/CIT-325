-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab2.sql
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
--   psql> \i apply_postgres_lab2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab1/apply_postgres_lab1.sql

-- ------------------------------------------------------------------
--  Run the 10 use cases.
-- ------------------------------------------------------------------

\o ./logs/apply_lab2_step1.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step1.sql
\o ./logs/apply_lab2_step2.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step2.sql
\o ./logs/apply_lab2_step3.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step3.sql
\o ./logs/apply_lab2_step4.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step4.sql
\o ./logs/apply_lab2_step5.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step5.sql
\o ./logs/apply_lab2_step6.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step6.sql
\o ./logs/apply_lab2_step7.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step7.sql
\o ./logs/apply_lab2_step8.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step8.sql
\o ./logs/apply_lab2_step9.txt  \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step9.sql
\o ./logs/apply_lab2_step10.txt \i C:/Data/cit225/postgres-s/lab2/steps/apply_lab2_step10.sql
