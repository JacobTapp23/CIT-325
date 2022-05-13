-- ------------------------------------------------------------------
--  Program Name:   apply_lab3_step7.sql
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
--   psql> \i apply_lab3_step7.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   cl.common_lookup_id
,        cl.common_lookup_context
,        cl.common_lookup_type
,        cl.common_lookup_meaning
FROM     common_lookup cl
WHERE    cl.common_lookup_type IN ('BLU-RAY','DVD_FULL_SCREEN','DVD_WIDE_SCREEN')
ORDER BY cl.common_lookup_type;
