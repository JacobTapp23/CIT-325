-- ======================================================================
--  Name:    dwarf_t.sql
--  Author:  Michael McLaughlin
--  Date:    02-Apr-2020
-- ------------------------------------------------------------------
--  Purpose: Prepare final project environment.
-- ======================================================================

-- Open log file.
SPOOL dwarf_t.txt

CREATE OR REPLACE
  TYPE dwarf_t UNDER base_t
  ( name  VARCHAR2(30)
  , genus VARCHAR2(30)
  , CONSTRUCTOR FUNCTION dwarf_t
  ( name  VARCHAR2
  , genus VARCHAR2 ) RETURN SELF AS RESULT
  , MEMBER PROCEDURE set_name
    ( name  VARCHAR2 )
  , MEMBER PROCEDURE set_genus
    ( genus VARCHAR2 )
  , OVERRIDING MEMBER FUNCTION  get_name RETURN VARCHAR2
  , MEMBER FUNCTION  get_genus RETURN VARCHAR2
  , OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 )
  INSTANTIABLE NOT FINAL;
/

LIST
SHOW ERRORS

CREATE OR REPLACE
  TYPE BODY dwarf_t IS
  /* Implement the constructor. */
  , CONSTRUCTOR FUNCTION dwarf_t
  ( name  VARCHAR2
  , genus VARCHAR2 ) RETURN SELF AS RESULT

  /* Implement a set_oname procedure. */
  MEMBER PROCEDURE set_name
  ( name  VARCHAR2 ) IS
  BEGIN
    self.name := name;
  END set_name;

  /* Implement a set_oname procedure. */
  MEMBER PROCEDURE set_genus
  ( genus  VARCHAR2 ) IS
  BEGIN
    self.genus := genus;
  END set_genus;

  /* Implement a get_name function - place order for SQL. */
  OVERRIDING MEMBER FUNCTION get_name
  RETURN VARCHAR2 IS
  BEGIN
    RETURN self.name;
  END get_name;

  /* Implement a get_genus function - place order for SQL. */
  MEMBER FUNCTION get_genus
  RETURN VARCHAR2 IS
  BEGIN
    RETURN self.genus;
  END get_genus;

  /* Implement a to_string function. */
  OVERRIDING MEMBER FUNCTION to_string
  RETURN VARCHAR2 IS
  BEGIN
    RETURN (self as base_t).to_string||'['||self.name||']['||self.genus||']';
  END to_string;
END;
/

SET SERVEROUTPUT ON SIZE UNLIMITED
DECLARE
  lv_object  BASE_T := base_t(1,'BASE_T');
BEGIN
  dbms_output.put_line(lv_object.to_string);
END;
/

-- Close log file.
SPOOL OFF

-- Quit SQL*Plus session.
QUIT

