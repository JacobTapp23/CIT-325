-- ------------------------------------------------------------------
--  Program Name:   verify_foreign_key.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  11-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ==================================================================
--  This creates the system_user table and system_user_s1 sequences.
-- ------------------------------------------------------------------
--    Create and assign bind variable for table name.
-- ==================================================================

--  Verify table name.
SELECT   r.rating_id
,        r.rating
,        i.item_rating
FROM     rating r JOIN item i
ON       r.rating_id = i.rating_id;
