CREATE TABLE card_types
(
  id   SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL
);

INSERT INTO card_types (type)
VALUES ('Debit'),
       ('Credit');