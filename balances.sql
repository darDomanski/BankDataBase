CREATE TABLE balances (
  id SERIAL PRIMARY KEY,
  currency_id INTEGER,
  amount DECIMAL(9,2) NOT NULL,
  account_id INTEGER NOT NULL,
  FOREIGN KEY (currency_id) REFERENCES currencies(id),
  FOREIGN KEY (account_id) REFERENCES accounts(id)
);