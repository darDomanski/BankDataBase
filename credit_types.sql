create table credit_types
(
	id       serial
		constraint credit_types_pk
			primary key,
	duration int,
	RRSO     DECIMAL(2, 0),
	name     VARCHAR(50)

);

ALTER TABLE credit_types
	ALTER COLUMN RRSO TYPE DECIMAL(2, 0);
INSERT INTO credit_types (duration, RRSO, name)
VALUES (24, 9.2, '5 minutes'),
			 (12, 14.3, 'short'),
			 (48, 7.2, 'long');
SELECT *
FROM credit_types;