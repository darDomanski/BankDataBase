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

INSERT INTO investments (customer_id,invest_type_id) values (4,1);
INSERT INTO investments (customer_id,invest_type_id) values (4,1);
INSERT INTO investments (customer_id,invest_type_id) values (4,2);
INSERT INTO investments (customer_id,invest_type_id) values (4,3);
INSERT INTO investments (customer_id,invest_type_id) values (4,1);
INSERT INTO investments (customer_id,invest_type_id) values (4,2);