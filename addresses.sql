create table if not exists addresses
(
  id       serial PRIMARY KEY not null,
  street   varchar(50)        not null,
  zip_code varchar(15)        not null,
  city     varchar(80)        not null,
  country  varchar(100)
)
;

CREATE OR REPLACE FUNCTION copy_address_to_archive() returns trigger as
$$
BEGIN
  INSERT into addresses_archive (street, zip_code, city, country)
  VALUES (old.street, old.zip_code, old.city, old.country);
  return null;
end;
$$ language plpgsql;

CREATE TRIGGER moveDeletedAddress
  AFTER DELETE
  ON addresses
  FOR EACH ROW
EXECUTE PROCEDURE copy_address_to_archive();

