-- ------------------------------------------------------------------
--  Program Name:   apply_postgres_lab1.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  13-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  21-Feb-2022    Modified to run from Windows OS.
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
--   psql> \i apply_postgres_lab1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Cleanup prior installations and run previous lab scripts.
-- ------------------------------------------------------------------

\o ./logs/cleanup_catalog.txt       \i C:/Data/cit225/postgres-s/lib/utility/cleanup_catalog.sql
\o ./logs/create_postgres_store.txt \i C:/Data/cit225/postgres-s/lib/create/create_postgres_store.sql
\o ./logs/preseed_store.txt         \i C:/Data/cit225/postgres-s/lib/preseed/preseed_store.sql
\o ./logs/seeding.txt               \i C:/Data/cit225/postgres-s/lib/seed/seeding.sql
