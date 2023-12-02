drop table if exists cars;
create table cars
(
    id         serial primary key,
    model      varchar,
    attributes jsonb
);

insert into cars (model, attributes) values
('F250', '{"brand": "Ford","release_year": 2020,"category": "truck"}'),
('Pickup', '{"brand": "Toyota","release_year": 1990,"category": "truck"}'),
('Prius', '{"brand": "Toyota","release_year": 2020,"category": "compact"}');

select attributes ->> 'brand' as brand, model
from cars
where attributes ->> 'category' = 'truck';
