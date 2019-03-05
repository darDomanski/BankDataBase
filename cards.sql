CREATE TABLE cards(
  id SERIAL PRIMARY KEY,
  account_id INTEGER,
  expiration_date DATE,
  CVV INTEGER,
  type_id INTEGER,
  operator_id INTEGER
);