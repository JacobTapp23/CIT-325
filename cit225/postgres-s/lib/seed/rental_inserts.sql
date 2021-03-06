-- ------------------------------------------------------------------
--  Program Name:   rental_inserts.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  29-Jan-2018
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--  This seeds data in the video store model.
--   - Inserts the data in the rental table for 5 records and
--     then inserts 9 dependent records in a non-sequential 
--     order.
--   - A non-sequential order requires that you use subqueries
--     to discover the foreign key values for the inserts.
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Insert 5 records in the RENTAL table.
-- ------------------------------------------------------------------

INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Vizquel'
  AND      first_name = 'Oscar')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Vizquel'
  AND      first_name = 'Doreen')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Sweeney'
  AND      first_name = 'Meaghan')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Sweeney'
  AND      first_name = 'Ian')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

INSERT INTO rental
( customer_id
, check_out_date
, return_date
, created_by
, last_updated_by )
VALUES
((SELECT   contact_id
  FROM     contact
  WHERE    last_name = 'Winn'
  AND      first_name = 'Brian')
, CURRENT_DATE
, CURRENT_DATE + INTERVAL '5 day'
, 1001
, 1001 );

-- ------------------------------------------------------------------
-- Insert 9 records in the RENTAL_ITEM table.
-- ------------------------------------------------------------------

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
  AND      c.last_name = 'Vizquel'
  AND      c.first_name = 'Oscar')
,(SELECT   i.item_id
  FROM     item i
  ,        common_lookup cl
  WHERE    i.item_title = 'Star Wars I'
  AND      i.item_subtitle = 'Phantom Menace'
  AND      i.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'DVD_WIDE_SCREEN')
, 1001
, 1001 );

INSERT INTO rental_item
( rental_id
, item_id
, created_by
, last_updated_by )
VALUES
((SELECT   r.rental_id
  FROM     rental r inner join contact c
  ON       r.customer_id = c.contact_id
  WHERE    c.last_name = 'Vizquel'
  AND      c.first_name = 'Oscar')
,(SELECT   d.item_id
  FROM     item d join common_lookup cl
  ON       d.item_title = 'Star Wars II'
  WHERE    d.item_subtitle = 'Attack of the Clones'
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'DVD_WIDE_SCREEN')
, 1001
, 1001 );

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
  AND      c.last_name = 'Vizquel'
  AND      c.first_name = 'Oscar')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'Star Wars III'
  AND      d.item_subtitle = 'Revenge of the Sith'
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'DVD_WIDE_SCREEN')
, 1001
, 1001 );

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
  AND      c.last_name = 'Vizquel'
  AND      c.first_name = 'Doreen')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'I Remember Mama'
  AND      d.item_subtitle = ''
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

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
  AND      c.last_name = 'Vizquel'
  AND      c.first_name = 'Doreen')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'Camelot'
  AND      d.item_subtitle = ''
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

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
  AND      c.last_name = 'Sweeney'
  AND      c.first_name = 'Meaghan')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'Hook'
  AND      d.item_subtitle = ''
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'BLU-RAY')
, 1001
, 1001 );

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
  AND      c.last_name = 'Sweeney'
  AND      c.first_name = 'Ian')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'Cars'
  AND      d.item_subtitle = ''
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'XBOX')
, 1001
, 1001 );

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
  AND      c.last_name = 'Winn'
  AND      c.first_name = 'Brian')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'RoboCop'
  AND      d.item_subtitle = ''
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'XBOX')
, 1001
, 1001 );

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
  AND      c.last_name = 'Winn'
  AND      c.first_name = 'Brian')
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = 'The Hunt for Red October'
  AND      d.item_subtitle = 'Special Collector''s Edition'
  AND      d.item_type = cl.common_lookup_id
  AND      cl.common_lookup_type = 'DVD_WIDE_SCREEN')
, 1001
, 1001 );

-- ------------------------------------------------------------------
--   Query to verify nine rental agreements, some with one and some
--   with more than one rental item.
-- ------------------------------------------------------------------
SELECT   m.member_id
,        m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' ||SUBSTR(c.middle_name,1,1)
	   ELSE ''
         END AS full_name
,        r.rental_id
,        ri.rental_item_id
,        i.item_title
FROM     member m INNER JOIN contact c ON m.member_id = c.member_id INNER JOIN
         rental r ON c.contact_id = r.customer_id INNER JOIN
         rental_item ri ON r.rental_id = ri.rental_id INNER JOIN
         item i ON ri.item_id = i.item_id
ORDER BY r.rental_id;
