create table if not exists genders
(
  id  SERIAL PRIMARY KEY,
  sex VARCHAR(20) NOT NULL
);

insert into genders (sex)
values ('male'),
       ('female'),
       ('other');