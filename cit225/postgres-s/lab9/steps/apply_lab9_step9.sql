-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step9.sql
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
--   psql> \i apply_lab9_step9.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the transaction_upload table.
-- -------------------------------------------------------------------

CREATE TABLE transaction_upload
( account_number          VARCHAR(10)  NOT NULL
, first_name              VARCHAR(20)  NOT NULL
, middle_name             VARCHAR(20)
, last_name               VARCHAR(20)  NOT NULL
, check_out_date          DATE         NOT NULL
, return_date             DATE         NOT NULL
, rental_item_type        VARCHAR(12)  NOT NULL
, transaction_type        VARCHAR(14)  NOT NULL
, transaction_amount      NUMERIC      NOT NULL
, transaction_date        DATE         NOT NULL
, item_id                 INTEGER      NOT NULL
, payment_method_type     VARCHAR(14)  NOT NULL
, payment_account_number  VARCHAR(19)  NOT NULL );
