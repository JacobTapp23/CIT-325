-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step2.sql
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
--   psql> \i apply_lab6_step6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert a rental agreement with two rental items.
-- -------------------------------------------------------------------
INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Potter'
  AND      first_name = 'Harry')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '1 day'
, 1001
, 1001 );

-- One rental item.
INSERT INTO rental_item
( rental_id
, item_id
, created_by
, last_updated_by )
VALUES
((SELECT   r.rental_id
  FROM     rental r
  ,        contact c
  WHERE    r.customer_id = c.contact_id
  AND      c.last_name = 'Potter'
  AND      c.first_name = 'Harry')
,(SELECT   i.item_id
  FROM     item i INNER JOIN common_lookup cl
  ON       i.item_type = cl.common_lookup_id
  WHERE    i.item_title = 'Toy Story 4'
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

-- Second rental item.
INSERT INTO rental_item
( rental_id
, item_id
, created_by
, last_updated_by )
VALUES
((SELECT   r.rental_id
  FROM     rental r
  ,        contact c
  WHERE    r.customer_id = c.contact_id
  AND      c.last_name = 'Potter'
  AND      c.first_name = 'Harry')
,(SELECT   i.item_id
  FROM     item i INNER JOIN common_lookup cl
  ON       i.item_type = cl.common_lookup_id
  WHERE    i.item_title = 'X-Men: Dark Phoenix'
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

-- ------------------------------------------------------------------
--  Task #2: Insert a rental agreement with one rental item.
-- -------------------------------------------------------------------
INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Potter'
  AND      first_name = 'Ginny')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '3 day'
, 1001
, 1001 );

-- One rental item.
INSERT INTO rental_item
( rental_id
, item_id
, created_by
, last_updated_by )
VALUES
((SELECT   r.rental_id
  FROM     rental r
  ,        contact c
  WHERE    r.customer_id = c.contact_id
  AND      c.last_name = 'Potter'
  AND      c.first_name = 'Ginny')
,(SELECT   i.item_id
  FROM     item i INNER JOIN common_lookup cl
  ON       i.item_type = cl.common_lookup_id
  WHERE    i.item_title = 'Toy Story 4'
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

-- ------------------------------------------------------------------
--  Task #3: Insert a rental agreement with one rental item.
-- -------------------------------------------------------------------
INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Potter'
  AND      first_name = 'Lily')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

-- One rental item.
INSERT INTO rental_item
( rental_id
, item_id
, created_by
, last_updated_by )
VALUES
((SELECT   r.rental_id
  FROM     rental r
  ,        contact c
  WHERE    r.customer_id = c.contact_id
  AND      c.last_name = 'Potter'
  AND      c.first_name = 'Lily')
,(SELECT   i.item_id
  FROM     item i INNER JOIN common_lookup cl
  ON       i.item_type = cl.common_lookup_id
  WHERE    i.item_title = 'X-Men: Dark Phoenix'
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );
