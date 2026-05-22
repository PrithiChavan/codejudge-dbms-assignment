-- Query 1
-- Purpose:
-- List all active students with student ID, name, email, batch, and admission date

SELECT student_id,
       full_name,
       email,
       batch_id,
       admission_date
FROM students
WHERE status = 'active';

-- Sample Output:
-- S001 | Ayaan Mehta | ayaan@gmail.com | BCA2025A | 2025-01-10

-- Validation Note:
-- Only active students are shown.



-- Query 2
-- Purpose:
-- Find students whose email is missing or appears invalid

SELECT student_id,
       full_name,
       email
FROM students
WHERE email IS NULL
OR email NOT LIKE '%@%.%';

-- Sample Output:
-- S010 | Sai Reddy | bad-email

-- Validation Note:
-- Invalid or missing emails are filtered.



-- Query 3
-- Purpose:
-- List all problems with difficulty level Easy or Medium

SELECT problem_id,
       title,
       difficulty
FROM problems
WHERE difficulty IN ('Easy', 'Medium');

-- Sample Output:
-- P001 | Arrays Basics | Easy

-- Validation Note:
-- Only Easy and Medium problems appear.



-- Query 4
-- Purpose:
-- Display the latest 20 submissions based on submission timestamp

SELECT *
FROM submissions
ORDER BY submitted_at DESC
LIMIT 20;

-- Sample Output:
-- SUB101 | S004 | P010 | successful

-- Validation Note:
-- Results are ordered from newest to oldest.



-- Query 5
-- Purpose:
-- Find submissions where the status is not successful

SELECT submission_id,
       student_id,
       status
FROM submissions
WHERE status <> 'successful';

-- Sample Output:
-- SUB099 | S010 | failed

-- Validation Note:
-- Only failed or rejected submissions are shown.



-- Query 6
-- Purpose:
-- Display each submission with student name, problem title, language, status, score, and submitted time

SELECT s.submission_id,
       st.full_name,
       p.title,
       s.language,
       s.status,
       s.score,
       s.submitted_at
FROM submissions s
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

-- Sample Output:
-- SUB001 | Ayaan Mehta | Arrays Basics | Python | successful | 95

-- Validation Note:
-- Submission data is combined with student and problem details.



-- Query 7
-- Purpose:
-- Display all students and their enrollments including students not enrolled in any course

SELECT st.student_id,
       st.full_name,
       e.course_id
FROM students st
LEFT JOIN enrollments e
ON st.student_id = e.student_id;

-- Sample Output:
-- S001 | Ayaan Mehta | C001

-- Validation Note:
-- LEFT JOIN ensures even unenrolled students are displayed.



-- Query 8
-- Purpose:
-- Display all courses with the number of enrolled students

SELECT c.course_id,
       c.course_name,
       COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- Sample Output:
-- C001 | Full Stack | 45

-- Validation Note:
-- Student count is calculated using GROUP BY.



-- Query 9
-- Purpose:
-- Display test case results for each submission including problem title and student name

SELECT tc.test_case_id,
       s.submission_id,
       st.full_name,
       p.title,
       tc.result
FROM test_case_results tc
JOIN submissions s
ON tc.submission_id = s.submission_id
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

-- Sample Output:
-- TC001 | SUB001 | Ayaan Mehta | Arrays Basics | Passed

-- Validation Note:
-- Test case records are mapped correctly to submissions.



-- Query 10
-- Purpose:
-- Find students who are enrolled in a course but have not submitted any solution for that course

SELECT DISTINCT st.student_id,
       st.full_name,
       c.course_name
FROM enrollments e
JOIN students st
ON e.student_id = st.student_id
JOIN courses c
ON e.course_id = c.course_id
LEFT JOIN submissions s
ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

-- Sample Output:
-- S020 | Maya Pillai | Java Course

-- Validation Note:
-- Students without submissions are identified using LEFT JOIN.



-- Query 11
-- Purpose:
-- Count submissions by status

SELECT status,
       COUNT(*) AS total_submissions
FROM submissions
GROUP BY status;

-- Sample Output:
-- successful | 250

-- Validation Note:
-- Total submissions are grouped by status.



-- Query 12
-- Purpose:
-- Calculate average score per problem

SELECT problem_id,
       AVG(score) AS average_score
FROM submissions
GROUP BY problem_id;

-- Sample Output:
-- P001 | 76.5

-- Validation Note:
-- Average score is calculated for each problem.



-- Query 13
-- Purpose:
-- Find students with more than 5 submissions

SELECT student_id,
       COUNT(*) AS total_submissions
FROM submissions
GROUP BY student_id
HAVING COUNT(*) > 5;

-- Sample Output:
-- S001 | 12

-- Validation Note:
-- HAVING filters grouped submission counts.



-- Query 14
-- Purpose:
-- Find problems where the success rate is below 40%

SELECT problem_id,
       (SUM(CASE WHEN status = 'successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS success_rate
FROM submissions
GROUP BY problem_id
HAVING (SUM(CASE WHEN status = 'successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) < 40;

-- Sample Output:
-- P010 | 32.4

-- Validation Note:
-- Success percentage is calculated using conditional aggregation.



-- Query 15
-- Purpose:
-- Find the top 10 most attempted problems

SELECT problem_id,
       COUNT(*) AS total_attempts
FROM submissions
GROUP BY problem_id
ORDER BY total_attempts DESC
LIMIT 10;

-- Sample Output:
-- P002 | 400

-- Validation Note:
-- Problems are ranked by submission attempts.



-- Query 16
-- Purpose:
-- Find students whose average score is greater than the overall average score

SELECT student_id,
       AVG(score) AS avg_score
FROM submissions
GROUP BY student_id
HAVING AVG(score) >
(
    SELECT AVG(score)
    FROM submissions
);

-- Sample Output:
-- S002 | 88.2

-- Validation Note:
-- Student averages are compared with overall average score.



-- Query 17
-- Purpose:
-- Find problems that have never been attempted

SELECT p.problem_id,
       p.title
FROM problems p
LEFT JOIN submissions s
ON p.problem_id = s.problem_id
WHERE s.submission_id IS NULL;

-- Sample Output:
-- P020 | Graph Theory Basics

-- Validation Note:
-- Problems without submissions are identified.



-- Query 18
-- Purpose:
-- Find students who have enrolled but never submitted any solution

SELECT st.student_id,
       st.full_name
FROM students st
JOIN enrollments e
ON st.student_id = e.student_id
LEFT JOIN submissions s
ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

-- Sample Output:
-- S030 | Neil Jain

-- Validation Note:
-- Enrolled students with zero submissions are shown.



-- Query 19
-- Purpose:
-- Find students who submitted solutions in both Python and Java

SELECT student_id
FROM submissions
WHERE language = 'Python'
INTERSECT
SELECT student_id
FROM submissions
WHERE language = 'Java';

-- Sample Output:
-- S004

-- Validation Note:
-- INTERSECT finds students using both languages.



-- Query 20
-- Purpose:
-- Find the second-highest score for a selected problem

SELECT DISTINCT score
FROM submissions
WHERE problem_id = 'P001'
ORDER BY score DESC
LIMIT 1 OFFSET 1;

-- Sample Output:
-- 96

-- Validation Note:
-- OFFSET skips the highest score and returns the second-highest.