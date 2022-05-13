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
--   psql> \i apply_lab6_step5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert a record in member table for Potter family.
-- -------------------------------------------------------------------
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
,'US00011'                                        -- account_number
,'6011-0000-0000-0078'                            -- credit_card_number
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'MEMBER'
  AND      common_lookup_type = 'DISCOVER_CARD')  -- credit_card_type
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
--  Task #2: Insert a records for Harry Potter.
-- -------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Insert into contact.
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
,'Harry'                                          -- first_name
,'Potter'                                         -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into address.
-- ------------------------------------------------------------------
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
,'Provo'                                          -- city
,'Utah'                                           -- state_province
,'84601'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into street_address.
-- ------------------------------------------------------------------
INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
 VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'900 E 300 N'                                    -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into telephone.
-- ------------------------------------------------------------------
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
,'001'                                            -- country_code
,'801'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
--  Task #3: Insert a records for Ginny Potter.
-- -------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Insert into contact.
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
,'Ginny'                                          -- first_name
,'Potter'                                         -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into address.
-- ------------------------------------------------------------------
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
,'Provo'                                          -- city
,'Utah'                                           -- state_province
,'84601'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into street_address.
-- ------------------------------------------------------------------
INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'900 E 300 N'                                    -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into telephone.
-- ------------------------------------------------------------------
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
,'001'                                            -- country_code
,'408'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
--  Task #4: Insert a records for Lily Luna Potter.
-- -------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Insert into contact.
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
,'Lily'                                           -- first_name
,'Luna'                                           -- middle_name
,'Potter'                                         -- last_name
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into address.
-- ------------------------------------------------------------------
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
,'Provo'                                          -- city
,'Utah'                                           -- state_province
,'84601'                                          -- postal_code
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')             -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into street_address.
-- ------------------------------------------------------------------
INSERT INTO street_address
( address_id
, street_address
, created_by
, last_updated_by )
VALUES
( CURRVAL('address_address_id_seq')               -- address_id
,'900 E 300 N'                                    -- street_address
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')            -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'DBA1')            -- last_updated_by
);

-- ------------------------------------------------------------------
-- Insert into telephone.
-- ------------------------------------------------------------------
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
,'001'                                            -- country_code
,'408'                                            -- area_code
,'333-3333'                                       -- telephone_number
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);
