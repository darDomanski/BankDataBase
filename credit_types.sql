
DROP TABLE credit_types

create table credit_types
(
	id serial
		constraint credit_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)

);


insert into credit_types (duration,RRSO,name)
values (12,0.60,'for young');
insert into credit_types (duration,RRSO,name)
values (6,0.35,'for family');
insert into credit_types (duration,RRSO,name)
values (3,0.20,'for seniors');