CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  account_type_id INTEGER,
  account_number INTEGER NOT NULL,
  open_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (account_type_id) REFERENCES account_types(id)
);

CREATE UNIQUE INDEX uidx_accnumber ON accounts(account_number);

CREATE OR REPLACE FUNCTION process_accounts_archive() RETURNS TRIGGER AS $$
  BEGIN
    INSERT INTO accounts_archive SELECT OLD.id, OLD.customer_id, OLD.account_type_id, OLD.account_number, OLD.open_date, now();
    RETURN NULL;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER account_archivizer AFTER DELETE ON accounts FOR EACH ROW EXECUTE PROCEDURE process_accounts_archive();
