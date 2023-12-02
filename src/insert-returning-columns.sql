drop table if exists account;
create table account
(
    id         serial primary key,
    owner_name varchar                     not null,
    created_at timestamp without time zone not null default now()
);


insert into account (owner_name)
values ('John Smith')
returning id;

insert into account (owner_name)
values ('Mary Jane')
returning id, created_at;

insert into account (owner_name)
values ('Amy Miles')
returning *;
