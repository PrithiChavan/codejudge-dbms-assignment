-- SAFE UPDATE 1: Correct invalid email values

SELECT student_id, email
FROM students
WHERE email NOT LIKE '%@%';

UPDATE students
SET email = CONCAT(student_id, '@example.com')
WHERE email NOT LIKE '%@%';

SELECT student_id, email
FROM students
WHERE email NOT LIKE '%@%';

-- Safe because WHERE clause updates only invalid emails



-- SAFE UPDATE 2: Fix negative scores

SELECT submission_id, score
FROM submissions
WHERE score < 0;

UPDATE submissions
SET score = 0
WHERE score < 0;

SELECT submission_id, score
FROM submissions
WHERE score < 0;

-- Safe because only negative scores are updated



-- SAFE UPDATE 3: Fix invalid difficulty values

SELECT problem_id, difficulty
FROM problems
WHERE difficulty NOT IN ('Easy','Medium','Hard');

UPDATE problems
SET difficulty = 'Medium'
WHERE difficulty NOT IN ('Easy','Medium','Hard');

SELECT problem_id, difficulty
FROM problems
WHERE difficulty NOT IN ('Easy','Medium','Hard');

-- Safe because only invalid difficulty rows are affected



-- SAFE UPDATE 4: Fix NULL attendance status

SELECT attendance_id, status
FROM attendance
WHERE status IS NULL;

UPDATE attendance
SET status = 'Absent'
WHERE status IS NULL;

SELECT attendance_id, status
FROM attendance
WHERE status IS NULL;

-- Safe because only NULL status rows are updated