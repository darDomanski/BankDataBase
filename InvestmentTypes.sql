create table InvestmentTypes
(
	id serial
		constraint InvestmentTypes_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);