drop table investmen_types

create table investmen_types
(
	id serial
		constraint investment_types_pk
			primary key,
	duration int,
	RRSO DECIMAL(2,2),
	name VARCHAR(50)
);

insert into investmen_types (duration,RRSO,name)
values (12,0.60,'super');
insert into investmen_types (duration,RRSO,name)
values (6,0.35,'normal');
insert into investmen_types (duration,RRSO,name)
values (3,0.20,'simple');

