CREATE TABLE
  if not exists accounts_archive
(
  id              SERIAL PRIMARY KEY,
  account_type_id INTEGER REFERENCES account_types (id),
  account_number  INTEGER NOT NULL,
  open_date       DATE    NOT NULL,
  close_date      DATE    NOT NULL
);