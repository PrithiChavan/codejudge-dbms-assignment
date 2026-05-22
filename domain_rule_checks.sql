--TASK 4 : DOMAIN AND RULE VALIDATION

-- 1. Negative scores
SELECT submission_id, score
FROM submissions
WHERE score < 0;

-- 2. Scores greater than maximum allowed marks
SELECT submission_id, score
FROM submissions
WHERE score > 100;

-- 3. Invalid difficulty values
SELECT problem_id, difficulty
FROM problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- 4. Invalid submission statuses
SELECT submission_id, status
FROM submissions
WHERE status NOT IN ('Accepted', 'Rejected', 'Pending');

-- 5. Invalid programming language values
SELECT submission_id, language
FROM submissions
WHERE language NOT IN ('Python', 'Java', 'C++', 'JavaScript');

-- 6. Invalid test-result statuses
SELECT test_result_id, status
FROM test_results
WHERE status NOT IN ('Passed', 'Failed');

-- 7. Invalid attendance statuses
SELECT attendance_id, status
FROM attendance
WHERE status NOT IN ('Present', 'Absent', 'Late');

-- 8. Invalid contest statuses
SELECT contest_id, status
FROM contests
WHERE status NOT IN ('Upcoming', 'Active', 'Completed');

-- 9. Invalid operation request states
SELECT request_id, state
FROM operation_requests
WHERE state NOT IN ('Open', 'In Progress', 'Resolved');

-- 10. End time before start time
SELECT contest_id, start_time, end_time
FROM contests
WHERE end_time < start_time;

-- 11. Resolved time before requested time
SELECT request_id, requested_time, resolved_time
FROM regrade_requests
WHERE resolved_time < requested_time;

-- 12. Executed time before requested time
SELECT request_id, requested_time, executed_time
FROM operation_requests
WHERE executed_time < requested_time;

-- 13. Submission timestamp before enrollment date
SELECT s.submission_id,
       s.submission_time,
       e.enrollment_date
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submission_time < e.enrollment_date;

-- 14. NULL or blank student names
SELECT student_id, name
FROM students
WHERE name IS NULL
OR TRIM(name) = '';

-- 15. NULL or blank emails
SELECT student_id, email
FROM students
WHERE email IS NULL
OR TRIM(email) = '';

-- 16. NULL or blank course names
SELECT course_id, course_name
FROM courses
WHERE course_name IS NULL
OR TRIM(course_name) = '';

-- 17. NULL or blank problem titles
SELECT problem_id, title
FROM problems
WHERE title IS NULL
OR TRIM(title) = '';

-- 18. NULL batch IDs in students
SELECT student_id
FROM students
WHERE batch_id IS NULL;

-- 19. Invalid email format
SELECT student_id, email
FROM students
WHERE email NOT LIKE '%@%.%';

-- 20. Future admission dates
SELECT student_id, admission_date
FROM students
WHERE admission_date > CURRENT_DATE;