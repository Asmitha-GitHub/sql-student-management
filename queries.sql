USE student_mgmt_sql;

-- 1. List all students with their enrolled courses (JOIN)
SELECT s.first_name, s.last_name, c.title AS course, e.semester, e.acad_year
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 2. Find average marks per course (Aggregate + JOIN)
SELECT c.title AS course, AVG(m.total) AS avg_score
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN marks m ON e.enrollment_id = m.enrollment_id
GROUP BY c.title;

-- 3. List students who scored above 85 in any course (Subquery)
SELECT first_name, last_name
FROM students
WHERE student_id IN (
    SELECT e.student_id
    FROM enrollments e
    JOIN marks m ON e.enrollment_id = m.enrollment_id
    WHERE m.total > 85
);

-- 4. Show top 3 scorers across all courses (ORDER BY + LIMIT)
SELECT s.first_name, s.last_name, c.title, m.total
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN marks m ON e.enrollment_id = m.enrollment_id
ORDER BY m.total DESC
LIMIT 3;

-- 5. Count how many students enrolled per department
SELECT c.department, COUNT(DISTINCT e.student_id) AS student_count
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.department;

-- 6. Find students who are NOT enrolled in any course
SELECT s.first_name, s.last_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;
