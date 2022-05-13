-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step3.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Nov-2019
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
--   psql> \i apply_lab9_step3.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the airport table.
-- -------------------------------------------------------------------

CREATE TABLE airport
( airport_id        SERIAL
, airport_code      VARCHAR(3)   NOT NULL
, airport_city      VARCHAR(30)  NOT NULL
, city              VARCHAR(30)  NOT NULL
, state_province    VARCHAR(30)  NOT NULL
, created_by        INTEGER      NOT NULL
, creation_date     TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by   INTEGER      NOT NULL
, last_update_date  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, CONSTRAINT pk_airport_id  PRIMARY KEY (airport_id)
, CONSTRAINT fk_airport_1   FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_airport_2   FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- ------------------------------------------------------------------
--  Task #2: Create a unique nk_airport index on the following
--           columns:
-- ------------------------------------------------------------------
--     1. airport_code
--     2. airport_city
--     3. city
--     4. state_province
-- -------------------------------------------------------------------

CREATE UNIQUE INDEX nk_airport
ON airport ( airport_code
           , airport_city
           , city
           , state_province );

