SET SERVEROUTPUT ON SIZE UNLIMITED;

drop package contact_package;

CREATE OR REPLACE PACKAGE contact_package IS
  PROCEDURE insert_contact
   ( PV_FIRST_NAME           VARCHAR2
   , PV_MIDDLE_NAME          VARCHAR2
   , PV_LAST_NAME            VARCHAR2
   , PV_CONTACT_TYPE         VARCHAR2
   , PV_ACCOUNT_NUMBER       VARCHAR2
   , PV_MEMBER_TYPE          VARCHAR2
   , PV_CREDIT_CARD_NUMBER   VARCHAR2
   , PV_CREDIT_CARD_TYPE     VARCHAR2
   , PV_CITY                 VARCHAR2
   , PV_STATE_PROVINCE       VARCHAR2
   , PV_POSTAL_CODE          VARCHAR2
   , PV_ADDRESS_TYPE         VARCHAR2
   , PV_COUNTRY_CODE         VARCHAR2
   , PV_AREA_CODE            VARCHAR2
   , PV_TELEPHONE_NUMBER     VARCHAR2
   , PV_TELEPHONE_TYPE       VARCHAR2
   , PV_USER_NAME            VARCHAR2 );
  PROCEDURE insert_contact
   ( PV_FIRST_NAME           VARCHAR2
   , PV_MIDDLE_NAME          VARCHAR2
   , PV_LAST_NAME            VARCHAR2
   , PV_CONTACT_TYPE         VARCHAR2
   , PV_ACCOUNT_NUMBER       VARCHAR2
   , PV_MEMBER_TYPE          VARCHAR2
   , PV_CREDIT_CARD_NUMBER   VARCHAR2
   , PV_CREDIT_CARD_TYPE     VARCHAR2
   , PV_CITY                 VARCHAR2
   , PV_STATE_PROVINCE       VARCHAR2
   , PV_POSTAL_CODE          VARCHAR2
   , PV_ADDRESS_TYPE         VARCHAR2
   , PV_COUNTRY_CODE         VARCHAR2
   , PV_AREA_CODE            VARCHAR2
   , PV_TELEPHONE_NUMBER     VARCHAR2
   , PV_TELEPHONE_TYPE       VARCHAR2
   , PV_USER_ID              NUMBER );
END contact_package;
/

LIST
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY contact_package IS
  PROCEDURE insert_contact
   ( PV_FIRST_NAME           VARCHAR2
   , PV_MIDDLE_NAME          VARCHAR2
   , PV_LAST_NAME            VARCHAR2
   , PV_CONTACT_TYPE         VARCHAR2
   , PV_ACCOUNT_NUMBER       VARCHAR2
   , PV_MEMBER_TYPE          VARCHAR2
   , PV_CREDIT_CARD_NUMBER   VARCHAR2
   , PV_CREDIT_CARD_TYPE     VARCHAR2
   , PV_CITY                 VARCHAR2
   , PV_STATE_PROVINCE       VARCHAR2
   , PV_POSTAL_CODE          VARCHAR2
   , PV_ADDRESS_TYPE         VARCHAR2
   , PV_COUNTRY_CODE         VARCHAR2
   , PV_AREA_CODE            VARCHAR2
   , PV_TELEPHONE_NUMBER     VARCHAR2
   , PV_TELEPHONE_TYPE       VARCHAR2
   , PV_USER_NAME            VARCHAR2 ) IS

  lv_user_id   NUMBER := 0;
  lv_member_id   NUMBER;
  lv_address_type        VARCHAR2(30);
  lv_contact_type        VARCHAR2(30);
  lv_credit_card_type    VARCHAR2(30);
  lv_member_type         VARCHAR2(30);
  lv_telephone_type      VARCHAR2(30);

  FUNCTION get_user_id
  ( pv_user_name     VARCHAR2
   ) RETURN NUMBER IS
 
    /* Local return variable. */
    lv_retval  NUMBER := 0;  -- Default value is 0.
 
    /* Use a cursor, which will not raise an exception at runtime. */
    CURSOR find_user_id
    ( cv_user_name      VARCHAR2
     ) IS
      SELECT system_user_id
      FROM   system_user
      WHERE  system_user_name = cv_user_name;
 
  BEGIN  
    /* Assign a value when a row exists. */
    FOR i IN find_user_id(pv_user_name) LOOP
      lv_retval := i.system_user_id;
    END LOOP;
 
    /* Return 0 when no row found and the ID # when row found. */
    RETURN lv_retval;
  END get_user_id;

  BEGIN
    lv_user_id := get_user_id(pv_user_name);
    IF NOT lv_user_id = 0 THEN 
    dbms_output.put_line('['||lv_user_id||']');
