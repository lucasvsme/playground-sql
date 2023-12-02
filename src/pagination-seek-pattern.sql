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
where (course_id) > 1000
order by course_id
limit 1000;

explain analyze
select course_id, course_name
from courses
where (course_id) > 5000
order by course_id
limit 1000;
