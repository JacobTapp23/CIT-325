-- ------------------------------------------------------------------
--  Program Name:   seed_rating.sql
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
--   psql> \i seed_rating.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Analyze the INSERT statement.
--  -----------------------------
--   1. The WITH clause is called a common table expression (CTE).
--   2. The rating_agency and item tables have nothing in common,
--      which makes joining them a challenge.
--   3. The rating_agency and item tables have a many-to-many 
--      relationship logically, which means there needs to exist
--      an association table.
--   4. There are two rules for joining these result sets, one for
--      the esrb and another for the mpaa rating agency.
--   5. The esrb CTE uses a CROSS JOIN to create a set of three
--      rows; the mpaa CTE uses a CROSS JOIN to create a set of
--      four rows; and the bridge CTE uses a SET operator to 
--      add one set to another based on their mirrored data 
--      structure, which is like a SELECT-list. 
--   6. The su CTE puts a single variable in context, which we
--      add to each row by using the Cartesian product process.
--      A Cartesian product of one table with another table of only
--      one column and row (or attribute and tuple) simply adds the
--      single column to each row in the original table.
--   7. The INSERT statement can then use a query to populate all
--      necessary rating table rows that allow you to join the
--      rating_agency row with the item table. The rating table
--      must have the correct data because after making this change
--      to the data model, it is essential to populate the new
--      rating_id foreign key column before removing the original
--      item_rating column.
-- ------------------------------------------------------------------

WITH esrb AS
(SELECT *
 FROM  (SELECT 'ESRB' AS abbr) k
        CROSS JOIN
       (SELECT 'E' AS rating
        ,      'Everyone' AS rating_desc
        UNION
        SELECT 'M' AS rating
        ,      'Mature' AS rating_desc
        UNION
        SELECT 'T' AS rating
        ,      'Teen' AS rating_desc) v)
, mpaa AS
(SELECT *
 FROM  (SELECT 'MPAA' AS abbr) k
        CROSS JOIN
       (SELECT 'G' AS rating
        ,      'General Audiences' AS rating_desc
        UNION
        SELECT 'PG' AS rating
        ,      'Parental Guidance' AS rating_desc
        UNION
        SELECT 'PG-13' AS rating
        ,      'Parental Strongly Caustioned' AS rating_desc 
        UNION
        SELECT 'NR' AS rating
        ,      'Not Rated' AS rating_desc) v)
, bridge AS
(SELECT *
 FROM   esrb
 UNION
 SELECT *
 FROM   mpaa)
, su AS
(SELECT system_user_id
 FROM   system_user
 WHERE  system_user_name = 'DBA2')
INSERT INTO rating
( rating_agency_id
, rating
, description
, created_by
, last_updated_by )
(SELECT  DISTINCT
         ra.rating_agency_id
 ,       i.item_rating AS rating
 ,       b.rating_desc AS description
 ,       su.system_user_id AS created_by
 ,       su.system_user_id AS last_updated_by
 FROM    rating_agency ra JOIN bridge b
 ON      ra.rating_agency_abbr = b.abbr JOIN item i
 ON      b.rating = i.item_rating
 OR      b.rating_desc = i.item_rating CROSS JOIN su);
