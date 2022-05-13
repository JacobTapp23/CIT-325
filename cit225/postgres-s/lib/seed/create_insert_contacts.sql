-- ------------------------------------------------------------------
--  Program Name:   create_insert_contacts.sql
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
--  This automates creating accounts.
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--  Automates inserts of member accounts for individual accounts. 
-- ------------------------------------------------------------------

-- Transaction Management Example.
DROP PROCEDURE IF EXISTS contact_insert
( IN pv_member_type         VARCHAR(30)
, IN pv_account_number      VARCHAR(10)
, IN pv_credit_card_number  VARCHAR(19)
, IN pv_credit_card_type    VARCHAR(30)
, IN pv_first_name          VARCHAR(20)
, IN pv_middle_name         VARCHAR(20)
, IN pv_last_name           VARCHAR(20)
, IN pv_contact_type        VARCHAR(30)
, IN pv_address_type        VARCHAR(30)
, IN pv_city                VARCHAR(30)
, IN pv_state_province      VARCHAR(30)
, IN pv_postal_code         VARCHAR(20)
, IN pv_street_address      VARCHAR(30)
, IN pv_telephone_type      VARCHAR(30)
, IN pv_country_code        VARCHAR(3)
, IN pv_area_code           VARCHAR(6)
, IN pv_telephone_number    VARCHAR(10)
, IN pv_created_by          INTEGER
, IN pv_last_updated_by     INTEGER);

-- Transaction Management Example.
CREATE OR REPLACE PROCEDURE contact_insert
( IN pv_member_type         VARCHAR(30)
, IN pv_account_number      VARCHAR(10)
, IN pv_credit_card_number  VARCHAR(19)
, IN pv_credit_card_type    VARCHAR(30)
, IN pv_first_name          VARCHAR(20)
, IN pv_middle_name         VARCHAR(20)
, IN pv_last_name           VARCHAR(20)
, IN pv_contact_type        VARCHAR(30)
, IN pv_address_type        VARCHAR(30)
, IN pv_city                VARCHAR(30)
, IN pv_state_province      VARCHAR(30)
, IN pv_postal_code         VARCHAR(20)
, IN pv_street_address      VARCHAR(30)
, IN pv_telephone_type      VARCHAR(30)
, IN pv_country_code        VARCHAR(3)
, IN pv_area_code           VARCHAR(6)
, IN pv_telephone_number    VARCHAR(10)
, IN pv_created_by          INTEGER = 1001
, IN pv_last_updated_by     INTEGER = 1001 ) AS
$$
DECLARE
  /* Declare local variable. */
  lv_middle_name  VARCHAR(20);

  /* Declare error handling variables. */
  err_num  TEXT;
  err_msg  INTEGER;
BEGIN
  /* Assing a null value to an empty string. */ 
  IF pv_middle_name IS NULL THEN
    lv_middle_name = '';
  END IF;

  /* Insert into the member table. */
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
    AND      common_lookup_type = pv_member_type)
  , pv_account_number
  , pv_credit_card_number
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_context = 'MEMBER'
    AND      common_lookup_type = pv_credit_card_type)
  , pv_created_by
  , pv_last_updated_by );

  /* Insert into the contact table. */
  INSERT INTO contact
  ( member_id
  , contact_type
  , first_name
  , middle_name
  , last_name
  , created_by
  , last_updated_by )
  VALUES
  ( CURRVAL('member_member_id_seq')
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_context = 'CONTACT'
    AND      common_lookup_type = pv_contact_type)
  , pv_first_name
  , pv_middle_name
  , pv_last_name
  , pv_created_by
  , pv_last_updated_by );

  /* Insert into the address table. */
  INSERT INTO address
  ( contact_id
  , address_type
  , city
  , state_province
  , postal_code
  , created_by
  , last_updated_by )
  VALUES
  ( CURRVAL('contact_contact_id_seq')
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_context = 'MULTIPLE'
    AND      common_lookup_type = pv_address_type)
  , pv_city
  , pv_state_province
  , pv_postal_code
  , pv_created_by
  , pv_last_updated_by );

  /* Insert into the street_address table. */
  INSERT INTO street_address
  ( address_id
  , street_address
  , created_by
  , last_updated_by )
  VALUES
  ( CURRVAL('address_address_id_seq')
  , pv_street_address
  , pv_created_by
  , pv_last_updated_by );

  /* Insert into the telephone table. */
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
  ( CURRVAL('contact_contact_id_seq')
  , CURRVAL('address_address_id_seq')
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_context = 'MULTIPLE'
    AND      common_lookup_type = pv_telephone_type)
  , pv_country_code
  , pv_area_code
  , pv_telephone_number
  , pv_created_by
  , pv_last_updated_by);

EXCEPTION
  WHEN OTHERS THEN
    err_num := SQLSTATE;
    err_msg := SUBSTR(SQLERRM,1,100);
    RAISE NOTICE 'Trapped Error: %', err_msg;
END
$$ LANGUAGE plpgsql;
