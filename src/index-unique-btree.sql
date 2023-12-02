create extension if not exists "uuid-ossp";

drop table if exists contacts;
create table contacts (
  id uuid primary key default uuid_generate_v4(),
  full_name varchar,
  email text not null
);

create index full_name_idx on contacts(full_name);
create unique index email_unique_idx
on contacts
using btree (lower(email));
select indexname, indexdef from pg_indexes where tablename = 'contacts';

insert into contacts (full_name, email)
values ('John Smith', 'john.smith@email.com');

insert into contacts (id, full_name, email)
values (uuid_generate_v4(), 'Mary Jane', 'mary.jane@email.com');

select id, full_name, email
from contacts;
