drop table if exists account;
create table account
(
    id         serial primary key,
    owner_name varchar                     not null,
    created_at timestamp without time zone not null default now()
);

--  id
-- ----
--   1
-- (1 row)
insert into account (owner_name)
values ('John Smith')
returning id;

--  id |         created_at
-- ----+----------------------------
--   2 | 2023-12-03 03:08:25.649937
-- (1 row)
insert into account (owner_name)
values ('Mary Jane')
returning id, created_at;

--  id | owner_name |         created_at
-- ----+------------+----------------------------
--   3 | Amy Miles  | 2023-12-03 03:08:25.652844
-- (1 row)
insert into account (owner_name)
values ('Amy Miles')
returning *;
