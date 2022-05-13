-- ------------------------------------------------------------------
--  Program Name:   seeding.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  30-Jan-2018
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

\o ./logs/group_account1.txt         \i C:/Data/cit225/postgres-s/lib/seed/group_account1.sql
\o ./logs/group_account2.txt         \i C:/Data/cit225/postgres-s/lib/seed/group_account2.sql
\o ./logs/group_account3.txt         \i C:/Data/cit225/postgres-s/lib/seed/group_account3.sql
\o ./logs/item_inserts.txt           \i C:/Data/cit225/postgres-s/lib/seed/item_inserts.sql
\o ./logs/create_insert_contacts.txt \i C:/Data/cit225/postgres-s/lib/seed/create_insert_contacts.sql
\o ./logs/individual_accounts.txt    \i C:/Data/cit225/postgres-s/lib/seed/individual_accounts.sql
\o ./logs/update_members.txt         \i C:/Data/cit225/postgres-s/lib/seed/update_members.sql
\o ./logs/rental_inserts.txt         \i C:/Data/cit225/postgres-s/lib/seed/rental_inserts.sql
\o ./logs/create_view.txt            \i C:/Data/cit225/postgres-s/lib/seed/create_view.sql
\o ./logs/system_user_inserts.txt    \i C:/Data/cit225/postgres-s/lib/seed/system_user_inserts.sql

-- ------------------------------------------------------------------
--   Query to verify seven rows of chained inserts to the five
--   dependent tables.
-- ------------------------------------------------------------------
--    1. MEMBER
--    2. CONTACT
--    3. ADDRESS
--    4. STREET_ADDRESS
--    5. TELEPHONE
-- ------------------------------------------------------------------

SELECT   m.member_id
,        m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' || SUBSTR(c.middle_name,1,1)
           ELSE ''
         END AS full_name
,        a.city
,        a.state_province
,        t.country_code || '-(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM     member m INNER JOIN contact c ON m.member_id = c.member_id INNER JOIN
         address a ON c.contact_id = a.contact_id INNER JOIN
         street_address sa ON a.address_id = sa.address_id INNER JOIN
         telephone t ON c.contact_id = t.contact_id AND a.address_id = t.address_id
WHERE    last_name IN ('Sweeney','Vizquel','Winn');

-- ------------------------------------------------------------------
--  Display the 21 inserts into the item table.
-- ------------------------------------------------------------------
SELECT   i.item_id
,        cl.common_lookup_meaning
,        i.item_title
,        i.item_release_date
FROM     item i INNER JOIN common_lookup cl ON i.item_type = cl.common_lookup_id;

-- ------------------------------------------------------------------
--   Query to verify five individual rows of chained inserts through
--   a procedure into the five dependent tables.
-- ------------------------------------------------------------------
SELECT   m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' || SUBSTR(c.middle_name,1,1)
           ELSE ''
         END AS full_name
,        a.city
,        a.state_province
,        t.country_code || '-(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM     member m INNER JOIN contact c ON m.member_id = c.member_id INNER JOIN
         address a ON c.contact_id = a.contact_id INNER JOIN
         street_address sa ON a.address_id = sa.address_id INNER JOIN
         telephone t ON c.contact_id = t.contact_id AND a.address_id = t.address_id
WHERE    m.member_type = (SELECT common_lookup_id
                          FROM   common_lookup
                          WHERE  common_lookup_context = 'MEMBER'
                          AND    common_lookup_type = 'INDIVIDUAL');

-- ------------------------------------------------------------------
--   Query to verify nine rental agreements, some with one and some
--   with more than one rental item.
-- ------------------------------------------------------------------
SELECT   m.member_id
,        m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' || SUBSTR(c.middle_name,1,1)
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
