create table loan_types
(
	id serial
		constraint loan_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);