CREATE TABLE currencies(
  id SERIAL PRIMARY KEY,
  currency VARCHAR(40) NOT NULL,
  dollar_converter DECIMAL(8,0) NOT NULL,
  pln_converter DECIMAL(8,0) NOT NULL
);

INSERT INTO currencies(currency, dollar_converter, pln_converter)
VALUES ('PLN', 3.69, 0);