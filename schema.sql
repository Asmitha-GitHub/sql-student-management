-- schema.sql - MySQL 8+
DROP DATABASE IF EXISTS student_mgmt_sql;
CREATE DATABASE student_mgmt_sql CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE student_mgmt_sql;

-- Students
CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  email      VARCHAR(100) NOT NULL UNIQUE,
  phone      VARCHAR(15),
  gender     ENUM('M','F','O') DEFAULT 'O',
  dob        DATE,
  year_of_study TINYINT CHECK (year_of_study BETWEEN 1 AND 4),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Courses
CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  code      VARCHAR(10) NOT NULL UNIQUE,
  title     VARCHAR(100) NOT NULL,
  credits   TINYINT NOT NULL CHECK (credits BETWEEN 1 AND 6),
  department VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Enrollments
CREATE TABLE enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id  INT NOT NULL,
  semester   ENUM('Odd','Even','Summer') NOT NULL,
  acad_year  YEAR NOT NULL,
  enrolled_on DATE DEFAULT (CURRENT_DATE),
  UNIQUE KEY uq_enrollment (student_id, course_id, acad_year, semester),
  CONSTRAINT fk_enr_student FOREIGN KEY (student_id)
    REFERENCES students(student_id) ON DELETE CASCADE,
  CONSTRAINT fk_enr_course FOREIGN KEY (course_id)
    REFERENCES courses(course_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Marks
CREATE TABLE marks (
  mark_id INT AUTO_INCREMENT PRIMARY KEY,
  enrollment_id INT NOT NULL UNIQUE,
  total  INT NOT NULL,
  grade  CHAR(2),
  recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_total CHECK (total BETWEEN 0 AND 100),
  CONSTRAINT fk_marks_enrollment FOREIGN KEY (enrollment_id)
    REFERENCES enrollments(enrollment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Helpful indexes
CREATE INDEX idx_students_name ON students(last_name, first_name);
CREATE INDEX idx_courses_code ON courses(code);
CREATE INDEX idx_enr_student ON enrollments(student_id);
CREATE INDEX idx_enr_course  ON enrollments(course_id);
