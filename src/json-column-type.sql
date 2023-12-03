drop table if exists cars;
create table cars
(
    id         serial primary key,
    model      varchar,
    attributes jsonb
);

-- INSERT 0 3
insert into cars (model, attributes) values
('F250', '{"brand": "Ford", "release_year": 2020, "category": "truck", "spec": { "doors": "4" }}'),
('Pickup', '{"brand": "Toyota", "release_year": 1990, "category": "truck"}'),
('Prius', '{"brand": "Toyota", "release_year": 2020, "category": "compact"}');

--  model  | brand
-- --------+--------
--  F250   | Ford
--  Pickup | Toyota
-- (2 rows)
select model, attributes ->> 'brand' as brand
from cars
where attributes ->> 'category' = 'truck';

--  model | doors
-- -------+-------
--  F250  | "4"
-- (1 row)
select model, attributes -> 'spec' -> 'doors' as doors
from cars
where model = 'F250';

--  model | unknown
-- -------+---------
--  F250  |
-- (1 row)
select model, attributes -> 'spec' -> 'seats' as unknown
from cars
where model = 'F250';
