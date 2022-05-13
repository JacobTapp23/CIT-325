-- ------------------------------------------------------------------
--  Program Name:   apply_lab3_step10.sql
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
--   psql> \i apply_lab3_step10.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

SELECT   cl.common_lookup_id
,        cl.common_lookup_context
,        cl.common_lookup_type
,        COUNT(m.credit_card_type) AS credit_cards
FROM     member m RIGHT JOIN common_lookup cl
ON       m.credit_card_type = cl.common_lookup_id 
WHERE    cl.common_lookup_type IN
           ('DISCOVER_CARD'
	   ,'MASTER_CARD'
           ,'VISA_CARD')
GROUP BY cl.common_lookup_id
,        cl.common_lookup_context
,        cl.common_lookup_type
HAVING   COUNT(m.credit_card_type) = 0;
