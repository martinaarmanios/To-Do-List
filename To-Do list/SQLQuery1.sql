
/** USER TABLE **/
CREATE TABLE users (
    id INT ,
    username VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL ,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

/** TODOLIST TABLE **/
CREATE TABLE todo_lists (
    id int,
    title NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

/** TASK TABLE **/
CREATE TABLE tasks (
    id INT ,
    description NVARCHAR(MAX) NOT NULL,
    due_date DATE NULL,
    is_completed BIT DEFAULT 0,
    priority NVARCHAR(10) DEFAULT 'Low',
    list_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES todo_lists(id) 
);

/** INSERT SAMPLE DATA into users **/
INSERT INTO users (id, username, email, password)
VALUES 
    (1, 'Nour Ashry', 'nour.ashry@example.com', 'password123'),
    (2, 'Habiba Hany', 'habiba.hani@example.com', 'password123'),
    (3, 'Malak Mohammed', 'malak.mohammed@example.com', 'password123');
 
 /** INSERT SAMPLE DATA into todolist **/
INSERT INTO todo_lists (id, title, created_at, user_id)
VALUES 
    (1, 'Nour Daily Tasks', GETDATE(), 1),
    (2, 'Habiba Study Plan', GETDATE(), 2),
    (3, 'Malak Shopping List', GETDATE(), 3);

/** INSERT SAMPLE DATA into tasks**/
INSERT INTO tasks (id, description, due_date, is_completed, priority, list_id)
VALUES 
    (1, 'Complete assignment', '2024-12-31', 0, 'High', 1),
    (2, 'Review lecture notes', '2024-12-30', 0, 'Medium', 2),
    (3, 'Buy groceries', '2024-12-28', 0, 'Low', 3);










