drop sequence if exists person_id;
drop table if exists person;

create sequence person_id start with 1;
create table person
(
    id         bigint  not null,
    first_name varchar not null,
    last_name  varchar not null,

    constraint pk_person_id primary key (id)
);

-- INSERT 0 5
insert into person (id, first_name, last_name)
values (nextval('person_id'), 'John', 'Smith'),
       (nextval('person_id'), 'Mary', 'Jane'),
       (nextval('person_id'), 'Edgar', 'Smith'),
       (nextval('person_id'), 'Evelin', 'Jane'),
       (nextval('person_id'), 'Mary', 'Jane');

--  first_name
-- ------------
--  Mary
--  Edgar
--  John
--  Evelin
-- (4 rows)
select distinct first_name
from person;

--  last_name
-- -----------
--  Jane
--  Smith
-- (2 rows)
select distinct last_name
from person;

--  first_name | last_name
-- ------------+-----------
--  Edgar      | Smith
--  John       | Smith
--  Mary       | Jane
--  Evelin     | Jane
-- (4 rows)
select distinct first_name, last_name
from person;

--  id | first_name | last_name
-- ----+------------+-----------
--   4 | Evelin     | Jane
--   1 | John       | Smith
--   2 | Mary       | Jane
--   3 | Edgar      | Smith
--   5 | Mary       | Jane
-- (5 rows)
select distinct id, first_name, last_name
from person;

--  id | first_name | last_name
-- ----+------------+-----------
--   4 | Evelin     | Jane
--   1 | John       | Smith
--   2 | Mary       | Jane
--   3 | Edgar      | Smith
--   5 | Mary       | Jane
-- (5 rows)
select distinct *
from person;
