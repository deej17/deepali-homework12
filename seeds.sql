-- Inserting value into the "department" table
INSERT INTO department(name) VALUES ("Marketing");
INSERT INTO department(name) VALUES ("Human Resource");
INSERT INTO department(name) VALUES ("Training");
INSERT INTO department(name) VALUES ("Information Technology");
INSERT INTO department(name) VALUES ("Production");
INSERT INTO department(name) VALUES ("Accounting and Finance");
INSERT INTO department(name) VALUES ("Research and Development");

SELECT * FROM department;

-- Inserting value into the "roles" table
INSERT INTO roles(title, salary, department_id) VALUES ("Marketing Manager", 90000, 1);
INSERT INTO roles(title, salary, department_id) VALUES ("Marketing Executive", 60000, 1);
INSERT INTO roles(title, salary, department_id) VALUES ("HR Manager", 90000, 2);
INSERT INTO roles(title, salary, department_id) VALUES ("HR Executive", 90000, 2);
INSERT INTO roles(title, salary, department_id) VALUES ("Training Manager", 90000, 3);
INSERT INTO roles(title, salary, department_id) VALUES ("Program Manager", 120000, 4);
INSERT INTO roles(title, salary, department_id) VALUES ("Project Manager", 90000, 4);
INSERT INTO roles(title, salary, department_id) VALUES ("Senior Architect", 80000, 4);
INSERT INTO roles(title, salary, department_id) VALUES ("Associate", 60000, 4);
INSERT INTO roles(title, salary, department_id) VALUES ("Product Manager", 80000, 5);
INSERT INTO roles(title, salary, department_id) VALUES ("Accounts Manager", 85000, 6);
INSERT INTO roles(title, salary, department_id) VALUES ("Data Research Analysts", 130000, 7);

SELECT * FROM roles;

INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Johnny", "Depp", 2, 1);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Angelina", "Jolie", 4, 3);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Emma", "Stone", 5, 5);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Sandra", "Bullock", 8, 7);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Robert", "De Niro", 7, 6);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Anna", "Hathaway", 8, 7);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Tom", "Cruise", 12, 6);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Jessica", "Alba", 9, 7);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Brad", "Pitt", 9, 7);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Mila", "Kunis", 10, 6);
INSERT INTO employee(first_name, last_name, role_id, manager_id) VALUES ("Matt", "Damon", 11, 3);

SELECT * FROM employee;

