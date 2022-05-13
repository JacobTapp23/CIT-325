-- Create my subtype under the base_t type.
CREATE OR REPLACE
  TYPE item_t UNDER base_t
  ( ITEM_ID             NUMBER
  , ITEM_BARCODE        VARCHAR2(20)
  , ITEM_TYPE           NUMBER
  , ITEM_TITLE          VARCHAR2(60)
  , ITEM_SUBTITLE       VARCHAR2(60)
  , ITEM_RATING         VARCHAR2(8)
  , ITEM_RATING_AGENCY  VARCHAR2(4)
  , ITEM_RELEASE_DATE   DATE
  , CREATED_BY          NUMBER
  , CREATION_DATE       DATE
  , LAST_UPDATED_BY     NUMBER
  , LAST_UPDATE_DATE    DATE
  , CONSTRUCTOR FUNCTION item_t
    ( oname               VARCHAR2
    , name                VARCHAR2
    , ITEM_ID             NUMBER
    , ITEM_BARCODE        VARCHAR2
    , ITEM_TYPE           NUMBER
    , ITEM_TITLE          VARCHAR2
    , ITEM_SUBTITLE       VARCHAR2
    , ITEM_RATING         VARCHAR2
    , ITEM_RATING_AGENCY  VARCHAR2
    , ITEM_RELEASE_DATE   DATE
    , CREATED_BY          NUMBER
    , CREATION_DATE       DATE
    , LAST_UPDATED_BY     NUMBER
    , LAST_UPDATE_DATE    DATE ) RETURN SELF AS RESULT
  , OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)
  INSTANTIABLE NOT FINAL;
/