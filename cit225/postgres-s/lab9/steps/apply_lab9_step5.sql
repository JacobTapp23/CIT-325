-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step5.sql
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
--   psql> \i apply_lab9_step5.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the account_list table.
-- -------------------------------------------------------------------

CREATE TABLE account_list
( account_list_id   SERIAL
, account_number    VARCHAR(10)  NOT NULL
, consumed_date     DATE
, consumed_by       INTEGER
, created_by        INTEGER      NOT NULL
, creation_date     TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by   INTEGER      NOT NULL
, last_update_date  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, CONSTRAINT pk_account_list    PRIMARY KEY (account_list_id)
, CONSTRAINT fk_account_list_1  FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_account_list_2  FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));
