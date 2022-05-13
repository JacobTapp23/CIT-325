-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab6.sql
--  Lab Assignment: Lab #6
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
--   psql> \i apply_postgres_lab6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\i C:/Data/cit225/postgres-s/lab5/apply_postgres_lab5.sql

-- ------------------------------------------------------------------
--  Step #1: Alter the rental_item table.
-- ------------------------------------------------------------------

\o ./logs/apply_lab6_step1.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step1.sql
\o ./logs/verify_lab6_step1.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step1.sql

-- ------------------------------------------------------------------
--  Step #2: Create the price table and its sequence.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step2.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step2.sql
\o ./logs/verify_lab6_step2.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step2.sql

-- ------------------------------------------------------------------
--  Step #3: Rename the item_release_date to release_date.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step3.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step3.sql
\o ./logs/verify_lab6_step3.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step3.sql

-- ------------------------------------------------------------------
--  Step #4: Insert three BLU-RAY releases into the item table.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step4.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step4.sql
\o ./logs/verify_lab6_step4.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step4.sql

-- ------------------------------------------------------------------
--  Step #5: Insert three BLU-RAY releases into the item table.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step5.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step5.sql
\o ./logs/verify_lab6_step5.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step5.sql

-- ------------------------------------------------------------------
--  Step #6: Insert three BLU-RAY releases into the item table.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step6.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step6.sql
\o ./logs/verify_lab6_step6.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step6.sql

-- ------------------------------------------------------------------
--  Step #7: Modify the design of the common_lookup table.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step7.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step7.sql
\o ./logs/verify_lab6_step7.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step7.sql

-- ------------------------------------------------------------------
--  Step #8: Create the price table.
-- ------------------------------------------------------------------
\o ./logs/apply_lab6_step8.txt \i C:/Data/cit225/postgres-s/lab6/steps/apply_lab6_step8.sql
\o ./logs/verify_lab6_step8.txt \i C:/Data/cit225/postgres-s/lab6/audit/verify_lab6_step8.sql