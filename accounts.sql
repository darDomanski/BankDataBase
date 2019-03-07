CREATE TABLE accounts (
                        id              SERIAL PRIMARY KEY,
                        customer_id     INTEGER,
                        account_type_id INTEGER,
                        account_number  BIGINT NOT NULL UNIQUE,
                        open_date       DATE   NOT NULL,
                        FOREIGN KEY (customer_id) REFERENCES customers(id),
                        FOREIGN KEY (account_type_id) REFERENCES account_types(id)
);
ALTER TABLE accounts add CONSTRAINT uniqueAccountNumber UNIQUE (account_number);
CREATE UNIQUE INDEX uidx_accnumber ON accounts(account_number);
ALTER TABLE accounts
  ALTER COLUMN account_number TYPE BIGINT;

CREATE OR REPLACE FUNCTION balance_handle() RETURNS TRIGGER AS $$
  BEGIN
    IF(TG_OP = 'UPDATE' AND OLD.id <> NEW.id) THEN
          UPDATE balances SET account_id = NEW.id WHERE account_id = OLD.id;
    ELSEIF (TG_OP = 'INSERT') THEN
        INSERT INTO balances (currency_id, amount, account_id) VALUES (1, 0, NEW.id);
    end if;
    RETURN NEW;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER balance_handler AFTER INSERT OR UPDATE ON accounts FOR EACH ROW EXECUTE PROCEDURE balance_handle();


CREATE OR REPLACE FUNCTION delete_handler() RETURNS TRIGGER AS $$
  BEGIN
    DELETE FROM balances WHERE account_id = OLD.id;
    DELETE FROM transactions WHERE account_id = OLD.id;
    RETURN OLD;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER delete_handler BEFORE DELETE ON accounts FOR EACH ROW EXECUTE PROCEDURE delete_handler();


CREATE OR REPLACE FUNCTION process_accounts_archive() RETURNS TRIGGER AS $$
  BEGIN
    INSERT INTO accounts_archive SELECT OLD.id, OLD.customer_id, OLD.account_type_id, OLD.account_number, OLD.open_date, now();
    RETURN NULL;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER account_archivizer AFTER DELETE ON accounts FOR EACH ROW EXECUTE PROCEDURE process_accounts_archive();

COPY accounts from '/home/darski/codecool/advanced/tw2/BankDataBase/data_sources/accounts.csv' delimiter '|';
