CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  account_type_id INTEGER,
  account_number INTEGER NOT NULL,
  open_date DATE NOT NULL,
  balance_id int,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (account_type_id) REFERENCES account_types(id),
  FOREIGN KEY (balance_id) REFERENCES balances(id)
);

CREATE UNIQUE INDEX uidx_accnumber ON accounts(account_number);

CREATE OR REPLACE FUNCTION process_accounts_archive() RETURNS TRIGGER AS $$
  BEGIN
    INSERT INTO accounts_archive SELECT OLD.id, OLD.customer_id, OLD.account_type_id, OLD.account_number, OLD.open_date, now();
    RETURN NULL;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER account_archivizer AFTER DELETE ON accounts FOR EACH ROW EXECUTE PROCEDURE process_accounts_archive();
DROP TRIGGER account_archivizer ON accounts;

INSERT INTO addresses(street, zip_code, city, country) VALUES('Skotnicka 199', '30-394', 'Krakow', 'Poland');
INSERT INTO customers(customer_name, customer_surname, birth_date, address_id, phone, email, sex_id, pesel, start_date) VALUES('Karol', 'Trzaska', '1996-06-14', 1, 732828336, 'karoltrzaska19@gmail.com', 1, 96061411154, '2018-04-15');
INSERT INTO accounts(customer_id, account_type_id, account_number, open_date, balance_id) VALUES(1, 2, 534324123, '14-06-2018', 1);
DELETE FROM accounts WHERE id=1;
SELECT * FROM accounts;
SELECT * FROM accounts_archive;