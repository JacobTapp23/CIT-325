-- ------------------------------------------------------------------
--  Program Name:   create_postgres_store.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  28-Sep-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  21-Feb-2022    Modified to run from Windows OS.
-- ==================================================================
--  This creates the system_user table and system_user_s1 sequences.
-- ------------------------------------------------------------------
--    Create and assign bind variable for table name.
-- ==================================================================
SET SESSION "videodb.catalog_name" = 'videodb';

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- Run a set of tables.
\o ./log/system_user.txt    \i C:/Data/cit225/postgres-s/lib/create/system_user.sql
\o ./log/common_lookup.txt  \i C:/Data/cit225/postgres-s/lib/create/common_lookup.sql
\o ./log/member.txt         \i C:/Data/cit225/postgres-s/lib/create/member.sql
\o ./log/contact.txt        \i C:/Data/cit225/postgres-s/lib/create/contact.sql
\o ./log/address.txt        \i C:/Data/cit225/postgres-s/lib/create/address.sql
\o ./log/street_address.txt \i C:/Data/cit225/postgres-s/lib/create/street_address.sql
\o ./log/telephone.txt      \i C:/Data/cit225/postgres-s/lib/create/telephone.sql
\o ./log/rental.txt         \i C:/Data/cit225/postgres-s/lib/create/rental.sql
\o ./log/item.txt           \i C:/Data/cit225/postgres-s/lib/create/item.sql
\o ./log/rental_item.txt    \i C:/Data/cit225/postgres-s/lib/create/rental_item.sql

-- Query the catalog.
SELECT   t.table_catalog
,        t.table_name
,        s.sequence_name
FROM     information_schema.tables t join information_schema.sequences s
ON       s.sequence_name LIKE t.table_name||'%'
WHERE    table_catalog = current_setting('videodb.catalog_name')
AND      table_name IN ('system_user','common_lookup','member','contact','address'
                       ,'street_address','telephone','rental','item','rental_item')
ORDER BY CASE
           WHEN table_name LIKE 'system_user%' THEN 0
           WHEN table_name LIKE 'common_lookup%' THEN 1
           WHEN table_name LIKE 'member%' THEN 2
           WHEN table_name LIKE 'contact%' THEN 3
           WHEN table_name LIKE 'address%' THEN 4
           WHEN table_name LIKE 'street_address%' THEN 5
           WHEN table_name LIKE 'telephone%' THEN 6
           WHEN table_name LIKE 'item%' THEN 7
           WHEN table_name LIKE 'rental%' THEN 8
           WHEN table_name LIKE 'rental_item%' THEN 9 
		 END;
