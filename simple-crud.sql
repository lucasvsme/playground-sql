CREATE TABLE things (
    id serial PRIMARY KEY,
    name varchar
);

INSERT INTO things (name) VALUES ('Pen');
INSERT INTO things (name) VALUES ('Paper');
INSERT INTO things (name) VALUES ('Folder');

SELECT id, name FROM things;

UPDATE things SET name = 'Pencil' WHERE id = 1;

SELECT id, name FROM things;

DELETE FROM things WHERE name LIKE '%er';

SELECT COUNT(id) FROM things;

DROP TABLE things;
