CREATE TABLE account_types (
  id SERIAL PRIMARY KEY,
  charge DECIMAL(3,0) NOT NULL,
  name VARCHAR(50) NOT NULL
);

