create table investment_types
(
	id serial
		constraint investment_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);

