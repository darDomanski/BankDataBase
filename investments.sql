Drop table investments;
create table investments
(
  id             serial,
  customer_id    int,
  invest_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (invest_type_id) REFERENCES investment_types (id)

);

COPY investments FROM '/home/darski/codecool/advanced/tw2/BankDataBase/data_sources/loans.csv' delimiter ',';
SELECT *
FROM investments;

SELECT *
FROM loan_types;
