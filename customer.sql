CREATE TABLE if not exists customers
(
  id               SERIAL PRIMARY KEY NOT NULL,
  customer_name    VARCHAR(50)        NOT NULL,
  customer_surname VARCHAR(50)        NOT NULL,
  birth_date       DATE               NOT NULL,
  address_id       int                NOT NULL references addresses (id),
  phone            BIGINT             NOT NULL,
  email            VARCHAR(50)        NOT NULL,
  sex_id           INT                NOT NULL references genders (id),
  pesel            VARCHAR(11)        NOT NULL,
  start_date       DATE               NOT NULL
);

drop table customers cascade;

CREATE OR REPLACE FUNCTION copy_customer_to_archive() returns trigger as
$$
BEGIN
  INSERT into customers_archive (customer_name, customer_surname, birth_date, address_id, phone, email, sex_id, pesel,
                                 start_date, end_date)
  VALUES (old.customer_name, old.customer_surname, old.birth_date, old.address_id, old.phone, old.email, old.sex_id,
          old.pesel, old.start_date, current_date);
  delete from addresses where id = old.address_id;
  RETURN null;
end;
$$ language plpgsql;

CREATE TRIGGER moveDeleted
  AFTER DELETE
  ON customers
  FOR EACH ROW
EXECUTE PROCEDURE copy_customer_to_archive();

COPY customers from '/home/darski/codecool/advanced/tw2/BankDataBase/data_sources/customers.csv' delimiter ',';
