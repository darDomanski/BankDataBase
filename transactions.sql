CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  account_id INTEGER,
  account_number INTEGER NOT NULL,
  change DECIMAL(9,2) NOT NULL,
  type VARCHAR(50) NOT NULL,
  description VARCHAR(100) DEFAULT '',
  date DATE NOT NULL,
  FOREIGN KEY (account_id) REFERENCES accounts(id)
);