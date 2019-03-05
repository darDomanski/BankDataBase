CREATE TABLE account_types (
  id SERIAL PRIMARY KEY,
  charge DECIMAL(3.2) NOT NULL,
  name VARCHAR(50) NOT NULL
);
ALTER TABLE account_types DROP COLUMN charge;
ALTER TABLE account_types ADD COLUMN charge DECIMAL(3,0);
DROP TABLE account_types;
INSERT INTO account_types (charge, name) VALUES(13.2,'vip');
