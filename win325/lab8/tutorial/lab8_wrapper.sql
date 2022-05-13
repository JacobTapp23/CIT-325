CREATE OR REPLACE PACKAGE lab8_wrapper IS
  /* Define the contact_insert procedure. */
  PROCEDURE contact_insert
  ( pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2 := ''
  , pv_last_name           VARCHAR2
  , pv_contact_type        VARCHAR2
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_street_address      VARCHAR2
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER   := 1
  , pv_creation_date       DATE     := SYSDATE
  , pv_last_updated_by     NUMBER   := 1
  , pv_last_update_date    DATE     := SYSDATE);

  /* Define the contact_insert procedure. */
  FUNCTION contact_insert
  ( pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2 := ''
  , pv_last_name           VARCHAR2
  , pv_contact_type        VARCHAR2
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_street_address      VARCHAR2
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER   := 1
  , pv_creation_date       DATE     := SYSDATE
  , pv_last_updated_by     NUMBER   := 1
  , pv_last_update_date    DATE     := SYSDATE) RETURN NUMBER;

END lab8_wrapper;
/

CREATE OR REPLACE PACKAGE BODY lab8_wrapper IS

  /* Local function to discover whether the independent
     first table in a chain exists for the data. */
  FUNCTION get_member_id
  ( pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2 ) RETURN NUMBER IS

    /* Default local return value for false. */
    lv_retval  NUMBER := 0;

    /* Use a cursor, which will not raise an exception at runtime. */
    CURSOR find_member_id
    ( cv_account_number      VARCHAR2
    , cv_credit_card_number  VARCHAR2 ) IS
      SELECT member_id
      FROM   member
      WHERE  account_number = cv_account_number
      AND    credit_card_number = cv_credit_card_number;

  BEGIN

    /* Assign a value when a row exists, or true. */
    FOR i IN find_member_id(pv_account_number, pv_credit_card_number) LOOP
      lv_retval := i.member_id;
    END LOOP;

    /* Return 0 when no row found anuserd the ID # when row found. */
    RETURN lv_retval;
  END get_member_id;

  /* Define the contact_insert procedure. */
  PROCEDURE contact_insert
  ( pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2 := ''
  , pv_last_name           VARCHAR2
  , pv_contact_type        VARCHAR2
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_street_address      VARCHAR2
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER   := 1
  , pv_creation_date       DATE     := SYSDATE
  , pv_last_updated_by     NUMBER   := 1
  , pv_last_update_date    DATE     := SYSDATE) IS

    /* Local variables, provide a default value in the event
       that the other module fails to meet specification. */
    lv_member_id          NUMBER := 0;
    lv_contact_id         NUMBER;
    lv_address_id         NUMBER;
    lv_street_address_id  NUMBER;
    lv_telephone_id       NUMBER;

  BEGIN

    /* Set the savepoint. */
    SAVEPOINT starting;

    /* Check for existing grandma row. */
    lv_member_id := get_member_id
                      ( pv_account_number
                      , pv_credit_card_number);

    /* Assign member_s1.currval to local variable. */
    IF lv_member_id = 0 THEN
      lv_member_id := 
        lab8_api.member
          ( pv_member_type        => pv_member_type
          , pv_account_number     => pv_account_number
          , pv_credit_card_number => pv_credit_card_number
          , pv_credit_card_type   => pv_credit_card_type
          , pv_created_by         => pv_created_by
          , pv_creation_date      => pv_creation_date
          , pv_last_updated_by    => pv_last_updated_by
          , pv_last_update_date   => pv_last_update_date );
    END IF;

    /* Insert contact table. */
    lv_contact_id := 
      lab8_api.contact
        ( pv_member_id        => lv_member_id
        , pv_contact_type     => pv_contact_type 
        , pv_last_name        => pv_last_name
        , pv_first_name       => pv_first_name
        , pv_middle_name      => pv_middle_name
        , pv_created_by       => pv_created_by
        , pv_creation_date    => pv_creation_date
        , pv_last_updated_by  => pv_last_updated_by
        , pv_last_update_date => pv_last_update_date );

    /* Insert contact table. */
    lv_address_id := 
      lab8_api.address
        ( pv_contact_id       => lv_contact_id
        , pv_address_type     => pv_address_type 
        , pv_city             => pv_city
        , pv_state_province   => pv_state_province
        , pv_postal_code      => pv_postal_code
        , pv_created_by       => pv_created_by
        , pv_creation_date    => pv_creation_date
        , pv_last_updated_by  => pv_last_updated_by
        , pv_last_update_date => pv_last_update_date );

    /* If the program gets here, both insert statements work. Commit it. */
    COMMIT;

  EXCEPTION

    /* When anything is broken do this. */
    WHEN OTHERS THEN
      /* Until any partial results. */
      ROLLBACK TO starting;

  END contact_insert;

  /* Define the contact_insert procedure. */
  FUNCTION contact_insert
  ( pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2 := ''
  , pv_last_name           VARCHAR2
  , pv_contact_type        VARCHAR2
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_street_address      VARCHAR2
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER   := 1
  , pv_creation_date       DATE     := SYSDATE
  , pv_last_updated_by     NUMBER   := 1
  , pv_last_update_date    DATE     := SYSDATE) RETURN NUMBER IS

    /* Local variables, provide a default value in the event
       that the other module fails to meet specification. */
    lv_member_id          NUMBER := 0;
    lv_contact_id         NUMBER;
    lv_address_id         NUMBER;
    lv_street_address_id  NUMBER;
    lv_telephone_id       NUMBER;

    /* Local return value. */
    lv_retval             NUMBER;

  BEGIN

    /* Set the savepoint. */
    SAVEPOINT starting;

    /* Check for existing grandma row. */
    lv_member_id := get_member_id
                      ( pv_account_number
                      , pv_credit_card_number);

    /* Assign member_s1.currval to local variable. */
    IF lv_member_id = 0 THEN
      lv_member_id := 
        lab8_api.member
          ( pv_member_type        => pv_member_type
          , pv_account_number     => pv_account_number
          , pv_credit_card_number => pv_credit_card_number
          , pv_credit_card_type   => pv_credit_card_type
          , pv_created_by         => pv_created_by
          , pv_creation_date      => pv_creation_date
          , pv_last_updated_by    => pv_last_updated_by
          , pv_last_update_date   => pv_last_update_date );
    END IF;

    /* Insert contact table. */
    lv_contact_id := 
      lab8_api.contact
        ( pv_member_id        => lv_member_id
        , pv_contact_type     => pv_contact_type 
        , pv_last_name        => pv_last_name
        , pv_first_name       => pv_first_name
        , pv_middle_name      => pv_middle_name
        , pv_created_by       => pv_created_by
        , pv_creation_date    => pv_creation_date
        , pv_last_updated_by  => pv_last_updated_by
        , pv_last_update_date => pv_last_update_date );

    /* If the program gets here, both insert statements work. Commit it. */
    COMMIT;

    /* Return the value of succes. */
    lv_retval := 1;

    /* Return the value. */
    RETURN lv_retval;
  EXCEPTION

    /* When anything is broken do this. */
    WHEN OTHERS THEN
      /* Until any partial results. */
      ROLLBACK TO starting;
  END contact_insert;

END lab8_wrapper;
/

LIST
SHOW ERRORS
