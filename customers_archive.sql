CREATE TABLE if not exists customers_archive
(
  id               SERIAL PRIMARY KEY        NOT NULL,
  customer_name    VARCHAR(50)               NOT NULL,
  customer_surname VARCHAR(50)               NOT NULL,
  birth_date       DATE                      NOT NULL,
  address_id       int                       NOT NULL references addresses_archive (id),
  phone            INT                       NOT NULL,
  email            VARCHAR(50)               NOT NULL,
  sex_id           INT                       NOT NULL references genders (id),
  pesel            VARCHAR(11)               NOT NULL,
  start_date       DATE                      NOT NULL,
  end_date         DATE default current_date NOT NULL
);