NULL;
    -- contact_package.insert_contact(
    --   pv_first_name => pv_first_name
    --   ,pv_middle_name => pv_middle_name
    --   ,pv_last_name => pv_last_name
    --   ,pv_contact_type => pv_contact_type
    --   ,pv_account_number => pv_account_number
    --   ,pv_member_type => pv_member_type
    --   ,pv_credit_card_number => pv_credit_card_number
    --   ,pv_credit_card_type => pv_credit_card_type
    --   ,pv_city => pv_city
    --   ,pv_state_provence => pv_state_provence
    --   ,pv_postal_code => pv_postal_code
    --   ,pv_address_type => pv_address_type
    --   ,pv_country_code => pv_country_code
    --   ,pv_area_code => pv_area_code
    --   ,pv_telephone_number => pv_telephone_number
    --   ,pv_telephone_type => pv_telephone_type
    --   ,pv_user_id   => lv_user_id);  

    -- insert logic to call the overloaded method.
    else
    NULL;  -- insert logic to exit procedure without doing anything
    END IF;
  END insert_contact;

  PROCEDURE insert_contact
   ( PV_FIRST_NAME           VARCHAR2
   , PV_MIDDLE_NAME          VARCHAR2
   , PV_LAST_NAME            VARCHAR2
   , PV_CONTACT_TYPE         VARCHAR2
   , PV_ACCOUNT_NUMBER       VARCHAR2
   , PV_MEMBER_TYPE          VARCHAR2
   , PV_CREDIT_CARD_NUMBER   VARCHAR2
   , PV_CREDIT_CARD_TYPE     VARCHAR2
   , PV_CITY                 VARCHAR2
   , PV_STATE_PROVINCE       VARCHAR2
   , PV_POSTAL_CODE          VARCHAR2
   , PV_ADDRESS_TYPE         VARCHAR2
   , PV_COUNTRY_CODE         VARCHAR2
   , PV_AREA_CODE            VARCHAR2
   , PV_TELEPHONE_NUMBER     VARCHAR2
   , PV_TELEPHONE_TYPE       VARCHAR2
   , PV_USER_ID              NUMBER ) IS


lv_address_type        VARCHAR2(30);
  lv_contact_type        VARCHAR2(30);
  lv_credit_card_type    VARCHAR2(30);
  lv_member_type         VARCHAR2(30);
  lv_telephone_type      VARCHAR2(30);

lv_member_id   NUMBER;
 
  FUNCTION get_member_id
  ( pv_account_number      VARCHAR2
   ) RETURN NUMBER IS
 
    /* Local return variable. */
    lv_retval  NUMBER := 0;  -- Default value is 0.
 
    /* Use a cursor, which will not raise an exception at runtime. */
    CURSOR find_member_id
    ( cv_account_number      VARCHAR2
     ) IS
      SELECT member_id
      FROM   member
      WHERE  account_number = cv_account_number;
 
  BEGIN  
    /* Assign a value when a row exists. */
    FOR i IN find_member_id(pv_account_number) LOOP
      lv_retval := i.member_id;
    END LOOP;
 
    /* Return 0 when no row found and the ID # when row found. */
    RETURN lv_retval;
  END get_member_id;
BEGIN
NULL;

  END insert_contact;
    BEGIN
  lv_address_type := pv_address_type;
  lv_contact_type := pv_contact_type;
  lv_credit_card_type := pv_credit_card_type;
  lv_member_type := pv_member_type;
  lv_telephone_type := pv_telephone_type;
  
  -- Create a SAVEPOINT as a starting point.
  SAVEPOINT starting_point;
  
  INSERT INTO member
  ( member_id
  , member_type
  , account_number
  , credit_card_number
  , credit_card_type
  , created_by
  , creation_date
  , last_updated_by
  , last_update_date )
  VALUES
  ( member_s1.NEXTVAL
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_table = 'MEMBER'
    AND      common_lookup_column = 'MEMBER_TYPE'
    AND      common_lookup_type = lv_member_type)
  , pv_account_number
  , pv_credit_card_number
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_table = 'MEMBER'
    AND      common_lookup_column = 'CREDIT_CARD_TYPE'
    AND      common_lookup_type = lv_credit_card_type)
  , pv_created_by
  , pv_creation_date
  , pv_last_updated_by
  , pv_last_update_date );

  INSERT INTO contact
  ( contact_id
  , member_id
  , contact_type
  , last_name
  , first_name
  , middle_name
  , created_by
  , creation_date
  , last_updated_by
  , last_update_date)
  VALUES
  ( contact_s1.NEXTVAL
  , member_s1.CURRVAL
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_table = 'CONTACT'
    AND      common_lookup_column = 'CONTACT_TYPE'
    AND      common_lookup_type = lv_contact_type)
  , pv_last_name
  , pv_first_name
  , pv_middle_name
  , pv_created_by
  , pv_creation_date
  , pv_last_updated_by
  , pv_last_update_date );  

  INSERT INTO address
  VALUES
  ( address_s1.NEXTVAL
  , contact_s1.CURRVAL
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_table = 'ADDRESS'
    AND      common_lookup_column = 'ADDRESS_TYPE'
    AND      common_lookup_type = lv_address_type)
  , pv_city
  , pv_state_province
  , pv_postal_code
  , pv_created_by
  , pv_creation_date
  , pv_last_updated_by
  , pv_last_update_date );  

  INSERT INTO street_address
  VALUES
  ( street_address_s1.NEXTVAL
  , address_s1.CURRVAL
  , 1
  , pv_street_address
  , pv_created_by
  , pv_creation_date
  , pv_last_updated_by
  , pv_last_update_date );  

  INSERT INTO telephone
  VALUES
  ( telephone_s1.NEXTVAL                              
  , contact_s1.CURRVAL                               
  , address_s1.CURRVAL                                
  ,(SELECT   common_lookup_id
    FROM     common_lookup
    WHERE    common_lookup_table = 'TELEPHONE'
    AND      common_lookup_column = 'TELEPHONE_TYPE'
    AND      common_lookup_type = lv_telephone_type)
  , pv_country_code                                 
  , pv_area_code                                      
  , pv_telephone_number                               
  , pv_created_by                                    
  , pv_creation_date                                 
  , pv_last_updated_by                               
  , pv_last_update_date);                             

  COMMIT;
END contact_package;
/

LIST
SHOW ERRORS