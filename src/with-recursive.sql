drop table if exists directories;
create table directories
(
    id             serial,
    path           text not null,
    parent_path_id integer default null
);

-- INSERT 0 3
insert into directories (id, path, parent_path_id)
values (1, '/projects', null),
       (2, '/hello-world', 1),
       (3, '/my-website', 1);

--          path
-- -----------------------
--  /projects
--  /projects/hello-world
--  /projects/my-website
-- (3 rows)
with recursive directories_tree as (select path
                                    from directories
                                    where parent_path_id is null

                                    union

                                    select concat(pd.path, d.path) as path
                                    from directories d
                                             inner join directories pd on pd.id = d.parent_path_id
                                    order by path)
select *
from directories_tree;
