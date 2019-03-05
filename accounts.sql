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