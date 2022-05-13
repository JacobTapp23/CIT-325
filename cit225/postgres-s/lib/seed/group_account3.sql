-- ------------------------------------------------------------------
--  Program Name:   group_account3.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This seeds data in the video store model.
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--  This seeds rows in a dependency chain, including the following
--  tables:
--
--    1. MEMBER
--    2. CONTACT
--    3. ADDRESS
--    4. STREET_ADDRESS
--    5. TELEPHONE
--
--  It creates primary keys with the .NEXTVAL pseudo columns and
--  foreign keys with the .CURRVAL pseudo columns.
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Insert record set #3, with one entry in the member table and
--  two entries in contact table.
-- ------------------------------------------------------------------
INSERT INTO member
( member_type
, account_number
, credit_card_number
, credit_card_type
, created_by
, last_updated_by )
VALUES
((SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MEMBER'
  AND      common_lookup_type = 'DISCOVER_CARD')  -- member_type
,'B293-71447'                                     -- account_number
,'3333-4444-5555-6666'                            -- credit_card_number
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MEMBER'
  AND      common_lookup_type = 'DISCOVER_CARD')  -- credit_card_type
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

-- ------------------------------------------------------------------
--  Insert first contact in a group account user.
-- ------------------------------------------------------------------
INSERT INTO contact
( member_id
, contact_type
, first_name
, last_name
, created_by
, last_updated_by )
VALUES
( CURRVAL('member_member_id_seq')                 -- member_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'CONTACT'
  AND      common_lookup_type = 'CUSTOMER')       -- contact_type
,'Meaghan'                                        -- first_name
,'Sweeney'                                        -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO address
( contact_id
, address_type
, city
, state_province
, postal_code
, created_by
, last_updated_by )
VALUES
( CURRVAL('contact_contact_id_seq')               -- contact_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_type = 'HOME')           -- address_type
,'San Jose'                                       -- city
,'CA'                                             -- state_province
,'95192'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
 VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'14 El Camino Real'                              -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO telephone
( contact_id
, address_id
, telephone_type
, country_code
, area_code
, telephone_number
, created_by
, last_updated_by )
 VALUES
( CURRVAL('contact_contact_id_seq')               -- address_id
, CURRVAL('address_address_id_seq')               -- contact_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MULTIPLE'
  AND      common_lookup_type = 'HOME')           -- telephone_type
,'USA'                                            -- country_code
,'408'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

-- ------------------------------------------------------------------
--  Insert second contact in a group account user.
-- ------------------------------------------------------------------
INSERT INTO contact
( member_id
, contact_type
, first_name
, last_name
, created_by
, last_updated_by )
VALUES
( CURRVAL('member_member_id_seq')                 -- member_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'CONTACT'
  AND      common_lookup_type = 'CUSTOMER')       -- contact_type
,'Matthew'                                         -- first_name
,'Sweeney'                                        -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO address
( contact_id
, address_type
, city
, state_province
, postal_code
, created_by
, last_updated_by )
VALUES
( CURRVAL('contact_contact_id_seq')               -- contact_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_type = 'HOME')           -- address_type
,'San Jose'                                       -- city
,'CA'                                             -- state_province
,'95192'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'14 El Camino Real'                              -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO telephone
( contact_id
, address_id
, telephone_type
, country_code
, area_code
, telephone_number
, created_by
, last_updated_by )
 VALUES
( CURRVAL('contact_contact_id_seq')               -- address_id
, CURRVAL('address_address_id_seq')               -- contact_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MULTIPLE'
  AND      common_lookup_type = 'HOME')           -- telephone_type
,'USA'                                            -- country_code
,'408'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

-- ------------------------------------------------------------------
--  Insert third contact in a group account user.
-- ------------------------------------------------------------------
INSERT INTO contact
( member_id
, contact_type
, first_name
, middle_name
, last_name
, created_by
, last_updated_by )
VALUES
( CURRVAL('member_member_id_seq')                 -- member_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'CONTACT'
  AND      common_lookup_type = 'CUSTOMER')       -- contact_type
,'Ian'                                            -- first_name
,'M'                                              -- middle_name
,'Sweeney'                                        -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);


INSERT INTO address
( contact_id
, address_type
, city
, state_province
, postal_code
, created_by
, last_updated_by )
VALUES
( CURRVAL('contact_contact_id_seq')               -- contact_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_type = 'HOME')           -- address_type
,'San Jose'                                       -- city
,'CA'                                             -- state_province
,'95192'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'14 El Camino Real'                              -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO telephone
( contact_id
, address_id
, telephone_type
, country_code
, area_code
, telephone_number
, created_by
, last_updated_by )
 VALUES
( CURRVAL('contact_contact_id_seq')               -- contact_id
, CURRVAL('address_address_id_seq')               -- address_id
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MULTIPLE'
  AND      common_lookup_type = 'HOME')           -- telephone_type
,'USA'                                            -- country_code
,'408'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

SELECT   m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN ' ' || c.middle_name
	   ELSE ''
         END AS full_name
,        a.city
,        a.state_province
,        t.country_code || '-(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM     member m INNER JOIN contact c ON m.member_id = c.member_id INNER JOIN
         address a ON c.contact_id = a.contact_id INNER JOIN
         street_address sa ON a.address_id = sa.address_id INNER JOIN
         telephone t ON c.contact_id = t.contact_id AND a.address_id = t.address_id
WHERE    c.last_name = 'Sweeney';
