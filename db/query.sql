SELECT *
FROM course_names;

-- +----+-------------------------+------------+
-- | id | name                    | department |
-- +----+-------------------------+------------+
-- |  1 | Intro to JavaScript     |          1 |
-- |  2 | Data Science            |          2 |
-- |  3 | Linear Algebra          |          3 |
-- |  4 | History of the Internet |          4 |
-- |  5 | Machine Learning        |          4 |
-- |  6 | Game Design             |          1 |
-- |  7 | Cloud Development       |          1 |
-- +----+-------------------------+------------+

SELECT *
FROM course_names
JOIN department ON course_names.department = department.id;

-- +----+-------------------------+------------+----+-----------------+
-- | id | name                    | department | id | name            |
-- +----+-------------------------+------------+----+-----------------+
-- |  1 | Intro to JavaScript     |          1 |  1 | Web Development |
-- |  6 | Game Design             |          1 |  1 | Web Development |
-- |  7 | Cloud Development       |          1 |  1 | Web Development |
-- |  2 | Data Science            |          2 |  2 | Data Science    |
-- |  3 | Linear Algebra          |          3 |  3 | Math            |
-- |  4 | History of the Internet |          4 |  4 | Electives       |
-- |  5 | Machine Learning        |          4 |  4 | Electives       |
-- +----+-------------------------+------------+----+-----------------+

SELECT *
FROM department
JOIN course_names ON course_names.department = department.id;


-- +----+-----------------+----+-------------------------+------------+
-- | id | name            | id | name                    | department |
-- +----+-----------------+----+-------------------------+------------+
-- |  1 | Web Development |  1 | Intro to JavaScript     |          1 |
-- |  1 | Web Development |  6 | Game Design             |          1 |
-- |  1 | Web Development |  7 | Cloud Development       |          1 |
-- |  2 | Data Science    |  2 | Data Science            |          2 |
-- |  3 | Math            |  3 | Linear Algebra          |          3 |
-- |  4 | Electives       |  4 | History of the Internet |          4 |
-- |  4 | Electives       |  5 | Machine Learning        |          4 |
-- +----+-----------------+----+-------------------------+------------+

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

SELECT department.id AS DepartmentID, department.nameAS dept_names , course_names.name  AS course_names 
FROM department 
JOIN course_names ON course_names.department = department.id;

-- +--------------+-----------------+-------------------------+
-- | DepartmentID | name            | course_names                    |
-- +--------------+-----------------+-------------------------+
-- |            1 | Web Development | Intro to JavaScript     |
-- |            1 | Web Development | Game Design             |
-- |            1 | Web Development | Cloud Development       |
-- |            2 | Data Science    | Data Science            |
-- |            3 | Math            | Linear Algebra          |
-- |            4 | Electives       | History of the Internet |
-- |            4 | Electives       | Machine Learning        |
-- +--------------+-----------------+-------------------------+

SELECT department.id AS DepartmentID, department.name , course_names.name AS course_names 
FROM department
INNER JOIN course_names ON course_names.department = department.id;

-- +--------------+-----------------+-------------------------+
-- | DepartmentID | name            | course_names            |
-- +--------------+-----------------+-------------------------+
-- |            1 | Web Development | Intro to JavaScript     |
-- |            1 | Web Development | Game Design             |
-- |            1 | Web Development | Cloud Development       |
-- |            2 | Data Science    | Data Science            |
-- |            3 | Math            | Linear Algebra          |
-- |            4 | Electives       | History of the Internet |
-- |            4 | Electives       | Machine Learning        |
-- +--------------+-----------------+-------------------------+


SELECT department.id AS DepartmentID, department.name , course_names.name AS course_names 
FROM department
INNER JOIN course_names ON course_names.department = department.id
AND department.name = "Web Development";


-- +--------------+-----------------+---------------------+
-- | DepartmentID | name            | course_names        |
-- +--------------+-----------------+---------------------+
-- |            1 | Web Development | Intro to JavaScript |
-- |            1 | Web Development | Game Design         |
-- |            1 | Web Development | Cloud Development   |
-- +--------------+-----------------+---------------------+


SELECT department.id AS DepartmentID, department.name , course_names.name AS course_names 
FROM department
INNER JOIN course_names ON course_names.department = department.id
AND department.name = "Web Development" OR department.name = "Electives";

-- +--------------+-----------------+-------------------------+
-- | DepartmentID | name            | course_names            |
-- +--------------+-----------------+-------------------------+
-- |            4 | Electives       | Intro to JavaScript     |
-- |            1 | Web Development | Intro to JavaScript     |
-- |            4 | Electives       | Data Science            |
-- |            4 | Electives       | Linear Algebra          |
-- |            4 | Electives       | History of the Internet |
-- |            4 | Electives       | Machine Learning        |
-- |            4 | Electives       | Game Design             |
-- |            1 | Web Development | Game Design             |
-- |            4 | Electives       | Cloud Development       |
-- |            1 | Web Development | Cloud Development       |
-- +--------------+-----------------+-------------------------+



SELECT department.id AS DepartmentID, department.name , course_names.name AS course_names 
FROM department
INNER JOIN course_names ON course_names.department = department.id
AND department.name = "Web Development" OR department.name = "Electives"
ORDER BY department.id;

-- Same As

SELECT department.id AS DepartmentID, department.name , course_names.name AS course_names 
FROM department
INNER JOIN course_names ON course_names.department = department.id
WHERE department.name = "Web Development" OR department.name = "Electives"
ORDER BY department.id;

-- +--------------+-----------------+-------------------------+
-- | DepartmentID | name            | course_names            |
-- +--------------+-----------------+-------------------------+
-- |            1 | Web Development | Intro to JavaScript     |
-- |            1 | Web Development | Game Design             |
-- |            1 | Web Development | Cloud Development       |
-- |            4 | Electives       | Intro to JavaScript     |
-- |            4 | Electives       | Data Science            |
-- |            4 | Electives       | Linear Algebra          |
-- |            4 | Electives       | History of the Internet |
-- |            4 | Electives       | Machine Learning        |
-- |            4 | Electives       | Game Design             |
-- |            4 | Electives       | Cloud Development       |
-- +--------------+-----------------+-------------------------+





