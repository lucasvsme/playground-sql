drop table if exists cars;
create table cars
(
    id         serial primary key,
    model      varchar,
    attributes jsonb
);

insert into cars (model, attributes) values
('F250', '{"brand": "Ford", "release_year": 2020, "category": "truck", "spec": { "doors": "4" }}'),
('Pickup', '{"brand": "Toyota", "release_year": 1990, "category": "truck"}'),
('Prius', '{"brand": "Toyota", "release_year": 2020, "category": "compact"}');

select model, attributes ->> 'brand' as brand
from cars
where attributes ->> 'category' = 'truck';

select model, attributes -> 'spec' -> 'doors' as doors
from cars
where model = 'F250';

select model, attributes -> 'spec' -> 'seats' as unknown
from cars
where model = 'F250';
