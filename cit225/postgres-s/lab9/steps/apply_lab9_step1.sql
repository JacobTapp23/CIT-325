-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step1.sql
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
--   psql> \i apply_lab6_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create the transaction table.
-- ------------------------------------------------------------------

CREATE TABLE transaction
( transaction_id                SERIAL
, transaction_account           VARCHAR(15)  NOT NULL
, transaction_type              INTEGER      NOT NULL
, transaction_date              DATE         NOT NULL
, transaction_amount            NUMERIC      NOT NULL
, rental_id                     INTEGER      NOT NULL
, payment_method_type           INTEGER      NOT NULL
, payment_account_number        VARCHAR(19)  NOT NULL
, created_by                    INTEGER      NOT NULL
, creation_date                 TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by               INTEGER      NOT NULL
, last_update_date              TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, CONSTRAINT pk_transaction_id  PRIMARY KEY (transaction_id)
, CONSTRAINT fk_transaction_1   FOREIGN KEY (transaction_type) REFERENCES common_lookup (common_lookup_id)
, CONSTRAINT fk_transaction_2   FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
, CONSTRAINT fk_transaction_3   FOREIGN KEY (payment_method_type) REFERENCES common_lookup (common_lookup_id)
, CONSTRAINT fk_transaction_4   FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_transaction_5   FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- ------------------------------------------------------------------
--  Task #2: Create a unique natural_key index on the following
--           columns:
-- ------------------------------------------------------------------
--     1. rental_id
--     2. transaction_type
--     3. transaction_date
--     4. payment_method_type
--     5. payment_account_number
--     6. transaction_account
-- ------------------------------------------------------------------

CREATE UNIQUE INDEX natural_key
ON     transaction( rental_id
                  , transaction_type
                  , transaction_date
                  , payment_method_type
                  , payment_account_number
                  , transaction_account);
