-- ------------------------------------------------------------------
--  Program Name:   individual_accounts.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--  This inserts 5 individual accounts through procedure.
-- ------------------------------------------------------------------

-- Insert first contact.
CALL contact_insert(
       pv_member_type := 'INDIVIDUAL'
     , pv_account_number := 'R11-514-34'
     , pv_credit_card_number := '1111-1111-1111-1111'
     , pv_credit_card_type := 'VISA_CARD'
     , pv_first_name := 'Goeffrey'
     , pv_middle_name := 'Ward'
     , pv_last_name := 'Clinton'
     , pv_contact_type := 'CUSTOMER'
     , pv_address_type := 'HOME'
     , pv_city := 'Provo'
     , pv_state_province := 'Utah'
     , pv_postal_code := '84606'
     , pv_street_address := '118 South 9th East'
     , pv_telephone_type := 'HOME'
     , pv_country_code := '001'
     , pv_area_code := '801'
     , pv_telephone_number := '423-1234'
     , pv_created_by := 1001
     , pv_last_updated_by := 1001 );

-- Insert second contact.
CALL contact_insert(
       pv_member_type := 'INDIVIDUAL'
     , pv_account_number := 'R11-514-35'
     , pv_credit_card_number := '1111-2222-1111-1111'
     , pv_credit_card_type := 'VISA_CARD'
     , pv_first_name := 'Wendy'
     , pv_middle_name := ''
     , pv_last_name := 'Moss'
     , pv_contact_type := 'CUSTOMER'
     , pv_address_type := 'HOME'
     , pv_city := 'Provo'
     , pv_state_province := 'Utah'
     , pv_postal_code := '84606'
     , pv_street_address := '1218 South 10th East'
     , pv_telephone_type := 'HOME'
     , pv_country_code := '001'
     , pv_area_code := '801'
     , pv_telephone_number := '423-1235'
     , pv_created_by := 1001
     , pv_last_updated_by := 1001 );

-- Insert third contact.
CALL contact_insert(
       pv_member_type := 'INDIVIDUAL'
     , pv_account_number := 'R11-514-36'
     , pv_credit_card_number := '1111-1111-2222-1111'
     , pv_credit_card_type := 'VISA_CARD'
     , pv_first_name := 'Simon'
     , pv_middle_name := 'Jonah'
     , pv_last_name := 'Gretelz'
     , pv_contact_type := 'CUSTOMER'
     , pv_address_type := 'HOME'
     , pv_city := 'Provo'
     , pv_state_province := 'Utah'
     , pv_postal_code := '84606'
     , pv_street_address := '2118 South 7th East'
     , pv_telephone_type := 'HOME'
     , pv_country_code := '001'
     , pv_area_code := '801'
     , pv_telephone_number := '423-1236'
     , pv_created_by := 1001
     , pv_last_updated_by := 1001 );

-- Insert fourth contact.
CALL contact_insert(
       pv_member_type := 'INDIVIDUAL'
     , pv_account_number := 'R11-514-37'
     , pv_credit_card_number := '3333-1111-1111-2222'
     , pv_credit_card_type := 'VISA_CARD'
     , pv_first_name := 'Elizabeth'
     , pv_middle_name := 'Jane'
     , pv_last_name := 'Royal'
     , pv_contact_type := 'CUSTOMER'
     , pv_address_type := 'HOME'
     , pv_city := 'Provo'
     , pv_state_province := 'Utah'
     , pv_postal_code := '84606'
     , pv_street_address := '2228 South 14th East'
     , pv_telephone_type := 'HOME'
     , pv_country_code := '001'
     , pv_area_code := '801'
     , pv_telephone_number := '423-1237'
     , pv_created_by := 1001
     , pv_last_updated_by := 1001 );

-- Insert fifth contact.
CALL contact_insert(
       pv_member_type := 'INDIVIDUAL'
     , pv_account_number := 'R11-514-38'
     , pv_credit_card_number := '1111-1111-3333-1111'
     , pv_credit_card_type := 'VISA_CARD'
     , pv_first_name := 'Brian'
     , pv_middle_name := 'Nathan'
     , pv_last_name := 'Smith'
     , pv_contact_type := 'CUSTOMER'
     , pv_address_type := 'HOME'
     , pv_city := 'Spanish Fork'
     , pv_state_province := 'Utah'
     , pv_postal_code := '84606'
     , pv_street_address := '333 North 2nd East'
     , pv_telephone_type := 'HOME'
     , pv_country_code := '001'
     , pv_area_code := '801'
     , pv_telephone_number := '423-1238'
     , pv_created_by := 1001
     , pv_last_updated_by := 1001 );

-- ------------------------------------------------------------------
--   Query to verify five individual rows of chained inserts through
--   a procedure into the five dependent tables.
-- ------------------------------------------------------------------
SELECT   m.account_number
,        c.last_name || ', ' || c.first_name
||       CASE
           WHEN c.middle_name IS NOT NULL THEN SUBSTRING(c.middle_name,1,1)
	   ELSE ''
         END AS full_name
,        a.city
,        a.state_province
,        t.country_code || '-(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM     member m INNER JOIN contact c ON m.member_id = c.member_id INNER JOIN
         address a ON c.contact_id = a.contact_id INNER JOIN
         street_address sa ON a.address_id = sa.address_id INNER JOIN
         telephone t ON c.contact_id = t.contact_id AND a.address_id = t.address_id
WHERE    m.member_type = (SELECT common_lookup_id
                          FROM   common_lookup
                          WHERE  common_lookup_context = 'MEMBER'
                          AND    common_lookup_type = 'INDIVIDUAL');
