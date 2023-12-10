drop sequence if exists product_id_sequence;
drop table if exists product;

create sequence product_id_sequence start with 1;

create table product
(
    id       bigint  not null primary key,
    fullname varchar not null
);

insert into product (id, fullname)
values (nextval('product_id_sequence'), 'Notebook'),
       (nextval('product_id_sequence'), 'Pencil'),
       (nextval('product_id_sequence'), 'Bag');

--  last_value
-- ------------
--           3
-- (1 row)
select last_value
from product_id_sequence;

alter sequence product_id_sequence restart;

--  last_value
-- ------------
--           1
-- (1 row)
select last_value
from product_id_sequence;

alter sequence product_id_sequence restart 4;

--  last_value
-- ------------
--           3
-- (1 row)
select last_value
from product_id_sequence;

insert into product (id, fullname)
values (nextval('product_id_sequence'), 'Calculator');

--  id | fullname
-- ----+----------
--   1 | Notebook
--   2 | Pencil
--   3 | Bag
--   4 | Pen
-- (4 rows)
select *
from product;
