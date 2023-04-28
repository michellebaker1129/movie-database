DROP DATABASE IF EXISTS movies_db;
CREATE DATABASE movies_db;

USE movies_db;

CREATE TABLE movies (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movie_name VARCHAR(100) NOT NULL
);

CREATE TABLE reviews (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movie_id INT,
  review TEXT,
  FOREIGN KEY (movie_id)
  REFERENCES movies(id)
  ON DELETE SET NULL
);

-- -----
-- DROP DATABASE IF EXISTS courses_db;
-- CREATE DATABASE courses_db;

-- USE courses_db;

-- CREATE TABLE department (
--   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(30) NOT NULL
-- );

-- CREATE TABLE course_names (
--   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(30) NOT NULL,
--   department INT,
--   FOREIGN KEY (department)
--   REFERENCES department(id)
--   ON DELETE SET NULL
-- );


