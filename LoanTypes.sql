create table LoanTypes
(
	id serial
		constraint LoanTypes_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);