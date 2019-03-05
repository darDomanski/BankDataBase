create table CreditTypes
(
	id serial
		constraint CreditTypes_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);