Drop table investments;
create table investments
(
  id             serial,
  customer_id    int,
  invest_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (invest_type_id) REFERENCES investmen_types (id)

);


INSERT INTO Investments (customer_id,invest_type_id) values (1,1);
INSERT INTO Investments (customer_id,invest_type_id) values (2,1);
INSERT INTO Investments (customer_id,invest_type_id) values (1,2);
INSERT INTO Investments (customer_id,invest_type_id) values (1,3);
INSERT INTO Investments (customer_id,invest_type_id) values (1,1);
INSERT INTO Investments (customer_id,invest_type_id) values (1,2);