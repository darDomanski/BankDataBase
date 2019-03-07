CREATE TABLE account_types (
  id SERIAL PRIMARY KEY,
  charge DECIMAL(3,0) NOT NULL,
  name VARCHAR(50) NOT NULL
);

INSERT INTO account_types (charge, name)
values (10.10, 'for young'),
       (12.10, 'normal'),
       (50.50, 'vip'),
       (20.10, 'for business'),
       (10.10, 'for family');
INSERT INTO account_types (charge, name)
VALUES (15.60, 'for elders');