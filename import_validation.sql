-- TASK 1 : ROW COUNT AND IMPORT VALIDATION

-- Row count of each table
SELECT 'batches' AS table_name, COUNT(*) AS total_rows
FROM batches;

SELECT 'students' AS table_name, COUNT(*) AS total_rows
FROM students;

SELECT 'courses' AS table_name, COUNT(*) AS total_rows
FROM courses;

SELECT 'enrollments' AS table_name, COUNT(*) AS total_rows
FROM enrollments;

SELECT 'problems' AS table_name, COUNT(*) AS total_rows
FROM problems;

SELECT 'test_cases' AS table_name, COUNT(*) AS total_rows
FROM test_cases;

SELECT 'contests' AS table_name, COUNT(*) AS total_rows
FROM contests;

SELECT 'contest_problems' AS table_name, COUNT(*) AS total_rows
FROM contest_problems;

SELECT 'submissions' AS table_name, COUNT(*) AS total_rows
FROM submissions;


-- DISTINCT PRIMARY KEY CHECKS
SELECT COUNT(DISTINCT batch_id) AS unique_batch_ids
FROM batches;

SELECT COUNT(DISTINCT student_id) AS unique_student_ids
FROM students;

SELECT COUNT(DISTINCT course_id) AS unique_course_ids
FROM courses;

SELECT COUNT(DISTINCT enrollment_id) AS unique_enrollment_ids
FROM enrollments;

SELECT COUNT(DISTINCT problem_id) AS unique_problem_ids
FROM problems;

SELECT COUNT(DISTINCT submission_id) AS unique_submission_ids
FROM submissions;


-- NULL OR BLANK VALUE CHECKS
SELECT *
FROM students
WHERE student_name IS NULL
   OR student_name = '';


SELECT *
FROM students
WHERE email IS NULL
   OR email = '';


SELECT *
FROM courses
WHERE course_name IS NULL
   OR course_name = '';


SELECT *
FROM problems
WHERE title IS NULL
   OR title = '';


SELECT *
FROM students
WHERE batch_id IS NULL;

-- EMPTY TABLE CHECKS
SELECT 'submissions table is empty'
WHERE NOT EXISTS (
    SELECT * FROM submissions
);


SELECT 'enrollments table is empty'
WHERE NOT EXISTS (
    SELECT * FROM enrollments
);


SELECT 'problems table is empty'
WHERE NOT EXISTS (
    SELECT * FROM problems
);

-- CSV IMPORT VALIDATION
SELECT COUNT(*) AS imported_student_rows
FROM students;


SELECT COUNT(*) AS imported_course_rows
FROM courses;


SELECT COUNT(*) AS imported_submission_rows
FROM submissions;