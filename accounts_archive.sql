CREATE TABLE accounts_archive
(
  id              SERIAL PRIMARY KEY,
  customer_id     INTEGER REFERENCES customers_archive (id),
  account_type_id INTEGER REFERENCES account_types (id),
  account_number  INTEGER NOT NULL,
  open_date       DATE    NOT NULL,
  close_date      DATE    NOT NULL
);