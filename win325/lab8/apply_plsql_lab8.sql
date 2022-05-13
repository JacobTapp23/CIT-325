/*
||  Name:          apply_plsql_lab8.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 9 lab.
*/

-- Open log file.
SPOOL apply_plsql_lab8.txt


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

  BEGIN
    NULL; -- Logic of Program.
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

  BEGIN
    NULL; -- Logic of Program.
  END insert_contact;
END contact_package;
/

LIST
SHOW ERRORS
