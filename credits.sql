Drop table Credits;
create table credits
(
  id             serial,
  customer_id    int,
  credit_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types (id)

);


INSERT INTO customers (customer_name,customer_surname,birth_date,address_id,phone,email,sex_id,pesel,start_date)
values ('Tomasz','Kowalski','2016-06-23',1002,1000,'xxx@gcom',1,11111,'2016-06-23');

INSERT INTO customers (customer_name,customer_surname,birth_date,address_id,phone,email,sex_id,pesel,start_date)
values ('Piotr','Nowak','2016-06-23',1002,1000,'xxx@gcom',1,11111,'2016-06-23');

insert into addresses(street,zip_code,city,country)
values ('Krakowska',1111111,'Krakow','Poland');

INSERT INTO credits (customer_id,credit_type_id) values (4,4);
INSERT INTO credits (customer_id,credit_type_id) values (4,4);
INSERT INTO credits (customer_id,credit_type_id) values (4,5);
INSERT INTO credits (customer_id,credit_type_id) values (4,5);
INSERT INTO credits (customer_id,credit_type_id) values (4,6);
INSERT INTO credits (customer_id,credit_type_id) values (4,6);

INSERT INTO credits (customer_id,credit_type_id) values (6,4);
INSERT INTO credits (customer_id,credit_type_id) values (6,4);
INSERT INTO credits (customer_id,credit_type_id) values (6,5);
INSERT INTO credits (customer_id,credit_type_id) values (7,5);
INSERT INTO credits (customer_id,credit_type_id) values (7,6);
INSERT INTO credits (customer_id,credit_type_id) values (7,6);

INSERT INTO loans (customer_id,loan_type_id) values (6,6);
INSERT INTO loans (customer_id,loan_type_id) values (6,6);
INSERT INTO loans (customer_id,loan_type_id) values (6,6);
INSERT INTO loans (customer_id,loan_type_id) values (7,5);
INSERT INTO loans (customer_id,loan_type_id) values (7,4);
INSERT INTO loans (customer_id,loan_type_id) values (7,4);

INSERT INTO investments (customer_id,invest_type_id) values (6,4);
INSERT INTO investments (customer_id,invest_type_id) values (6,5);
INSERT INTO investments (customer_id,invest_type_id) values (6,6);
INSERT INTO investments (customer_id,invest_type_id) values (7,4);
INSERT INTO investments (customer_id,invest_type_id) values (7,5);
INSERT INTO investments (customer_id,invest_type_id) values (7,6);


SELECT customers.customer_name, customers.customer_surname, credit_types.name as Credit_Type,
investmen_types.name as Investment_Type,
loan_types.name as Loan_Type

FROM customers

JOIN credits
ON customers.id = credits.customer_id
JOIN credit_types
ON credits.credit_type_id = credit_types.id

JOIN  investments
ON customers.id = investments.customer_id
JOIN investmen_types
ON investments.invest_type_id = investmen_types.id

JOIN  loans
ON customers.id = loans.customer_id
JOIN loan_types
ON loans.loan_type_id = loan_types.id

where customers.id = 6;


DROP VIEW CRED;
CREATE VIEW CRED AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where customers.id = 6;

SELECT * FROM CRED;

DROP VIEW INVE;
CREATE VIEW INVE AS
  SELECT customers.customer_name, customers.customer_surname, investmen_types.name as All, investmen_types.rrso as RRSO
  FROM customers
  JOIN  investments
  ON customers.id = investments.customer_id
  JOIN investmen_types
  ON investments.invest_type_id = investmen_types.id
  where customers.id = 6;

SELECT * FROM INVE;

DROP VIEW LOAN;
CREATE VIEW LOAN AS
  SELECT customers.customer_name, customers.customer_surname, loan_types.name as All, loan_types.rrso as RRSO
  FROM customers
  JOIN  loans
  ON customers.id = loans.customer_id
  JOIN loan_types
  ON loans.loan_type_id = loan_types.id
  where customers.id = 6;

SELECT * FROM CRED
union all
SELECT * FROM INVE
union all
SELECT * FROM LOAN
;

DROP FUNCTION all_loans_credits_investments();
CREATE OR REPLACE FUNCTION all_loans_credits_investments(c_id INTEGER ) RETURNS void AS
$BODY$

BEGIN

  DROP VIEW CRED;
CREATE VIEW CRED AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where customers.id = c_id;

SELECT * FROM CRED;

DROP VIEW INVE;
CREATE VIEW INVE AS
  SELECT customers.customer_name, customers.customer_surname, investmen_types.name as All, investmen_types.rrso as RRSO
  FROM customers
  JOIN  investments
  ON customers.id = investments.customer_id
  JOIN investmen_types
  ON investments.invest_type_id = investmen_types.id
  where customers.id = c_id;

SELECT * FROM INVE;

DROP VIEW LOAN;
CREATE VIEW LOAN AS
  SELECT customers.customer_name, customers.customer_surname, loan_types.name as All, loan_types.rrso as RRSO
  FROM customers
  JOIN  loans
  ON customers.id = loans.customer_id
  JOIN loan_types
  ON loans.loan_type_id = loan_types.id
  where customers.id = c_id;

SELECT * FROM CRED
union all
SELECT * FROM INVE
union all
SELECT * FROM LOAN;

END

$BODY$
LANGUAGE plpgsql;

select all_loans_credits_investments(5);


DROP VIEW credit_1;
CREATE VIEW credit_1 AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 1;
SELECT * FROM credit_1;


DROP VIEW credit_2;
CREATE VIEW credit_2 AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 2;
SELECT * FROM credit_2;


DROP VIEW credit_3;
CREATE VIEW credit_3 AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 3;
SELECT * FROM credit_3;


DROP VIEW credit_4;
CREATE VIEW credit_4 AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 4;
SELECT * FROM credit_4;