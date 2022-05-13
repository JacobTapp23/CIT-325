-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step2.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  05-Nov-2019
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
--   psql> \i apply_lab6_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the price table.
-- -------------------------------------------------------------------
CREATE TABLE price
( price_id                SERIAL
, item_id                 INTEGER
, price_type              INTEGER      NOT NULL
, active_flag             VARCHAR(1)   NOT NULL
, start_date              INTEGER      NOT NULL
, end_date                INTEGER
, amount                  NUMERIC      NOT NULL 
, created_by              INTEGER      NOT NULL
, creation_date           TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by         INTEGER      NOT NULL
, last_update_date        TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, PRIMARY KEY (price_id)
, CONSTRAINT fk_price_1   FOREIGN KEY (item_id) REFERENCES item (item_id)
, CONSTRAINT fk_price_2   FOREIGN KEY (price_type) REFERENCES common_lookup (common_lookup_id)
, CONSTRAINT fk_price_3   FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_price_4   FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- ------------------------------------------------------------------
--  Task #2: Alter sequence to restart at 1001.
-- ------------------------------------------------------------------
ALTER SEQUENCE price_price_id_seq RESTART WITH 1001;

-- ------------------------------------------------------------------
--  Task #3: Add yn_price check constraint.
-- ------------------------------------------------------------------
ALTER TABLE price
ADD CONSTRAINT yn_price CHECK (active_flag IN ('Y','N'));
