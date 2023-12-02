drop table if exists courses;
create table courses
(
    course_id   int,
    course_name char(36),

    primary key (course_id)
);

insert into courses (course_id, course_name)
select generate_series(1, 100000), gen_random_uuid();

explain analyze
select course_id, course_name
from courses
order by course_id
offset 1000 limit 1000;

explain analyze
select course_id, course_name
from courses
order by course_id
offset 5000 limit 1000;
