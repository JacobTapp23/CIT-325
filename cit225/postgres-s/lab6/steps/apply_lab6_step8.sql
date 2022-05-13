-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step8.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  11-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  21-Feb-2022    Updated for PostgreSQL.
-- ==================================================================
--  This creates the system_user table and system_user_s1 sequences.
-- ------------------------------------------------------------------
--    Create and assign bind variable for table name.
-- ==================================================================
SET SESSION "videodb.table_name" = 'price';
SET CLIENT_MIN_MESSAGES TO ERROR;

--  Verify table name.
SELECT current_setting('videodb.table_name');

-- ------------------------------------------------------------------
--  Conditionally drop table.
-- ------------------------------------------------------------------
DROP TABLE IF EXISTS price CASCADE;

-- ------------------------------------------------------------------
--  Create table.
-- -------------------------------------------------------------------
CREATE TABLE price
( price_id              SERIAL
, item_id               INTEGER
, price_type            INTEGER
, active_flag           VARCHAR(1)  CHECK (active_flag IN ('Y','N'))
, start_date            DATE
, end_date              DATE
, amount                NUMERIC(5,2)
, created_by            INTEGER  NOT NULL
, creation_date         TIMESTAMP  WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by       INTEGER  NOT NULL
, last_update_date      TIMESTAMP  WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, PRIMARY KEY (price_id)
, CONSTRAINT fk_price_1    FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_price_2    FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- Alter the sequence by restarting it at 1001.
ALTER SEQUENCE price_price_id_seq RESTART WITH 1001;

