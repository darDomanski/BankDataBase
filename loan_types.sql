create table loan_types
(
	id       serial
		constraint loan_types_pk
			primary key,
	duration int,
	RRSO     DECIMAL(2, 0),
	name     VARCHAR(50)
);
ALTER TABLE loan_types
	ALTER COLUMN RRSO TYPE DECIMAL(2, 0);
INSERT INTO loan_types (duration, RRSO, name)
VALUES (24, 9.2, '5 minutes'),
			 (12, 14.3, 'short'),
			 (48, 7.2, 'long');