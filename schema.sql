-- Drops the empinfo_db if it already exists --
DROP DATABASE IF EXISTS empinfo_db;

-- Created the DB "empinfo_db" (only works on local connections)
CREATE DATABASE empinfo_db;

-- Use the DB wizard_schools_db for all the rest of the script
USE empinfo_db;

-- Created the table "department", "roles" and "employee"
CREATE TABLE department
(
  id int AUTO_INCREMENT NOT NULL,
  name varchar(30) NOT NULL,
  PRIMARY KEY(id)
);
USE empinfo_db;
CREATE TABLE roles
(
  id int AUTO_INCREMENT NOT NULL,
  title varchar(30) NOT NULL,
  salary decimal(12,2) NOT NULL,
  department_id int NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (department_id) REFERENCES department(id)
);
USE empinfo_db;
CREATE TABLE employee
(
  id int AUTO_INCREMENT NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  role_id int NULL,
  manager_id int NULL,
  PRIMARY KEY(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Various queries
USE empinfo_db;
SELECT e.id, CONCAT(e.first_name, ' ' ,e.last_name) AS Name, r.title, d.name 
FROM employee e 
INNER JOIN roles r ON e.role_id = r.id 
INNER JOIN department d ON r.department_id = d.id 
ORDER BY d.name;

SELECT * FROM empinfo_db.employee;
SELECT * FROM empinfo_db.roles;
SELECT * FROM empinfo_db.department;

USE empinfo_db;
SELECT r.id, r.title, r.salary, d.name 
FROM roles r 
INNER JOIN department d ON r.department_id = d.id;

USE empinfo_db;
SELECT e.id, CONCAT(e.first_name, ' ' ,e.last_name) AS Name, CONCAT(m.first_name, ' ' ,m.last_name) AS Manager_Name 
FROM employee e 
LEFT OUTER JOIN employee m ON e.manager_id = m.id 
ORDER BY m.first_name;

USE empinfo_db;
SELECT d.name, count(r.salary) AS Total_Budget
FROM employee e, roles r, department d
WHERE e.role_id = r.id AND r.department_id = d.id
GROUP BY r.department_id;