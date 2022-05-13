-- @@/home/student/Data/cit325/lab1/apply_plsql_lab1.sql

CREATE OR REPLACE PACKAGE lab8_api IS
  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION member 
  ( pv_member_id           NUMBER
  , pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    NUMBER
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION contact 
  ( pv_contact_id          NUMBER
  , pv_member_id           NUMBER
  , pv_contact_type        VARCHAR2
  , pv_last_name           VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION address 
  ( pv_address_id          NUMBER
  , pv_contact_id          NUMBER
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER;               

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION street_address 
  ( pv_street_address_id   NUMBER
  , pv_address_id          NUMBER
  , pv_line_number         NUMBER
  , pv_street_address      VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER;               

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION telephone 
  ( pv_telephone_id        NUMBER
  , pv_contact_id          NUMBER
  , pv_address_id          NUMBER
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER;               
END lab8_api;
/

LIST
SHOW ERRORS

INSERT INTO common_lookup VALUES
( -1        -- Never assigned.
,'GENERIC'
,'GENERIC_COLUMN'
,'GENERIC_TYPE'
, NULL
,'Generic Customization'
, 1
, SYSDATE
, 1
, SYSDATE);


CREATE OR REPLACE PACKAGE BODY lab8_api IS

  /* Local function to lookup common_lookup_id value. */
  FUNCTION get_common_lookup_id
  ( pv_table    VARCHAR2
  , pv_column   VARCHAR2
  , pv_type     VARCHAR2 ) RETURN NUMBER IS

    /* A local return value. */
    retval  NUMBER := -1;

    /* Define a cursor for the lookup. */
    CURSOR c
    ( pv_table    VARCHAR2
    , pv_column   VARCHAR2
    , pv_type     VARCHAR2 ) IS
      SELECT   common_lookup_id AS id
      FROM     common_lookup
      WHERE    common_lookup_table = pv_table
      AND      common_lookup_column = pv_column
      AND      common_lookup_type = pv_type;

  BEGIN
    /* Read and return primary key value. */
    FOR i IN c ( pv_table, pv_column, pv_type ) LOOP
      retval := i.id;
    END LOOP;

    /* Return primary key value or -1 for unknown. */
    RETURN retval;
  END get_common_lookup_id;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION member 
  ( pv_member_id           NUMBER
  , pv_member_type         VARCHAR2
  , pv_account_number      VARCHAR2
  , pv_credit_card_number  VARCHAR2
  , pv_credit_card_type    NUMBER
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER IS

    /* Declare local variables. */
    lv_member_type         NUMBER;
    lv_credit_card_type    NUMBER;
    retval                 NUMBER := 0;

  BEGIN
    /* Assign lookup values. */
    lv_member_type :=
      get_common_lookup_id('MEMBER','MEMBER_TYPE',UPPER(pv_member_type));
    lv_credit_card_type :=
      get_common_lookup_id('MEMBER','CREDIT_CARD_TYPE',UPPER(pv_credit_card_type));

    /* Insert row into member table. */
    INSERT INTO member
    ( member_id             -- 1
    , member_type           -- 2
    , account_number        -- 3
    , credit_card_number    -- 4
    , credit_card_type      -- 5
    , created_by            -- 6
    , creation_date         -- 7
    , last_updated_by       -- 8
    , last_update_date )    -- 9
    VALUES
    ( member_s1.NEXTVAL     -- 1
    , lv_member_type        -- 2
    , pv_account_number     -- 3
    , pv_credit_card_number -- 4
    , lv_credit_card_type   -- 5
    , pv_created_by         -- 6
    , pv_creation_date      -- 7
    , pv_last_updated_by    -- 8
    , pv_last_update_date ) -- 9
    RETURNING member_id INTO retval;

    /* Return the copy of the primary key. */
    RETURN retval;
  END;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION contact 
  ( pv_contact_id          NUMBER
  , pv_member_id           NUMBER
  , pv_contact_type        VARCHAR2
  , pv_last_name           VARCHAR2
  , pv_first_name          VARCHAR2
  , pv_middle_name         VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER IS

    /* Declare local variables. */
    lv_contact_type        NUMBER;
    retval                 NUMBER := 0;

  BEGIN
    /* Assign lookup values. */
    lv_contact_type :=
      get_common_lookup_id('CONTACT','CONTACT_TYPE',UPPER(pv_contact_type));

    /* Insert row into member table. */
    INSERT INTO contact
    ( contact_id            --  1
    , member_id             --  2
    , contact_type          --  3
    , first_name            --  4
    , middle_name           --  5
    , last_name             --  6
    , created_by            --  7
    , creation_date         --  8
    , last_updated_by       --  9
    , last_update_date )    -- 10
    VALUES
    ( contact_s1.NEXTVAL    --  1
    , pv_member_id          --  2
    , lv_contact_type       --  3
    , pv_first_name         --  4
    , pv_middle_name        --  5
    , pv_last_name          --  6
    , pv_created_by         --  7
    , pv_creation_date      --  8
    , pv_last_updated_by    --  9
    , pv_last_update_date ) -- 10
    RETURNING contact_id INTO retval;

    /* Return the copy of the primary key. */
    RETURN retval;
  END;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION address 
  ( pv_address_id          NUMBER
  , pv_contact_id          NUMBER
  , pv_address_type        VARCHAR2
  , pv_city                VARCHAR2
  , pv_state_province      VARCHAR2
  , pv_postal_code         VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER IS

    /* Declare local variables. */
    lv_address_type        NUMBER;
    retval                 NUMBER := 0;

  BEGIN
    /* Assign lookup values. */
    lv_address_type :=
      get_common_lookup_id('ADDRESS','ADDRESS_TYPE',UPPER(pv_address_type));

    /* Insert row into address table. */
    INSERT INTO address
    ( address_id            --  1
    , contact_id            --  2
    , address_type          --  3
    , city                  --  4
    , state_province        --  5
    , postal_code           --  6 
    , created_by            --  7
    , creation_date         --  8
    , last_updated_by       --  9
    , last_update_date )    -- 10
    VALUES
    ( address_s1.NEXTVAL    --  1
    , pv_contact_id         --  2
    , lv_address_type       --  3
    , pv_city               --  4
    , pv_state_province     --  5
    , pv_postal_code        --  6
    , pv_created_by         --  7
    , pv_creation_date      --  8
    , pv_last_updated_by    --  9
    , pv_last_update_date ) -- 10
    RETURNING address_id INTO retval;

    /* Return the copy of the primary key. */
    RETURN retval;
  END;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION street_address 
  ( pv_street_address_id   NUMBER
  , pv_address_id          NUMBER
  , pv_line_number         NUMBER
  , pv_street_address      VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER IS

    /* Declare local variables. */
    retval                 NUMBER := 0;

  BEGIN
    /* Insert row into member table. */
    INSERT INTO street_address
    ( street_address_id         -- 1
    , address_id                -- 2
    , line_number               -- 3
    , street_address            -- 4
    , created_by                -- 5
    , creation_date             -- 6
    , last_updated_by           -- 7
    , last_update_date )        -- 8
    VALUES
    ( street_address_s1.NEXTVAL -- 1
    , pv_address_id             -- 2
    , pv_line_number            -- 3
    , pv_street_address         -- 4
    , pv_created_by             -- 5
    , pv_creation_date          -- 6
    , pv_last_updated_by        -- 7
    , pv_last_update_date )     -- 8
    RETURNING street_address_id INTO retval;
 
    /* Return the copy of the primary key. */
    RETURN retval;
  END;

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION telephone 
  ( pv_telephone_id        NUMBER
  , pv_contact_id          NUMBER
  , pv_address_id          NUMBER
  , pv_telephone_type      VARCHAR2
  , pv_country_code        VARCHAR2
  , pv_area_code           VARCHAR2
  , pv_telephone_number    VARCHAR2
  , pv_created_by          NUMBER
  , pv_creation_date       DATE
  , pv_last_updated_by     NUMBER
  , pv_last_update_date    DATE ) RETURN NUMBER IS

    /* Declare local variables. */
    lv_telephone_type      NUMBER;
    retval                 NUMBER := 0;

  BEGIN
    /* Assign lookup values. */
    lv_telephone_type :=
      get_common_lookup_id('TELEPHONE','TELEPHONE_TYPE',UPPER(pv_telephone_type));

    /* Insert row into member table. */
    INSERT INTO telephone
    ( telephone_id          --  1
    , contact_id            --  2
    , address_id            --  3
    , telephone_type        --  4
    , country_code          --  5
    , area_code             --  6 
    , telephone_number      --  7
    , created_by            --  8
    , creation_date         --  9
    , last_updated_by       -- 10
    , last_update_date )    -- 11
    VALUES
    ( telephone_s1.NEXTVAL  --  1
    , pv_contact_id         --  2
    , pv_address_id         --  3
    , lv_telephone_type     --  4
    , pv_country_code       --  5
    , pv_area_code          --  6
    , pv_telephone_number   --  7
    , pv_created_by         --  8
    , pv_creation_date      --  9
    , pv_last_updated_by    -- 10
    , pv_last_update_date ) -- 11
    RETURNING telephone_id INTO retval;

    /* Return the copy of the primary key. */
    RETURN retval;
  END;

END lab8_api;
/

LIST
SHOW ERRORS
