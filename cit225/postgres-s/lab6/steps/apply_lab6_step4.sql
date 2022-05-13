-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step4.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  07-Nov-2019
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
--   psql> \i apply_lab6_step4.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the price table.
-- -------------------------------------------------------------------
INSERT INTO item
( item_barcode
, item_type
, item_title
, rating_id
, release_date
, created_by
, last_updated_by )
VALUES
('B07RJ9M8JW'
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'ITEM'
  AND      common_lookup_type = 'BLU-RAY')
,'X-Men: Dark Phoenix'
,(SELECT   rating_id
  FROM     rating
  WHERE    rating = 'PG-13')
,(CURRENT_DATE - INTERVAL '10 days')::date
, 1001
, 1001 );

-- ------------------------------------------------------------------
--  Task #2: Alter sequence to restart at 1001.
-- ------------------------------------------------------------------
INSERT INTO item
( item_barcode
, item_type
, item_title
, rating_id
, release_date
, created_by
, last_updated_by )
VALUES
('B07VHY78RQ'
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'ITEM'
  AND      common_lookup_type = 'BLU-RAY')
,'Toy Story 4'
,(SELECT   rating_id
  FROM     rating
  WHERE    rating = 'G')
,(CURRENT_DATE - INTERVAL '10 days')::date
, 1001
, 1001 );

-- ------------------------------------------------------------------
--  Task #3: Add yn_price check constraint.
-- ------------------------------------------------------------------
INSERT INTO item
( item_barcode
, item_type
, item_title
, rating_id
, release_date
, created_by
, last_updated_by )
VALUES
('B07SRF34CC'
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'ITEM'
  AND      common_lookup_type = 'BLU-RAY')
,'Spider-Man: Far from Home'
,(SELECT   rating_id
  FROM     rating
  WHERE    rating = 'PG-13')
,(CURRENT_DATE - INTERVAL '10 days')::date
, 1001
, 1001 );
