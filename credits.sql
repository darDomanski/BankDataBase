create  table IF NOT EXISTS credits
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
  SELECT customers.customer_name, customers.customer_surname, credit_types.name as name, credit_types.rrso  as RRSO
  FROM customers
  JOIN credits
  ON customers.id = credits.customer_id
  JOIN credit_types
  ON credits.credit_type_id = credit_types.id
  where credit_types.id = 4;
SELECT * FROM credit_4;


CREATE OR REPLACE FUNCTION update_view_credit4() RETURNS TRIGGER AS $$
  DECLARE
  customer_table_name TEXT := (SELECT customer_name FROM customers WHERE id = new.customer_id);
  customer_table_surname TEXT := (SELECT  customer_surname FROM  customers WHERE id = new.customer_id );
  credit_name TEXT := (SELECT  name FROM  credit_types WHERE id = new.credit_type_id );
  credit_rrso DECIMAL := (SELECT  rrso FROM  credit_types WHERE id = new.credit_type_id );

  BEGIN
    IF(TG_OP = 'UPDATE' AND OLD.customer_id <> NEW.customer_id) THEN
          UPDATE credit_4 SET customer_id = NEW.id WHERE customer_id = OLD.id;
    ELSEIF (TG_OP = 'INSERT') THEN
        INSERT INTO credit_4 (customer_name, customer_surname, name, rrso ) VALUES (customer_table_name,customer_table_surname,credit_name,credit_rrso);
    end if;
    RETURN NULL;
  end;

  $$ LANGUAGE plpgsql;

CREATE TRIGGER update_view_credit4 AFTER UPDATE OR INSERT ON credits FOR EACH ROW EXECUTE PROCEDURE update_view_credit4();
CREATE TRIGGER instead_insert_credit4 INSTEAD OF INSERT ON credit_4 FOR EACH ROW EXECUTE PROCEDURE update_view_credit4();
DROP TRIGGER instead_insert_credit4 ON credit_4;
INSERT INTO credits (customer_id, credit_type_id) values (4,4);

