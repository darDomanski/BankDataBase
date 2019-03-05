CREATE TABLE balances (
  id SERIAL PRIMARY KEY,
  currency_id INTEGER,
  amount DECIMAL(9,2) NOT NULL,
  FOREIGN KEY (currency_id) REFERENCES currencies(id)
)
;
ALTER TABLE balances DROP COLUMN amount;
ALTER TABLE balances ADD COLUMN amount DECIMAL(9,0);
INSERT INTO balances(currency_id, amount) VALUES(1, 1000);