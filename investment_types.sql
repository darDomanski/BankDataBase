create table investment_types
(
	id       serial
		constraint investment_types_pk
			primary key,
	duration int,
	RRSO     DECIMAL(2, 0),
	name     VARCHAR(50)
);

ALTER TABLE investment_types
	ALTER COLUMN RRSO TYPE DECIMAL(2, 0);
INSERT INTO investment_types (duration, RRSO, name)
VALUES (24, 3.1, '24 months'),
			 (12, 2.3, 'short'),
			 (48, 4.2, 'long');

