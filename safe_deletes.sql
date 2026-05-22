-- SAFE DELETE 1: Remove duplicate attendance records

-- Identify duplicate rows
SELECT student_id, session_id, COUNT(*) AS duplicate_count
FROM attendance
GROUP BY student_id, session_id
HAVING COUNT(*) > 1;

-- Delete duplicate rows while keeping minimum attendance_id
DELETE FROM attendance
WHERE attendance_id NOT IN (
    SELECT MIN(attendance_id)
    FROM attendance
    GROUP BY student_id, session_id
);

-- Verify duplicates removed
SELECT student_id, session_id, COUNT(*)
FROM attendance
GROUP BY student_id, session_id
HAVING COUNT(*) > 1;

-- Explanation:
-- This DELETE is safe because it preserves one valid attendance record
-- for each student-session pair and removes only extra duplicates.



-- SAFE DELETE 2: Remove orphan submissions

-- Identify orphan records
SELECT s.submission_id
FROM submissions s
LEFT JOIN students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;

-- Delete orphan records
DELETE FROM submissions
WHERE student_id NOT IN (
    SELECT student_id
    FROM students
);

-- Verify deletion
SELECT s.submission_id
FROM submissions s
LEFT JOIN students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;

-- Explanation:
-- This DELETE is safe because it removes only submissions
-- whose student records do not exist in the students table.