-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step5.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  27-Aug-2020
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
--   psql> \i apply_lab5_step5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   su1.system_user_id
,        su1.system_user_name
,        su2.system_user_id AS created_by
,        su2.system_user_name AS creator
,        su3.system_user_id AS updated_by
,        su3.system_user_name AS updator
FROM     system_user su1 JOIN system_user su2
ON       su1.created_by = su2.system_user_id
JOIN     system_user su3
ON       su1.last_updated_by = su3.system_user_id;
