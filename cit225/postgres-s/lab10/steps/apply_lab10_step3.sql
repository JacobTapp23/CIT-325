-- ------------------------------------------------------------------
--  Program Name:   apply_lab10_step2.sql
--  Lab Assignment: Lab #10
--  Program Author: Michael McLaughlin
--  Creation Date:  22-Feb-2022
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
--   psql> \i apply_lab8_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Count rows from import table: [4081].
-- ------------------------------------------------------------------

-- Count importing transactions.
SELECT   COUNT(*)
FROM    (SELECT   t.transaction_id
         ,        tu.payment_account_number AS transaction_account
         ,        cl1.common_lookup_id AS transaction_type
         ,        tu.transaction_date
         ,       (SUM(tu.transaction_amount) / 1.06) AS transaction_amount
         ,        r.rental_id
         ,        cl2.common_lookup_id AS payment_method_type
         ,        m.credit_card_number AS payment_account_number
         ,        1001 AS create_by
         ,        CURRENT_DATE AS create_date
         ,        1001 AS last_update_by
         ,        CURRENT_DATE AS update_date
         FROM     member m INNER JOIN contact c
         ON       m.member_id = c.member_id INNER JOIN transaction_upload tu
         ON       c.first_name = tu.first_name
         AND      COALESCE(c.middle_name,'x') = COALESCE(tu.middle_name,'x')
         AND      c.last_name = tu.last_name
         AND      tu.account_number = m.account_number INNER JOIN rental r
         ON       c.contact_id = r.customer_id
         AND      tu.check_out_date = r.check_out_date
         AND      tu.return_date = r.return_date INNER JOIN common_lookup cl1
         ON       cl1.common_lookup_table = 'TRANSACTION'
         AND      cl1.common_lookup_column = 'TRANSACTION_TYPE'
         AND      cl1.common_lookup_type = tu.transaction_type INNER JOIN common_lookup cl2
         ON       cl2.common_lookup_table = 'TRANSACTION'
         AND      cl2.common_lookup_column = 'PAYMENT_METHOD_TYPE'
         AND      cl2.common_lookup_type = tu.payment_method_type LEFT JOIN transaction t
         ON       t.transaction_account = tu.payment_account_number
         AND      t.rental_id = r.rental_id
         AND      t.transaction_type = cl1.common_lookup_id
         AND      t.transaction_date = tu.transaction_date
         AND      t.payment_method_type = cl2.common_lookup_id
         AND      t.payment_account_number = m.credit_card_number
         GROUP BY t.transaction_id
         ,        tu.payment_account_number
         ,        cl1.common_lookup_id
         ,        tu.transaction_date
         ,        r.rental_id
         ,        cl2.common_lookup_id
         ,        m.credit_card_number
         ,        create_by
         ,        create_date
         ,        last_update_by
         ,        update_date) t;
		 
-- ------------------------------------------------------------------
--  Task #2: Count rows from import and import target tables: [4081].
-- ------------------------------------------------------------------

-- Count importing transactions.
INSERT INTO transaction
SELECT   COALESCE(t.transaction_id, NEXTVAL('transaction_transaction_id_seq'::regclass)) transaction_id
,        t.transaction_account
,        t.transaction_type
,        t.transaction_date
,        t.transaction_amount
,        t.rental_id
,        t.payment_method_type
,        t.payment_account_number
,        t.create_by
,        t.create_date
,        t.last_update_by
,        t.update_date
FROM    (SELECT   t.transaction_id
         ,        tu.payment_account_number AS transaction_account
         ,        cl1.common_lookup_id AS transaction_type
         ,        tu.transaction_date
         ,       (SUM(tu.transaction_amount) / 1.06) AS transaction_amount
         ,        r.rental_id
         ,        cl2.common_lookup_id AS payment_method_type
         ,        m.credit_card_number AS payment_account_number
         ,        1001 AS create_by
         ,        CURRENT_DATE AS create_date
         ,        1001 AS last_update_by
         ,        CURRENT_DATE AS update_date
         FROM     member m INNER JOIN contact c
         ON       m.member_id = c.member_id INNER JOIN transaction_upload tu
         ON       c.first_name = tu.first_name
         AND      COALESCE(c.middle_name,'x') = COALESCE(tu.middle_name,'x')
         AND      c.last_name = tu.last_name
         AND      tu.account_number = m.account_number INNER JOIN rental r
         ON       c.contact_id = r.customer_id
         AND      tu.check_out_date = r.check_out_date
         AND      tu.return_date = r.return_date INNER JOIN common_lookup cl1
         ON       cl1.common_lookup_table = 'TRANSACTION'
         AND      cl1.common_lookup_column = 'TRANSACTION_TYPE'
         AND      cl1.common_lookup_type = tu.transaction_type INNER JOIN common_lookup cl2
         ON       cl2.common_lookup_table = 'TRANSACTION'
         AND      cl2.common_lookup_column = 'PAYMENT_METHOD_TYPE'
         AND      cl2.common_lookup_type = tu.payment_method_type LEFT JOIN transaction t
         ON       t.transaction_account = tu.payment_account_number
         AND      t.rental_id = r.rental_id
         AND      t.transaction_type = cl1.common_lookup_id
         AND      t.transaction_date = tu.transaction_date
         AND      t.payment_method_type = cl2.common_lookup_id
         AND      t.payment_account_number = m.credit_card_number
         GROUP BY t.transaction_id
         ,        tu.payment_account_number
         ,        cl1.common_lookup_id
         ,        tu.transaction_date
         ,        r.rental_id
         ,        cl2.common_lookup_id
         ,        m.credit_card_number
         ,        create_by
         ,        create_date
         ,        last_update_by
         ,        update_date) t;