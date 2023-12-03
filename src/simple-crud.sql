drop table if exists things;
create table things
(
    id   serial primary key,
    name varchar
);

-- INSERT 0 1
insert into things (name)
values ('Pen');

-- INSERT 0 2
insert into things (name)
values ('Paper'),
       ('Folder');

--  id |  name
-- ----+--------
--   1 | Pen
--   2 | Paper
--   3 | Folder
-- (3 rows)
select id, name
from things;

-- UPDATE 1
update things
set name = 'Pencil'
where id = 1;

--  id |  name
-- ----+--------
--   2 | Paper
--   3 | Folder
--   1 | Pencil
-- (3 rows)
select id, name
from things;

-- DELETE 2
delete
from things
where name like '%er';

--  count
-- -------
--      1
-- (1 row)
select count(id)
from things;
