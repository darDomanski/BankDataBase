create table new_schema.LoanTypes
(
	id serial
		constraint LoanTypes_pk
			primary key,
	duration int,
	RRSO int,
	name int
);
