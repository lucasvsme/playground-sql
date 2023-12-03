drop table if exists courses;
create table courses
(
    course_id   int,
    course_name char(36),

    primary key (course_id)
);

-- INSERT 0 100000
insert into courses (course_id, course_name)
select generate_series(1, 100000), gen_random_uuid();

--                                                                QUERY PLAN
-- ----------------------------------------------------------------------------------------------------------------------------------------
--  Limit  (cost=0.29..310.70 rows=1000 width=152) (actual time=0.013..0.180 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..4353.73 rows=14025 width=152) (actual time=0.013..0.129 rows=1000 loops=1)
--          Index Cond: (course_id > 1000)
--  Planning Time: 0.155 ms
--  Execution Time: 0.230 ms
-- (5 rows)
explain analyze
select course_id, course_name
from courses
where (course_id) > 1000
order by course_id
    fetch first 1000 rows only;

--                                                                QUERY PLAN
-- ----------------------------------------------------------------------------------------------------------------------------------------
--  Limit  (cost=0.29..310.70 rows=1000 width=152) (actual time=0.016..0.183 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..4353.73 rows=14025 width=152) (actual time=0.016..0.133 rows=1000 loops=1)
--          Index Cond: (course_id > 5000)
--  Planning Time: 0.020 ms
--  Execution Time: 0.222 ms
-- (5 rows)
explain analyze
select course_id, course_name
from courses
where (course_id) > 5000
order by course_id
    fetch first 1000 rows only;
