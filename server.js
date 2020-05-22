var inquirer = require("inquirer");
var mysql = require("mysql");
var table = require("console.table");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "rootpass",
    database: "empinfo_db"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    start();
});

//function which prompts the user for what action they should take
function start() {
    inquirer
        .prompt({
            name: "action",
            type: "list",
            message: "Would you like to do?",
            choices: [
                "View all Employees",
                "View all Employees by Department",
                "View all Employees by Manager",
                "Add an Employee",
                "Remove an Employee",
                "Update Employee Role",
                "Update Employee Manager",
                "View All Roles",
                "Exit"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "View all Employees":
                    view("employees");
                    break;

                case "View all Employees by Department":
                    view("department");
                    break;

                case "View all Employees by Manager":
                    view("manager");
                    break;

                case "Add an Employee":
                    add();
                    break;

                case "Remove an Employee":
                    remove();
                    break;

                case "Update Employee Role":
                    update("role");
                    break;

                case "Update Employee Manager":
                    update("manager");
                    break;

                case "View All Roles":
                    view("roles");
                    break;

                case "Exit":
                    connection.end();
                    break;
            }
        });
}

function view(choice) {
    switch (choice) {
        case "employees":
            sqlQuery = "SELECT e.id, CONCAT(e.first_name, ' ' ,e.last_name) AS Name, r.title, d.name FROM employee e INNER JOIN roles r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.first_name";
            break;

        case "department":
            sqlQuery = "SELECT e.id, CONCAT(e.first_name, ' ' ,e.last_name) AS Name, r.title, d.name FROM employee e INNER JOIN roles r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY d.name";
            break;

        case "manager":
            sqlQuery = "SELECT e.id, CONCAT(e.first_name, ' ' ,e.last_name) AS Name, CONCAT(m.first_name, ' ' ,m.last_name) AS Manager_Name FROM employee e LEFT OUTER JOIN employee m ON e.manager_id = m.id ORDER BY m.first_name";
            break;

        case "roles":
            sqlQuery = "SELECT r.id, r.title, r.salary, d.name FROM roles r INNER JOIN department d ON r.department_id = d.id";
            break;
    }
    connection.query(sqlQuery, function (err, res) {
        if (err) throw err;
        console.table(res);
        // console.log("Would you like to continue? (y/n): ");
        // if (res === "y" || res === "Y") { start(); } else { connection.end(); }
        // start();
    });
}

function add() {

}