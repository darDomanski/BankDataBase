CREATE TABLE currencies(
  id SERIAL PRIMARY KEY,
  currency VARCHAR(40) NOT NULL,
  dollar_converter DECIMAL(8,0) NOT NULL,
  pln_converter DECIMAL(8,0) NOT NULL
)
;
ALTER TABLE currencies DROP COLUMN dollar_converter;
ALTER TABLE currencies DROP COLUMN pln_converter;
ALTER TABLE currencies ADD COLUMN dollar_converter DECIMAL(8,0);
ALTER TABLE currencies ADD COLUMN pln_converter DECIMAL(8,0);
INSERT INTO currencies (currency, dollar_converter, pln_converter) VALUES('PLN', 3.45, 0);