create table credit_types
(
	id serial
		constraint credit_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);

