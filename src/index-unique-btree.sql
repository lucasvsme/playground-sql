create extension if not exists "uuid-ossp";

drop table if exists contacts;
create table contacts
(
    id        uuid primary key default uuid_generate_v4(),
    full_name varchar,
    email     text not null
);

-- CREATE INDEX
create index full_name_idx on contacts (full_name);

-- CREATE INDEX
create unique index email_unique_idx
    on contacts
        using btree (lower(email));

--     indexname     |                                      indexdef
-- ------------------+------------------------------------------------------------------------------------
--  contacts_pkey    | CREATE UNIQUE INDEX contacts_pkey ON public.contacts USING btree (id)
--  full_name_idx    | CREATE INDEX full_name_idx ON public.contacts USING btree (full_name)
--  email_unique_idx | CREATE UNIQUE INDEX email_unique_idx ON public.contacts USING btree (lower(email))
-- (3 rows)
select indexname, indexdef
from pg_indexes
where tablename = 'contacts';

-- INSERT 0 1
insert into contacts (full_name, email)
values ('John Smith', 'john.smith@email.com');

-- INSERT 0 1
insert into contacts (id, full_name, email)
values (uuid_generate_v4(), 'Mary Jane', 'mary.jane@email.com');

--                   id                  | full_name  |        email
-- --------------------------------------+------------+----------------------
--  f1041085-f655-42d8-98e3-aaa309735fe5 | John Smith | john.smith@email.com
--  4b626c54-784e-4f29-b58d-d12941bcec6d | Mary Jane  | mary.jane@email.com
-- (2 rows)
select id, full_name, email
from contacts;
