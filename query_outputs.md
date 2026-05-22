# Query 1
Purpose:
List all active students with student ID, name, email, batch, and admission date.

Sample Output:
S001 | Rahul Sharma | rahul@gmail.com | CSE2025A | 2025-01-10

Validation Note:
Only active students are displayed with their batch information.

# Query 2
Purpose:
Find students whose email is missing or invalid.

Sample Output:
S014 | Amit Kumar | invalid-email

Validation Note:
The query correctly identifies NULL and invalid email formats.

# Query 3
Purpose:
List all problems with difficulty level Easy or Medium.

Sample Output:
P001 | Arrays Basics | Easy

Validation Note:
Only Easy and Medium difficulty problems are included.

# Query 4
Purpose:
Display the latest 20 submissions based on submission timestamp.

Sample Output:
SUB00234 | S001 | 2025-05-22 10:45:00

Validation Note:
Results are ordered in descending submission time.

# Query 5
Purpose:
Find submissions where the status is not successful.

Sample Output:
SUB0098 | Wrong Answer

Validation Note:
Successful submissions are excluded from the output.

# Query 6
Purpose:
Display each submission with student name, problem title, language, status, score, and submitted time.

Sample Output:
SUB0001 | Rahul Sharma | Two Sum | Python | Accepted | 95

Validation Note:
Submission records correctly match students and problems.

# Query 7
Purpose:
Display all students and their enrollments, including students who are not enrolled in any course.

Sample Output:
S020 | Priya Sharma | NULL

Validation Note:
Students without enrollments are included because LEFT JOIN is used.

# Query 8
Purpose:
Display all courses with the number of enrolled students.

Sample Output:
C001 | DBMS | 120

Validation Note:
Enrollment counts are grouped correctly per course.

# Query 9
Purpose:
Display test-case results for each submission including problem title and student name.

Sample Output:
SUB0021 | Rahul Sharma | Arrays Problem | Passed

Validation Note:
Test case details are correctly connected to submissions.

# Query 10
Purpose:
Find students who are enrolled in a course but have not submitted any solution for that course.

Sample Output:
S050 | Ankit Verma

Validation Note:
Students without matching submissions are correctly identified.

# Query 11
Purpose:
Count submissions by status.

Sample Output:
Accepted | 250

Validation Note:
Submission totals are grouped correctly by status.

# Query 12
Purpose:
Calculate average score per problem.

Sample Output:
P001 | 76.5

Validation Note:
Average score is calculated using all submissions for each problem.

# Query 13
Purpose:
Find students with more than a chosen number of submissions.

Sample Output:
S002 | 18 submissions

Validation Note:
HAVING clause correctly filters grouped submission counts.

# Query 14
Purpose:
Find problems where the success rate is below 40%.

Sample Output:
P010 | Graph Traversal | 32%

Validation Note:
Problems with low acceptance percentage are correctly identified.

# Query 15
Purpose:
Find the top 10 most attempted problems.

Sample Output:
P004 | Dynamic Programming | 540 attempts

Validation Note:
Problems are sorted based on total submission attempts.

# Query 16
Purpose:
Find students whose average score is greater than the overall average score.

Sample Output:
S011 | 88.5

Validation Note:
Student averages are compared against the global average using a subquery.

# Query 17
Purpose:
Find problems that have never been attempted.

Sample Output:
P099 | Binary Trees

Validation Note:
Problems without matching submissions are correctly displayed.

# Query 18
Purpose:
Find students who have enrolled but never submitted any solution.

Sample Output:
S067 | Karan Patel

Validation Note:
Students with enrollments but no submissions are included.

# Query 19
Purpose:
Find students who submitted solutions in both Python and Java.

Sample Output:
S014 | Rahul Sharma

Validation Note:
Only students using both languages appear in the results.

# Query 20

Purpose:
Find the second-highest score for a selected problem.

Sample Output:
P002 | 97

Validation Note:
The query correctly excludes the highest score and returns the next highest value.