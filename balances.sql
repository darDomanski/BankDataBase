CREATE TABLE balances (
  id SERIAL PRIMARY KEY,
  account_id INTEGER,
  currency_id INTEGER,
  amount DECIMAL(9,2),
  FOREIGN KEY (currency_id) REFERENCES currencies(id)
);