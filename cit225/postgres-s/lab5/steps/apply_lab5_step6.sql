-- ------------------------------------------------------------------
--  Program Name:   apply_lab5_step6.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  27-Aug-2020
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
--   psql> \i apply_lab5_step6.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Enter the query below.
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Create table.
-- -------------------------------------------------------------------
CREATE TABLE rating_agency
( rating_agency_id    SERIAL
, rating_agency_abbr  VARCHAR(8)   NOT NULL
, rating_agency_name  VARCHAR(40)  NOT NULL
, created_by          INTEGER      NOT NULL
, creation_date       TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by     INTEGER      NOT NULL
, last_update_date    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, CONSTRAINT pk_rating_agency PRIMARY KEY (rating_agency_id)
, CONSTRAINT uq_rating_agency UNIQUE (rating_agency_abbr, rating_agency_name)
, CONSTRAINT fk_rating_agency_1  FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_rating_agency_2  FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- Alter the sequence by restarting it at 1001.
ALTER SEQUENCE rating_agency_rating_agency_id_seq RESTART WITH 1001;
