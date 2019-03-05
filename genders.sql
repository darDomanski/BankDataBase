create table genders
(
  id  SERIAL PRIMARY KEY,
  sex VARCHAR(20) NOT NULL
);

insert into genders
values ('male'),
       ('female'),
       ('other');