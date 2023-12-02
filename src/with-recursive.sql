DROP TABLE IF EXISTS directories;
CREATE TABLE directories (
  id SERIAL,
  path TEXT NOT NULL,
  parent_path_id INTEGER DEFAULT NULL
);

INSERT INTO directories (id, path, parent_path_id) VALUES 
(1, '/projects', null),
(2, '/hello-world', 1),
(3, '/my-website', 1);

WITH RECURSIVE directories_tree AS (
  SELECT path
  FROM directories
  WHERE parent_path_id IS NULL

  UNION

  SELECT CONCAT(pd.path, d.path) AS path
  FROM directories d
  INNER JOIN directories pd ON pd.id = d.parent_path_id
  ORDER BY path
) SELECT * FROM directories_tree;
