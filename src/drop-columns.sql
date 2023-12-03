drop table if exists messages;
create table messages
(
    id         serial primary key,
    content    text,
    from_email text,
    to_email   text,

    constraint content_notnull check (content is not null),
    constraint from_email_notnull check (from_email is not null),
    constraint to_email_notnull check (to_email is not null)
);

--  column_name | data_type
-- -------------+-----------
--  id          | integer
--  content     | text
--  from_email  | text
--  to_email    | text
-- (4 rows)
select column_name, data_type
from information_schema.columns
where table_name = 'messages';

-- ALTER TABLE
alter table messages
    drop column if exists content;

--  column_name | data_type
-- -------------+-----------
--  id          | integer
--  from_email  | text
--  to_email    | text
-- (3 rows)
select column_name, data_type
from information_schema.columns
where table_name = 'messages';

-- ALTER TABLE
alter table messages
    drop column from_email,
    drop column to_email;

--  column_name | data_type
-- -------------+-----------
--  id          | integer
-- (1 row)
select column_name, data_type
from information_schema.columns
where table_name = 'messages';
