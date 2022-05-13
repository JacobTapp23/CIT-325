-- ------------------------------------------------------------------
--  Program Name:   apply_lab3_step8.sql
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
--   psql> \i apply_lab3_step8.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   i.item_title
,        i.item_rating
FROM     item i
WHERE    i.item_type IN (SELECT common_lookup_Id
	                 FROM   common_lookup
			 WHERE  common_lookup_type IN
			          ('BLU-RAY'
                                  ,'DVD_FULL_SCREEN' 
                                  ,'DVD_WIDE_SCREEN'))
ORDER BY i.item_title;
