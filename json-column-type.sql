DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
    id serial PRIMARY KEY,
    model varchar,
    attributes JSONB
);

INSERT INTO cars (model, attributes) VALUES (
    'F250', '{
    "brand": "Ford",
    "release_year": 2020,
    "category": "truck"}'
);
INSERT INTO cars (model, attributes) VALUES (
    'Ranger', '{
    "brand": "Toyota",
    "release_year": 1989,
    "category": "truck"}'
);
INSERT INTO cars (model, attributes) VALUES (
    'Prius', '{
    "brand": "Toyota",
    "release_year": 2018,
    "category": "sedan"}'
);

SELECT attributes->>'brand' AS brand, model
FROM cars
WHERE attributes->>'category' = 'truck';
