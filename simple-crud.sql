DROP DATABASE IF EXISTS things;
CREATE TABLE things (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

INSERT INTO things (name) VALUES ('Pen');
INSERT INTO things (name) VALUES ('Paper');
INSERT INTO things (name) VALUES ('Folder');
SELECT id, name FROM things;

UPDATE things SET name = 'Pencil' WHERE id = 1;
SELECT id, name FROM things;

DELETE FROM things WHERE name LIKE '%er';
SELECT count(id) FROM things;