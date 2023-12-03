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
--  Limit  (cost=0.29..310.70 rows=1000 width=152) (actual time=0.013..0.178 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..4353.73 rows=14025 width=152) (actual time=0.012..0.128 rows=1000 loops=1)
--          Index Cond: (course_id > 1000)
--  Planning Time: 0.152 ms
--  Execution Time: 0.229 ms
-- (5 rows)
explain analyze
select course_id, course_name
from courses
where (course_id) > 1000
order by course_id
limit 1000;

--                                                                QUERY PLAN
-- ----------------------------------------------------------------------------------------------------------------------------------------
--  Limit  (cost=0.29..310.70 rows=1000 width=152) (actual time=0.014..0.180 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..4353.73 rows=14025 width=152) (actual time=0.014..0.130 rows=1000 loops=1)
--          Index Cond: (course_id > 5000)
--  Planning Time: 0.022 ms
--  Execution Time: 0.218 ms
-- (5 rows)
explain analyze
select course_id, course_name
from courses
where (course_id) > 5000
order by course_id
limit 1000;
