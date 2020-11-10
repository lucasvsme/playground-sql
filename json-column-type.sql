DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    model VARCHAR,
    attributes JSONB
);

INSERT INTO cars (model, attributes) VALUES
('F250', '{"brand": "Ford","release_year": 2020,"category": "truck"}'),
('Pickup', '{"brand": "Toyota","release_year": 1990,"category": "truck"}'),
('Prius', '{"brand": "Toyota","release_year": 2020,"category": "compact"}');

SELECT attributes->>'brand' AS brand, model
FROM cars
WHERE attributes->>'category' = 'truck';

