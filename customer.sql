CREATE TABLE customers
(
  id               SERIAL PRIMARY KEY NOT NULL,
  customer_name    VARCHAR(50)        NOT NULL,
  customer_surname VARCHAR(50)        NOT NULL,
  birth_date       DATE               NOT NULL,
  address_id       int                NOT NULL references addresses(id),
  phone            INT                NOT NULL,
  email            VARCHAR(50)        NOT NULL,
  sex_id           INT                NOT NULL references genders(id),
  pesel            VARCHAR(11)        NOT NULL,
  start_date       DATE               NOT NULL
)
;


INSERT INTO customers (customer_name,customer_surname,birth_date,address_id,phone,email,sex_id,pesel,start_date)
values ('xxx','yyy',2016-06-23,1,1000,xxx@g.com,1,11111,2016-06-23);