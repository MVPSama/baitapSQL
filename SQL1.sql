DROP DATABASE IF EXISTS testing_system_assigment_1;
CREATE DATABASE IF NOT EXISTS testing_system_assigment_1;
USE testing_system_assigment_1;

CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE p0stition (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(50) NOT NULL
);

CREATE TABLE acc0unt (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    username VARCHAR(50) NOT NULL,
    fullname VARCHAR(50),
    department_id INT,
    position_id INT,
    create_date DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (position_id) REFERENCES p0stition(position_id)
);

CREATE TABLE gr0up (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL,
    creator_id INT,
    creat_date DATE
);

CREATE TABLE groupAccount (
    group_id INT,
    account_id INT,
    join_date DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES gr0up(group_id),
    FOREIGN KEY (account_id) REFERENCES acc0unt(account_id)
);

CREATE TABLE typeQuestion (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE CategoryQuestion (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE question (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(50) NOT NULL,
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATE,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id),
    FOREIGN KEY (type_id) REFERENCES typeQuestion(type_id)
);

CREATE TABLE answer (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255),
    question_id INT,
    is_correct ENUM('TRUE', 'FALSE'),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

CREATE TABLE exam (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    c0de INT,
    title VARCHAR(50),
    category_id INT,
    duration TIME,
    creator_id INT,
    creat_date DATE,
    FOREIGN KEY (category_id) REFERENCES CategoryQuestion(category_id)
);

CREATE TABLE examQUestion (
    exam_id INT,
    question_id INT,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);