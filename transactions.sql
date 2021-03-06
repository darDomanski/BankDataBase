CREATE TABLE transactions (
                            id             SERIAL PRIMARY KEY,
                            account_id     INTEGER,
                            account_number BIGINT       NOT NULL,
                            change         DECIMAL(9,2) NOT NULL,
                            type           VARCHAR(50)  NOT NULL,
                            description    VARCHAR(100) DEFAULT '',
                            date           DATE         NOT NULL,
                            FOREIGN KEY (account_id) REFERENCES accounts(id),
                            CHECK (check_account_number_exist(account_number))
);

ALTER TABLE transactions
  ALTER COLUMN account_number TYPE BIGINT;

CREATE OR REPLACE FUNCTION check_account_number_exist(number BIGINT) RETURNS BOOLEAN AS
$$
  BEGIN
  IF EXISTS(SELECT account_number FROM accounts WHERE account_number = number) THEN
    RETURN TRUE;
    ELSE
    RETURN FALSE;
  end if;
  end;
  $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION change_balance() RETURNS TRIGGER AS $$
  BEGIN
    UPDATE balances SET amount = (amount + NEW.change) WHERE account_id = NEW.account_id;
    RETURN NULL;
  end;
  $$ LANGUAGE plpgsql;

CREATE TRIGGER balance_changer AFTER INSERT ON transactions FOR EACH ROW EXECUTE PROCEDURE change_balance();

COPY transactions from '/home/darski/codecool/advanced/tw2/BankDataBase/data_sources/transactions_out.csv' DELIMITER '|';