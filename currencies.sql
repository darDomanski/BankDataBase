CREATE TABLE currencies(
  id SERIAL PRIMARY KEY,
  currency VARCHAR(40) NOT NULL,
  dollar_converter DECIMAL(8,2) NOT NULL,
  pln_converter DECIMAL(8,2) NOT NULL
);