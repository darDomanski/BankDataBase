Drop table Credits
create table Credits
(
	id serial,
	custumer_id int,
	credit_type_id int,

	PRIMARY KEY (id),
	FOREIGN KEY (custumer_id) REFERENCES Customers(id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types(id)


);


