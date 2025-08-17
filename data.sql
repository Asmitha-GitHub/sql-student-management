USE student_mgmt_sql;

-- Insert Students
INSERT INTO students (first_name, last_name, email, phone, gender, dob, year_of_study)
VALUES
('Arjun', 'Mehta', 'arjun.mehta@example.com', '9876543210', 'M', '2002-05-10', 3),
('Priya', 'Nair', 'priya.nair@example.com', '9123456780', 'F', '2003-09-15', 2),
('Ravi', 'Sharma', 'ravi.sharma@example.com', '9988776655', 'M', '2001-11-20', 4),
('Sneha', 'Iyer', 'sneha.iyer@example.com', '9000011122', 'F', '2004-01-05', 1);

-- Insert Courses
INSERT INTO courses (code, title, credits, department)
VALUES
('CSE101', 'Database Management Systems', 4, 'CSE'),
('CSE102', 'Operating Systems', 3, 'CSE'),
('ECE201', 'Digital Logic Design', 3, 'ECE'),
('MTH301', 'Linear Algebra', 4, 'Mathematics');

-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id, semester, acad_year)
VALUES
(1, 1, 'Odd', 2024),
(1, 2, 'Odd', 2024),
(2, 1, 'Odd', 2024),
(2, 4, 'Odd', 2024),
(3, 2, 'Even', 2023),
(4, 3, 'Odd', 2024);

-- Insert Marks
INSERT INTO marks (enrollment_id, total, grade)
VALUES
(1, 88, 'A'),
(2, 75, 'B'),
(3, 91, 'A'),
(4, 68, 'C'),
(5, 82, 'B'),
(6, 95, 'A');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM marks;
