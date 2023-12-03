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
--  Limit  (cost=130.42..260.55 rows=1000 width=152) (actual time=0.168..0.351 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..5475.41 rows=42075 width=152) (actual time=0.015..0.262 rows=2000 loops=1)
--  Planning Time: 0.137 ms
--  Execution Time: 0.400 ms
-- (4 rows)
explain analyze
select course_id, course_name
from courses
order by course_id
offset 1000 limit 1000;

--                                                                QUERY PLAN
-- ----------------------------------------------------------------------------------------------------------------------------------------
--  Limit  (cost=650.93..781.06 rows=1000 width=152) (actual time=0.624..0.778 rows=1000 loops=1)
--    ->  Index Scan using courses_pkey on courses  (cost=0.29..5475.41 rows=42075 width=152) (actual time=0.012..0.605 rows=6000 loops=1)
--  Planning Time: 0.019 ms
--  Execution Time: 0.817 ms
-- (4 rows)
explain analyze
select course_id, course_name
from courses
order by course_id
offset 5000 limit 1000;
