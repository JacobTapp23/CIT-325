-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab5.sql
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
--   psql> \i apply_postgres_lab5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab4/apply_postgres_lab4.sql

-- ------------------------------------------------------------------
--  Run the 10 use cases.
-- ------------------------------------------------------------------

\o ./logs/apply_lab5_step1.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step1.sql
\o ./logs/apply_lab5_step2.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step2.sql
\o ./logs/apply_lab5_step3.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step3.sql
\o ./logs/apply_lab5_step4.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step4.sql
\o ./logs/apply_lab5_step5.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step5.sql
\o ./logs/drop_rating_agency.txt    \i C:/Data/cit225/postgres-s/lab5/audit/drop_rating_agency.sql
\o ./logs/apply_lab5_step6.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step6.sql
\o ./logs/verify_rating_agency.txt  \i C:/Data/cit225/postgres-s/lab5/audit/verify_rating_agency.sql
\o ./logs/apply_lab5_step7.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step7.sql
\o ./logs/drop_rating.txt           \i C:/Data/cit225/postgres-s/lab5/audit/drop_rating.sql
\o ./logs/apply_lab5_step8.txt      \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step8.sql
\o ./logs/verify_rating.txt         \i C:/Data/cit225/postgres-s/lab5/audit/verify_rating.sql
\o ./logs/apply_lab5_step9a.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9a.sql
\o ./logs/seed_rating.txt           \i C:/Data/cit225/postgres-s/lab5/audit/seed_rating.sql
\o ./logs/apply_lab5_step9b.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9b.sql
\o ./logs/apply_lab5_step9c.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9c.sql
\o ./logs/apply_lab5_step9d.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9d.sql
\o ./logs/verify_foreign_key.txt    \i C:/Data/cit225/postgres-s/lab5/audit/verify_foreign_key.sql
\o ./logs/apply_lab5_step9e.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9e.sql
\o ./logs/verify_item.txt           \i C:/Data/cit225/postgres-s/lab5/audit/verify_item.sql
\o ./logs/apply_lab5_step9f.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step9f.sql
\o ./logs/apply_lab5_step10.txt     \i C:/Data/cit225/postgres-s/lab5/steps/apply_lab5_step10.sql
