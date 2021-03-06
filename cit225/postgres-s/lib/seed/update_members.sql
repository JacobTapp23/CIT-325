-- ------------------------------------------------------------------
--  Program Name:   update_members.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  25-Jan-2018
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- These steps modify the MEMBER table created during Lab #2, by adding
-- a MEMBER_TYPE column and seeding an appropriate group or individual 
-- account on the basis of how many contacts belong to a member.
-- ------------------------------------------------------------------

-- Update all MEMBER_TYPE values based on number of dependent CONTACT rows.
UPDATE member m
SET    member_type =
        (SELECT   common_lookup_id
         FROM     common_lookup
         WHERE    common_lookup_context = 'MEMBER'
         AND      common_lookup_type =
                   (SELECT  dt.member_type
                    FROM   (SELECT   c.member_id
                            ,        CASE
                                       WHEN COUNT(c.member_id) > 1 THEN 'GROUP'
                                       ELSE 'INDIVIDUAL'
                                     END AS member_type
                            FROM     contact c
                            GROUP BY c.member_id) dt
                    WHERE    dt.member_id = m.member_id));

-- Modify the MEMBER table to add a NOT NULL constraint to the MEMBER_TYPE column.
ALTER TABLE member
  ALTER COLUMN member_type SET NOT NULL;

-- Use SQL*Plus report formatting commands.
SELECT   m.member_id
,        COUNT(contact_id) AS MEMBERS
,        m.member_type
,        cl.common_lookup_id
,        cl.common_lookup_type
FROM     member m INNER JOIN contact c
ON       m.member_id = c.member_id INNER JOIN common_lookup cl
ON       m.member_type = cl.common_lookup_id
GROUP BY m.member_id
,        m.member_type
,        cl.common_lookup_id
,        cl.common_lookup_type
ORDER BY m.member_id;
