create table credits
(
  id             serial,
  customer_id    int,
  credit_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types (id)

);

DROP VIEW credit_1;
CREATE VIEW credit_1 AS
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as All, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 1;


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


CREATE OR REPLACE FUNCTION update_view_credit4() RETURNS TRIGGER AS $$
  BEGIN
    IF(TG_OP = 'UPDATE' AND OLD.id <> NEW.id) THEN
          UPDATE balances SET account_id = NEW.id WHERE account_id = OLD.id;
    ELSEIF (TG_OP = 'INSERT') THEN
        INSERT INTO balances (currency_id, amount, account_id) VALUES (1, 0, NEW.id);
    end if;
    RETURN NEW;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER update_view_credit4 AFTER UPDATE OR INSERT ON credit FOR EACH ROW EXECUTE PROCEDURE update_view_credit4();


