Drop table loans;
create table loans
(
  id           serial,
  customer_id  int,
  loan_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (loan_type_id) REFERENCES loan_types (id)

);

INSERT INTO loans (customer_id,loan_types) values (1,1);
INSERT INTO loans (customer_id,loan_types) values (2,1);
INSERT INTO loans (customer_id,loan_types) values (1,2);
INSERT INTO loans (customer_id,loan_types) values (1,3);
INSERT INTO loans (customer_id,loan_types) values (1,1);
INSERT INTO loans (customer_id,loan_types) values (1,2);