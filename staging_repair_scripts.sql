--TASK 6 : REPAIR SCRIPTS ON STAGING TABLES

--STEP 1 :CREATE STAGING TABLES
CREATE TABLE staging_students AS
SELECT * FROM students;

CREATE TABLE staging_submissions AS
SELECT * FROM submissions;

CREATE TABLE staging_problems AS
SELECT * FROM problems;

CREATE TABLE staging_enrollments AS
SELECT * FROM enrollments;


-- REPAIR 1 : FIX NEGATIVE SCORES
-- Before Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score < 0;

-- Repair Query
UPDATE staging_submissions
SET score = 0
WHERE score < 0;

-- After Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score < 0;

-- Decision:
-- Negative scores are invalid.
-- They are corrected to minimum allowed value 0.


-- REPAIR 2 : FIX SCORES GREATER THAN 100
-- Before Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score > 100;

-- Repair Query
UPDATE staging_submissions
SET score = 100
WHERE score > 100;

-- After Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score > 100;

-- Decision:
-- Scores cannot exceed maximum marks.
-- Updated to 100.

-- REPAIR 3 : FIX INVALID DIFFICULTY VALUES

-- Before Repair
SELECT problem_id, difficulty
FROM staging_problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- Repair Query
UPDATE staging_problems
SET difficulty = 'Medium'
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- After Repair
SELECT problem_id, difficulty
FROM staging_problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');

-- Decision:
-- Invalid difficulty values replaced with Medium.

-- REPAIR 4 : FIX NULL OR BLANK STUDENT NAMES

-- Before Repair
SELECT student_id, name
FROM staging_students
WHERE name IS NULL
OR TRIM(name) = '';

-- Repair Query
UPDATE staging_students
SET name = 'Unknown Student'
WHERE name IS NULL
OR TRIM(name) = '';

-- After Repair
SELECT student_id, name
FROM staging_students
WHERE name IS NULL
OR TRIM(name) = '';

-- Decision:
-- Blank names replaced with placeholder value.

-- REPAIR 5 : FIX INVALID SUBMISSION STATUS
-- Before Repair
SELECT submission_id, status
FROM staging_submissions
WHERE status NOT IN ('Accepted', 'Rejected', 'Pending');

-- Repair Query
UPDATE staging_submissions
SET status = 'Pending'
WHERE status NOT IN ('Accepted', 'Rejected', 'Pending');

-- After Repair
SELECT submission_id, status
FROM staging_submissions
WHERE status NOT IN ('Accepted', 'Rejected', 'Pending');

-- Decision:
-- Invalid statuses changed to Pending.

-- REPAIR 6 : REMOVE DUPLICATE ENROLLMENTS
-- Before Repair
SELECT student_id, course_id, COUNT(*) AS duplicate_count
FROM staging_enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- Repair Query
DELETE FROM staging_enrollments
WHERE enrollment_id NOT IN (
    SELECT MIN(enrollment_id)
    FROM staging_enrollments
    GROUP BY student_id, course_id
);

-- After Repair
SELECT student_id, course_id, COUNT(*) AS duplicate_count
FROM staging_enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- Decision:
-- Duplicate enrollment records removed.
-- Only one valid enrollment kept.

-- REPAIR 7 : FIX INVALID EMAIL FORMAT
-- Before Repair
SELECT student_id, email
FROM staging_students
WHERE email NOT LIKE '%@%.%';

-- Repair Query
UPDATE staging_students
SET email = CONCAT(student_id, '@example.com')
WHERE email NOT LIKE '%@%.%';

-- After Repair
SELECT student_id, email
FROM staging_students
WHERE email NOT LIKE '%@%.%';

-- Decision:
-- Invalid emails replaced with temporary valid emails.


-- REPAIR 8 : FIX END TIME BEFORE START TIME
-- Before Repair
SELECT contest_id, start_time, end_time
FROM contests
WHERE end_time < start_time;

-- Repair Query
UPDATE contests
SET end_time = DATE_ADD(start_time, INTERVAL 2 HOUR)
WHERE end_time < start_time;

-- After Repair
SELECT contest_id, start_time, end_time
FROM contests
WHERE end_time < start_time;

-- Decision:
-- Contest end time corrected using standard duration.