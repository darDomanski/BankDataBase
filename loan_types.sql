
DROP TABLE loan_types

create table loan_types
(
	id serial
		constraint loan_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);

insert into loan_types (duration,RRSO,name)
values (12,0.60,'last');
insert into loan_types (duration,RRSO,name)
values (6,0.35,'second');
insert into loan_types (duration,RRSO,name)
values (3,0.20,'first');