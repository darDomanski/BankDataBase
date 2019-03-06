Drop table Credits;
create table credits
(
  id             serial,
  customer_id    int,
  credit_type_id int,

  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (credit_type_id) REFERENCES credit_types (id)

);


INSERT INTO customers (customer_name,customer_surname,birth_date,address_id,phone,email,sex_id,pesel,start_date)
values ('xxx','yyy','2016-06-23',1002,1000,'xxx@gcom',1,11111,'2016-06-23');

insert into addresses(street,zip_code,city,country)
values ('Krakowska',1111111,'Krakow','Poland');


INSERT INTO credits (customer_id,credit_type_id) values (4,1);
INSERT INTO credits (customer_id,credit_type_id) values (4,1);
INSERT INTO credits (customer_id,credit_type_id) values (4,2);
INSERT INTO credits (customer_id,credit_type_id) values (4,3);
INSERT INTO credits (customer_id,credit_type_id) values (4,1);
INSERT INTO credits (customer_id,credit_type_id) values (4,2);