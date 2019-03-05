 create table Investments
(
	id serial,
	customer_id int,
	invest_type_id int,

	PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES Customers(id),
	FOREIGN KEY (invest_type_id) REFERENCES InvestmentTypes(id)

);