--TASK 2 : PRIMARY KEY AND UNIQUENESS AUDIT

-- Duplicate batch IDs
SELECT batch_id, COUNT(*) AS duplicate_count
FROM batches
GROUP BY batch_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS batch_id_check
FROM (
    SELECT batch_id
    FROM batches
    GROUP BY batch_id
    HAVING COUNT(*) > 1
) duplicates;


-- 2. Duplicate student IDs
SELECT student_id, COUNT(*) AS duplicate_count
FROM students
GROUP BY student_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS student_id_check
FROM (
    SELECT student_id
    FROM students
    GROUP BY student_id
    HAVING COUNT(*) > 1
) duplicates;

-- 3. Duplicate course IDs
SELECT course_id, COUNT(*) AS duplicate_count
FROM courses
GROUP BY course_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS course_id_check
FROM (
    SELECT course_id
    FROM courses
    GROUP BY course_id
    HAVING COUNT(*) > 1
) duplicates;


-- 4. Duplicate emails
SELECT email, COUNT(*) AS duplicate_count
FROM students
GROUP BY email
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS email_duplicate_check
FROM (
    SELECT email
    FROM students
    GROUP BY email
    HAVING COUNT(*) > 1
) duplicates;


-- 5. Duplicate enrollment records
SELECT student_id, course_id, COUNT(*) AS duplicate_count
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS enrollment_duplicate_check
FROM (
    SELECT student_id, course_id
    FROM enrollments
    GROUP BY student_id, course_id
    HAVING COUNT(*) > 1
) duplicates;


-- 6. Duplicate contest-problem mappings
SELECT contest_id, problem_id, COUNT(*) AS duplicate_count
FROM contest_problems
GROUP BY contest_id, problem_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS contest_problem_duplicate_check
FROM (
    SELECT contest_id, problem_id
    FROM contest_problems
    GROUP BY contest_id, problem_id
    HAVING COUNT(*) > 1
) duplicates;


-- 7. Duplicate test case records
SELECT test_case_id, COUNT(*) AS duplicate_count
FROM test_cases
GROUP BY test_case_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS test_case_duplicate_check
FROM (
    SELECT test_case_id
    FROM test_cases
    GROUP BY test_case_id
    HAVING COUNT(*) > 1
) duplicates;


-- 8. Duplicate submission IDs
SELECT submission_id, COUNT(*) AS duplicate_count
FROM submissions
GROUP BY submission_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS submission_duplicate_check
FROM (
    SELECT submission_id
    FROM submissions
    GROUP BY submission_id
    HAVING COUNT(*) > 1
) duplicates;


-- 9. Duplicate attendance records
SELECT student_id, session_id, COUNT(*) AS duplicate_count
FROM attendance
GROUP BY student_id, session_id
HAVING COUNT(*) > 1;
-- PASS/FAIL CHECK
SELECT 
CASE
WHEN COUNT(*) = 0 THEN 'PASS'
ELSE 'FAIL'
END AS attendance_duplicate_check
FROM (
    SELECT student_id, session_id
    FROM attendance
    GROUP BY student_id, session_id
    HAVING COUNT(*) > 1
) duplicates;


-- TASK 3 : FOREIGN KEY AND RELATIONSHIP AUDIT
-- 1. Students linked to missing batches
SELECT s.student_id, s.batch_id
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;

-- 2. Enrollments linked to missing students
SELECT e.enrollment_id, e.student_id
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 3. Enrollments linked to missing courses
SELECT e.enrollment_id, e.course_id
FROM enrollments e
LEFT JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

-- 4. Problems linked to missing courses
SELECT p.problem_id, p.course_id
FROM problems p
LEFT JOIN courses c
ON p.course_id = c.course_id
WHERE c.course_id IS NULL;

-- 5. Test cases linked to missing problems
SELECT t.test_case_id, t.problem_id
FROM test_cases t
LEFT JOIN problems p
ON t.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

-- 6. Contests linked to missing courses
SELECT c.contest_id, c.course_id
FROM contests c
LEFT JOIN courses co
ON c.course_id = co.course_id
WHERE co.course_id IS NULL;

-- 7. Contest-problem mappings linked to missing contests
SELECT cp.contest_id, cp.problem_id
FROM contest_problems cp
LEFT JOIN contests c
ON cp.contest_id = c.contest_id
WHERE c.contest_id IS NULL;

-- 8. Contest-problem mappings linked to missing problems
SELECT cp.contest_id, cp.problem_id
FROM contest_problems cp
LEFT JOIN problems p
ON cp.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

-- 9. Submissions linked to missing students
SELECT sub.submission_id, sub.student_id
FROM submissions sub
LEFT JOIN students s
ON sub.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 10. Submissions linked to missing problems
SELECT sub.submission_id, sub.problem_id
FROM submissions sub
LEFT JOIN problems p
ON sub.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

-- 11. Submissions linked to missing contests
SELECT sub.submission_id, sub.contest_id
FROM submissions sub
LEFT JOIN contests c
ON sub.contest_id = c.contest_id
WHERE c.contest_id IS NULL;

-- 12. Test results linked to missing submissions
SELECT tr.test_result_id, tr.submission_id
FROM test_results tr
LEFT JOIN submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

-- 13. Test results linked to missing test cases
SELECT tr.test_result_id, tr.test_case_id
FROM test_results tr
LEFT JOIN test_cases tc
ON tr.test_case_id = tc.test_case_id
WHERE tc.test_case_id IS NULL;

-- 14. Sessions linked to missing courses
SELECT ses.session_id, ses.course_id
FROM sessions ses
LEFT JOIN courses c
ON ses.course_id = c.course_id
WHERE c.course_id IS NULL;

-- 15. Attendance linked to missing sessions
SELECT a.attendance_id, a.session_id
FROM attendance a
LEFT JOIN sessions s
ON a.session_id = s.session_id
WHERE s.session_id IS NULL;

-- 16. Attendance linked to missing students
SELECT a.attendance_id, a.student_id
FROM attendance a
LEFT JOIN students s
ON a.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 17. Regrade requests linked to missing submissions
SELECT r.request_id, r.submission_id
FROM regrade_requests r
LEFT JOIN submissions s
ON r.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

-- 18. Regrade requests linked to missing students
SELECT r.request_id, r.student_id
FROM regrade_requests r
LEFT JOIN students s
ON r.student_id = s.student_id
WHERE s.student_id IS NULL;

-- 19. Plagiarism flags linked to missing submissions
SELECT p.flag_id, p.submission_id
FROM plagiarism_flags p
LEFT JOIN submissions s
ON p.submission_id = s.submission_id
WHERE s.submission_id IS NULL;