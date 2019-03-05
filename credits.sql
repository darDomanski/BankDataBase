Drop table Credits;
create table credits
(
	id serial,
	custumer_id int,
	credit_type_id int,

	PRIMARY KEY (id),
	FOREIGN KEY (custumer_id) REFERENCES customers(id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types(id)


);


