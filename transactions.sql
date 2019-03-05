CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  account_id INTEGER,
  account_number INTEGER,
  change DECIMAL(9,2),
  type VARCHAR(50),
  description VARCHAR(100),
  date DATE,
  FOREIGN KEY (account_id) REFERENCES accounts(id)
);