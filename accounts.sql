CREATE TABLE accounts (
                        id SERIAL PRIMARY KEY,
                        customer_id INTEGER,
                        account_type_id INTEGER,
                        account_number INTEGER,
                        open_date DATE,
                        balance_id int,
                        FOREIGN KEY (customer_id) REFERENCES customers(id),
                        FOREIGN KEY (account_type_id) REFERENCES accountTypes(id),
                        FOREIGN KEY (balance_id) REFERENCES balances(id)
                        );