# SQL Reasoning and Explanation

## 1. Explain one query where using LEFT JOIN is more appropriate than INNER JOIN
Query 7 uses LEFT JOIN to display all students and their enrollments, including students who are not enrolled in any course.LEFT JOIN is more appropriate because INNER JOIN would only return students who already have matching enrollment records. Students without enrollments would be excluded.
Example:
SELECT st.student_id,
       st.full_name,
       e.course_id
FROM students st
LEFT JOIN enrollments e
ON st.student_id = e.student_id;

This ensures every student appears in the output even if the course_id is NULL.

## 2. Explain one query where HAVING is required instead of WHERE
Query 13 uses HAVING because filtering is done after aggregation.
Example:

SELECT student_id,
       COUNT(*) AS total_submissions
FROM submissions
GROUP BY student_id
HAVING COUNT(*) > 5;

WHERE cannot be used here because COUNT(*) is an aggregate function. HAVING filters grouped records after GROUP BY execution.

## 3. Explain one query where a subquery helped solve the problem
Query 16 uses a subquery to compare each student’s average score with the overall average score.
Example:

SELECT student_id,
       AVG(score) AS avg_score
FROM submissions
GROUP BY student_id
HAVING AVG(score) >
(
    SELECT AVG(score)
    FROM submissions
);

The subquery calculates the global average score first. The outer query then compares every student average against it.

## 4. Explain one situation where your query output could be misleading if duplicate records exist
In Query 8, duplicate enrollment records could incorrectly increase the number of enrolled students.
Example:

SELECT c.course_id,
       c.course_name,
       COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

If the same student is accidentally enrolled multiple times in the same course, the count becomes inaccurate. Using COUNT(DISTINCT e.student_id) would avoid this issue.

## 5. Explain one edge case you considered while writing any query
In Query 2, some students may have NULL emails while others may contain invalid email formats.

Example:

SELECT student_id,
       full_name,
       email
FROM students
WHERE email IS NULL
OR email NOT LIKE '%@%.%';

The query handles both missing emails and improperly formatted emails. Without checking NULL values separately, some invalid records could be missed.