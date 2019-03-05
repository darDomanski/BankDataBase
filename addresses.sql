create table if not exists addresses
(
  id       serial PRIMARY KEY not null,
  street   varchar(50)        not null,
  zip_code varchar(15)        not null,
  city     varchar(80)        not null,
  country  varchar(100)
);