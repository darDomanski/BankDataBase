CREATE TABLE cards
(
  id              SERIAL PRIMARY KEY,
  account_id      INTEGER,
  expiration_date DATE    NOT NULL,
  CVV             INTEGER NOT NULL,
  type_id         INTEGER,
  operator_id     INTEGER,
  FOREIGN KEY (account_id) REFERENCES accounts (id),
  FOREIGN KEY (type_id) REFERENCES card_types (id),
  FOREIGN KEY (operator_id) REFERENCES operators (id)
);
