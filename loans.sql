 Drop table Loans
create table Loans
(
	id serial,
	customer_id int,
	loan_type_id int,

	PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
	FOREIGN KEY (loan_type_id) REFERENCES loan_types(id)

);