CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    start_year INT NOT NULL
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    credits INT CHECK (credits > 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE,
    grade CHAR(1),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO students VALUES (DEFAULT, 'Алексей Смирнов', 'smir@exemple.com', 2021);
INSERT INTO students VALUES (DEFAULT, 'Елена Кузнецова', 'elena@exempl.com', 2022);
INSERT INTO students VALUES (DEFAULT, 'Дмитрий Новиков', 'dimanov@exempl.com', 2021);
INSERT INTO students VALUES (DEFAULT, 'Ольга Морозова', 'moroz_olga@exemple.com', 2023);

INSERT INTO courses VALUES (DEFAULT, 'Введение в программирование', 5);
INSERT INTO courses VALUES (DEFAULT, 'Базы данных', 4);
INSERT INTO courses VALUES (DEFAULT, 'Веб-технологии', 4);

INSERT INTO enrollments VALUES 
(1, 2, 'A'), 
(2, 2, 'B'), 
(2, 3, 'A'), 
(3, 1, NULL), 
(3, 2, NULL), 
(3, 3, NULL);

UPDATE students 
SET email = 'elena.kuznetsova@newmail.com' 
WHERE student_id = 2;

UPDATE enrollments
set grade = 'A'
WHERE student_id = 3 AND course_id = 1;

DELETE FROM students
WHERE student_id = 6;