-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step7.sql
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
--   psql> \i apply_lab5_step7.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the 1st Row below.
-- ------------------------------------------------------------------

INSERT INTO rating_agency
( rating_agency_abbr
, rating_agency_name
, created_by
, last_updated_by )
VALUES
('ESRB'
,'Entertainment Software Rating Board'
,(SELECT system_user_id
  FROM   system_user
  WHERE  system_user_name = 'DBA2')
,(SELECT system_user_id
  FROM   system_user
  WHERE  system_user_name = 'DBA2'));

-- ------------------------------------------------------------------
--  Enter the 1st Row below.
-- ------------------------------------------------------------------

INSERT INTO rating_agency
( rating_agency_abbr
, rating_agency_name
, created_by
, last_updated_by )
VALUES
('MPAA'
,'Motion Picture Association of America'
,(SELECT system_user_id
  FROM   system_user
  WHERE  system_user_name = 'DBA2')
,(SELECT system_user_id
  FROM   system_user
  WHERE  system_user_name = 'DBA2'));
