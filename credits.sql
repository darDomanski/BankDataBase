Drop table Credits;
create table credits
(
  id             serial,
  customer_id    int,
  credit_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types (id)

);

INSERT INTO credits (customer_id,credit_type_id) values (1,1);
INSERT INTO credits (customer_id,credit_type_id) values (2,1);
INSERT INTO credits (customer_id,credit_type_id) values (1,2);
INSERT INTO credits (customer_id,credit_type_id) values (1,3);
INSERT INTO credits (customer_id,credit_type_id) values (1,1);
INSERT INTO credits (customer_id,credit_type_id) values (1,2);