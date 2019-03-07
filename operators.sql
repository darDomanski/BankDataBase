CREATE TABLE operators
(
  id       SERIAL PRIMARY KEY,
  operator VARCHAR(50) NOT NULL
);

INSERT INTO operators (operator)
VALUES ('Master-Card'),
       ('Visa'),
       ('Maestro'),
       ('American-Express');

