drop table if exists things;
create table things
(
    id   serial primary key,
    name varchar
);

insert into things (name)
values ('Pen');

insert into things (name)
values ('Paper'),
       ('Folder');

select id, name
from things;

update things
set name = 'Pencil'
where id = 1;

select id, name
from things;

delete
from things
where name like '%er';

select count(id)
from things;
